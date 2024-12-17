Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FFDE7716A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 09:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B015510E8C6;
	Tue, 17 Dec 2024 09:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sfgsbkft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1AE10E8C6
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 09:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734429008; x=1765965008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0XB93X6w6ehHVZnSFo14WmDWDAopWQj4X4zm92iVYgQ=;
 b=Sfgsbkft+d5cJkJgJtLGlUCpukDlr9k4/JJGO+pmOaYW5lHhMd6x1Fxy
 M9ZZEQW/+Ohd46HToJjWBaxHcGsXwMfILQh7uaGhnLTu0J4QMbpaWwIql
 GqEdn65/z9DXiVE0TlFoRY7c0vYwA+zfxqFapvMzgFNxIAd2i8sp0V0F6
 VKxw0V4cgOFdL6zQR3r3JU/T8Yauh7rHmdTHuMLoHBSAOks0ukI0BN8E8
 9k/fbMwJHG2+X7+NElIzpsT4K6G9yIeM78Nr0NwlKq/ZN18j1miemj5KZ
 JNehcgqL3PCmvH9/q/8AUaUNev3Ph3XafJRbS+3GIm6cD3aGdmAqxjvHU w==;
X-CSE-ConnectionGUID: t/L1UqCeS1CAvefR5bDUlw==
X-CSE-MsgGUID: Uhr4hjY2RFCddHDts4oZIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45330652"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45330652"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:50:07 -0800
X-CSE-ConnectionGUID: Xm5nhgdyTbCjjUhW8BBGSg==
X-CSE-MsgGUID: MNfeTYltRNOz5dyf3BuCXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102084888"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.48])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:50:07 -0800
Date: Tue, 17 Dec 2024 10:50:03 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, katarzyna.piecielska@intel.com,
 matthew.auld@intel.com
Subject: Re: [PATCH v2] tests/intel/xe_vm: Check negative cases for
 vm_create/destroy ioctl
Message-ID: <20241217095003.z73gc4lrhydcyivv@zkempczy-mobl2>
References: <20241213185735.652032-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213185735.652032-1-pravalika.gurram@intel.com>
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

On Sat, Dec 14, 2024 at 12:27:35AM +0530, Pravalika Gurram wrote:
> Negative test to check vm_create/destroy ioctl returns expected error when
> invalid flags, extensions, reserved, pad, vm_id  param is used.
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_vm.c | 131 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 131 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index e78ddd0e5..3535d48c7 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2242,6 +2242,102 @@ static void bind_flag_invalid(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +/**
> + * TEST: Negative test for vm create/destroy ioctl
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Synchronization
> + * Functionality: vm create
> + * Test category: negative test
> + */
> +
> +/**
> + * SUBTEST: invalid-flag-%s
> + * Description:  function %arg[1] used in vm create IOCTL to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_vm_create_fault:  xe_vm_create_fault
> + * @xe_vm_create_scratch_fault: xe_vm_create_scrach_fault
> + * @xe_vm_create_scratch_fault_lr:    xe_vm_create_scrach_fault_lr
> + */
> +
> +static void invalid_flag(int fd, __u32 flags)
> +{
> +	struct drm_xe_vm_create create = {
> +		.flags = flags,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
> +

Unnecessary blank line.

> +}
> +
> +/**
> + * SUBTEST: invalid-extensions
> + * Description: Check query with invalid extensions returns expected error code
> + *
> + * SUBTEST: vm-create-invalid-reserved
> + * Description: Send query with invalid reserved value for vm_create ioctl
> + */
> +
> +static void invalid_extensions(int fd)
> +{
> +	struct drm_xe_vm_create create = {
> +		.extensions = -1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
> +

Ditto.

> +}
> +
> +static void vm_create_invalid_reserved(int fd)
> +{
> +	struct drm_xe_vm_create create = {
> +		.reserved[0] = 0xffff,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
> +

Ditto.

See my comment about destroy and reserved[1].

> +}
> +
> +/**
> + * SUBTEST: vm-destroy-invalid-reserved
> + * Description: Send query with invalid reserved value for vm_destroy ioctl
> + *
> + * SUBTEST: invalid-pad
> + * Description: Check query with invalid pad returns expected error code
> + *
> + * SUBTEST: invalid-vm-id
> + * Description: Check query with invalid vm_id returns expected error code
> + */
> +
> +static void vm_destroy_invalid_reserved(int fd)
> +{
> +	struct drm_xe_vm_destroy destroy = {
> +		.reserved[0] = 0xffff,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, EINVAL);

I think checking reserved[1] in this subtests also deserves for a check:

	destroy.reserved[0] = 0;
	destroy.reserved[1] = 0xffff;

	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, EINVAL);

> +}
> +
> +static void invalid_pad(int fd)
> +{
> +	struct drm_xe_vm_destroy destroy = {
> +		.pad = 1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, EINVAL);
> +}
> +
> +static void invalid_vm_id(int fd)
> +{
> +	struct drm_xe_vm_destroy destroy = {
> +		.vm_id = 0xdeadbeef,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -2339,6 +2435,21 @@ igt_main
>  		{ NULL },
>  	};
>  
> +        const struct vm_create_section {
> +                const char *name;
> +                __u32 flags;
> +        } vm_create_flags_fail_functions[] = {
> +                { "xe_vm_create_fault", DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> +                { "xe_vm_create_scratch_fault",
> +                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> +                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> +                { "xe_vm_create_scratch_fault_lr",

I would call it "xe_vm_create_invalid_flags". This one will require
altering when someone will add a new flag.

With those nits fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> +                        ~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> +                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
> +                { }
> +        };
> +
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
>  
> @@ -2598,6 +2709,26 @@ igt_main
>  		}
>  	}
>  
> +	for (const struct vm_create_section *s = vm_create_flags_fail_functions; s->name; s++) {
> +		igt_subtest_f("invalid-flag-%s", s->name)
> +			invalid_flag(fd, s->flags);
> +	}
> +
> +	igt_subtest("invalid-extensions")
> +		invalid_extensions(fd);
> +
> +	igt_subtest("vm-create-invalid-reserved")
> +		vm_create_invalid_reserved(fd);
> +
> +	igt_subtest("vm-destroy-invalid-reserved")
> +		vm_destroy_invalid_reserved(fd);
> +
> +	igt_subtest("invalid-pad")
> +		invalid_pad(fd);
> +
> +	igt_subtest("invalid-vm-id")
> +		invalid_vm_id(fd);
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> -- 
> 2.34.1
> 
