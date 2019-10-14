//  Copyright (c) 2014 Thomas Heller
//  Copyright (c) 2014-2015 Anton Bikineev
//
//  SPDX-License-Identifier: BSL-1.0
//  Distributed under the Boost Software License, Version 1.0. (See accompanying
//  file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

// hpxinspect:nodeprecatedinclude:boost/shared_ptr.hpp
// hpxinspect:nodeprecatedname:boost::shared_ptr

#ifndef HPX_SERIALIZATION_SHARED_PTR_HPP
#define HPX_SERIALIZATION_SHARED_PTR_HPP

#include <hpx/config.hpp>
#include <hpx/serialization/detail/pointer.hpp>
#include <hpx/serialization/serialization_fwd.hpp>
#include <hpx/serialization/serialize.hpp>

#if defined(HPX_SERIALIZATION_HAVE_BOOST_TYPES)
#include <boost/shared_ptr.hpp>
#endif

#include <memory>

namespace hpx { namespace serialization {

#if defined(HPX_SERIALIZATION_HAVE_BOOST_TYPES)
    template <typename T>
    void load(input_archive& ar, boost::shared_ptr<T>& ptr, unsigned)
    {
        detail::serialize_pointer_tracked(ar, ptr);
    }

    template <typename T>
    void save(output_archive& ar, boost::shared_ptr<T> const& ptr, unsigned)
    {
        detail::serialize_pointer_tracked(ar, ptr);
    }

    HPX_SERIALIZATION_SPLIT_FREE_TEMPLATE(
        (template <typename T>), (boost::shared_ptr<T>) )
#endif

    template <typename T>
    void load(input_archive& ar, std::shared_ptr<T>& ptr, unsigned)
    {
        detail::serialize_pointer_tracked(ar, ptr);
    }

    template <typename T>
    void save(output_archive& ar, std::shared_ptr<T> const& ptr, unsigned)
    {
        detail::serialize_pointer_tracked(ar, ptr);
    }

    HPX_SERIALIZATION_SPLIT_FREE_TEMPLATE(
        (template <typename T>), (std::shared_ptr<T>) )
}}    // namespace hpx::serialization

#endif
