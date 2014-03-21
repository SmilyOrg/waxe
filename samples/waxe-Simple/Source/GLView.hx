import wx.Window;
import wx.EventID;
import wx.Error;

import lime.gl.GL;
import lime.gl.GLBuffer;
import lime.gl.GLProgram;
import lime.gl.GLShader;
import lime.utils.Matrix3D;
import lime.utils.Float32Array;

class GLView extends wx.GLCanvas
{
    var triangleItemSize:Int;
    var triangleNumItems:Int;
    var squareItemSize:Int;
    var squareNumItems:Int;
    
    // Buffers
    var triangleVertexPositionBuffer:GLBuffer;
    var squareVertexPositionBuffer:GLBuffer;
    
    // Shader
    var shaderProgram:GLProgram;
    var vertexPositionAttribute:Int;
    var projectionMatrixUniform:Int;
    var modelViewMatrixUniform:Int;
    
    var projectionMatrix:Matrix3D;
    var modelViewMatrix:Matrix3D;
    
    var inited:Bool;
    
    var width:Int;
    var height:Int;
    
    function new(inHandle:Dynamic,inWidth:Int, inHeight:Int)
    {
        super(inHandle);
        trace("Init GLView");
        
        width = inWidth;
        height = inHeight;
        
        inited = false;
        
        modelViewMatrix = new Matrix3D();
        
        onSize = myOnSize;
        onPaint = render;
    }
    
    /// Must be called after parent is shown
    public function initRendering()
    {    
        initShaders();
        initBuffers();
    }

    override function _wx_deleted()
    {
        super._wx_deleted();
    }

    function myOnSize(event:Dynamic)
    {
        var s = clientSize;
        width = s.width;
        height = s.height;
    }

    function pumpMouseEvent(inID:Int, inEvent:Dynamic)
    {
    }

    function pumpKeyEvent(inID:Int, inEvent:Dynamic)
    {
    }

    override function HandleEvent(event:Dynamic)
    {
        super.HandleEvent(event); // this calls the render
        
        switch(Type.createEnumIndex(EventID,Std.int(event.type)))
        {
            case EventID.LEFT_DOWN: trace("LEFT_DOWN");
            case EventID.LEFT_UP: trace("LEFT_UP");
            case EventID.MOTION: trace("MOTION");
            case EventID.KEY_DOWN: trace("KEY_DOWN");
            case EventID.CHAR: trace("CHAR");
            case EventID.KEY_UP: trace("KEY_UP");
            case EventID.TIMER: trace("TIMER");

            default:
        }
    }

    function initBuffers()
    {
        trace("Init Buffers");
        // Triangle
        
        var vertices = [
             0.0,  1.0,  0.0,
            -1.0, -1.0,  0.0,
             1.0, -1.0,  0.0
        ];
        
        triangleVertexPositionBuffer = GL.createBuffer();
        GL.bindBuffer(GL.ARRAY_BUFFER, triangleVertexPositionBuffer);       
        GL.bufferData(GL.ARRAY_BUFFER, new Float32Array(cast vertices), GL.STATIC_DRAW);
        GL.bindBuffer(GL.ARRAY_BUFFER, null);
        
        triangleItemSize = 3;
        triangleNumItems = 3;
        
        // Square
        
        vertices = [
             1.0,  1.0,  0.0,
            -1.0,  1.0,  0.0,
             1.0, -1.0,  0.0,
            -1.0, -1.0,  0.0
        ];
        
        squareVertexPositionBuffer = GL.createBuffer();
        GL.bindBuffer(GL.ARRAY_BUFFER, squareVertexPositionBuffer);
        GL.bufferData(GL.ARRAY_BUFFER, new Float32Array(cast vertices), GL.STATIC_DRAW);
        GL.bindBuffer(GL.ARRAY_BUFFER, null);
        
        squareItemSize = 3;
        squareNumItems = 4;
    }
    
    function setMatrixUniforms()
    {
        GL.uniformMatrix3D(projectionMatrixUniform, false, projectionMatrix);
        GL.uniformMatrix3D(modelViewMatrixUniform, false, modelViewMatrix);
    }
    
