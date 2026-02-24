Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595CBF4BB7A
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 19:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00B310E617;
	Tue, 24 Feb 2026 19:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ex+308Cg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2B710E617
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771962108; x=1803498108;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HllStjL+rSH4T8NaTTnvjWRQjF6luCWqm69DYi/9F38=;
 b=Ex+308Cg+8RZEuuNtgqSxoTchx/oz4wfOJChO/Uf8wPSG2w95zz0RA6i
 HxKIur59dFx7OqmW6r7OM2joPWS3Rn1mJ6Por6KoWJyGWCe0zU1wGNSLL
 NnuOAjA+nFd14I2urQeLXhsC8q06jn6kgf6J1ruYQ1yrviJSS+Ezflnlf
 00viMSXBXQVLXiVUfshjAgF7xVDQqdj1ovhkz+O1FPC5hcMqsEF/SHFuz
 9u2pYY/qA+iCoFH0QeR3muS0mfPMvS6hi1rCz2UFU2y2jvFz6s4luDv0E
 UlhJuGY46oN8seXic39AOrhwIW/be7xX4ngN+ZyuX2oHC2lAsyt1eMAWp Q==;
X-CSE-ConnectionGUID: HkbIPWQtR02raBDjgQ3LbA==
X-CSE-MsgGUID: vc8rMX21T12Ut67Y63hBvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83703863"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="83703863"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 11:41:48 -0800
X-CSE-ConnectionGUID: qPaqlNK7Se28DDWuEjvPyA==
X-CSE-MsgGUID: KW4a20CvTLyLPtpP7klEUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215106370"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 11:41:47 -0800
Date: Tue, 24 Feb 2026 20:41:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: Re: [PATCH i-g-t 2/2] test/intel/xe_vm: Test to check no overcommit
 flag in fault mode
Message-ID: <20260224194143.p7yjsbg7nlpvjy3e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
References: <20260212190305.804221-1-sobin.thomas@intel.com>
 <20260212190305.804221-3-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260212190305.804221-3-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-02-12 at 19:03:03 +0000, Sobin Thomas wrote:
