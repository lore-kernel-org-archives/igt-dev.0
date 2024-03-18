Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BF8C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 11:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757ED10F5BD;
	Mon, 18 Mar 2024 11:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZscksLD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA9B10F5BD
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 11:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710762710; x=1742298710;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lFMEjdV8rOXT8+tBrFUeU1rThLOcP9dSKymmp/Pcjks=;
 b=QZscksLDDWk1PObG8HcX31g+tvjEggOszfkG4X7Oo81yEAZwIC9E3LTc
 2syZXPfTF1VJQPCjPnmKKM7rhh9i3EnI3atwBGxqqTnxpE9EdV7dGKUq3
 wysn9a5vfoYZQr558rL3Q1maV3xLNy7L6JmBdYSEVKl/eQbe6U3G4FK8I
 7Mi6GO8YE6VVDt/1dy333tcvwkQiV8HFqj8AKbX/gSKaIcFNyRq1ejKR1
 GbFCsWg492DUYgVXZ10/wkPbKI7vbzHiLGArX0CriaOlczkWFvzQY41fH
 VCrrAn8hFYWp425EyVwFU6BsUx9QijbbRjVDmG0mKdtikdMUE4RqVH69X A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5429814"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5429814"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13392622"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 04:51:48 -0700
Date: Mon, 18 Mar 2024 12:51:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: Re: [PATCH] tests/amdgpu: add fuzzing tests
Message-ID: <20240318115145.aqqbnn5wlbijl54e@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>,
 Jesse Zhang <Jesse.Zhang@amd.com>
References: <20240316023631.420131-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240316023631.420131-1-vitaly.prosyak@amd.com>
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

Hi Vitaly,

On 2024-03-15 at 22:36:31 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Joonkyo Jung was using customized Syzkaller with KAZAN
> enabled to find the bugs in amdgpu and the drm scheduler.
> Those new tests would help to keep the job state machine
> of the drm scheduler and amdgpu in the correct state to
> ensure that the wrong call sequence or invalid parameters
> do not cause a kernel crash.
> 
> The sub-test 'user ptr fuzzing' sends
> DRM_IOCTL_AMDGPU_GEM_USERPTR the invalid address and
> 2 GB allocation size.
> The sub-test 'cs fuzzing' sends DRM_IOCTL_AMDGPU_WAIT_CS
> for several IP types without previously submitted jobs.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
> Cc: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_fuzzing.c | 99 ++++++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build   |  1 +
>  2 files changed, 100 insertions(+)
>  create mode 100644 tests/amdgpu/amd_fuzzing.c
> 
> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
> new file mode 100644
> index 000000000..11a85f46c
> --- /dev/null
> +++ b/tests/amdgpu/amd_fuzzing.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +
> +#include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_gfx.h"
--------------------------- ^

Keep it sorted alphabetically.

> +
> +/*
> + * The bug was found using customized Syzkaller and with Kazan enabled.
> + * It can be triggered by sending a single amdgpu_gem_userptr_ioctl
> + * to the AMDGPU DRM driver on any ASICs with an invalid address and size.
> + * The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
> + * The following test ensures that the found bug is no longer reproducible.
> + */
> +static
> +void amd_gem_userptr_fuzzing(int fd)
> +{
> +	/*
> +	 * use-after-free bug in the AMDGPU DRM driver
> +	 * fix in amdgpu commit 6dbd33a9c8747dbf1d149484509ad667cbdb3059
> +	 * The error dump is available in dmesg only when KAZAN is enabled
> +	 */
> +
> +	struct drm_amdgpu_gem_userptr user_ptr;
> +	int r;
> +
> +	user_ptr.addr = 0xffffffffffff0000;
> +	user_ptr.size = 0x80000000; /*2 Gb*/
> +	user_ptr.flags = 0x7;
> +	r = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_USERPTR, &user_ptr);
> +	igt_info("%s DRM_IOCTL_AMDGPU_GEM_USERPTR ret %d", __func__, r);
> +	igt_assert_neq(r, 0);
> +}
> +
> +/*
> + *  The bug was found using customized Syzkaller and with Kazan enabled.
> + *  The bug can be triggered by sending an amdgpu_cs_wait_ioctl for ip types:
> + *  AMD_IP_VCE, AMD_IP_VCN_ENC, AMD_IP_VCN_JPEG, AMD_IP_VPE
> + *  to the AMDGPU DRM driver on any ASICs with valid context.
> + *  The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
> + *
> + */
> +static
> +void amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_type types[], int size)
> +{
> +	/*
> +	 * null-ptr-deref and the fix in the DRM scheduler
> +	 * The test helps keep the job state machine of the drm scheduler and
> +	 * amdgpu in the correct state to ensure that the wrong call sequence does
> +	 * not cause a crash.
> +	 */
> +
> +	union drm_amdgpu_ctx ctx;
> +	union drm_amdgpu_wait_cs cs_wait;
> +	int r, i;
> +
> +	memset(&ctx, 0, sizeof(union drm_amdgpu_ctx));
> +	ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
> +	r = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
> +	igt_info("%s DRM_IOCTL_AMDGPU_CTX ret %d", __func__, r);
> +
> +	for (i = 0; i < size; i++) {
> +		memset(&cs_wait, 0, sizeof(union drm_amdgpu_wait_cs));
> +		cs_wait.in.handle = 0x0;
> +		cs_wait.in.timeout = 0x2000000000000;
> +		cs_wait.in.ip_type = types[i];
> +		cs_wait.in.ip_instance = 0x0;
> +		cs_wait.in.ring = 0x0;
> +		cs_wait.in.ctx_id = ctx.out.alloc.ctx_id;
> +		r = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_CS, &cs_wait);
> +		igt_info("$s AMDGPU_WAIT_CS ret %d", __func__, r);
> +		igt_assert_eq(r, 0);
> +	}
> +}
> +
> +igt_main
> +{
> +	int fd = -1;
> +	const enum amd_ip_block_type arr_types[] = {
> +			AMD_IP_VCE, AMD_IP_VCN_ENC, AMD_IP_VCN_JPEG, AMD_IP_VPE };
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +		igt_require(fd != -1);
> +	}
> +
> +	igt_describe("Check user ptr fuzzing with huge size and not valid address");
> +	igt_subtest("userptr-fuzzing")
> +		amd_gem_userptr_fuzzing(fd);
> +
> +	igt_describe("Check cs wait fuzzing");
> +	igt_subtest("cs-wait-fuzzing")
> +		amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index a58d18ad3..ce3ba5520 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -12,6 +12,7 @@ if libdrm_amdgpu.found()
>  			  'amd_cs_nop',
>  			  'amd_deadlock',
>  			  'amd_dp_dsc',
> +			  'amd_fuzzing',
-------------------^^

Try to keep it sorted alphabetically.

Regards,
Kamil

>  			  'amd_freesync_video_mode',
>  			  'amd_hotplug',
>  			  'amd_gang_cs' ,
> -- 
> 2.25.1
> 
