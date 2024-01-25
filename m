Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37648C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 17:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D272E10F948;
	Thu, 25 Jan 2024 17:29:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0279A10F95A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706203775; x=1737739775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QPoP4c6SShmgmIzGmBe7NJCBO3AzBTKI95sLHGJOhfs=;
 b=FNx9awAYmZ4vJGZAOIMZyfS6lahHhMzC46rzex6Bp8cSy0Lu7iWV24lR
 IzjE3sTRO8frFXkEtlk6jJrJQx7jY8/a00jmX3WHT32i2lDGZ6Rc35znp
 TnVVjrCxfnso2o0I0N219j0lkGL0YSAtj68flOfUcs/0wSV0DIvwJAITs
 0ueuO/Wf4f/rMiS2vn2B/5kdIR3Q40wKv5KXY0f42qDySwXSRt2eJ9D4U
 YCi3oNQi++3RjP3tsArMZKZUPwlioFWB2gQJtcxQkFhRkorczwjYE+FwY
 2LbcNo7SEk2kzjoN8i7HnAuUxgnKImjOv1LCMJ15iqWvWX/lksZICMvKF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1156221"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1156221"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 09:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="786827758"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="786827758"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 09:29:33 -0800
Date: Thu, 25 Jan 2024 18:29:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel: Add xe_coredump test, v2.
Message-ID: <20240125172930.ahygbofp3xlng5aq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20240124164747.2424-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124164747.2424-1-maarten.lankhorst@linux.intel.com>
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
On 2024-01-24 at 17:47:46 +0100, Maarten Lankhorst wrote:

please add i-g-t after PATCH, also remove ", v2." from end
so instead of:
[PATCH] tests/intel: Add xe_coredump test, v2.

this should be:
[PATCH i-g-t v2] tests/intel: Add xe_coredump test

Please also give here link to corresponding kmd series.

> Add a simple test that forces a GPU hang and then reads the resulting
> devcoredump file. Map a single userptr and BO, and dump the contents of
> those.
> 
> Changes since v1:
> - Almost completely rewrite test for readability, based on feedback.
> 

Add here link to Gitlab report (it can stay also as comment in code).

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  tests/intel/xe_coredump.c | 256 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   1 +
>  2 files changed, 257 insertions(+)
>  create mode 100644 tests/intel/xe_coredump.c
> 
> diff --git a/tests/intel/xe_coredump.c b/tests/intel/xe_coredump.c
> new file mode 100644
> index 000000000..add9508f5
> --- /dev/null
> +++ b/tests/intel/xe_coredump.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
------------------^^^^
Year 2024

> + */
> +
> +/**
> + * TEST: Check devcoredump functionality
> + * Category: Software building block
> + * Sub-category: devcoredump
> + * Run type: BAT
> + * Functionality: Error dumping and readout.
> + */
> +
> +#include <unistd.h>
> +#include <fcntl.h>
> +#include <glob.h>
> +#include <string.h>
> +#include <wchar.h>
> +#include <sys/stat.h>
------------ ^^^
imho this should be before wchar.h

> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_io.h"
> +#include "igt_syncobj.h"
> +#include "igt_sysfs.h"
> +
> +#include "intel_pat.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#ifndef DRM_XE_VM_BIND_FLAG_DUMPABLE
> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE (1<<3)

imho add a comment like: FIXME: remove after sync in drm uAPI

