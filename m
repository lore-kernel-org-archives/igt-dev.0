Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BFD10E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 15:35:11 +0000 (UTC)
Date: Thu, 23 Nov 2023 16:34:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: janga.rahul.kumar@intel.com
Message-ID: <20231123153453.m7cxwxpmnuwp7zt2@kamilkon-desk.igk.intel.com>
References: <20231109091136.2119007-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231109091136.2119007-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/intel/xe_engine_property: Add engine
 set property tests
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

Hi priyanka.dandamudi,
On 2023-11-09 at 14:41:36 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added tests to check engine set properties.
> It tests basic positive and invalid values for all properties.
> 
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_engine_property.c | 191 +++++++++++++++++++++++++++++++
>  tests/meson.build                |   1 +
>  2 files changed, 192 insertions(+)
>  create mode 100644 tests/intel/xe_engine_property.c
> 
> diff --git a/tests/intel/xe_engine_property.c b/tests/intel/xe_engine_property.c
> new file mode 100644
> index 000000000..06440bf36
> --- /dev/null
> +++ b/tests/intel/xe_engine_property.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +/**
> + * TEST: Basic tests to check engine set property functionality
> + * Category: Software building block
> + * Run type: FULL
> + * Sub-category: engine property
> + * Functionality: engine set property
> + * Test category: functionality test
> + * SUBTEST: priority-set-property
> + * Description: tests basic priority property by setting invalid values and positive values.
> + * SUBTEST: persistence-set-property
> + * Description: tests basic persistence property by setting positive values
> + * SUBTEST: %s-property-min-max
> + * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
> + *
> + * arg[1]:
> + *
> + * @preempt_timeout_us:		preempt timeout us
> + * @timeslice_duration_us:	timeslice duration us
> + * @job_timeout_ms:		job timeout ms
> + */
> +
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +#include "xe_drm.h"
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include <string.h>
> +#include "igt_sysfs.h"
> +#include <dirent.h>
> +#include <fcntl.h>

Please sort headers alphabetically, first system ones,
then igt.

> +
> +#define DRM_SCHED_PRIORITY_HIGH  2
> +#define DRM_SCHED_PRIORITY_NORMAL 1
---------- ^

This should be in drm u-api?


> +
> +static int get_property_name(const char *property)
> +{
> +	if (strstr(property, "preempt"))
> +		return XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT;
> +	else if (strstr(property, "job_timeout"))
> +		return XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT;
> +	else if (strstr(property, "timeslice"))
> +		return XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE;
> +	else
> +		return -1;
> +}
> +
> +static void test_set_property(int xe, int property_name,
> +			      int property_value, int err_val)
> +{
> +	struct drm_xe_engine_class_instance instance = {
> +			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
> +	};
> +	struct drm_xe_ext_set_property ext = {
> +		.base.next_extension = 0,
> +		.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property = property_name,
> +		.value = property_value,
> +	};
> +
> +	struct drm_xe_exec_queue_create create = {
> +		.extensions = to_user_pointer(&ext),
> +		.width = 1,
> +		.num_placements = 1,
> +		.instances = to_user_pointer(&instance),
> +		.vm_id = xe_vm_create(xe, 0, 0),
> +	};
> +	int ret = 0;
> +
> +	if (igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
> +		ret = -errno;
> +		errno = 0;
> +	}
> +	igt_assert_eq(ret, err_val);
> +}
> +
> +static void test_property_min_max(int xe, int engine, const char **property)
> +{
> +	unsigned int max;
> +	unsigned int min;
> +	unsigned int set;
> +	int property_name;
> +	int defaults;
> +
> +	defaults = openat(engine, ".defaults", O_DIRECTORY);
> +	igt_require(defaults != -1);
> +
> +	igt_sysfs_scanf(defaults, property[2], "%u", &max);
> +	igt_sysfs_scanf(defaults, property[1], "%u", &min);
> +	igt_sysfs_scanf(engine, property[0], "%u", &set);
> +
> +	property_name = get_property_name(property[0]);
> +	igt_assert_neq(property_name, -1);
> +
> +	/* Tests scheduler properties by setting positive values */
> +	test_set_property(xe, property_name, max, 0);
> +	test_set_property(xe, property_name, min, 0);
> +
> +	/* Tests scheduler properties by setting invalid values */
> +	test_set_property(xe, property_name, max + 1, -EINVAL);
> +	test_set_property(xe, property_name, min - 1, -EINVAL);

Add also restore for defaults after test fails.

> +}
> +
> +igt_main
> +{
> +	static const struct {
> +		const char *name;
> +		void (*fn)(int, int, const char **);
> +	} tests[] = {{"property-min-max", test_property_min_max}, {} };
> +
> +	const char *property[][3] = { {"preempt_timeout_us", "preempt_timeout_min", "preempt_timeout_max"},
> +				      {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
> +				      {"job_timeout_ms", "job_timeout_min", "job_timeout_max"},
> +	};
> +	int count = sizeof(property) / sizeof(property[0]);
> +	int sys_fd;
> +	int xe;
> +	int gt;
> +
> +	igt_fixture {
> +		uint16_t devid;
> +
> +		xe = drm_open_driver(DRIVER_XE);
> +		devid = intel_get_drm_devid(xe);
> +
> +		igt_require(xe_supports_faults(xe));
> +		igt_require(IS_PONTEVECCHIO(devid));
> +
> +		sys_fd = igt_sysfs_open(xe);
> +		igt_require(sys_fd != -1);
> +		close(sys_fd);
> +	}
> +
> +	igt_subtest("priority-set-property") {
> +		/* Tests priority property by setting positive values. */
> +		test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> +				  DRM_SCHED_PRIORITY_NORMAL, 0);
> +
> +		/* Tests priority property by setting invalid value. */
> +		test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> +				  DRM_SCHED_PRIORITY_HIGH + 1, -EINVAL);
> +		igt_fork(child, 1) {
> +			igt_drop_root();
> +
> +			/* Tests priority property by dropping root permissions. */
> +			test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> +					  DRM_SCHED_PRIORITY_HIGH, -EPERM);
> +			test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> +					  DRM_SCHED_PRIORITY_NORMAL, 0);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("persistence-set-property") {
> +		/* Tests persistence property by setting positive values. */
> +		test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE, 1, 0);
> +
> +	}
> +
> +	for (int i = 0; i < count; i++) {
> +		for (typeof(*tests) *t = tests; t->name; t++) {
> +			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> +				xe_for_each_gt(xe, gt) {
> +					int engines_fd = -1;
> +					int gt_fd = -1;
> +
> +					gt_fd = xe_sysfs_gt_open(xe, gt);
> +					igt_require(gt_fd != -1);
> +					engines_fd = openat(gt_fd, "engines", O_RDONLY);
> +					igt_require(engines_fd != -1);
> +
> +					igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
> +					close(engines_fd);
> +					close(gt_fd);
> +				}
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		xe_device_put(xe);
--------^
Remove this, drm_close_driver() is taking care of this.
> +		drm_close_driver(xe);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index de91b4418..c8d02cf90 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -310,6 +310,7 @@ intel_xe_progs = [
>  	'xe_spin_batch',
>  	'xe_sysfs_defaults',
>  	'xe_sysfs_scheduler',
> +	'xe_engine_property',

This aslo should be in alphabeticall order.

Regards,
Kamil

>  ]
>  
>  msm_progs = [
> -- 
> 2.25.1
> 
