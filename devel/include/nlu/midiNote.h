// Generated by gencpp from file nlu/midiNote.msg
// DO NOT EDIT!


#ifndef NLU_MESSAGE_MIDINOTE_H
#define NLU_MESSAGE_MIDINOTE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace nlu
{
template <class ContainerAllocator>
struct midiNote_
{
  typedef midiNote_<ContainerAllocator> Type;

  midiNote_()
    : channel(0)
    , note(0)
    , velocity(0)  {
    }
  midiNote_(const ContainerAllocator& _alloc)
    : channel(0)
    , note(0)
    , velocity(0)  {
    }



   typedef uint8_t _channel_type;
  _channel_type channel;

   typedef uint8_t _note_type;
  _note_type note;

   typedef uint8_t _velocity_type;
  _velocity_type velocity;




  typedef boost::shared_ptr< ::nlu::midiNote_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nlu::midiNote_<ContainerAllocator> const> ConstPtr;

}; // struct midiNote_

typedef ::nlu::midiNote_<std::allocator<void> > midiNote;

typedef boost::shared_ptr< ::nlu::midiNote > midiNotePtr;
typedef boost::shared_ptr< ::nlu::midiNote const> midiNoteConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nlu::midiNote_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nlu::midiNote_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace nlu

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
<<<<<<< HEAD
// {'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg'], 'nlu': ['/home/m/catkin_ws/src/nlu/msg']}
=======
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'nlu': ['/home/m/catkin_ws/src/nlu/msg']}
>>>>>>> b883065350307bba6f0f0bd12bed736de3baf565

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::nlu::midiNote_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nlu::midiNote_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nlu::midiNote_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nlu::midiNote_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nlu::midiNote_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nlu::midiNote_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nlu::midiNote_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b3472d1c37f93be8434bb9e07c11582b";
  }

  static const char* value(const ::nlu::midiNote_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb3472d1c37f93be8ULL;
  static const uint64_t static_value2 = 0x434bb9e07c11582bULL;
};

template<class ContainerAllocator>
struct DataType< ::nlu::midiNote_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nlu/midiNote";
  }

  static const char* value(const ::nlu::midiNote_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nlu::midiNote_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8   channel\n\
uint8   note\n\
uint8   velocity\n\
\n\
";
  }

  static const char* value(const ::nlu::midiNote_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nlu::midiNote_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.channel);
      stream.next(m.note);
      stream.next(m.velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct midiNote_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nlu::midiNote_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nlu::midiNote_<ContainerAllocator>& v)
  {
    s << indent << "channel: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.channel);
    s << indent << "note: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.note);
    s << indent << "velocity: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.velocity);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NLU_MESSAGE_MIDINOTE_H
