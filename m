Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7B8C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 10:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1884E10E0EE;
	Wed,  9 Apr 2025 10:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZ+cEEiN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5C610E0EE
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 10:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744196065; x=1775732065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p3WnyWDQONoczZ4C6RApjY6KDNo0XumoEStYY/D0k+E=;
 b=DZ+cEEiNg6Lwl6JdzRMLZcUdiQ9dqKrt0fYBB7w4hUKn2X0jfN/7ntPu
 /7wjkmed+YhkT7HrgfXhY046F7tLnFolL58TpU/sz+mTozojW8x9SVdqY
 VSXdl4K5o8ow+eHy3XkRwblOzkj09gC9ZtZA6p4f/BHeIqG8jJfx2uXkG
 I4XSkw3m3uq17eXo7BLKIE+zVae927MwP2uucETR0Dfp0Zu45pTzLvXw5
 yEd23qq3b1AGeubYWv28429vKiTRKvcwxzNDNzf+JKA23OSnfx53LREOy
 xn8LcEfApEi0IQueMn4WYEPZEwJKhLhwkV70M94+6Pah4dcG/HOsOKks+ g==;
X-CSE-ConnectionGUID: f+ZCLsNOSvOMw7Vw79SqaQ==
X-CSE-MsgGUID: dwPUYEfiSPeBCyuyEhPsTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63205497"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="63205497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 03:54:25 -0700
X-CSE-ConnectionGUID: +LcWLi1HSP+y+6bvxfQbFw==
X-CSE-MsgGUID: thHX2ZelS76P9cdSfeQFuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="133263996"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:54:23 -0700
Date: Wed, 9 Apr 2025 12:54:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v7 1/4] lib/ioctl_wrappers: let the caller handle
 capability check result
Message-ID: <20250409105420.c3m6n2z24ljbvhc6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250408223604.289309-1-andrealmeid@igalia.com>
 <20250408223604.289309-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408223604.289309-2-andrealmeid@igalia.com>
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
On 2025-04-08 at 19:36:01 -0300, André Almeida wrote:
> Rework igt_has_drm_cap to just check if a DRM capability is supported
> and let the called decide what to do from this check. It prevents the
> test fails because of an assert done when it's called in
> igt_subtest_with_dynamics.

Sorry, just noticed I missed one more nit in documentation.

> 
> Co-Developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/ioctl_wrappers.c    | 17 ++++++++++++-----
>  lib/ioctl_wrappers.h    |  2 +-
>  tests/kms_async_flips.c | 13 +++++++++----
>  3 files changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 146973f0d..26748450e 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -1288,14 +1288,21 @@ int __kms_addfb(int fd, uint32_t handle,
>   * This helper verifies if the passed capability is
>   * supported by the kernel
>   *
> - * Returns: Whether the capability is supported or not.
> + * Returns: negative value if error (bad fd, cap does not exist), 0 if cap is

Remove 'bad fd, ' from here as you assert on it.

Regards,
Kamil

> + * not supported, 1 if cap is supported.
>   */
> -bool igt_has_drm_cap(int fd, uint64_t capability)
> +int igt_has_drm_cap(int fd, uint64_t capability)
>  {
> -	struct drm_get_cap cap = { .capability = capability };
> +	uint64_t value = 0;
> +	int ret;
> +
> +	ret = drmGetCap(fd, capability, &value);
> +	if (ret) {
> +		igt_assert_neq(errno, EBADF);
> +		return -errno;
> +	}
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
> index da426f753..63598bd95 100644
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
> +	igt_require_f(ret >= 0, "Monotonic timestamps cap doesn't exist in this kernel\n");
> +	igt_require_f(ret == 1, "Monotonic timestamps not supported\n");
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
> +		igt_require_f(ret >= 0, "Async flip cap doesn't exist in this kernel\n");
> +		igt_require_f(ret == 1, "Async Flip is not supported\n");
>  
>  		if (is_intel_device(data.drm_fd))
>  			data.bops = buf_ops_create(data.drm_fd);
> -- 
> 2.49.0
> 
