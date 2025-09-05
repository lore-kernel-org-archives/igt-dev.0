Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B3CCA0FED
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 10:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3391710EB77;
	Fri,  5 Sep 2025 10:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkVYrCu8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EEC10EB77
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757069240; x=1788605240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q4cy8Wuhpjk4yhk0is4Kin9y4uvGMmQojRWChq+aAh0=;
 b=NkVYrCu86ZaVoWZgXVQBWbw+Oobwp2B9JuSTJXh9noaDy4/M+SDRh36T
 PslHNZ/YE79aEbsZbwRnI2aJaQKyq/FcGuJLNBvfTUa9ANAKMycaAhNWZ
 /APzTjXXp/uJaatcCp7haegGwkKrtB0tGNB4zXas4VT1ycp82kbmi8Dx7
 T4nk2JlGKos4mZEsjYjV4i7x+wmt9udoFRnXIsURzztRwNz6aKo/FMkgp
 VTA5iG/VFmF0vC5Mz4QZta/RtiHUIPQSd4Cq89fqaaM3H8vV08FsDvnYe
 dCwYBMCrvXBRA7mCbKEVeZHM6Q1SPdNg+Wk3mn+VAjaSnMOkgRs5Sosei g==;
X-CSE-ConnectionGUID: Xd53StKAQzSRXS22goLZGg==
X-CSE-MsgGUID: 76etXRMQR4m9abWj4OucKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="69677226"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="69677226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 03:47:20 -0700
X-CSE-ConnectionGUID: V+YtoweSSomn6hfhgpwf8w==
X-CSE-MsgGUID: mqUSC/54RQGTUYJ54yuAQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172944773"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 03:47:18 -0700
Date: Fri, 5 Sep 2025 12:46:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_fault_injection: Add test for
 xe_pxp_exec_queue_add
Message-ID: <20250905104659.256rpwcy76j74tqo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250819005622.2970399-3-daniele.ceraolospurio@intel.com>
 <20250819005622.2970399-4-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819005622.2970399-4-daniele.ceraolospurio@intel.com>
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

Hi Daniele,
On 2025-08-18 at 17:56:24 -0700, Daniele Ceraolo Spurio wrote:
> This test will make sure that the error path in the exec_queue creation
> code works correctly if there is a PXP error.
> 
> Since this is the first queue creation case that requires an extension,
> the code has been updated to add support for that
> 
> This patch requires the matching kernel code [1] to be merged first.
> 
> [1] https://patchwork.freedesktop.org/series/153095/
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Please reply to CI.Xe.Full fail on LNL, I guess it was caused
by kernel patch from [1] not merged yet?

Regards,
Kamil

> ---
>  tests/intel/xe_fault_injection.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 00d045cd8..778148766 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -339,25 +339,43 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
>   * @xe_hw_engine_group_add_exec_queue:    xe_hw_engine_group_add_exec_queue
>   * @xe_vm_add_compute_exec_queue:         xe_vm_add_compute_exec_queue
>   * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
> + * @xe_pxp_exec_queue_add:                xe_pxp_exec_queue_add
>   */
> +
> +#define EXEC_QUEUE_LR	BIT(0)
> +#define EXEC_QUEUE_PXP	BIT(1)
>  static void
>  exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
>  		       const char pci_slot[], const char function_name[],
>  		       unsigned int flags)
>  {
>  	uint32_t exec_queue_id;
> -	uint32_t vm = xe_vm_create(fd, flags, 0);
> +	struct drm_xe_ext_set_property ext = { 0 };
> +	uint64_t ext_ptr = 0;
> +	uint32_t vm;
> +
> +	if (flags & EXEC_QUEUE_PXP) {
> +		igt_require(xe_wait_for_pxp_init(fd) == 0);
> +
> +		ext.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		ext.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE,
> +		ext.value = DRM_XE_PXP_TYPE_HWDRM;
> +		ext_ptr = to_user_pointer(&ext);
> +	}
> +
> +	vm = xe_vm_create(fd, flags & EXEC_QUEUE_LR ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
> +
>  	/* sanity check */
> -	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id), 0);
>  	xe_exec_queue_destroy(fd, exec_queue_id);
>  
>  	ignore_dmesg_errors_from_dut(pci_slot);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
> -	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
> +	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id) != 0);
>  	injection_list_remove(function_name);
>  
> -	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id), 0);
>  	xe_exec_queue_destroy(fd, exec_queue_id);
>  }
>  
> @@ -585,7 +603,8 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  	const struct section exec_queue_create_fail_functions[] = {
>  		{ "xe_exec_queue_create", 0 },
>  		{ "xe_hw_engine_group_add_exec_queue", 0 },
> -		{ "xe_vm_add_compute_exec_queue", DRM_XE_VM_CREATE_FLAG_LR_MODE },
> +		{ "xe_vm_add_compute_exec_queue", EXEC_QUEUE_LR },
> +		{ "xe_pxp_exec_queue_add", EXEC_QUEUE_PXP },
>  		{ }
>  	};
>  
> -- 
> 2.43.0
> 
