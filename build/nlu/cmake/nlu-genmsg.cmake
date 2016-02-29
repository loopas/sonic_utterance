# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "nlu: 5 messages, 0 services")

<<<<<<< HEAD
set(MSG_I_FLAGS "-Inlu:/home/m/catkin_ws/src/nlu/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
=======
set(MSG_I_FLAGS "-Inlu:/home/m/catkin_ws/src/nlu/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(nlu_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midi.msg" NAME_WE)
add_custom_target(_nlu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nlu" "/home/m/catkin_ws/src/nlu/msg/midi.msg" "nlu/midiCC:nlu/midiNote"
)

<<<<<<< HEAD
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/aroval.msg" NAME_WE)
add_custom_target(_nlu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nlu" "/home/m/catkin_ws/src/nlu/msg/aroval.msg" ""
)

=======
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/croaches.msg" NAME_WE)
add_custom_target(_nlu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nlu" "/home/m/catkin_ws/src/nlu/msg/croaches.msg" ""
)

get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiCC.msg" NAME_WE)
add_custom_target(_nlu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nlu" "/home/m/catkin_ws/src/nlu/msg/midiCC.msg" ""
)

<<<<<<< HEAD
=======
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/aroval.msg" NAME_WE)
add_custom_target(_nlu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nlu" "/home/m/catkin_ws/src/nlu/msg/aroval.msg" ""
)

>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiNote.msg" NAME_WE)
add_custom_target(_nlu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nlu" "/home/m/catkin_ws/src/nlu/msg/midiNote.msg" ""
)

#
<<<<<<< HEAD
#  langs = gencpp;geneus;genlisp;genpy
=======
#  langs = gencpp;genlisp;genpy
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(nlu
<<<<<<< HEAD
  "/home/m/catkin_ws/src/nlu/msg/aroval.msg"
  "${MSG_I_FLAGS}"
  ""
=======
  "/home/m/catkin_ws/src/nlu/msg/midi.msg"
  "${MSG_I_FLAGS}"
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg;/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nlu
)
_generate_msg_cpp(nlu
  "/home/m/catkin_ws/src/nlu/msg/croaches.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nlu
)
_generate_msg_cpp(nlu
<<<<<<< HEAD
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg"
=======
  "/home/m/catkin_ws/src/nlu/msg/aroval.msg"
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nlu
)
_generate_msg_cpp(nlu
<<<<<<< HEAD
  "/home/m/catkin_ws/src/nlu/msg/midi.msg"
  "${MSG_I_FLAGS}"
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg;/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
=======
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg"
  "${MSG_I_FLAGS}"
  ""
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nlu
)
_generate_msg_cpp(nlu
  "/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nlu
)

### Generating Services

### Generating Module File
_generate_module_cpp(nlu
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nlu
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(nlu_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(nlu_generate_messages nlu_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midi.msg" NAME_WE)
add_dependencies(nlu_generate_messages_cpp _nlu_generate_messages_check_deps_${_filename})
<<<<<<< HEAD
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/aroval.msg" NAME_WE)
add_dependencies(nlu_generate_messages_cpp _nlu_generate_messages_check_deps_${_filename})
=======
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/croaches.msg" NAME_WE)
add_dependencies(nlu_generate_messages_cpp _nlu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiCC.msg" NAME_WE)
add_dependencies(nlu_generate_messages_cpp _nlu_generate_messages_check_deps_${_filename})
<<<<<<< HEAD
=======
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/aroval.msg" NAME_WE)
add_dependencies(nlu_generate_messages_cpp _nlu_generate_messages_check_deps_${_filename})
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiNote.msg" NAME_WE)
add_dependencies(nlu_generate_messages_cpp _nlu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nlu_gencpp)
add_dependencies(nlu_gencpp nlu_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nlu_generate_messages_cpp)

<<<<<<< HEAD
### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(nlu
  "/home/m/catkin_ws/src/nlu/msg/aroval.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nlu
)
_generate_msg_eus(nlu
  "/home/m/catkin_ws/src/nlu/msg/croaches.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nlu
)
_generate_msg_eus(nlu
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nlu
)
_generate_msg_eus(nlu
  "/home/m/catkin_ws/src/nlu/msg/midi.msg"
  "${MSG_I_FLAGS}"
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg;/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nlu
)
_generate_msg_eus(nlu
  "/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nlu
)

### Generating Services

### Generating Module File
_generate_module_eus(nlu
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nlu
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(nlu_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(nlu_generate_messages nlu_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midi.msg" NAME_WE)
add_dependencies(nlu_generate_messages_eus _nlu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/aroval.msg" NAME_WE)
add_dependencies(nlu_generate_messages_eus _nlu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/croaches.msg" NAME_WE)
add_dependencies(nlu_generate_messages_eus _nlu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiCC.msg" NAME_WE)
add_dependencies(nlu_generate_messages_eus _nlu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiNote.msg" NAME_WE)
add_dependencies(nlu_generate_messages_eus _nlu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nlu_geneus)
add_dependencies(nlu_geneus nlu_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nlu_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(nlu
  "/home/m/catkin_ws/src/nlu/msg/aroval.msg"
  "${MSG_I_FLAGS}"
  ""
=======
### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(nlu
  "/home/m/catkin_ws/src/nlu/msg/midi.msg"
  "${MSG_I_FLAGS}"
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg;/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nlu
)
_generate_msg_lisp(nlu
  "/home/m/catkin_ws/src/nlu/msg/croaches.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nlu
)
_generate_msg_lisp(nlu
<<<<<<< HEAD
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg"
=======
  "/home/m/catkin_ws/src/nlu/msg/aroval.msg"
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nlu
)
_generate_msg_lisp(nlu
<<<<<<< HEAD
  "/home/m/catkin_ws/src/nlu/msg/midi.msg"
  "${MSG_I_FLAGS}"
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg;/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
=======
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg"
  "${MSG_I_FLAGS}"
  ""
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nlu
)
_generate_msg_lisp(nlu
  "/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nlu
)

### Generating Services

### Generating Module File
_generate_module_lisp(nlu
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nlu
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(nlu_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(nlu_generate_messages nlu_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midi.msg" NAME_WE)
add_dependencies(nlu_generate_messages_lisp _nlu_generate_messages_check_deps_${_filename})
<<<<<<< HEAD
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/aroval.msg" NAME_WE)
add_dependencies(nlu_generate_messages_lisp _nlu_generate_messages_check_deps_${_filename})
=======
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/croaches.msg" NAME_WE)
add_dependencies(nlu_generate_messages_lisp _nlu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiCC.msg" NAME_WE)
add_dependencies(nlu_generate_messages_lisp _nlu_generate_messages_check_deps_${_filename})
<<<<<<< HEAD
=======
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/aroval.msg" NAME_WE)
add_dependencies(nlu_generate_messages_lisp _nlu_generate_messages_check_deps_${_filename})
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiNote.msg" NAME_WE)
add_dependencies(nlu_generate_messages_lisp _nlu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nlu_genlisp)
add_dependencies(nlu_genlisp nlu_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nlu_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(nlu
<<<<<<< HEAD
  "/home/m/catkin_ws/src/nlu/msg/aroval.msg"
  "${MSG_I_FLAGS}"
  ""
=======
  "/home/m/catkin_ws/src/nlu/msg/midi.msg"
  "${MSG_I_FLAGS}"
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg;/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nlu
)
_generate_msg_py(nlu
  "/home/m/catkin_ws/src/nlu/msg/croaches.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nlu
)
_generate_msg_py(nlu
<<<<<<< HEAD
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg"
=======
  "/home/m/catkin_ws/src/nlu/msg/aroval.msg"
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nlu
)
_generate_msg_py(nlu
<<<<<<< HEAD
  "/home/m/catkin_ws/src/nlu/msg/midi.msg"
  "${MSG_I_FLAGS}"
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg;/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
=======
  "/home/m/catkin_ws/src/nlu/msg/midiCC.msg"
  "${MSG_I_FLAGS}"
  ""
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nlu
)
_generate_msg_py(nlu
  "/home/m/catkin_ws/src/nlu/msg/midiNote.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nlu
)

### Generating Services

### Generating Module File
_generate_module_py(nlu
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nlu
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(nlu_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(nlu_generate_messages nlu_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midi.msg" NAME_WE)
add_dependencies(nlu_generate_messages_py _nlu_generate_messages_check_deps_${_filename})
<<<<<<< HEAD
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/aroval.msg" NAME_WE)
add_dependencies(nlu_generate_messages_py _nlu_generate_messages_check_deps_${_filename})
=======
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/croaches.msg" NAME_WE)
add_dependencies(nlu_generate_messages_py _nlu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiCC.msg" NAME_WE)
add_dependencies(nlu_generate_messages_py _nlu_generate_messages_check_deps_${_filename})
<<<<<<< HEAD
=======
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/aroval.msg" NAME_WE)
add_dependencies(nlu_generate_messages_py _nlu_generate_messages_check_deps_${_filename})
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
get_filename_component(_filename "/home/m/catkin_ws/src/nlu/msg/midiNote.msg" NAME_WE)
add_dependencies(nlu_generate_messages_py _nlu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nlu_genpy)
add_dependencies(nlu_genpy nlu_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nlu_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nlu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nlu
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(nlu_generate_messages_cpp std_msgs_generate_messages_cpp)

<<<<<<< HEAD
if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nlu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nlu
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(nlu_generate_messages_eus std_msgs_generate_messages_eus)

=======
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565
if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nlu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nlu
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(nlu_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nlu)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nlu\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nlu
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(nlu_generate_messages_py std_msgs_generate_messages_py)
