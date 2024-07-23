Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0840C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 07:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5DD10E471;
	Tue, 23 Jul 2024 07:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9AUwLiT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561BA10E471
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 07:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721721358; x=1753257358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X3Ndrm0IMBM4Yqvl2ubTFpqrmXT9se2EjuCv6bs9nVk=;
 b=H9AUwLiTSIQRZKakTCEgaJu3jA/ekOKJHOn89vyrrZ+WCfcrEoujljQg
 I4atpyalzA73sh6my/m7DnyJ0Yn7O2F6dHx4sh7Ve4Van9z9+1MN/JQpP
 85dFqLDbaHpgR1PX7S0qdcjJUo0EvfRXRXNqYVHwiQ/rii/FknDijdfA3
 3u8bb9FLaDm2PcyegJ3tkpfhW1yyxkAogtA1UFB7xNRezfqwBvyvTCIzL
 bUUzbCwkIg98DTHEjMCl9d9HbkSFfzc1jmD9TVpA+EkfFP2wWu7CdSAhr
 82XL7mxRoWFDd0FDRN/S3vuzbYvVLgNp9DRNQMB4UtB2WxxeZysK6KIF2 Q==;
X-CSE-ConnectionGUID: dvIFcYpyTbS+OrdG7ogPvA==
X-CSE-MsgGUID: cXkDgQCRR5CBSoOaEVY5GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="18944801"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="18944801"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 00:55:58 -0700
X-CSE-ConnectionGUID: SRpP3mtcSi6nz+bgaWNVig==
X-CSE-MsgGUID: vIasAqbqSYqsqLdDIFnBlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="83163867"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 00:55:56 -0700
Date: Tue, 23 Jul 2024 09:55:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/2] tests/xe/xe_vm: Add section to test zero number
 of VM binds
Message-ID: <20240723075540.pnb3yfdkbsrfvhmm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
References: <20240719194107.1549306-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240719194107.1549306-1-matthew.brost@intel.com>
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

Hi Matthew,
On 2024-07-19 at 12:41:06 -0700, Matthew Brost wrote:
> Verify the bind queue ordering works wrt out-sync signaling when zero
> number of binds passed to VM bind IOCTL.
> 
> v2:
>  - Fix build error
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

You patch do not apply, if it is a part of bigger changes
consider sending them all in one patchseries or wait for
other ones to be merged.

Regards,
Kamil

> ---
>  lib/xe/xe_ioctl.c   | 13 ++++++++++
>  lib/xe/xe_ioctl.h   |  2 ++
>  tests/intel/xe_vm.c | 63 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index ae43ffd15e..27a4a4e70d 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -154,6 +154,19 @@ void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  			    num_syncs, 0, 0);
>  }
>  
> +void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t exec_queue,
> +		     struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	struct drm_xe_vm_bind bind = {
> +		.vm_id = vm,
> +		.num_syncs = num_syncs,
> +		.syncs = (uintptr_t)sync,
> +		.exec_queue_id = exec_queue,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
> +}
> +
>  void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  			    uint64_t offset, uint64_t addr, uint64_t size,
>  			    struct drm_xe_sync *sync, uint32_t num_syncs,
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index b27c0053f0..6dfed1b330 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -35,6 +35,8 @@ void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue,
>  void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		      uint64_t offset, uint64_t addr, uint64_t size,
>  		      struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t exec_queue,
> +		     struct drm_xe_sync *sync, uint32_t num_syncs);
>  void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			      uint64_t userptr, uint64_t addr, uint64_t size,
>  			      struct drm_xe_sync *sync, uint32_t num_syncs);
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index a088bd5db8..ede75f72aa 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -868,6 +868,63 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm, uint32_t exec_queue,
>  	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, err);
>  }
>  
> +/**
> + * SUBTEST: zero-binds
> + * Description: Test zero binds in IOCTL
> + * Functionality: bind engines
> + * Run type: BAT
> + */
> +
> +static void test_zero_binds(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	uint32_t vm;
> +	uint64_t addr = 0x1a0000;
> +	struct drm_xe_sync sync[1] = {
> +		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	size_t bo_size;
> +	uint32_t bo = 0;
> +	struct xe_cork cork;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = ALIGN(xe_cs_prefetch_size(fd),
> +			xe_get_default_alignment(fd));
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	xe_cork_init(fd, eci, &cork);
> +	xe_cork_wait_started(&cork);
> +
> +	/* Initial bind behind cork */
> +	sync[0].handle = cork.syncobj;
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +
> +	/* Bind /w num_binds == 0 */
> +	sync[0].handle = syncobj_create(fd, 0);
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_vm_bind_zero(fd, vm, 0, sync, 1);
> +
> +	/* Let jobs runs for a bit */
> +	usleep(100000);
> +
> +	/* both binds are waiting */
> +	igt_assert(!syncobj_wait(fd, &sync[0].handle, 1, 0, 0, NULL));
> +
> +	/* Release cork */
> +	xe_cork_end(&cork);
> +	xe_cork_wait_done(&cork);
> +	xe_cork_fini(&cork);
> +
> +	/* both binds are done */
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
>  #define BIND_ARRAY_ENOBUFS_FLAG		(0x1 << 1)
>  
> @@ -2416,6 +2473,12 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			test_bind_execqueues_independent(fd, hwe, CONFLICT);
>  
> +	igt_subtest("zero-binds")
> +		xe_for_each_engine(fd, hwe) {
> +			test_zero_binds(fd, hwe);
> +			break;
> +		}
> +
>  	igt_subtest("bind-array-twice")
>  		xe_for_each_engine(fd, hwe)
>  			test_bind_array(fd, hwe, 2, 0x1a0000, 0, 0);
> -- 
> 2.34.1
> 
