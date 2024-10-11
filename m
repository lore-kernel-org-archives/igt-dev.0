Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3036CFC61B
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 08:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2A810E013;
	Fri, 11 Oct 2024 08:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2pj+TuK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C3010E013
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 08:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728634799; x=1760170799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JAJpz3tS1Z6c1vsGjtJEn/j6jmo2FyDpcHBA0EbsWt8=;
 b=D2pj+TuKyoB70AKWiTfesSlWS0LJHcVY9szYANsYttpk8JKlZMqjzRgT
 3BwVIx9i22PK9OeKb0czb6j67EheJmA0/Dwbmsi0D/aYZXOp3QHxnbSNs
 3dK3Yj61uGCO7+qKWfUR75aqffPuFc80joX7t5QII9mgT8zxNn88iC0Mu
 nVRNilLiOL5Aa6qOsL6vzNF7t1yucq73EQW/hRhVcyAkC6Er408QxkYwA
 vlOtFnvOCoDLUwBTEvug2Udj+qYb8ZuTNrE6pXG87VXvh54BC79cLL04L
 M0o6qouP2cGF+u/XTSahW+ARtmpOLjr2PAKy//gMGFa8M9Fuek7rfRSUA Q==;
X-CSE-ConnectionGUID: F/qib3tEQPO1VNu5VvKytQ==
X-CSE-MsgGUID: 4Bep6RaORPS47RLXph3nLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28156893"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="28156893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:19:59 -0700
X-CSE-ConnectionGUID: 8/Lpr+96R9mg3B/yYo9bIA==
X-CSE-MsgGUID: TO5oCcKsQLCNPupNuaUPzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76845072"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 01:19:58 -0700
Date: Fri, 11 Oct 2024 10:19:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Peter Senna Tschudin <peter.senna@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] xe_exec_capture: Add xe_exec_capture test
Message-ID: <20241011081956.lqe54tzned7pkex5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Peter Senna Tschudin <peter.senna@intel.com>
References: <20241007221348.3559076-1-zhanjun.dong@intel.com>
 <20241007221348.3559076-2-zhanjun.dong@intel.com>
 <df92b1e5-c6cc-4bc6-b3ec-64eca44239e1@intel.com>
 <a5c8c157-7f9e-4ea1-ac83-1f840c930e79@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5c8c157-7f9e-4ea1-ac83-1f840c930e79@intel.com>
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

