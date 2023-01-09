 DROP DATABASE platziblog; 


CREATE DATABASE platziblog;

 USE platziblog; 

CREATE TABLE usuarios (
  id int(11) NOT NULL,
  login varchar(30) NOT NULL,
  password varchar(32) NOT NULL,
  nickname varchar(40) NOT NULL,
  email varchar(40) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY email_UNIQUE (email)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;




CREATE TABLE categorias (
  id int(11) NOT NULL,
  nombre varchar(30) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

CREATE TABLE etiquetas (
  id int(11) NOT NULL,
  nombre varchar(30) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;


CREATE TABLE posts  (
   id int(11) NOT NULL,
   titulo varchar(130) NOT NULL,
   fecha_publicacion  timestamp NULL DEFAULT NULL,
   contenido text NOT NULL,
   estatus char(8) DEFAULT'activo',
   usuario_id int(11) DEFAULT NULL,
   categoria_id int(11) DEFAULT NULL,
  PRIMARY KEY ( id ),
  KEY posts_usuarios_idx  ( usuario_id ),
  KEY posts_categorias_idx  ( categoria_id ),
  CONSTRAINT posts_categorias  FOREIGN KEY ( categoria_id ) REFERENCES platziblog.categorias  ( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT posts_usuarios  FOREIGN KEY ( usuario_id ) REFERENCES platziblog.usuarios  ( id ) ON DELETE NO ACTION ON UPDATE CASCADE
  ) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;




CREATE TABLE comentarios  (
   id int(11) NOT NULL,
   cuerpo_comentario text NOT NULL,
   usuario_id int(11) NOT NULL,
   post_id int(11) NOT NULL,
  PRIMARY KEY ( id ),
  KEY comentarios_usuario_idx  ( usuario_id ),
  KEY comentarios_post_idx  ( post_id ),
  CONSTRAINT comentarios_post  FOREIGN KEY ( post_id ) REFERENCES platziblog.posts  ( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT comentarios_usuario  FOREIGN KEY ( usuario_id ) REFERENCES platziblog.usuarios  ( id ) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE posts_etiquetas  (
   id int(11) NOT NULL AUTO_INCREMENT,
   post_id int(11) NOT NULL,
   etiqueta_id int(11) NOT NULL,
  PRIMARY KEY ( id ),
  KEY postsetiquetas_post_idx  ( post_id ),
  KEY postsetiquetas_etiquetas_idx  ( etiqueta_id ),
  CONSTRAINT postsetiquetas_etiquetas  FOREIGN KEY ( etiqueta_id ) REFERENCES platziblog.etiquetas  ( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT postsetiquetas_post  FOREIGN KEY ( post_id ) REFERENCES platziblog.posts  ( id ) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;