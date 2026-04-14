Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3C0F9D0EC
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 17:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4EC10E649;
	Tue, 14 Apr 2026 17:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsi200Rz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E2210E63E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776188470; x=1807724470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v/Y5Rg/5wCj8Vv3dpR1gcerVIvLlVGdisoD3VsTAkiQ=;
 b=jsi200RzWaCsdKbhFq6jtVH9JHwtc6jwAHGeqPPXalYZN4woaS3nX2Mh
 ImoOjrm/89yjHQ8INGtsFXMaAHqBvgHTBd8qUBzzmLhBzXD4TtUbUaTuk
 x87gAXbGO1vcoXILifK6wUEKPxpSpMrWSt4Cthn04n3mJI7GgsO1iKsao
 da2LaGg6cjNTD7GsY5aUx/IVp+SZQSAxfAFooresm6WXB6Yv5ydK1bWp8
 uLgUArhFs+xknnrFuRZF1VQ0bXRKh+sM6flbagUunaEfiNSOUsczEEHrz
 5FZaGxResEhWTTf0866O/cpECl+/Jgn3bouaxG0EYqZ2lHuXaNG3iAoxJ Q==;
X-CSE-ConnectionGUID: 0/L+JX0oQ+qs6SaUosnPHQ==
X-CSE-MsgGUID: VsDvP4msSKqAOvnThWyhXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99799054"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="99799054"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 10:41:10 -0700
X-CSE-ConnectionGUID: wyvvVYLeQiOU8WUA0l9MHQ==
X-CSE-MsgGUID: n71zYIAKRwWXMNy7wVFrcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253375949"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 10:41:08 -0700
Date: Tue, 14 Apr 2026 19:40:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_wedged: Add subtest to validate
 device behaviour
Message-ID: <20260414174051.4jz7mquribwyownl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 matthew.brost@intel.com
References: <20260413143717.5323-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413143717.5323-1-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-04-13 at 14:37:17 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 

Please write a more descriptive subject, maybe use some
explanation from new test description?

[PATCH i-g-t] tests/intel/xe_wedged: Add subtest to validate device behaviour

* Description: Submits a long-running job using a userptr buffer, force-wedges the device

so maybe:

[PATCH i-g-t] tests/intel/xe_wedged: Check ECANCELED after device wedge
or
[PATCH i-g-t] tests/intel/xe_wedged: Check device wedge with userptr buffer

> This test:
> - Forces the device into "wedged-at-any-timeout" mode via debugfs.
> - Submits a hang job and waits for the hang to be detected.
> - Verifies that all subsequent ioctls return -ECANCELED,

You tested only one, so imho

- Verifies that subsequent ioctl return -ECANCELED,

or did I miss something?

>   indicating the device is wedged.
> - Reloads the driver and checks that normal operation is
>   restored on all engines.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_wedged.c | 94 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index e1ac629ca..fe6468cc6 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -193,6 +193,51 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>  	} while (err && errno == ENOMEM);
>  }
>  
> +static void
> +submit_job(int fd, uint32_t vm, uint32_t exec_queue, void *userptr,
> +	   size_t size, uint32_t syncobj)
> +{
> +	uint64_t addr = 0x1a0000;
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	uint32_t bo = 0;
> +	uint32_t *batch;
> +	size_t bo_size = 4096;
> +	uint64_t batch_addr = addr;
> +	int b = 0;
> +
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, 0),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	batch = xe_bo_map(fd, bo, bo_size);
> +
> +	batch[b++] = MI_BATCH_BUFFER_START;
> +	batch[b++] = MI_PRT_BATCH_BUFFER_START;
> +	batch[b++] = batch_addr;
> +	batch[b++] = batch_addr >> 32;
> +	batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= (bo_size / sizeof(uint32_t)));
> +
> +	xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(userptr),
> +				 addr + 0x10000, size, NULL, 0);
> +
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, batch_addr, bo_size, NULL, 0);
> +
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = batch_addr;
> +
> +	syncobj_reset(fd, &syncobj, 1);
> +	xe_exec(fd, &exec);
> +}
> +
>  /**
>   * SUBTEST: basic-wedged
>   * Description: Force Xe device wedged after injecting a failure in GT reset
> @@ -209,6 +254,10 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>   * SUBTEST: basic-wedged-read
>   * Description: Read wedged_mode debugfs
>   */
> +/**
> + * SUBTEST: userptr-wedge-fence-signal
> + * Description: Submits a long-running job using a userptr buffer, force-wedges the device
> + */
>  int igt_main()
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -310,6 +359,51 @@ int igt_main()
>  		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
>  	}
>  
> +	igt_subtest("userptr-wedge-fence-signal") {
> +		struct drm_xe_engine_class_instance inst = {
> +			.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +			};
> +
> +		size_t size;
> +		void *userptr;
> +		uint32_t vm, exec_queue, syncobj;
> +		int ret;
> +
> +		size = 128 * 1024 * 1024;
> +		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
> +					       O_RDWR));
> +		igt_debugfs_write(fd, "fail_gt_reset/verbose", "1");
> +
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +		ignore_wedged_in_dmesg();
> +
> +		userptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
> +			       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +		igt_assert(userptr != MAP_FAILED);
> +
> +		vm = xe_vm_create(fd, 0, 0);
> +		exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
> +		syncobj = syncobj_create(fd, 0);
> +
> +		submit_job(fd, vm, exec_queue, userptr, size, syncobj);
> +
> +		force_wedged(fd);
> +		munmap(userptr, size);
> +
> +		ret = syncobj_wait_err(fd, &syncobj, 1, INT64_MAX, 0);
> +		if (ret)
> +			igt_assert_eq(ret, -ECANCELED);
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		system("modprobe -r xe && modprobe xe");


imho this should be done in at_exit procedure, or at least in fixture.
The reason is that if test will fail with assert, it will miss those
cleanups. Also, there are igt lib functions for this, please use them.

Regards,
Kamil

> +		fd = drm_open_driver(DRIVER_XE);
> +
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +		xe_for_each_engine(fd, hwe)
> +			simple_exec(fd, hwe);
> +	}
> +
>  	igt_fixture() {
>  		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>  			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
> -- 
> 2.43.0
> 
