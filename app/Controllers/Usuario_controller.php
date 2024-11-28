<?php
namespace App\Controllers;
Use App\Models\Usuarios_model;
use CodeIgniter\Controller;

class Usuario_controller extends Controller{

	public function __construct(){
           helper(['form', 'url']);

	}
   
    public function create() {
         $data['titulo']='Registro';
         echo view('navbar/navbar'); 
        echo view('header/header',$data);        
         echo view('SignUp/SignUp');
          echo view('footer/footer');
     
    }
 
    public function formValidation() {
          //helper(['form', 'url']);
        
        $input = $this->validate([
            'nombre'   => 'required|min_length[3]',
            'apellido' => 'required|min_length[3]|max_length[25]',
            'email'    => 'required|min_length[4]|max_length[100]|valid_email|is_unique[usuarios.email]',
            'usuario'  => 'required|min_length[3]',
            'telefono'  => 'required|min_length[10]|max_length[10]',
            'direccion'  => 'required|max_length[100]',
            'pass'     => 'required|min_length[3]|max_length[10]'
        ]);
        $formModel = new Usuarios_model();
        
        if (!$input) {
               $data['titulo']='Registro'; 
                echo view('header/header',$data);
                echo view('navbar/navbar');
                echo view('usuarios/registrarse',['validation' => $this->validator]);
                echo view('footer/footer');
        } else {
            $formModel->save([
                'nombre' => $this->request->getVar('nombre'),
                'apellido' => $this->request->getVar('apellido'),
                'usuario' => $this->request->getVar('usuario'),
                'telefono' => $this->request->getVar('telefono'),
                'direccion' => $this->request->getVar('direccion'),
                'email'  => $this->request->getVar('email'),
                'pass' => password_hash($this->request->getVar('pass'), PASSWORD_DEFAULT)
            ]);  
            session()->setFlashdata('msg', 'Registro Completado Con Éxito!');
              return $this->response->redirect(site_url(''));
        }
    }


    public function nuevoUsuario() {
         $data['titulo']='Crear Nuevo Usuario'; 
         echo view('navbar/navbar');
         echo view('header/header',$data);        
         echo view('admin/creoNuevoUsuario_view');
         echo view('footer/footer');
     
    }

    public function formValidationAdmin() {
          //helper(['form', 'url']);
        
        $input = $this->validate([
            'nombre'   => 'required|min_length[3]',
            'apellido' => 'required|min_length[3]|max_length[25]',
            'email'    => 'required|min_length[4]|max_length[100]|valid_email|is_unique[usuarios.email]',
            'usuario'  => 'required|min_length[3]',
            'telefono'  => 'required|min_length[10]|max_length[10]',
            'direccion'  => 'required|max_length[100]',
            'pass'     => 'required|min_length[3]|max_length[10]',
            'perfil_id'=> 'required|max_length[1]'
            
        ]);
        $formModel = new Usuarios_model();
        
        if (!$input) {
               $data['titulo']='Registro'; 
                echo view('navbar/navbar');
                echo view('header/header',$data);                
                echo view('admin/creoNuevoUsuario_view',['validation' => $this->validator]);
                echo view('footer/footer');
        } else {
            $formModel->save([
                'nombre' => $this->request->getVar('nombre'),
                'apellido' => $this->request->getVar('apellido'),
                'usuario' => $this->request->getVar('usuario'),
                'telefono' => $this->request->getVar('telefono'),
                'direccion' => $this->request->getVar('direccion'),
                'email'  => $this->request->getVar('email'),
                'pass' => password_hash($this->request->getVar('pass'), PASSWORD_DEFAULT),
                'perfil_id'  => $this->request->getVar('perfil_id'),

            ]); 
            session()->setFlashdata('msg','Usuario Creado');
             return redirect()->to(base_url('usuarios-list'));
        }
    }

