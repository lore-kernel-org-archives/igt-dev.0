Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3700A1098781
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB8B10EA9B;
	Fri, 20 Mar 2026 13:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4hBY2D4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F6D10EA9B
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774013305; x=1805549305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qalwrOGvZ5wFnZ+1OQgFCqEHZ98msNF1FjUnpERRo6Y=;
 b=W4hBY2D4AJV5k4Ssk4r6ywuLJ9o874gL2alsbxs19EdX4YzWmhKeNq7R
 Kp/wJSBN1VPkg06b6yWG8WtVT0Jqyx5RZH5FvjYKejm17OLr47OQERg+q
 Puoud4NiSbpGghr9T5zYbL++goWZUPXGoxbH0UPpain03FDy6HwJ0RJ11
 Fc693ROBtjx56nqVJBEd024WI6HJ9nQsIAVHMs957l8sqEFrOQ2FJ3ecN
 3SB3pCyaMB8bwEGOpuKI45WkiM2DMbg86bbnDxZZQJ4f6FR8qUd0tMbOu
 RZV/djeJGrmWJmYK2NpzKCXzHjwRwVh/RF/S8ml2dSNVVo+T/SPuiKVk5 A==;
X-CSE-ConnectionGUID: zhnVbWeITNKEXBXk6qunEQ==
X-CSE-MsgGUID: SeXmo7soRselyAJf491Mcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="85723263"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="85723263"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 06:28:25 -0700
X-CSE-ConnectionGUID: j5jM0O4eSaGvet25s6Yk0Q==
X-CSE-MsgGUID: c0lnn+J/QWubAk+vhoTfLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="218639817"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 06:28:24 -0700
Date: Fri, 20 Mar 2026 14:28:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org, tejas.upadhyay@intel.com,
 priyanka.dandamudi@intel.com
Subject: Re: [PATCH v2 i-g-t] tests/intel/xe_pat: Add negetive test to
 validate pat index
Message-ID: <20260320132821.evol6t6odk4cufh6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nakshtra.goyal@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
References: <20260320122926.1614740-1-nakshtra.goyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320122926.1614740-1-nakshtra.goyal@intel.com>
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

Hi nakshtra.goyal,
On 2026-03-20 at 17:59:26 +0530, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>

small nit about subject, please make it shorter, also write PAT in
uppercase, s/negetive/negative/, so imho better:

[PATCH v2 i-g-t] tests/intel/xe_pat: Add negative subtest for PAT index

This could be done either at merge or at v3.

Regards,
Kamil

> 
> Adding negative test to validate pat index restrictions, extending tests in
> userptr_coh_none and prime_export for index 18 and adding new svm test
> to validate for diff indexes , index 19 will pass in all cases , 18
> will fail with EINVAL
> 
> v2: Adding validation checks directly inside subtest call instead
>     of different functions   (Priyanka)
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_pat.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index e91b037a5..6f107f345 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -34,6 +34,11 @@
>  #define XE_COH_NONE          1
>  #define XE_COH_AT_LEAST_1WAY 2
>  
> +/*
> + * PAT index 18: XA (eXclusive Access) + UC (Uncached).
> + */
> +#define XE_PAT_IDX_XA_UC     18
> +
>  static bool do_slow_check;
>  static char bus_addr[NAME_MAX];
>  static struct pci_device *pci_dev;
> @@ -82,6 +87,10 @@ static void userptr_coh_none(int fd)
>  				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>  				   intel_get_pat_idx_wt(fd), 0),
>  		      -EINVAL);
> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
> +				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
> +				   XE_PAT_IDX_XA_UC, 0),
> +		      -EINVAL);
>  
>  	munmap(data, size);
>  	xe_vm_destroy(fd, vm);
> @@ -755,6 +764,54 @@ static void pat_index_dw(struct xe_pat_param *p)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +/**
> + * SUBTEST: l2-flush-opt-svm-pat-restrict
> + * Test category: negative test
> + * Description: Validate that on L2 flush optimized platforms, SVM
> + *		(CPU_ADDR_MIRROR) mappings only accept pat_index 19
> + *		(XA+2WAY) and reject all other pat indices with -EINVAL.
> + */
> +static void l2_flush_opt_svm_pat_restrict(int fd)
> +{
> +	struct drm_xe_query_config *config = xe_config(fd);
> +	uint32_t vm;
> +	void *buffer;
> +	size_t alloc_size = xe_get_default_alignment(fd);
> +	struct xe_device *xe_dev = xe_device_get(fd);
> +	uint64_t svm_size;
> +	size_t size = xe_get_default_alignment(fd);
> +
> +	svm_size = 1ull << xe_dev->va_bits;
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	xe_vm_bind_lr_sync(fd, vm, 0, 0, 0, svm_size,
> +			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
> +	buffer = aligned_alloc(alloc_size, SZ_2M);
> +
> +	igt_require(config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +		    DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					intel_get_pat_idx_wb(fd), 0, 0), 0);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					intel_get_pat_idx_uc(fd), 0, 0), -EINVAL);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					intel_get_pat_idx_wt(fd), 0, 0), -EINVAL);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					XE_PAT_IDX_XA_UC, 0, 0), -EINVAL);
> +
> +	free(buffer);
> +	xe_vm_unbind_lr_sync(fd, vm, 0, 0, svm_size);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: prime-self-import-coh
>   * Test category: functionality test
> @@ -890,6 +947,11 @@ static void prime_external_import_coh(void)
>  		      0);
>  	xe_vm_unbind_sync(fd2, vm, 0, 0x40000, size);
>  
> +	igt_assert_eq(__xe_vm_bind(fd2, vm, 0, handle_import, 0, 0x40000,
> +				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> +				   XE_PAT_IDX_XA_UC, 0),
> +		      -EINVAL);
> +
>  	xe_vm_destroy(fd2, vm);
>  
>  	/*
> @@ -1771,6 +1833,11 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>  		}
>  	}
>  
> +	igt_subtest("l2-flush-opt-svm-pat-restrict") {
> +		igt_require(intel_graphics_ver(dev_id) == IP_VER(35, 10));
> +		l2_flush_opt_svm_pat_restrict(fd);
> +	}
> +
>  	igt_fixture()
>  		drm_close_driver(fd);
>  }
> -- 
> 2.34.1
> 
