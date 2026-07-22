Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800B9C44536
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 14:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F1A10EE04;
	Wed, 22 Jul 2026 14:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a02tNqqG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED33F10E45A
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784730177; x=1816266177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XvjdK7JM4+iN/pLq52HXg+bUONxXU++yV4sSj92CUI4=;
 b=a02tNqqGIe9QexKtGPOM8Vn+xbhMTcsRr32nM/VK1tzAoPMNFR2OnCaZ
 zpxDi4ZdZSQNqkaFAaJWFslWR+Gu1qjZ8kxVCBBsFk7cwRNamvEj60h0p
 c5aiIM/To8Es31ISQt3rviaO3UyPToy/a4EI86o1c9PWLP2XOdas8Hy17
 qCZmedoY5YMvVXmsMsdLdevxTP4V8c9Oky1LqqLsKkD70525cRIRMktXR
 CT88CP+NMJZzNeYCaauu3w5+PdRNm56oNbH/56aQcJwcncG5JrkEu+jLE
 hHW6HxVSa9AHVnNIYl7f1iWaBlAgBMp9sjZMo/WFMiOQ7ikt+vitnzQ3n Q==;
X-CSE-ConnectionGUID: L+vTOwQbQSSIldgmsIRWcQ==
X-CSE-MsgGUID: CNeHckQTQEGHS6OTydmxqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84491459"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="84491459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:22:56 -0700
X-CSE-ConnectionGUID: e+AioWX4SvC13iN0b7Z6OA==
X-CSE-MsgGUID: k4SlGhDZQn6O9DcUkcsA9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="260061584"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 07:22:55 -0700
Date: Wed, 22 Jul 2026 16:22:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH i-g-t v3 07/10] tests/imagination: Add VM_CONTEXT tests
Message-ID: <20260722142252.vqhvxzigrnyizk4q@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-7-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-test-imagination-add-support-v3-7-ce69f9ad330c@imgtec.com>
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

Hi Robert,
On 2026-07-17 at 16:21:39 +0200, Robert Mazur wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Add subtests for VM context create and destroy ioctls,
> including invalid padding and bad handle error paths.
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> ---
>  lib/igt_pvr.c                      | 43 +++++++++++++++++++++
>  lib/igt_pvr.h                      |  3 ++
>  tests/imagination/meson.build      |  1 +
>  tests/imagination/pvr_vm_context.c | 78 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 125 insertions(+)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index 70fc71388..b97349044 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -164,3 +164,46 @@ igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out)
>  
>  	return sdas;
>  }
> +
> +/**
> + * igt_pvr_ioctl_create_vm_context:
> + * @fd: The file descriptor of the DRM device.
> + * @expect_err: Expected error code, or 0 if no error is expected.
> + *
> + * Function to create a VM context.
> + *
> + * Returns: The handle of the created VM context.
> + */
> +uint32_t igt_pvr_ioctl_create_vm_context(int fd, int expect_err)
> +{
> +	struct drm_pvr_ioctl_create_vm_context_args args = {0};
> +
> +	if (expect_err)
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_VM_CONTEXT, &args,
> +			     expect_err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_VM_CONTEXT, &args);
> +
> +	return args.handle;
> +}
> +
> +/**
> + * igt_pvr_ioctl_destroy_vm_context:
> + * @fd: The file descriptor of the DRM device.
> + * @handle: The handle of the VM context to destroy.
> + * @expect_err: Expected error code, or 0 if no error is expected.
> + *
> + * Function to destroy a VM context.
> + */
> +void igt_pvr_ioctl_destroy_vm_context(int fd, uint32_t handle, int expect_err)
> +{
> +	struct drm_pvr_ioctl_destroy_vm_context_args args = {
> +		.handle = handle,
> +	};
> +
> +	if (expect_err)
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args,
> +			     expect_err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args);
> +}
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index 19909480b..871c8a48e 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -21,4 +21,7 @@ igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);
>  struct drm_pvr_static_data_area *
>  igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out);
>  
> +uint32_t igt_pvr_ioctl_create_vm_context(int fd, int expect_err);
> +void igt_pvr_ioctl_destroy_vm_context(int fd, uint32_t handle, int expect_err);
> +
>  #endif /* IGT_PVR_H */
> diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> index fc24d0220..ffacce1fb 100644
> --- a/tests/imagination/meson.build
> +++ b/tests/imagination/meson.build
> @@ -2,6 +2,7 @@ pvr_progs = [ 'pvr_dev_query',
>  	      'pvr_gem',
>  	      'pvr_gpu_info',
>  	      'pvr_heap_info',
> +	      'pvr_vm_context',
>  	    ]
>  
>  pvr_deps = test_deps
> diff --git a/tests/imagination/pvr_vm_context.c b/tests/imagination/pvr_vm_context.c
> new file mode 100644
> index 000000000..84e9d39a3
> --- /dev/null
> +++ b/tests/imagination/pvr_vm_context.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#include <linux/errno.h>

Should be
#include <errno.h>

Rest looks ok.

Regards,
Kamil

> +#include <stddef.h>
> +#include <stdint.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_pvr.h"
> +
> +#include "pvr_drm.h"
> +
> +int igt_main()
> +{
> +	int fd;
> +
> +	igt_fixture()
> +	{
> +		fd = drm_open_driver(DRIVER_POWERVR);
> +	}
> +
> +	igt_describe("Test valid VM context creation and destruction");
> +	igt_subtest("create-and-destroy-vm-ctx")
> +	{
> +		const uint32_t handle = igt_pvr_ioctl_create_vm_context(fd, 0);
> +
> +		igt_pvr_ioctl_destroy_vm_context(fd, handle, 0);
> +	}
> +
> +	igt_describe("Test VM context creation with bad padding");
> +	igt_subtest("create-vm-ctx-bad-padding")
> +	{
> +		struct drm_pvr_ioctl_create_vm_context_args args = {
> +			._padding_4 = 1,
> +		};
> +
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_VM_CONTEXT, &args, EINVAL);
> +	}
> +
> +	igt_describe("Test VM context destruction with bad padding");
> +	igt_subtest("destroy-vm-ctx-bad-padding")
> +	{
> +		struct drm_pvr_ioctl_destroy_vm_context_args args = {
> +			._padding_4 = 1,
> +		};
> +
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args, EINVAL);
> +	}
> +
> +	igt_describe("Test VM context destruction with bad handle");
> +	igt_subtest("destroy-vm-ctx-bad-handle")
> +	{
> +		struct drm_pvr_ioctl_destroy_vm_context_args args = {
> +			.handle = 0xbad6bad6,
> +		};
> +
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args, EINVAL);
> +	}
> +
> +	igt_describe("Test VM context destruction with handle that is not a VM context");
> +	igt_subtest("destroy-vm-ctx-handle-is-not-vm-ctx")
> +	{
> +		size_t size = 4096;
> +		const uint32_t bo_handle = igt_pvr_ioctl_create_bo(fd, &size);
> +		struct drm_pvr_ioctl_destroy_vm_context_args args = {
> +			.handle = bo_handle,
> +		};
> +
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args, EINVAL);
> +		gem_close(fd, bo_handle);
> +	}
> +
> +	igt_fixture()
> +	{
> +		drm_close_driver(fd);
> +	}
> +}
> 
> -- 
> 2.43.0
> 