    public function formValidationEdit() {
        
        //print_r($_POST);exit;
        
        $input = $this->validate([
            'nombre'   => 'required|min_length[3]|string',
            'apellido' => 'required|min_length[3]|max_length[25]',
            'email'    => 'required|min_length[4]|max_length[100]|valid_email',
            'usuario'  => 'required|min_length[3]',
            'telefono'  => 'required|min_length[10]|max_length[10]',
            'direccion'  => 'required|max_length[100]',
            'pass'     => 'required|min_length[3]',
            'perfil_id'=> 'required|max_length[1]',
            'baja'  => 'required|max_length[2]'
        ]);
        $Model = new Usuarios_model();
        $id=$_POST['id'];
        if (!$input) {
            $data=$Model->getUsuario($id);
            $dato['titulo']='Editar Usuario'; 
                echo view('navbar/navbar');
                echo view('header/header',$dato);                
                echo view('back/Admin/editarUsuarios_view',compact('data'));
                echo view('footer');
        } else {
            $data=$Model->getUsuario($id);
            $pass=$data['pass'];
            $hash=$_POST['pass'];
            if($pass == $hash){ 
            $datos=[
                'id' => $_POST['id'],
                'nombre' =>$_POST['nombre'],
                'apellido' => $_POST['apellido'],
                'email' => $_POST['email'],
                'usuario'  => $_POST['usuario'],
                'telefono'  => $_POST['telefono'],
                'direccion'  => $_POST['direccion'],
                'pass' => $_POST['pass'],
                'perfil_id'  => $_POST['perfil_id'],
                'baja'  => $_POST['baja'],
            ];
         }else{
            $datos=[
                'id' => $_POST['id'],
                'nombre' =>$_POST['nombre'],
                'apellido' => $_POST['apellido'],
                'email' => $_POST['email'],
                'usuario'  => $_POST['usuario'],
                'telefono'  => $_POST['telefono'],
                'direccion'  => $_POST['direccion'],
                'pass' => password_hash($_POST['pass'],PASSWORD_DEFAULT),
                'perfil_id'  => $_POST['perfil_id'],
                'baja'  => $_POST['baja'],
            ];
         }
         $Model -> update($id,$datos);

         session()->setFlashdata('msg','Usuario Editado');

         return redirect()->to(base_url('usuarios-list'));
        }
    }

    public function usuariosEliminados(){
        $userModel = new Usuarios_model();
        $baja='SI';
        $data['usuarios'] = $userModel->getUsBaja($baja);
        $dato['titulo']='Usuarios Eliminados';
        echo view('navbar/navbar'); 
        echo view('header/header',$dato);
         echo view('admin/listUS_Eliminados_view',$data);
          echo view('footer/footer');
    }

    public function usuarioEdit() {
        
        //print_r($_POST);exit;
        
        $input = $this->validate([
            'nombre'   => 'required|min_length[3]',
            'apellido' => 'required|min_length[3]|max_length[25]',
            'email'    => 'required|min_length[4]|max_length[100]|valid_email',
            'usuario'  => 'required|min_length[3]',
            'telefono'  => 'required|min_length[10]|max_length[10]',
            'direccion'  => 'required|max_length[100]',
            'pass'     => 'required|min_length[3]'
        ]);
        $Model = new Usuarios_model();
        $id=$_POST['id'];
        if (!$input) {
            $data=$Model->getUsuario($id);
            $dato['titulo']='Editar Usuario'; 
                echo view('header',$dato);
                echo view('nav_view');
                echo view('back/usuario/editoMisDatos_view',compact('data'));
                echo view('footer');
        } else {
            $data=$Model->getUsuario($id);
            $pass=$data['pass'];
            $hash=$_POST['pass'];
            if($pass == $hash){ 
            $datos=[
                'id' => $_POST['id'],
                'nombre' =>$_POST['nombre'],
                'apellido' => $_POST['apellido'],
                'email' => $_POST['email'],
                'usuario'  => $_POST['usuario'],
                'telefono'  => $_POST['telefono'],
                'direccion'  => $_POST['direccion'],
                'pass' => $_POST['pass'],
                
            ];
         }else{
            $datos=[
                'id' => $_POST['id'],
                'nombre' =>$_POST['nombre'],
                'apellido' => $_POST['apellido'],
                'email' => $_POST['email'],
                'usuario'  => $_POST['usuario'],
                'telefono'  => $_POST['telefono'],
                'direccion'  => $_POST['direccion'],
                'pass' => password_hash($_POST['pass'],PASSWORD_DEFAULT),
                
            ];
         } 
         
         
         $Model -> update($id,$datos);

         session()->setFlashdata('msg','Datos Editados con Éxito');

         return redirect()->to(base_url('/'));
        }
    }

    public function delete($id){
    
        $Model=new Usuarios_model();
        $data=$Model->getUsuario($id);
        $datos=[
                'id' => 'id',
                'baja'  => 'SI',
                
            ];
        $Model->update($id,$datos);

        session()->setFlashdata('msg','Usuario Eliminado');

        return redirect()->to(base_url('usuarios-list'));
    }

    public function habilitar($id){
    
        $Model=new Usuarios_model();
        $data=$Model->getUsuario($id);
        $datos=[
                'id' => 'id',
                'baja'  => 'NO',
                
            ];
        $Model->update($id,$datos);

        session()->setFlashdata('msg','Usuario Habilitado');

        return redirect()->to(base_url('eliminados'));
    }
   
}