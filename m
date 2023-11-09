Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAF68902A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 16:19:20 +0000 (UTC)
Date: Thu, 9 Nov 2023 09:18:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <ZUyj4AgzeobrFCuE@DUT025-TGLU.fm.intel.com>
References: <20231109151347.2129614-1-priyanka.dandamudi@intel.com>
 <20231109151347.2129614-2-priyanka.dandamudi@intel.com>
 <20231109160710.6tfhmeqpvhwu7o7z@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231109160710.6tfhmeqpvhwu7o7z@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2 i-g-t] tests/intel/xe_engine_property: Add
 engine set property tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 05:07:10PM +0100, Kamil Konieczny wrote:
> Hi Priyanka,
> 
> On 2023-11-09 at 20:43:46 +0530, priyanka.dandamudi@intel.com wrote:
> > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > 
> > Added tests to check engine set properties.

s/engine/exec_queue

> > It tests basic positive and invalid values for priority and persistence.
> > 
> > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > ---
> >  tests/intel/xe_engine_property.c | 102 +++++++++++++++++++++++++++++++

s/xe_engine_property/xe_exec_queue_property/

Matt

> >  tests/meson.build                |   1 +
> >  2 files changed, 103 insertions(+)
> >  create mode 100644 tests/intel/xe_engine_property.c
> > 
> > diff --git a/tests/intel/xe_engine_property.c b/tests/intel/xe_engine_property.c
> > new file mode 100644
> > index 000000000..18e050f96
> > --- /dev/null
> > +++ b/tests/intel/xe_engine_property.c
> > @@ -0,0 +1,102 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +/**
> > + * TEST: Basic tests to check engine set property functionality
> > + * Category: Software building block
> > + * Run type: FULL
> ----- ^^^^^^^^^^^^^^
> No need for specifing this anymore.
> 
> > + * Sub-category: engine property
> > + * Functionality: engine set property
> > + * Test category: functionality test
> > + * SUBTEST: priority-set-property
> > + * Description: tests basic priority property by setting invalid values and positive values.
> > + * SUBTEST: persistence-set-property
> > + * Description: tests basic persistence property by setting positive values
> > + */
> > +
> > +#include <dirent.h>
> > +#include <fcntl.h>
> > +#include <string.h>
> > +#include <sys/stat.h>
> > +#include <sys/types.h>
> > +
> > +#include "igt.h"
> > +#include "xe_drm.h"
> ------------ ^^^^
> Move this after "lib/..."
> 
> Regards,
> Kamil
> 
> > +#include "lib/igt_syncobj.h"
> > +#include "lib/intel_reg.h"
> > +#include "xe/xe_ioctl.h"
> > +#include "xe/xe_query.h"
> > +
> > +#define DRM_SCHED_PRIORITY_HIGH  2
> > +#define DRM_SCHED_PRIORITY_NORMAL 1
> > +
> > +static void test_set_property(int xe, int property_name,
> > +			      int property_value, int err_val)
> > +{
> > +	struct drm_xe_engine_class_instance instance = {
> > +			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
> > +	};
> > +	struct drm_xe_ext_set_property ext = {
> > +		.base.next_extension = 0,
> > +		.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> > +		.property = property_name,
> > +		.value = property_value,
> > +	};
> > +
> > +	struct drm_xe_exec_queue_create create = {
> > +		.extensions = to_user_pointer(&ext),
> > +		.width = 1,
> > +		.num_placements = 1,
> > +		.instances = to_user_pointer(&instance),
> > +		.vm_id = xe_vm_create(xe, 0, 0),
> > +	};
> > +	int ret = 0;
> > +
> > +	if (igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
> > +		ret = -errno;
> > +		errno = 0;
> > +	}
> > +	igt_assert_eq(ret, err_val);
> > +}
> > +
> > +igt_main
> > +{
> > +	int xe;
> > +
> > +	igt_fixture {
> > +		xe = drm_open_driver(DRIVER_XE);
> > +	}
> > +
> > +	igt_subtest("priority-set-property") {
> > +		/* Tests priority property by setting positive values. */
> > +		test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> > +				  DRM_SCHED_PRIORITY_NORMAL, 0);
> > +
> > +		/* Tests priority property by setting invalid value. */
> > +		test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> > +				  DRM_SCHED_PRIORITY_HIGH + 1, -EINVAL);
> > +		igt_fork(child, 1) {
> > +			igt_drop_root();
> > +
> > +			/* Tests priority property by dropping root permissions. */
> > +			test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> > +					  DRM_SCHED_PRIORITY_HIGH, -EPERM);
> > +			test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> > +					  DRM_SCHED_PRIORITY_NORMAL, 0);
> > +		}
> > +		igt_waitchildren();
> > +	}
> > +
> > +	igt_subtest("persistence-set-property") {
> > +		/* Tests persistence property by setting positive values. */
> > +		test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE, 1, 0);
> > +
> > +	}
> > +
> > +	igt_fixture {
> > +		xe_device_put(xe);
> > +		drm_close_driver(xe);
> > +	}
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 62721157d..1b7cd6544 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -281,6 +281,7 @@ intel_xe_progs = [
> >  	'xe_dma_buf_sync',
> >  	'xe_debugfs',
> >  	'xe_drm_fdinfo',
> > +	'xe_engine_property',
> >  	'xe_evict',
> >  	'xe_evict_ccs',
> >  	'xe_exec_balancer',
> > -- 
> > 2.25.1
> > 
