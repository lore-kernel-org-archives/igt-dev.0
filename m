Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245BCC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 19:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3F110E929;
	Thu,  1 Aug 2024 19:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/7cACCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE4F10E929
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722539058; x=1754075058;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p0gWgIIfJKnU91g3o4z3PjnJ5PK+FyxjSejSxHlVQWA=;
 b=E/7cACClfpEwtndU2Ol5Dsq/qzH3nKiOjS8EUFACxetL+zkWIcKcSjL8
 ZBXGoTBs/1eS1GvPTFcJNe7h6zn+x0pv7gCeebZwlxoABebIjFC0h12mj
 YqV/L+1ZARNah9qgF0R6jtKYZenL/5YajK5LpXVze+2Tdd2lJ5GJ79WJm
 sdLJIjD7pvds/YTrChSzv2ULphMTMlMa0twRvVDaottnC1iCd5a75TMoh
 ReDW4PEiUkj186aohNjWpxPHqTE5LlWhNK8CMbG0o4Srognf9K5TibKuZ
 toIPCV70rtKOrfInU/XYDHdRb/03OPzx0nr3XaIm+HT3olvH+v60S6cze Q==;
X-CSE-ConnectionGUID: LcF7rJylRnmUggYtEB4Evg==
X-CSE-MsgGUID: AG1WxYXURumzoVH6BWVDFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24314836"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="24314836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 12:04:17 -0700
X-CSE-ConnectionGUID: 4UnLUiuoTJ6Tu+mkNSTyRQ==
X-CSE-MsgGUID: QroG526kRriSTo6UWYaF0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55098487"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 12:04:15 -0700
Date: Thu, 1 Aug 2024 21:04:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, janga.rahul.kumar@intel.com,
 sai.gowtham.ch@intel.com, Nakshtra Goyal <nakshtra.goyal@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t,v5 1/2] tests/intel/xe_sysfs_preempt_timeout:
 Porting sysfs preempt test in xe
Message-ID: <20240801190412.sf7x5gdp32ppenwu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com,
 Nakshtra Goyal <nakshtra.goyal@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
References: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
 <20240801150737.3700254-2-nakshtra.goyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240801150737.3700254-2-nakshtra.goyal@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Nakshtra,
On 2024-08-01 at 20:37:36 +0530, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 

Write here what and why. See CONTRIBUTE.md for general hints
how to describe patches. There is already similar test for i915
so subject seems ok, sorry for confusion.

> Changing variable type, sorting igt headers , adding space according to
> commit messages in v3

These looks like change description, not a patch description,
so this imho should be:

v3: Changing variable type, sorting igt headers, adding space

> 
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>

Add also 
Cc: Riana Tauro <riana.tauro@intel.com>

> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_sysfs_preempt_timeout.c | 218 +++++++++++++++++++++++++
>  tests/meson.build                      |   1 +
>  2 files changed, 219 insertions(+)
>  create mode 100644 tests/intel/xe_sysfs_preempt_timeout.c
> 
> diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
> new file mode 100644
> index 000000000..0f2d4a6f7
> --- /dev/null
> +++ b/tests/intel/xe_sysfs_preempt_timeout.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: sysfs preempt timeout
> + * Category: Core
> + * Mega feature: SysMan
> + * Sub-category: SysMan tests
> + * Functionality: sysfs preempt timeout
> + * Feature: SMI, context
> + * Test category: SysMan
> + *
> + * SUBTEST: %s-timeout

imho here:

* SUBTEST: timeout

no need for arguments, you did not touch min nor max
or am I missing something?