    function getShader(id:String)
    {
        var src = "";
        var shader:GLShader = null;
        if (id == "shader-fs") {
            src =
                "
                #ifdef GL_ES
                    precision mediump float;
                #endif

                void main(void) {
                    gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
                }";
            shader = GL.createShader(GL.FRAGMENT_SHADER);
        } else if (id == "shader-vs") {
            src = 
                "attribute vec3 aVertexPosition;

                uniform mat4 uMVMatrix;
                uniform mat4 uPMatrix;

                void main(void) {
                    gl_Position = uPMatrix * uMVMatrix * vec4(aVertexPosition, 1.0);
                }";
            trace("before shader " + id);
            trace(GL.getError());
            shader = GL.createShader(GL.VERTEX_SHADER);
            trace(GL.getError());
            trace("after shader " + id);
        } else {
            return null;
        }
        
        if (!GL.isShader(shader)) {
            trace(id + " not valid");
            throw "Shader wasn't created";
        }
            
        GL.shaderSource(shader, src);
        GL.compileShader(shader);

        if (GL.getShaderParameter(shader, GL.COMPILE_STATUS) == 0) {
            trace("Shader log " + id + ": " + GL.getShaderInfoLog(shader));
            throw "Error compiling " + id;
        }

        return shader;
    }
    
    function initShaders()
    {
        trace("Init Shaders");
        var vertexShader = getShader("shader-vs");
        var fragmentShader = getShader("shader-fs");
        
        shaderProgram = GL.createProgram();
        GL.attachShader(shaderProgram, vertexShader);
        GL.attachShader(shaderProgram, fragmentShader);
        GL.linkProgram(shaderProgram);

        if (GL.getProgramParameter(shaderProgram, GL.LINK_STATUS) == 0) {
            throw("Could not initialise shaders");
        }

        GL.useProgram(shaderProgram);
        
        vertexPositionAttribute = GL.getAttribLocation(shaderProgram, "aVertexPosition");
        GL.enableVertexAttribArray(vertexPositionAttribute);
        
        projectionMatrixUniform = GL.getUniformLocation(shaderProgram, "uPMatrix");
        modelViewMatrixUniform = GL.getUniformLocation(shaderProgram, "uMVMatrix");
    }
    
    private function makePerspective(fieldOfViewInRadians:Float, aspect:Float, near:Float, far:Float):Matrix3D
    {
        var m:Matrix3D = new Matrix3D();
        var f = Math.tan(Math.PI * 0.5 - 0.5 * fieldOfViewInRadians);
        var rangeInv = 1.0 / (near - far);
        m.rawData = [
            f / aspect, 0, 0, 0,
            0, f, 0, 0,
            0, 0, (near + far) * rangeInv, -1,
            0, 0, near * far * rangeInv * 2, 0
        ];
        return m;
    }

    public function render(_)
    {
        trace("Render");
        
        this.makeCurrent();
        
        GL.clearColor(0.0, 1.0, 0.0, 1.0);
        GL.clearDepth(1.0);
        GL.enable(GL.DEPTH_TEST);
        GL.depthFunc(GL.LEQUAL);
        
        if (!inited) {
            inited = true;
            // doing it in the PAINT event seems to be the recommended place for this. http://stackoverflow.com/questions/17782108/trouble-initializing-shaders-before-resize-on-wxglcanvas
            initRendering();
        }
        
        GL.viewport(0, 0, width, height);
        GL.clear(GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT);
        
        projectionMatrix = makePerspective(45, width / height, 0.1, 100.0);
        //Matrix3D.createOrtho(0, width, height, 0, 1000, -1000);
        modelViewMatrix.identity();
        
        // Triangle
        
        modelViewMatrix.prependTranslation(-1.5, 0.0, -7);
        
        GL.bindBuffer(GL.ARRAY_BUFFER, triangleVertexPositionBuffer);
        GL.vertexAttribPointer(vertexPositionAttribute, triangleItemSize, GL.FLOAT, false, 0, 0);
    
        setMatrixUniforms();
        
        GL.drawArrays(GL.TRIANGLES, 0, triangleNumItems);
        
        // Square
        
        modelViewMatrix.prependTranslation(3.0, 0.0, 0.0);
        
        GL.bindBuffer(GL.ARRAY_BUFFER, squareVertexPositionBuffer);
        GL.vertexAttribPointer(vertexPositionAttribute, squareItemSize, GL.FLOAT, false, 0, 0);
    
        setMatrixUniforms();
        
        GL.drawArrays(GL.TRIANGLE_STRIP, 0, squareNumItems);
        
        GL.flush();
        
        this.flip();
    }

    public static function create(inParent:Window,?inID:Int,?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int)
    {
        if (inParent==null)
            throw Error.INVALID_PARENT;
        
        var args:Array<Dynamic> = [inParent.wxHandle,inID,"",inPosition,inSize, inStyle];
        var handle = wx.GLCanvas.wx_glcanvas_create(args);
        var w:Int = inSize==null ? -1 : inSize.width;
        var h:Int = inSize==null ? -1 : inSize.height;
        var stage = new GLView(handle,w,h);
        
        stage.myOnSize(null);
        
        return stage;
   }
}