Hi Dong,,
On 2024-10-10 at 10:03:34 -0400, Dong, Zhanjun wrote:
> Thanks for review my patch, please see my comments below.
> 
> Regards,
> Zhanjun
> 
> On 2024-10-10 2:06 a.m., Peter Senna Tschudin wrote:
> > Please see my comments below.
> > 
> > On 08.10.2024 00:13, Zhanjun Dong wrote:
> > > Test with GuC reset, check if devcoredump register dump is within the
> > > range.
> > > 
> > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > ---
> > >   tests/intel/xe_exec_capture.c | 227 ++++++++++++++++++++++++++++++++++
> > >   tests/meson.build             |   1 +
> > >   2 files changed, 228 insertions(+)
> > >   create mode 100644 tests/intel/xe_exec_capture.c
> > > 
> > > diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> > > new file mode 100644
> > > index 000000000..3ca137989
> > > --- /dev/null
> > > +++ b/tests/intel/xe_exec_capture.c
> > > @@ -0,0 +1,227 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +/**
> > > + * TEST: Basic tests for GuC based register capture
> > > + * Category: Core
> > > + * Mega feature: General Core features
> > > + * Sub-category: CMD submission
> > > + * Functionality: Debug
> > > + * Test category: functionality test
> > > + */
> > > +
> > > +#include <ctype.h>
> > > +#include <math.h>
> > > +#include <stdio.h>
> > > +#include <string.h>
> > > +
> > > +#include "igt.h"
> > > +#include "lib/igt_syncobj.h"
> > > +#include "lib/intel_reg.h"
> > > +#include "xe_drm.h"
> > > +#include "xe/xe_ioctl.h"
> > > +#include "xe/xe_query.h"
> > > +#include "xe/xe_spin.h"
> > > +
> > > +#define MAX_N_EXECQUEUES	16
> > > +#define MAX_INSTANCE		9
> > > +#define GT_RESET			(0x1 << 0)
> > > +#define CLOSE_FD			(0x1 << 1)
> > > +#define CLOSE_EXEC_QUEUES	(0x1 << 2)
> > > +#define VIRTUAL				(0x1 << 3)
> > > +#define PARALLEL			(0x1 << 4)
> > > +#define CAT_ERROR			(0x1 << 5)
> > > +
> > > +#define CMD_BUFFER_SIZE		1024
> > > +#define MAX_PATH_NAME_LEN	512
> > > +static void get_cmd_output(const char *command, char *buf)
> > > +{
> > > +	int length;
> > > +	FILE *handle = popen(command, "r");
> > > +
> > > +	fgets(buf, CMD_BUFFER_SIZE, handle);
> > > +	pclose(handle);
> > > +
> > > +	/* Remove trailing space */
> > > +	length = strlen(buf);
> > > +	while (length > 0 && isspace(buf[length - 1]))
> > > +		buf--;
> > > +	buf[length] = '\0';
> > 
> > Would it be something like
> > 
> > buf[--length] = '\0';
> > 
> > instead of decrementing the pointer? Honest question, I am not sure.

Nice catch, it should be:

	while (length > 0 && isspace(buf[length - 1]))
		--length;

	buf[length] = '\0';

Regards,
Kamil

> 
> Thanks for point out, that's a bug. To be fixed in next rev.
> 
> > 
> > > +}
> > > +
> > > +static void find_devcoredump(char *card_dir)
> > > +{
> > > +	get_cmd_output("sudo bash -c 'cd /sys/class/drm;for dir in $(ls -d card?);"
> > > +		       "do if [ -e $dir/device/devcoredump/data ];then echo $dir;fi;done'",
> > > +		       card_dir);
> > 
> > As mentioned before, please use only c and don't hide privilege escalation with sudo in this way.
> Right, will be converted to C only.
> > 
> > > +	igt_assert(strlen(card_dir) > 0);
> > > +}
> > > +
> > > +static void rm_devcoredump(void)
> > > +{
> > > +	char command[CMD_BUFFER_SIZE];
> > > +	char card_dir[MAX_PATH_NAME_LEN];
> > > +
> > > +	find_devcoredump(card_dir);
> > > +	sprintf(command, "sudo bash -c \"echo '0'>/sys/class/drm/%s/device/devcoredump/data\"",
> > > +		card_dir);
> > > +	get_cmd_output(command, card_dir);
> > 
> > As mentioned before, please use only c and don't hide privilege escalation with sudo in this way.
> > 
> > > +}
> > > +
> > > +static void check_capture_output(const char *tag, uint64_t addr_lo, uint64_t addr_hi)
> > > +{
> > > +	char command[CMD_BUFFER_SIZE];
> > > +	char output[CMD_BUFFER_SIZE];
> > > +	char card_dir[MAX_PATH_NAME_LEN];
> > > +	uint64_t result;
> > > +
> > > +	find_devcoredump(card_dir);
> > > +
> > > +	sprintf(command, "sudo awk '/%s/{print $2}' /sys/class/drm/%s/device/devcoredump/data",
> > > +		tag, card_dir);
> > > +	get_cmd_output(command, output);
> > As mentioned before, please use only c and don't hide privilege escalation with sudo in this way.
> > 
> > 
> > > +	result = strtol(output, NULL, 16);
> > > +
> > > +	igt_debug("output:[%s] expected:[%lX-%lX]\n", output, addr_lo, addr_hi);
> > > +
> > > +	igt_assert((addr_lo <= result) && (result <= addr_hi));
> > > +}
> > > +
> > > +/**
> > > + * SUBTEST: close-fd
> > > + * Description: Test close fd, check if devcoredump register dump is within the
> > > + */
> > > +
> > > +static void
> > > +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > > +		 int n_exec_queues, int n_execs, unsigned int flags)
> > > +{
> > > +	uint32_t vm;
> > > +	const uint64_t addr = 0x1a0000;
> > Can you label the magic value with something meaningful?
> Sure, will make it a macro define in next rev.
> > 
> > 
> > > +	struct drm_xe_sync sync[2] = {
> > > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > > +	};
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 2,
> > > +		.syncs = to_user_pointer(sync),
> > > +	};
> > > +	uint32_t exec_queues[MAX_N_EXECQUEUES];
> > > +	uint32_t syncobjs[MAX_N_EXECQUEUES];
> > > +	size_t bo_size;
> > > +	uint32_t bo = 0;
> > > +	struct {
> > > +		struct xe_spin spin;
> > > +		uint32_t batch[16];
> > > +		uint64_t pad;
> > > +		uint32_t data;
> > > +	} *data;
> > > +	struct xe_spin_opts spin_opts = { .preempt = false };
> > > +	int i, b;
> > > +
> > > +	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> > > +
> > > +	if (flags & CLOSE_FD)
> > > +		fd = drm_open_driver(DRIVER_XE);
> > > +
> > > +	vm = xe_vm_create(fd, 0, 0);
> > > +	bo_size = sizeof(*data) * n_execs;
> > > +	bo_size = xe_bb_size(fd, bo_size);
> > > +
> > > +	bo = xe_bo_create(fd, vm, bo_size,
> > > +			  vram_if_possible(fd, eci->gt_id),
> > > +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +	data = xe_bo_map(fd, bo, bo_size);
> > > +
> > > +	for (i = 0; i < n_exec_queues; i++) {
> > > +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > +		syncobjs[i] = syncobj_create(fd, 0);
> > > +	};
> > > +
> > > +	sync[0].handle = syncobj_create(fd, 0);
> > > +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> > > +
> > > +	for (i = 0; i < n_execs; i++) {
> > > +		uint64_t base_addr = addr;
> > > +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > > +		uint64_t batch_addr = base_addr + batch_offset;
> > > +		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
> > > +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > > +		uint64_t sdi_addr = base_addr + sdi_offset;
> > > +		uint64_t exec_addr;
> > > +		int e = i % n_exec_queues;
> > > +
> > > +		if (!i) {
> > > +			spin_opts.addr = base_addr + spin_offset;
> > > +			xe_spin_init(&data[i].spin, &spin_opts);
> > > +			exec_addr = spin_opts.addr;
> > > +		} else {
> > > +			b = 0;
> > > +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > +			data[i].batch[b++] = sdi_addr;
> > > +			data[i].batch[b++] = sdi_addr >> 32;
> > > +			data[i].batch[b++] = 0xc0ffee;
> > > +			data[i].batch[b++] = MI_BATCH_BUFFER_END;
> > > +			igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > > +
> > > +			exec_addr = batch_addr;
> > > +		}
> > > +
> > > +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > > +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > > +		sync[1].handle = syncobjs[e];
> > > +
> > > +		exec.exec_queue_id = exec_queues[e];
> > > +		exec.address = exec_addr;
> > > +		if (e != i)
> > > +			syncobj_reset(fd, &syncobjs[e], 1);
> > > +		xe_exec(fd, &exec);
> > > +	}
> > > +
> > > +	for (i = 0; i < n_exec_queues && n_execs; i++)
> > > +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> > > +					NULL));
> > > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > > +
> > > +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > > +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > > +
> > > +	syncobj_destroy(fd, sync[0].handle);
> > > +	for (i = 0; i < n_exec_queues; i++) {
> > > +		syncobj_destroy(fd, syncobjs[i]);
> > > +		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > +	}
> > > +
> > > +	munmap(data, bo_size);
> > > +	gem_close(fd, bo);
> > > +	xe_vm_destroy(fd, vm);
> > > +
> > > +	check_capture_output("ACTHD:", addr, addr + sizeof(data->batch));
> > > +	check_capture_output("RING_BBADDR:", addr, addr + sizeof(data->batch));
> > > +
> > > +	rm_devcoredump();
> > > +}
> > > +
> > > +igt_main
> > > +{
> > > +	struct drm_xe_engine_class_instance *hwe;
> > > +	int fd;
> > > +
> > > +	igt_fixture
> > > +		fd = drm_open_driver(DRIVER_XE);
> > > +
> > > +	igt_subtest("close-fd")
> > > +		xe_for_each_engine(fd, hwe) {
> > > +			igt_debug("Engine class: %x inst: %x\n", hwe->engine_class,
> > > +				  hwe->engine_instance);
> > > +
> > > +			test_legacy_mode(fd, hwe, 1, 1, 0);
> > > +		}
> > > +
> > > +	igt_fixture
> > > +		drm_close_driver(fd);
> > > +}
> > > diff --git a/tests/meson.build b/tests/meson.build
> > > index 2d8cb87d5..b724a7c6d 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -284,6 +284,7 @@ intel_xe_progs = [
> > >   	'xe_exec_atomic',
> > >   	'xe_exec_balancer',
> > >   	'xe_exec_basic',
> > > +	'xe_exec_capture',
> > >   	'xe_exec_compute_mode',
> > >   	'xe_exec_fault_mode',
> > >   	'xe_exec_mix_modes',
> > 
