Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC3C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573D310E4C9;
	Wed, 15 May 2024 17:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ep5cI9oK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C0610E4C9
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715794731; x=1747330731;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L1NIDF+e5G7ZkIs32njPkZs0DJ5sai6BXFCDfsA+FIA=;
 b=ep5cI9oKPLPpwEMEejku/bZJG3ZyrnDxMED/Ro+9w5P+LYKncLogSH49
 GEL8Y/nN2SckGz7+H88CocKs8yLTsyW9tz3aQTcxB0d5YEhveykg+ML1o
 e9A4lXQkbpff5QplJCjIakJ1BKzXO3M2dA09nbZnv4Xp4bWwDGmeFuxIL
 Yms6l1U/YnJCzHBcqmyR5dI01ChPKiKcyJpJgTksrMAwFpzGPQsucfuMH
 ATOtL8FRDAtmcphlnUkJwFDsj1HzFd1HiNwIywxbggrajpk5gdcpT1IgG
 VPyeopi4NTiFpg/OSWlIO4tLrZxVSm8MNv2fPrnvtEsxtfaLAr45+zL0x g==;
X-CSE-ConnectionGUID: ZjWHzjS2Qz+oqttV5UlB4w==
X-CSE-MsgGUID: +cGLNhblTiqMkjUg+CG11A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22535890"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="22535890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:38:50 -0700
X-CSE-ConnectionGUID: 5dY8nivvRfqHRV17aL4rhQ==
X-CSE-MsgGUID: xwNZxqXKQPyqKEnQIQrAgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31710628"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:38:49 -0700
Date: Wed, 15 May 2024 19:38:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t v2 03/10] tests/xe_svm: basic svm test
Message-ID: <20240515173846.b3apak7bkx4rpuct@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
 <20240514071026.748257-4-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240514071026.748257-4-krishnaiah.bommu@intel.com>
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

Hi Bommu,
On 2024-05-14 at 12:40:19 +0530, Bommu Krishnaiah wrote:

please imprve subject:

[PATCH i-g-t v2 03/10] tests/xe_svm: basic svm test

imho better:

[PATCH i-g-t v2 03/10] tests/intel/xe_svm: add basic svm test

> Test will verify SVM basic functionality, by allocating a memory with
> system allocator(malloc() or mmap()) and accessing in GPU.

Please describe it more here, how you will verify it.

imho basic test could just access it using pointer from malloc.

> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/drm-uapi/xe_drm.h |  2 ++
>  tests/intel/xe_svm.c      | 57 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 0b709b374..228bc2974 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -973,6 +973,8 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)
> +
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
> index 7d0892a3d..2daed1eff 100644
> --- a/tests/intel/xe_svm.c
> +++ b/tests/intel/xe_svm.c
> @@ -14,8 +14,18 @@
>   */
>  
>  /**
> - * TEST: xe_basic
> + * TEST: xe_svm

Do not do this, make this correct from beginning in
previous patch.

> + * Description: Test shared virtual memory
> + * Sub-category: Memory management
> + * Functionality: svm
> + * Run type: FULL

Add also Mega feature:

> + *
> + * SUBTEST: xe_basic
-------------- ^^^
imho this would be svm-basic-gpu-access

>   * Description: Basic test to verify store dword by using helper funtions

Add newline.

> + * SUBTEST: svm-basic-malloc
> + * Description: verify SVM basic functionality by using malloc

Add newline.

> + * SUBTEST: svm-basic-mmap
> + * Description: verify SVM basic functionality by using mmap
>   */
>  
>  #include <fcntl.h>
> @@ -67,6 +77,40 @@ static void xe_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *e
>  	xe_destroy_buffer(&dst_buf);
>  }
>  
> +/**
> + *  Use malloc or mmap memory for direct GPU submission
> + */
> +static void svm_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci, bool test_mmap)
> +{
> +	uint64_t gpu_va = 0x1a0000;
> +	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
> +	uint32_t *dst;
> +
> +	struct xe_buffer cmd_buf = {
> +		.fd = fd,
> +		.gpu_addr = (void *)(uintptr_t)gpu_va,
> +		.vm = vm,
> +		.size = bo_size,
> +		.placement = vram_if_possible(fd, eci->gt_id),
> +		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +	};
> +
> +	if (test_mmap)
> +		dst = mmap(NULL, 4, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
> +	else
> +		dst = aligned_alloc(xe_get_default_alignment(fd), 4);
> +
> +	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);
> +	xe_submit_cmd(&cmd_buf);
> +	igt_assert_eq(*dst, 0xc0ffee);
> +	xe_destroy_cmdbuf(&cmd_buf);
> +
> +	if (test_mmap)
> +		munmap(dst, 4);
> +	else
> +		free(dst);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -77,13 +121,22 @@ igt_main
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_require(xe_supports_faults(fd));
>  		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << 47, DRM_XE_VM_BIND_OP_MAP,
> +				DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR, 0, 0, 0, 0);
>  	}
>  
> -

Remove this in previous patch.

Regards,
Kamil

>  	igt_subtest_f("xe-basic")
>  		xe_for_each_engine(fd, hwe)
>  			xe_basic(fd, vm, hwe);
>  
> +	igt_subtest_f("svm-basic-malloc")
> +		xe_for_each_engine(fd, hwe)
> +			svm_basic(fd, vm, hwe, false);
> +
> +	igt_subtest_f("svm-basic-mmap")
> +		xe_for_each_engine(fd, hwe)
> +			svm_basic(fd, vm, hwe, true);
> +
>  	igt_fixture {
>  		xe_vm_destroy(fd, vm);
>  		drm_close_driver(fd);
> -- 
> 2.25.1
> 