> + * Description: Test to measure the delay from requestion the preemption to its
> + *      completion. Send down some non-preemptable workloads and then
> + *      request a switch to a higher priority context. The HW will not
> + *      be able to respond, so the kernel will be forced to reset the hog.
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @preempt_timeout_us:		preempt timeout us
> + */
> +
> +#include "igt.h"
> +#include "igt_syncobj.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_spin.h"
> +
> +#define ATTR "preempt_timeout_us"
> +
> +static void set_preempt_timeout(int engine, unsigned int value)
> +{
> +	unsigned int delay;
> +
> +	igt_assert_lte(0, igt_sysfs_printf(engine, ATTR, "%u", value));
> +	igt_sysfs_scanf(engine, ATTR, "%u", &delay);
> +	igt_assert_eq(delay, value);
> +}
> +
> +static uint64_t __test_timeout(int xe, int engine, unsigned int timeout)
> +{
> +	struct drm_xe_sync sync = {
> +		.handle = syncobj_create(xe, 0),
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +/* high priority property */
> +	struct drm_xe_ext_set_property ext = {
> +		.base.next_extension = 0,
> +		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> +		.value = 2, /* High priority */
> +	};
> +	struct drm_xe_engine_class_instance *hwe;
> +	uint64_t ahnd = 0;
> +	uint32_t exec_queues[2];
> +	uint32_t vm[2];
> +	uint32_t bo[2];
> +	size_t bo_size;
> +	struct xe_spin *spin[2];
> +	struct timespec ts = {};
> +	double elapsed;
> +	uint64_t addr1 = 0x1a0000, addr2 = 0x100000;
> +	int i, n_engines;
> +
> +	n_engines = 0;
> +	/* select an random engine */

This is a contradiction, you know a class of engines (?)
or an exact engine (depending on what is represented in sysfs),
so choosing random here will miss the point. For example,
test for i915 and bsc engine:

Starting dynamic subtest: bcs0
Minimum timeout measured as 4.107ms; setting error threshold to 50ms
preempt_timeout_ms:1, elapsed=4.166ms
preempt_timeout_ms:50, elapsed=53.191ms
preempt_timeout_ms:100, elapsed=107.233ms
preempt_timeout_ms:500, elapsed=506.747ms
Dynamic subtest bcs0: SUCCESS (0.850s)

and your test:

Starting dynamic subtest: bcs
Minimum timeout measured as 643259.552us; setting error threshold to 1286519us
preempt_timeout_us:1000, elapsed=643232.184us
preempt_timeout_us:50000, elapsed=643346.015us
preempt_timeout_us:100000, elapsed=643497.511us
preempt_timeout_us:500000, elapsed=643291.614us
Dynamic subtest bcs: SUCCESS (3.267s)

This looks like test changed timeout but run was on another
engine so your sysfs write did not have any effect.

Regards,
Kamil

> +	i = rand() % xe_number_engines(xe);
> +	xe_for_each_engine(xe, hwe) {
> +		if (i == n_engines++)
> +			break;
> +	}
> +	/* set preempt timeout*/
> +	set_preempt_timeout(engine, timeout);
> +	vm[0] = xe_vm_create(xe, 0, 0);
> +	vm[1] = xe_vm_create(xe, 0, 0);
> +	exec_queues[0] = xe_exec_queue_create(xe, vm[0], hwe, 0);
> +	exec_queues[1] = xe_exec_queue_create(xe, vm[1], hwe, to_user_pointer(&ext));
> +	ahnd = intel_allocator_open(xe, 0, INTEL_ALLOCATOR_RELOC);
> +	bo_size = xe_bb_size(xe, sizeof(*spin));
> +	bo[0] = xe_bo_create(xe, vm[0], bo_size, vram_if_possible(xe, 0), 0);
> +	spin[0] = xe_bo_map(xe, bo[0], bo_size);
> +	xe_vm_bind_async(xe, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
> +	xe_spin_init_opts(spin[0], .addr = addr1,
> +				.preempt = false);
> +	exec.address = addr1;
> +	exec.exec_queue_id = exec_queues[0];
> +	xe_exec(xe, &exec);
> +	xe_spin_wait_started(spin[0]);
> +
> +	igt_nsec_elapsed(&ts);
> +	bo[1] = xe_bo_create(xe, vm[1], bo_size, vram_if_possible(xe, 0), 0);
> +	spin[1] = xe_bo_map(xe, bo[1], bo_size);
> +	xe_vm_bind_sync(xe, vm[1], bo[1], 0, addr2, bo_size);
> +	xe_spin_init_opts(spin[1], .addr = addr2);
> +	exec.address = addr2;
> +	exec.exec_queue_id = exec_queues[1];
> +	xe_exec(xe, &exec);
> +	xe_spin_wait_started(spin[1]);
> +	elapsed = igt_nsec_elapsed(&ts);
> +	xe_spin_end(spin[1]);
> +
> +	xe_vm_unbind_async(xe, vm[0], 0, 0, addr1, bo_size, &sync, 1);
> +	igt_assert(syncobj_wait(xe, &sync.handle, 1, INT64_MAX, 0, NULL));
> +
> +	xe_spin_end(spin[0]);
> +	xe_vm_unbind_sync(xe, vm[1], 0, addr2, bo_size);
> +	syncobj_destroy(xe, sync.handle);
> +
> +	xe_exec_queue_destroy(xe, exec_queues[0]);
> +	xe_vm_destroy(xe, vm[0]);
> +	xe_exec_queue_destroy(xe, exec_queues[1]);
> +	xe_vm_destroy(xe, vm[1]);
> +
> +	put_ahnd(ahnd);
> +
> +	return elapsed;
> +}
> +
> +static void test_timeout(int xe, int engine, const char **property)
> +{
> +	uint64_t delays[] = { 1000, 50000, 100000, 500000 };
> +	unsigned int saved;
> +	uint64_t elapsed;
> +	uint64_t epsilon;
> +
> +    /*
> +     * Send down some non-preemptable workloads and then request a
> +     * switch to a higher priority context. The HW will not be able to
> +     * respond, so the kernel will be forced to reset the hog. This
> +     * timeout should match our specification, and so we can measure
> +     * the delay from requesting the preemption to its completion.
> +     */
> +
> +	igt_assert(igt_sysfs_scanf(engine, ATTR, "%u", &saved) == 1);
> +	igt_debug("Initial %s:%u\n", ATTR, saved);
> +
> +	elapsed = __test_timeout(xe, engine, 1000);
> +	epsilon = 2 * elapsed / 1000;
> +	if (epsilon < 50000)
> +		epsilon = 50000;
> +	igt_info("Minimum timeout measured as %.3fus; setting error threshold to %" PRId64 "us\n",
> +		 elapsed * 1e-3, epsilon);
> +	igt_require(epsilon < 10000000);
> +
> +	for (int i = 0; i < ARRAY_SIZE(delays); i++) {
> +		elapsed = __test_timeout(xe, engine, delays[i]);
> +		igt_info("%s:%ld, elapsed=%.3fus\n",
> +			ATTR, delays[i], elapsed * 1e-3);
> +
> +		/*
> +		 * We need to give a couple of jiffies slack for the scheduler
> +		 * timeouts and then a little more slack for the overhead in
> +		 * submitting and measuring.
> +		 */
> +		igt_assert_f(elapsed / 1000 / 1000 < delays[i] + epsilon,
> +				 "Forced preemption timeout exceeded request!\n");
> +	}
> +
> +	set_preempt_timeout(engine, saved);
> +}
> +
> +igt_main
> +{
> +	static const struct {
> +		const char *name;
> +		void (*fn)(int, int, const char **);
> +	} tests[] = {
> +		{ "timeout", test_timeout },
> +		{ }
> +	};
> +
> +	const char *property[][3] = { {"preempt_timeout_us",
> +								   "preempt_timeout_min",
> +								   "preempt_timeout_max"}, };
> +	int count = sizeof(property) / sizeof(property[0]);
> +	int xe = -1, sys_fd, gt;
> +	int engines_fd = -1, gt_fd = -1;
> +
> +	igt_fixture {
> +		xe = drm_open_driver(DRIVER_XE);
> +
> +		sys_fd = igt_sysfs_open(xe);
> +		igt_require(sys_fd != -1);
> +		close(sys_fd);
> +	}
> +
> +	for (int i = 0; i < count; i++) {
> +		for (typeof(*tests) *t = tests; t->name; t++) {
> +			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> +				xe_for_each_gt(xe, gt) {
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
> +	igt_fixture {
> +		drm_close_driver(xe);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index e649466be..00556c9d6 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -314,6 +314,7 @@ intel_xe_progs = [
>  	'xe_waitfence',
>  	'xe_spin_batch',
>  	'xe_sysfs_defaults',
> +	'xe_sysfs_preempt_timeout',
>  	'xe_sysfs_scheduler',
>  ]
>  
> -- 
> 2.34.1
> 
