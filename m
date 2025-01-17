Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87F3C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 18:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F48E10EB5F;
	Fri, 17 Jan 2025 18:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDlBlClS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF9110EB5F
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 18:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737136883; x=1768672883;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k8B1yIlyNRvBEmmw7q09QUKSwriG+W5UJHFp2yMgUd8=;
 b=GDlBlClSls2iS6OBqdVSj4wQbZf/drdMwHsWQLBWnEJfhA3OasBd5Zkh
 LHSRZzSwNOjXt0fNTMaz9j5eI/EESx95fiu6Dzib1fwdLilp2O/BVYjx0
 AvgqU+anh8xIwL0wBbjdQFzMdedoKfaliUuJNFW09L92SthMdipodPqjd
 2bqZOTZZK/gFoGw76xOkfesIMYc4bko8Jrw7yPSG4wFPiarAa2M4nmDUG
 ZFF7roVj1eliRR+pCMyLjxFiUH9sIH8uSuQ1Y2tu2a785YlEQa7Oy5/69
 IQRnj7DxgvVe/lGif9tKcm530S0Up95AWHgUP9Ol52gRykehHqOCoDZFh w==;
X-CSE-ConnectionGUID: Ttu0FMgxQ/eQY5PiECo9lg==
X-CSE-MsgGUID: zGPFrWV5T/K/sHBMsE/k1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48240483"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="48240483"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 10:01:23 -0800
X-CSE-ConnectionGUID: Rr0xnLliS3itwVRIKk4kDw==
X-CSE-MsgGUID: 8i0pAIMyS6qXCo83pPEf7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106753342"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 10:01:17 -0800
Date: Fri, 17 Jan 2025 19:01:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/xe: Add xe_cg_dmem test
Message-ID: <20250117180105.js24gb7awykxt2v3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, igt-dev@lists.freedesktop.org
References: <20250115115512.84520-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115115512.84520-1-dev@lankhorst.se>
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

Hi Maarten,
On 2025-01-15 at 12:55:11 +0100, Maarten Lankhorst wrote:

I have not read it, I have only few comments on test names for now.

> This adds test to ensure the basic functionality of dmem works as

s/dmem/cgroup limits for device memory/

> expected on discrete platforms.

Could you give a link to lore.kernel.org for kernel patchset?

> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  tests/intel/xe_cg_dmem.c | 379 +++++++++++++++++++++++++++++++++++++++

Test name is imho a little too much a shortcut, what about
xe_cgroups or xe_cgroup2?

>  tests/meson.build        |   1 +
>  2 files changed, 380 insertions(+)
>  create mode 100644 tests/intel/xe_cg_dmem.c
> 
> diff --git a/tests/intel/xe_cg_dmem.c b/tests/intel/xe_cg_dmem.c
> new file mode 100644
> index 000000000..2924fd973
> --- /dev/null
> +++ b/tests/intel/xe_cg_dmem.c
> @@ -0,0 +1,379 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
------------------^^^^
Is it first public release? If yes, it should be 2025.

> + */
> +
> +/**
> + * TEST: Check cgroup VRAM allocation limits
> + * Category: Software building block
> + * Sub-category: cgroup
> + * Test category: functionality test
> + * Run type: BAT
> + * Description: Test that the dmem cgroup works as intended.
> + * Mega feature: General Core features
> + * Functionality: cgroup

Sort alphabetically.

> +*/
> +
> +#include <string.h>

Same here, sort system header string.h after fcntl.h
You could have unistd.h as first (this is an exception)