> +#endif
> +
> +static struct xe_device *xe;
> +static uint32_t batch_bo;
> +static uint32_t *batch;
> +static void *userptr;
> +static uint32_t vm;
> +static int sysfd;
> +
> +#define MAX_N_ENGINES 32
> +
> +static void tryclear_hang(void)
> +{
> +	int fd = openat(sysfd, "devcoredump/data", O_RDWR);
--------------------------- ^^^^^^^^^^^^^^^^
You use it in other places, consider making it define
or const char*

> +	char buf[256];
> +
> +	if (fd < 0)
> +		return;
> +
> +	while (read(fd, buf, sizeof(buf)) > 0)
> +		{ }

I was asking if that reading is really necessery for cleanig it?
Btw if you need it make buffer bigger like below 0x1000 or consider
alloc even bigger and make as few reads as possible.

> +	write(fd, "1", 1);
> +	close(fd);
> +}
> +
> +/*
> + * Helper to read and clear devcore.  We want to read it completely to ensure
> + * we catch any kernel side regressions like:
> + * https://gitlab.freedesktop.org/drm/msm/-/issues/20
> + */
> +static void
> +read_and_clear_hang(void)
> +{
> +	char buf[0x1000];
> +	int try, fd;
> +	for (try = 0; try < 5; try++) {
> +		fd = openat(sysfd, "devcoredump/data", O_RDWR);
> +		if (fd >= 0)
> +			break;
> +	}
> +	igt_assert(fd >= 0);
> +
> +	/*
> +	 * We want to read the entire file but we can throw away the
> +	 * contents.. we just want to make sure that we exercise the
---------------^^
Either "..." or ". We"

> +	 * kernel side codepaths hit when reading the devcore from
> +	 * sysfs
> +	 */
> +	igt_debug("---- begin coredump ----\n");
> +	while (1) {
> +		ssize_t ret;
> +
> +		ret = igt_readn(fd, buf, sizeof(buf) - 1);
> +		igt_assert(ret >= 0);
> +		if (ret == 0)
> +			break;
> +		buf[ret] = '\0';
> +		igt_debug("%s", buf);

Do you really want it all in debugfs? Our CI infra is limited...

> +	}
> +
> +	igt_debug("---- end coredump ----\n");
> +
> +	/* Clear the devcore: */
> +	igt_writen(fd, "1", 1);
> +
> +	close(fd);
> +}
> +
> +static void free_execqueue(void)
> +{
> +	int fd = xe->fd;
> +	xe_vm_destroy(fd, vm);
> +	vm = 0;
> +	gem_close(fd, batch_bo);
> +	munmap(batch, xe->default_alignment);
> +	munmap(userptr, xe->default_alignment);
> +	batch = userptr = NULL;
> +}
> +
> +static void recreate_execqueue(bool dumpable)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	struct drm_xe_vm_bind_op bind_ops[2] = { };
> +	int fd = xe->fd;
> +	uint32_t *ptr;
> +	uint64_t offset = xe->default_alignment - 4;
> +
> +	tryclear_hang();
> +
> +	if (vm)
> +		free_execqueue();
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	batch_bo = xe_bo_create(fd, vm, xe->default_alignment, system_memory(fd), 0);
> +	ptr = batch = xe_bo_map(xe->fd, batch_bo, xe->default_alignment);
> +
> +	memset(batch, 0, xe->default_alignment);
> +	*(ptr++) = MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_GTE_SDD;
> +	*(ptr++) = 1;
> +	*(ptr++) = offset >> 32;
> +	*(ptr++) = offset;
> +	*(ptr++) = MI_BATCH_BUFFER_END;
> +
> +	userptr = mmap(0, xe->default_alignment, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	wmemset(userptr, 0xf1234567, xe->default_alignment / sizeof(wchar_t));
> +
> +	bind_ops[0].op = DRM_XE_VM_BIND_OP_MAP;
> +	bind_ops[0].obj = batch_bo;
> +	bind_ops[0].addr = 0;
> +
> +	bind_ops[1].op = DRM_XE_VM_BIND_OP_MAP_USERPTR;
> +	bind_ops[1].userptr = (size_t)userptr;
> +	bind_ops[1].addr = 1ULL << 40ULL;
> +
> +	if (dumpable)
> +		bind_ops[0].flags = bind_ops[1].flags = DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +	bind_ops[0].range = bind_ops[1].range = xe->default_alignment;
> +	bind_ops[0].pat_index = bind_ops[1].pat_index = intel_get_pat_idx_wb(fd);
> +
> +	sync.handle = syncobj_create(fd, 0);
> +	xe_vm_bind_array(fd, vm, 0, bind_ops, ARRAY_SIZE(bind_ops), &sync, 1);
> +	syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +	syncobj_destroy(fd, sync.handle);
> +}
> +
> +static uint32_t hang_engine(struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint32_t engine;
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_create(xe->fd, 0),
> +	};
> +
> +	engine = xe_exec_queue_create(xe->fd, vm, hwe, 0);
> +	xe_exec_sync(xe->fd, engine, 0, &sync, 1);
> +
> +	return sync.handle;
> +}
> +
> +static void test_hang_one(void)
> +{
> +	uint32_t syncobj = hang_engine(&xe_engine(xe->fd, 0)->instance);
> +
> +	syncobj_wait(xe->fd, &syncobj, 1, INT64_MAX, 0, NULL);
> +	syncobj_destroy(xe->fd, syncobj);
> +
> +	read_and_clear_hang();
> +}
> +
> +/**
> + * SUBTEST: basic
> + * Description: Read out a full dumped VM.
> + * Test category: functionality test
> + */
> +static void basic(void)
> +{
> +	recreate_execqueue(true);
> +	test_hang_one();
> +}
> +
> +/**
> + * SUBTEST: empty-vm
> + * Description: Create an error dump without anything in VM to dump.
> + * Test category: functionality test
> + */
> +static void empty_vm(void)
> +{
> +	recreate_execqueue(false);
> +	test_hang_one();
> +}
> +
> +/**
> + * SUBTEST: all-simultaneously
> + * Description: Hang all engines at the same time, read out the dump.
> + * Test category: robustness test
> + */
> +static void all_simultaneously(void)
> +{
> +	uint32_t syncobj[MAX_N_ENGINES], i = 0;
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	recreate_execqueue(true);
> +	xe_for_each_engine(xe->fd, hwe)
> +		syncobj[i++] = hang_engine(hwe);
> +
> +	syncobj_wait(xe->fd, syncobj, i, INT64_MAX, 0, NULL);
> +	while (i--)
> +		syncobj_destroy(xe->fd, syncobj[i]);
> +
> +	read_and_clear_hang();
> +}
> +
> +igt_main
> +{
> +	igt_fixture {
> +		struct stat stat;
> +		int fd = drm_open_driver_render(DRIVER_XE);
> +		char str[256];
> +		xe = xe_device_get(fd);
> +
> +		igt_assert_eq(fstat(fd, &stat), 0);
> +		sprintf(str, "/sys/dev/char/%ld:%ld/device", stat.st_rdev >> 8, stat.st_rdev & 0xff);
> +		sysfd = open(str, O_DIRECTORY);
> +		igt_assert(sysfd >= 0);
> +	}
> +
> +	igt_describe("Test that hw fault coredump readout works");
> +	igt_subtest("basic")
> +		basic();
> +
> +	igt_describe("Hang all engines simultaneously");
> +	igt_subtest("all-simultaneously")
> +		all_simultaneously();
> +
> +	igt_describe("Ensure that snapshot works without anything to capture");
> +	igt_subtest("empty-vm")
> +		empty_vm();

Close here handles in fixture.

Regards,
Kamil

> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index d107d16fa..331d88c8e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -280,6 +280,7 @@ intel_xe_progs = [
>  	'xe_compute',
>  	'xe_compute_preempt',
>  	'xe_copy_basic',
> +	'xe_coredump',
>  	'xe_dma_buf_sync',
>  	'xe_debugfs',
>  	'xe_drm_fdinfo',
> -- 
> 2.43.0
> 
