Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B36E7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 10:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7380C10EF9E;
	Fri, 13 Dec 2024 10:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoDREZmV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7047F10EF9E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734085939; x=1765621939;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+Pngs0ENRu/X1SB4jybQ6GeffUMMEglOhX5lBzmm+RU=;
 b=EoDREZmVHL2IPUd2q4TG8RyMvIGwL/uYgWsmGyZbDC4bPYgnM0RZ8Jz8
 27kx6f/nL7ajHJ+EQFUBP2vG/j/Qb9AwZcLRV7mYnd8gP0WaeCl6djHF1
 Z2h36YbO4N+KUwvVEw4NK9SDHw8M83XJFVVVW+ZpNPZjxi6K1W2RRJZAL
 XIVbuRu0H4OzRBV9vDrHOLiRonjTR/b4lZf6Y0Pxo4NVtbmBu9mB67hM5
 UuYUgEFyre67BHP7ayuaeAUIFo6UGA9NXSmjQcjl1lNj5hxd6N8EB2hPK
 gKTd4vV0dDhZSJRGidNGQ2O5Y3kYN0b0vK1Wx9i/z9KlSswxh4ldSGKUY Q==;
X-CSE-ConnectionGUID: BQjvDcMlQAOoA8mDQmCYVg==
X-CSE-MsgGUID: PyUuc0RGQz+WCb5faQJJ2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45224861"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="45224861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 02:32:19 -0800
X-CSE-ConnectionGUID: bzSDnQSBSUS7fMya24lx5A==
X-CSE-MsgGUID: JkoyauCvSseWMYwLjPhICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97286791"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.7])
 ([10.245.244.7])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 02:32:19 -0800
Message-ID: <b04d46fe-b2db-4fd1-96b2-1ab5a8c991ed@intel.com>
Date: Fri, 13 Dec 2024 10:32:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
To: Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241213075724.641859-1-pravalika.gurram@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241213075724.641859-1-pravalika.gurram@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 13/12/2024 07:57, Pravalika Gurram wrote:
> Negative test to check vm_create ioctl returns expected error when
> invalid flags, extensions, reserved  param is used.

Would be good to also do the same for the vm_destroy ioctl. It has pad 
and reserved also which should be zero, plus would be good to also try 
to destroy an invalid vm id.

> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>   tests/intel/xe_vm_create.c | 104 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   2 files changed, 105 insertions(+)
>   create mode 100644 tests/intel/xe_vm_create.c
> 
> diff --git a/tests/intel/xe_vm_create.c b/tests/intel/xe_vm_create.c
> new file mode 100644
> index 000000000..2430e6739
> --- /dev/null
> +++ b/tests/intel/xe_vm_create.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "xe_drm.h"
> +
> +/**
> + * TEST: Negative test for vm create ioctl
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
> + * @xe_vm_create_scrach_fault: xe_vm_create_scrach_fault
> + * @xe_vm_create_scrach_fault_lr:    xe_vm_create_scrach_fault_lr
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
> +}
> +
> +/**
> + * SUBTEST: invalid-extensions
> + * Description: Check query with invalid extensions returns expected error code
> + *
> + * SUBTEST: invalid-reserved
> + * Description: Check query with invalid reserved value returns expected error code
> + */
> +
> +static void inavlid_extensions(int fd)
> +{
> +	struct drm_xe_vm_create create = {
> +		.extensions = -1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
> +
> +}
> +
> +static void inavlid_reserved(int fd)
> +{
> +	struct drm_xe_vm_create create = {
> +		.reserved[0] = 0xffff,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
> +
> +}
> +
> +igt_main
> +{
> +	int fd;
> +
> +	const struct section {
> +		const char *name;
> +		__u32 flags;
> +	} vm_create_flags_fail_functions[] = {
> +		{ "xe_vm_create_fault", DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> +		{ "xe_vm_create_scrach_fault",
> +			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> +			DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> +		{ "xe_vm_create_scrach_fault_lr",
> +			~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> +			DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
> +		{ }
> +	};
> +
> +	igt_fixture
> +		fd = drm_open_driver(DRIVER_XE);
> +
> +	for (const struct section *s = vm_create_flags_fail_functions; s->name; s++) {
> +		igt_subtest_f("invalid-flag-%s", s->name)
> +			invalid_flag(fd, s->flags);
> +	}
> +
> +	igt_subtest("invalid-extensions")
> +			inavlid_extensions(fd);
> +
> +	igt_subtest("invalid-reserved")
> +			inavlid_reserved(fd);
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a..fb9fc75d8 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -321,6 +321,7 @@ intel_xe_progs = [
>   	'xe_sysfs_scheduler',
>           'xe_sysfs_timeslice_duration',
>           'xe_tlb',
> +        'xe_vm_create',
>   ]
>   
>   intel_xe_eudebug_progs = [