> +#include <unistd.h>
> +#include <fcntl.h>
> +#include <sys/stat.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +static int cgfd = -1, igtcg = -1, cg1 = -1, cg1_1 = -1, cg1_2 = -1, cg2 = -1;
> +static char cgid[64];
> +
> +/*
> + * cgroups:
> + *                                      / cg1_1
> + * /sys/fs/cgroup (cgfd) / igtcg / cg1 /- cg1_2
> + *                               / cg2
> + */
> +
> +static void set_cgrp(int cg)
> +{
> +	igt_sysfs_set_u32(cg, "cgroup.procs", getpid());
> +}
> +
> +static inline void set_cg_val(int cg, const char *resource, int64_t val)
> +{
> +	if (val >= 0)
> +		igt_assert(igt_sysfs_printf(cg, resource, "%s %"PRIu64, cgid, val));
> +	else
> +		igt_assert(igt_sysfs_printf(cg, resource, "%s max", cgid));
> +}
> +
> +static void set_cgrp_min(int cg, int64_t min)
> +{
> +	set_cg_val(cg, "dmem.min", min);
> +}
> +
> +static void set_cgrp_low(int cg, int64_t low)
> +{
> +	set_cg_val(cg, "dmem.low", low);
> +}
> +
> +static void set_cgrp_max(int cg, int64_t max)
> +{
> +	set_cg_val(cg, "dmem.max", max);
> +}
> +
> +static int64_t get_cg_val(int cg, const char *resource)
> +{
> +	char *devstr, *valstr, *str;
> +	int64_t val;
> +
> +	str = igt_sysfs_get(cg, resource);
> +	igt_assert(str);
> +	devstr = strstr(str, cgid);
> +	igt_assert(devstr);
> +
> +	/* Only care about the line describing this region, terminate if needed */
> +	devstr = strtok(devstr, "\n");
> +
> +	valstr = strstr(devstr, " ") + 1;
> +	if (!strcmp(valstr, "max"))
> +		val = INT64_MAX;
> +	else
> +		val = strtoll(valstr, NULL, 10);
> +
> +	free(str);
> +	return val;
> +}
> +
> +static int64_t get_cgrp_min(int cg)
> +{
> +	return get_cg_val(cg, "dmem.min");
> +}
> +
> +static int64_t get_cgrp_low(int cg)
> +{
> +	return get_cg_val(cg, "dmem.low");
> +}
> +
> +static int64_t get_cgrp_max(int cg)
> +{
> +	return get_cg_val(cg, "dmem.max");
> +}
> +
> +static int64_t get_cgrp_current(int cg)
> +{
> +	return get_cg_val(cg, "dmem.current");
> +}
> +
> +static void assert_all_cgs_empty(void)
> +{
> +	igt_assert(!get_cgrp_current(igtcg));
> +}
> +
> +static void reset_cgs(void)
> +{
> +	int i, fds[] = { igtcg, cg1, cg1_1, cg1_2, cg2 };
> +	set_cgrp(cgfd);
> +
> +	for (i = 0; i < ARRAY_SIZE(fds); i++) {
> +		int cg = fds[i];
> +
> +		set_cgrp_min(cg, 0);
> +		set_cgrp_low(cg, 0);
> +		set_cgrp_max(cg, -1);
> +	}
> +}
> +
> +static void cleanup_cg(int sig)
> +{
> +	/* Move self to root so we can rmdir */
> +	set_cgrp(cgfd);
> +
> +	unlinkat(cg1, "cg1_1", AT_REMOVEDIR);
> +	unlinkat(cg1, "cg1_2", AT_REMOVEDIR);
> +	unlinkat(igtcg, "cg1", AT_REMOVEDIR);
> +	unlinkat(igtcg, "cg2", AT_REMOVEDIR);
> +	unlinkat(cgfd, "igtcg", AT_REMOVEDIR);
> +
> +	/* leak fd's at exit, nobody cares */
> +}
> +
> +static int mkcgrp(int fd, const char *name)
> +{
> +	int err;
> +
> +	/* Check and enable controller */
> +	igt_require(igt_sysfs_set(fd, "cgroup.subtree_control", "+dmem"));
> +
> +	err = mkdirat(fd, name, 0755);
> +	if (!err || (err == -1 && errno == EEXIST))
> +		err = openat(fd, name, O_RDONLY);
> +	igt_assert(err >= 0);
> +	return err;
> +}
> +
> +static void create_cgroups(void)
> +{
> +	char *controllers;
> +	cgfd = open("/sys/fs/cgroup", O_RDONLY);
> +	igt_require(cgfd >= 0);
> +
> +	controllers = igt_sysfs_get(cgfd, "cgroup.controllers");
> +	igt_require(controllers && strstr(controllers, "dmem"));
> +	free(controllers);
> +
> +	igt_install_exit_handler(cleanup_cg);
> +
> +	/* Populate cg's */
> +	igtcg = mkcgrp(cgfd, "igtcg");
> +	cg1 = mkcgrp(igtcg, "cg1");
> +	cg1_1 = mkcgrp(cg1, "cg1_1");
> +	cg1_2 = mkcgrp(cg1, "cg1_2");
> +	cg2 = mkcgrp(igtcg, "cg2");
> +}
> +
> +static int bo_create_at(struct xe_device *xe, int cg, uint64_t bo_size)
> +{
> +	struct drm_xe_gem_create create = {
> +		.placement = vram_if_possible(xe->fd, 0),
> +		.cpu_caching = __xe_default_cpu_caching(xe->fd, create.placement, 0),
> +		.size = bo_size,
> +	};
> +
> +	set_cgrp(cg);
> +
> +	if (igt_ioctl(xe->fd, DRM_IOCTL_XE_GEM_CREATE, &create) < 0) {
> +		igt_debug("Creating bo with size %"PRIu64" returned -1/%m\n", bo_size);
> +		return -errno;
> +	}
> +
> +	igt_debug("Creating bo with size %"PRIu64" and handle %u\n", bo_size, create.handle);
> +	return create.handle;
> +}
> +
> +/**
> + * SUBTEST: functional
> + * Description: Test if written values can be read back,
> + * 	to rule out copy/paste errors.
> + */
> +static void test_functional(void)
> +{
> +	set_cgrp_min(igtcg, 12345);
> +	set_cgrp_low(igtcg, 54321);
> +	set_cgrp_max(igtcg, 67890);
> +
> +	igt_assert_eq_u64(get_cgrp_min(igtcg), 12345);
> +	igt_assert_eq_u64(get_cgrp_low(igtcg), 54321);
> +	igt_assert_eq_u64(get_cgrp_max(igtcg), 67890);
> +
> +	set_cgrp_min(igtcg, -1);
> +	set_cgrp_low(igtcg, -1);
> +	set_cgrp_max(igtcg, -1);
> +
> +	igt_assert_eq_u64(get_cgrp_min(igtcg), INT64_MAX);
> +	igt_assert_eq_u64(get_cgrp_low(igtcg), INT64_MAX);
> +	igt_assert_eq_u64(get_cgrp_max(igtcg), INT64_MAX);
> +
> +	set_cgrp_min(igtcg, 0);
> +	set_cgrp_low(igtcg, 0);
> +	set_cgrp_max(igtcg, 0);
> +	igt_assert_eq_u64(get_cgrp_low(igtcg), 0);
> +	igt_assert_eq_u64(get_cgrp_max(igtcg), 0);
> +	igt_assert_eq_u64(get_cgrp_min(igtcg), 0);
> +}
> +
> +/**
> + * SUBTEST: test-simple-max
> + * Description: Test that cgroup max limits are respected between
> + * 	various nestings of cgroups, and correct cgroups are evicted.
> + */
> +static void test_simple_max(struct xe_device *xe)
> +{
> +	uint64_t bo_size = xe->default_alignment;
> +	int bo1, bo1_1, bo1_2;
> +
> +	/* Test if we set cgroup limits, that they are respected */
> +	assert_all_cgs_empty();
> +
> +	reset_cgs();
> +
> +	set_cgrp_max(igtcg, 0);
> +	igt_assert(get_cgrp_max(igtcg) == 0);
> +	set_cgrp_max(cg1, 2 * bo_size);
> +	set_cgrp_max(cg1_1, 2 * bo_size);
> +	set_cgrp_max(cg1_2, bo_size);
> +	set_cgrp_max(cg2, -1);
> +	igt_assert(get_cgrp_max(cg2) == INT64_MAX);
> +
> +	/* First check if top cg limit (of igtcg) is not ignored */
> +	igt_assert_eq(-ENOMEM, bo_create_at(xe, cg1_1, bo_size));
> +
> +	assert_all_cgs_empty();
> +	set_cgrp_max(igtcg, 4 * bo_size);
> +
> +	/* Same cg limit? */
> +	bo1_1 = bo_create_at(xe, cg1_1, 2 * bo_size);
> +	igt_assert(bo1_1 > 0);
> +
> +	set_cgrp_max(cg1, 3 * bo_size);
> +	bo1_2 = bo_create_at(xe, cg1_2, bo_size);
> +	igt_assert(bo1_2 > 0);
> +
> +	/* Create a too big bo and check if 1_2 is evicted */
> +	igt_assert_eq(-ENOMEM, bo_create_at(xe, cg1_2, 4 * bo_size));
> +	igt_assert_eq_u64(0, get_cgrp_current(cg1_2));
> +
> +	gem_close(xe->fd, bo1_2);
> +	bo1_2 = bo_create_at(xe, cg1_2, bo_size);
> +	igt_assert(bo1_2 > 0);
> +
> +	set_cgrp_max(cg1, 4 * bo_size);
> +	bo1 = bo_create_at(xe, cg1_1, bo_size);
> +	igt_assert(bo1 > 0);
> +
> +	gem_close(xe->fd, bo1_2);
> +	gem_close(xe->fd, bo1_1);
> +	gem_close(xe->fd, bo1);
> +}
> +
> +static void create_cg1_min(struct xe_device *xe, int *bo1_1, int *bo1_2)
> +{
> +	uint64_t bo_size = xe->default_alignment;
> +
> +	if (*bo1_1 > 0)
> +		gem_close(xe->fd, *bo1_1);
> +
> +	if (*bo1_2 > 0)
> +		gem_close(xe->fd, *bo1_2);
> +
> +	*bo1_1 = bo_create_at(xe, cg1_1, bo_size);
> +	igt_assert(*bo1_1 > 0);
> +
> +	*bo1_2 = bo_create_at(xe, cg1_2, bo_size);
> +	igt_assert(*bo1_2 > 0);
> +}
> +
> +/**
> + * SUBTEST: test-simple-min
> + * Description: Test that cgroup min limits are respected between
> + * 	various nestings of cgroups, and correct cgroups are evicted.
> + */
> +static void test_simple_min(struct xe_device *xe)
> +{
> +	uint64_t bo_size = xe->default_alignment;
> +	int bo1_1 = -1, bo1_2 = -1, bo2;
> +
> +	assert_all_cgs_empty();
> +	reset_cgs();
> +
> +	/* set static max of 2 bo's for testing, allow protection as well on cg1 */
> +	set_cgrp_max(igtcg, 2 * bo_size);
> +	set_cgrp_min(igtcg, 2 * bo_size);
> +	set_cgrp_min(cg1, 2 * bo_size);
> +	set_cgrp_min(cg1_1, bo_size);
> +	set_cgrp_min(cg1_2, bo_size);
> +
> +	create_cg1_min(xe, &bo1_1, &bo1_2);
> +
> +	igt_assert_eq_u64(get_cgrp_current(cg1), 2 * bo_size);
> +
> +	bo2 = bo_create_at(xe, cg2, bo_size);
> +	igt_assert_eq_u64(get_cgrp_current(cg1), 2 * bo_size);
> +	igt_assert_eq(bo2, -ENOMEM);
> +
> +	/* Unprotect one */
> +	set_cgrp_min(cg1, bo_size);
> +	set_cgrp_min(cg1_2, 0);
> +
> +	bo2 = bo_create_at(xe, cg2, bo_size);
> +	/* Verify cg1_2 is evicted, cg1_1 not */
> +	igt_assert_eq_u64(get_cgrp_current(cg1_2), 0);
> +	igt_assert_eq_u64(get_cgrp_current(cg1), bo_size);
> +	igt_assert_eq_u64(get_cgrp_current(igtcg), 2 * bo_size);
> +	igt_assert(bo2 > 0);
> +
> +	gem_close(xe->fd, bo2);
> +	gem_close(xe->fd, bo1_1);
> +	gem_close(xe->fd, bo1_2);
> +}
> +
> +igt_main
> +{
> +	struct xe_device *xe;
> +	int fd;
> +
> +	igt_fixture {
> +		char *data;
> +		char busid[32];
> +
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe = xe_device_get(fd);
> +
> +		/* XXX: Easier way to determine busid? */
> +		igt_device_get_pci_slot_name(fd, busid);
> +
> +		/* For now, require VRAM as shared memory lacks support */
> +		igt_require(xe->has_vram);
> +		sprintf(cgid, "drm/%s/vram0", busid);
> +
> +		create_cgroups();
> +
> +		data = igt_sysfs_get(cgfd, "dmem.capacity");
> +		igt_debug("Contents: %s\n", data);
> +		/* Ensure our driver is found" */
> +		igt_require_f(strstr(data, busid), "Is driver xe/%s supported by dmem controller?\n", busid);
> +		free(data);
> +	}
> +
> +	igt_subtest("functional")

imho better: dmem-basic

> +		test_functional();
> +
> +	igt_subtest("test-simple-max")

Here also: dmem-simple-max

> +		test_simple_max(xe);
> +
> +	igt_subtest("test-simple-min")

Here also: dmem-simple-min

Btw didn't we use lmem in i915 counterparts?

Regards,
Kamil

> +		test_simple_min(xe);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a6750d523..f2a0dea88 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -273,6 +273,7 @@ intel_kms_progs = [
>  intel_xe_progs = [
>  	'xe_wedged',
>  	'xe_ccs',
> +	'xe_cg_dmem',
>  	'xe_create',
>  	'xe_compute',
>  	'xe_compute_preempt',
> -- 
> 2.43.0
> 