> In existing tests there is no support to check no overcommit flag
> (DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT) which will disallow overcommit
> during bind
> 
> - test_vm_fault_mode_no_overcommit(): Tests that fault-mode VMs with
>   DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT enabled properly prevent eviction
>   and validate OOM error handling.
> 
> These tests ensure deterministic VM behavior and prevent unpredictable
> eviction-related performance degradation in memory-constrained scenarios.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  include/drm-uapi/xe_drm.h |   1 +
>  tests/intel/xe_vm.c       | 131 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 128 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 077e66a68..2efe27ad5 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -983,6 +983,7 @@ struct drm_xe_vm_create {
>  #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
>  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
>  #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> +#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
>  	/** @flags: Flags */
>  	__u32 flags;

This should be a separate commit, sync with kernel. Look into
git log -- include/drm-uapi/xe_drm.h

and also into README.md

Regards,
Kamil

>  
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index cf45d1051..d908f6005 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,7 +21,9 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>  
> -
> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define BO_SIZE xe_bb_size(fd, SZ_512M)
> +#define MAX_BUFS ((int)(xe_visible_vram_size(fd, 0) / BO_SIZE))
>  
>  static uint32_t
>  addr_low(uint64_t addr)
> @@ -2387,9 +2389,6 @@ static void invalid_vm_id(int fd)
>   */
>  static void test_oom(int fd)
>  {
> -#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> -#define BO_SIZE xe_bb_size(fd, SZ_512M)
> -#define MAX_BUFS ((int)(xe_visible_vram_size(fd, 0) / BO_SIZE))
>  	uint64_t addr = 0x1a0000;
>  	uint64_t vm_sync;
>  	uint32_t bo[MAX_BUFS + 1];
> @@ -2934,6 +2933,125 @@ gpu_done:
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +/**
> + * SUBTEST: evict-vm-fault-no-overcommit
> + * Description: Test if vm fault mode with NO_VM_OVERCOMMIT flag prevents overcommit
> + * Functionality: NO_VM_OVERCOMMIT flag prevents per-VM overcommit in fault mode
> + * Test category: functionality test
> + */
> +static void test_vm_fault_no_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
> +					uint64_t system_size, uint64_t vram_size,
> +					uint64_t overcommit_multiplier)
> +{
> +	uint64_t overcommit_size;
> +	uint32_t vm;
> +	uint32_t *bos;
> +	int num_bos;
> +	size_t nf_bo_size = 64 * 1024 * 1024;  // 64MB per BO
> +	int i;
> +	int create_ret;
> +	int bind_err;
> +	bool overcommit_detected = false;
> +	uint32_t bind_exec_queue;
> +	uint64_t data_addr = 0x300000000;
> +
> +	struct drm_xe_sync bind_sync[1] = {
> +		{
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = USER_FENCE_VALUE
> +		},
> +	};
> +
> +	igt_debug("Starting fault-mode NO_VM_OVERCOMMIT test");
> +
> +	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
> +
> +	if (overcommit_size > system_size) {
> +		igt_debug("Limiting overcommit size from %llu MB to %llu MB",
> +			  (unsigned long long)(overcommit_size >> 20),
> +			  (unsigned long long)(system_size >> 20));
> +		overcommit_size = ALIGN(system_size, 4096);
> +	}
> +
> +	num_bos = (overcommit_size / nf_bo_size) + 1;
> +	bos = calloc(num_bos, sizeof(*bos));
> +	igt_assert(bos);
> +
> +	igt_debug("Fault mode NO_OVERCOMMIT: allocating %d BOs of %llu MB each, "
> +		  "target overcommit=%llu MB, vram=%llu MB",
> +		  num_bos, (unsigned long long)(nf_bo_size >> 20),
> +		  (unsigned long long)(overcommit_size >> 20),
> +		  (unsigned long long)(vram_size >> 20));
> +
> +	/* Create fault-mode VM with NO_VM_OVERCOMMIT flag */
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +		       DRM_XE_VM_CREATE_FLAG_FAULT_MODE |
> +		       DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT, 0);
> +	igt_assert(vm);
> +
> +	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
> +
> +	/* Try to create and bind BOs - should eventually fail or limit overcommit */
> +	for (i = 0; i < num_bos; i++) {
> +		struct {
> +			uint64_t vm_sync;
> +		} *data;
> +
> +		/* CREATE BO */
> +		create_ret = __xe_bo_create(fd, 0, nf_bo_size,
> +					    vram_if_possible(fd, eci->gt_id),
> +					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +					    NULL, &bos[i]);
> +		if (create_ret) {
> +			igt_debug("BO create failed with error %d (%s)",
> +				  -create_ret, strerror(-create_ret));
> +			overcommit_detected = true;
> +			num_bos = i;
> +			break;
> +		}
> +
> +		igt_debug("BO created successfully - %llu MB",
> +			  (unsigned long long)(nf_bo_size >> 20));
> +
> +		/* MAP BO */
> +		data = xe_bo_map(fd, bos[i], 4096);
> +		memset(data, 0, 4096);
> +		bind_sync[0].addr = to_user_pointer(&data->vm_sync);
> +
> +		/* Try to bind with IMMEDIATE flag - subject to no overcommit check */
> +		bind_err = __xe_vm_bind(fd, vm, bind_exec_queue, bos[i], 0,
> +					data_addr + (i * nf_bo_size), nf_bo_size,
> +					DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_IMMEDIATE,
> +					bind_sync, 1, 0, 0, 0);
> +		if (bind_err) {
> +			igt_debug("Bind failed at %d/%d with error %d (%s)",
> +				  i, num_bos, -bind_err, strerror(-bind_err));
> +			igt_assert_f(bind_err == -ENOMEM || bind_err == -ENOSPC,
> +				     "Unexpected bind error %d (%s)", -bind_err,
> +				     strerror(-bind_err));
> +			overcommit_detected = true;
> +			num_bos = i;
> +			break;
> +		}
> +
> +		munmap(data, 4096);
> +	}
> +
> +	igt_debug("NO_VM_OVERCOMMIT test: overcommit %s (created %d BOs)",
> +		  overcommit_detected ? "limited" : "completed",
> +		  num_bos);
> +
> +	/* Cleanup */
> +	xe_exec_queue_destroy(fd, bind_exec_queue);
> +	for (i = 0; i < num_bos; i++) {
> +		if (bos[i])
> +			gem_close(fd, bos[i]);
> +	}
> +	free(bos);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  int igt_main()
>  {
>  	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -3350,6 +3468,11 @@ int igt_main()
>  		igt_assert(xe_visible_vram_size(fd, 0));
>  		test_oom(fd);
>  	}
> +	igt_subtest("evict-vm-fault-no-overcommit") {
> +		igt_require(xe_has_vram(fd));
> +		igt_assert(xe_visible_vram_size(fd, 0));
> +		test_vm_fault_no_overcommit(fd, hwe, system_size, vram_size, 2);
> +	}
>  
>  	igt_fixture()
>  		drm_close_driver(fd);
> -- 
> 2.52.0
> 
