Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3664C3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 12:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC2910E67A;
	Tue,  8 Apr 2025 12:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/33sFgJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A550310E675
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744114129; x=1775650129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Vivpy8DIzY+u6n809LPg+yMgYNiMayURHad9X9gL680=;
 b=M/33sFgJYfydC6Xc8cQQDI5rZk5hgRTuwg2kbMiYNw1M/zrCH2QrWqwi
 4RSLcAaf7fJMGEQs/J0EFfM06o6A0XwJvEXP3BrY7zzDH9VS0LJR9OBb3
 qhtF4JuBBXlNrCrPFb+moNoZtU/vV4YDpl4yoowiv3pZvagTiVmvGH7lr
 jwuuW2P0bXv4w1tgNkfzy9GQIWpUT1yrB6MJ9L6ssfCk1LB0/C0jz0GfQ
 hy+konrbqG6wCLrIq0PRqTskB0Za3EnuLFBBS4D9+iLWQPnirNgaOrNv9
 kmUQHBXH5CTCIngAvNdC3Qq1D7a7SHZxdzR4voYUBbVBA1vcIimHIGLz/ w==;
X-CSE-ConnectionGUID: fcEvEfUKSkiT+NB8fzeLlQ==
X-CSE-MsgGUID: YQUY68z6THGWrmteo89BOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56180773"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="56180773"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 05:08:48 -0700
X-CSE-ConnectionGUID: J2XnNNtKSPiqCMafrNlnSQ==
X-CSE-MsgGUID: NCGW04peS0S8VvK6Cc3DAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="129107263"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:08:46 -0700
Date: Tue, 8 Apr 2025 14:08:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v6 1/4] lib/ioctl_wrappers: let the caller handle
 capability check result
Message-ID: <20250408120844.3f3jrrab7ejflknh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
 <20250408000221.140459-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408000221.140459-2-andrealmeid@igalia.com>
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

Hi André,
On 2025-04-07 at 21:02:18 -0300, André Almeida wrote:
> From: Melissa Wen <mwen@igalia.com>
> 
> Rework igt_has_drm_cap to just check if a DRM capability is supported
> and let the called decide what to do from this check. It prevents the
> test fails because of an assert done when it's called in
> igt_subtest_with_dynamics.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  lib/ioctl_wrappers.c    | 13 ++++++++-----
>  lib/ioctl_wrappers.h    |  2 +-
>  tests/kms_async_flips.c | 13 +++++++++----
>  3 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 146973f0d..33f593295 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -1288,14 +1288,17 @@ int __kms_addfb(int fd, uint32_t handle,
>   * This helper verifies if the passed capability is
>   * supported by the kernel
>   *
> - * Returns: Whether the capability is supported or not.
> + * Returns: negative value if error, 0 if cap is not supported, 1 if cap is
> + * supported.
>   */
> -bool igt_has_drm_cap(int fd, uint64_t capability)
> +int igt_has_drm_cap(int fd, uint64_t capability)
>  {
> -	struct drm_get_cap cap = { .capability = capability };
> +	uint64_t value = 0;
> +
> +	if (drmGetCap(fd, capability, &value))
> +		return -errno;
>  
> -	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
> -	return cap.value;
> +	return value ? 1 : 0;
>  }
>  
>  /**
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index b7d7c2ad9..7cf05e626 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -144,7 +144,7 @@ void prime_sync_end(int dma_buf_fd, bool write);
>  
>  bool igt_has_fb_modifiers(int fd);
>  void igt_require_fb_modifiers(int fd);
> -bool igt_has_drm_cap(int fd, uint64_t capability);
> +int igt_has_drm_cap(int fd, uint64_t capability);
>  bool igt_has_set_caching(uint32_t devid);
>  
>  /**
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index da426f753..126b96d6b 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -203,8 +203,10 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>  
>  static void require_monotonic_timestamp(int fd)
>  {
> -	igt_require_f(igt_has_drm_cap(fd, DRM_CAP_TIMESTAMP_MONOTONIC),
> -		      "Monotonic timestamps not supported\n");
> +	int ret = igt_has_drm_cap(fd, DRM_CAP_TIMESTAMP_MONOTONIC);
> +
> +	igt_assert(ret >= 0);

Better:
	igt_assert_le(0, ret);

> +	igt_require_f(ret, "Monotonic timestamps not supported\n");
>  }
>  
>  static void test_init(data_t *data)
> @@ -747,13 +749,16 @@ igt_main
>  	int i;
>  
>  	igt_fixture {
> +		int ret;
> +
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_display_require_output(&data.display);
>  
> -		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP),
> -			      "Async Flip is not supported\n");
> +		ret = igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP);
> +		igt_assert(ret >= 0);

Same here:
	igt_assert_le(0, ret);

With this fixed:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +		igt_require_f(ret, "Async Flip is not supported\n");
>  
>  		if (is_intel_device(data.drm_fd))
>  			data.bops = buf_ops_create(data.drm_fd);
> -- 
> 2.49.0
> 
