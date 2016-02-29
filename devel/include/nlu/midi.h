// Generated by gencpp from file nlu/midi.msg
// DO NOT EDIT!


#ifndef NLU_MESSAGE_MIDI_H
#define NLU_MESSAGE_MIDI_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <nlu/midiNote.h>
#include <nlu/midiCC.h>

namespace nlu
{
template <class ContainerAllocator>
struct midi_
{
  typedef midi_<ContainerAllocator> Type;

  midi_()
    : midi_msg()
    , arousal(0.0)
    , valence(0.0)
    , vocal()
    , note()
    , control()  {
    }
  midi_(const ContainerAllocator& _alloc)
    : midi_msg(_alloc)
    , arousal(0.0)
    , valence(0.0)
    , vocal(_alloc)
    , note(_alloc)
    , control(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _midi_msg_type;
  _midi_msg_type midi_msg;

   typedef float _arousal_type;
  _arousal_type arousal;

   typedef float _valence_type;
  _valence_type valence;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _vocal_type;
  _vocal_type vocal;

   typedef  ::nlu::midiNote_<ContainerAllocator>  _note_type;
  _note_type note;

   typedef  ::nlu::midiCC_<ContainerAllocator>  _control_type;
  _control_type control;




  typedef boost::shared_ptr< ::nlu::midi_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nlu::midi_<ContainerAllocator> const> ConstPtr;

}; // struct midi_

typedef ::nlu::midi_<std::allocator<void> > midi;

typedef boost::shared_ptr< ::nlu::midi > midiPtr;
typedef boost::shared_ptr< ::nlu::midi const> midiConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nlu::midi_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nlu::midi_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace nlu

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
<<<<<<< HEAD
// {'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg'], 'nlu': ['/home/m/catkin_ws/src/nlu/msg']}
=======
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'nlu': ['/home/m/catkin_ws/src/nlu/msg']}
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::nlu::midi_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nlu::midi_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nlu::midi_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nlu::midi_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nlu::midi_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nlu::midi_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nlu::midi_<ContainerAllocator> >
{
  static const char* value()
  {
    return "89ac7e18db078d2e326de3ebee350de8";
  }

  static const char* value(const ::nlu::midi_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x89ac7e18db078d2eULL;
  static const uint64_t static_value2 = 0x326de3ebee350de8ULL;
};

template<class ContainerAllocator>
struct DataType< ::nlu::midi_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nlu/midi";
  }

  static const char* value(const ::nlu::midi_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nlu::midi_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string    midi_msg\n\
float32   arousal\n\
float32   valence\n\
string    vocal\n\
midiNote  note\n\
midiCC  control\n\
\n\
\n\
================================================================================\n\
MSG: nlu/midiNote\n\
uint8   channel\n\
uint8   note\n\
uint8   velocity\n\
\n\
\n\
================================================================================\n\
MSG: nlu/midiCC\n\
uint16[]  channel\n\
uint16[]  control\n\
int16[]   value\n\
";
  }

  static const char* value(const ::nlu::midi_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nlu::midi_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.midi_msg);
      stream.next(m.arousal);
      stream.next(m.valence);
      stream.next(m.vocal);
      stream.next(m.note);
      stream.next(m.control);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct midi_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nlu::midi_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nlu::midi_<ContainerAllocator>& v)
  {
    s << indent << "midi_msg: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.midi_msg);
    s << indent << "arousal: ";
    Printer<float>::stream(s, indent + "  ", v.arousal);
    s << indent << "valence: ";
    Printer<float>::stream(s, indent + "  ", v.valence);
    s << indent << "vocal: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.vocal);
    s << indent << "note: ";
    s << std::endl;
    Printer< ::nlu::midiNote_<ContainerAllocator> >::stream(s, indent + "  ", v.note);
    s << indent << "control: ";
    s << std::endl;
    Printer< ::nlu::midiCC_<ContainerAllocator> >::stream(s, indent + "  ", v.control);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NLU_MESSAGE_MIDI_H
