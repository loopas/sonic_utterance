// Generated by gencpp from file nlu/aroval.msg
// DO NOT EDIT!


#ifndef NLU_MESSAGE_AROVAL_H
#define NLU_MESSAGE_AROVAL_H


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
struct aroval_
{
  typedef aroval_<ContainerAllocator> Type;

  aroval_()
    : arousal(0.0)
    , valence(0.0)  {
    }
  aroval_(const ContainerAllocator& _alloc)
    : arousal(0.0)
    , valence(0.0)  {
    }



   typedef float _arousal_type;
  _arousal_type arousal;

   typedef float _valence_type;
  _valence_type valence;




  typedef boost::shared_ptr< ::nlu::aroval_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nlu::aroval_<ContainerAllocator> const> ConstPtr;

}; // struct aroval_

typedef ::nlu::aroval_<std::allocator<void> > aroval;

typedef boost::shared_ptr< ::nlu::aroval > arovalPtr;
typedef boost::shared_ptr< ::nlu::aroval const> arovalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nlu::aroval_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nlu::aroval_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::nlu::aroval_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nlu::aroval_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nlu::aroval_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nlu::aroval_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nlu::aroval_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nlu::aroval_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nlu::aroval_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deb93fb762dda020985704a2147802dd";
  }

  static const char* value(const ::nlu::aroval_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdeb93fb762dda020ULL;
  static const uint64_t static_value2 = 0x985704a2147802ddULL;
};

template<class ContainerAllocator>
struct DataType< ::nlu::aroval_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nlu/aroval";
  }

  static const char* value(const ::nlu::aroval_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nlu::aroval_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32   arousal\n\
float32   valence\n\
";
  }

  static const char* value(const ::nlu::aroval_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nlu::aroval_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.arousal);
      stream.next(m.valence);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct aroval_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nlu::aroval_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nlu::aroval_<ContainerAllocator>& v)
  {
    s << indent << "arousal: ";
    Printer<float>::stream(s, indent + "  ", v.arousal);
    s << indent << "valence: ";
    Printer<float>::stream(s, indent + "  ", v.valence);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NLU_MESSAGE_AROVAL_H
