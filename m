Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D91C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 11:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6180C10E0C5;
	Thu, 10 Jul 2025 11:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERqgRcXu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA3B10E0C5
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752146765; x=1783682765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Nzx2hsfB39Xxuv08EqABFUoQC/aGGjQ6+77EgULLMD0=;
 b=ERqgRcXuUXfN0oiVnWM7Zezy9Fka7FI+5IoE5wqCOo40yQK+iRqFXtWa
 DJ3jDL8CXMVG5gMj7R9f/nlQfX9eTOd9gLa7bi14GA+ax5ic0FkwCs6eZ
 tuGV1bn++psB8yQLNhUrYS+QM+4qUj6VHs3DnPUjk+i6T6vPJmYpyDn1O
 yfY9rBV8jr4dHsYTC7le4dkwT1HX64raE2MGhhE0i8yVb1W7/gzHu5+IP
 H8Cp79pfU2j91jnTzgChQfHCpRpqU/KCUrYXv/uoJUODRW7Ox3O16iREt
 cN4tC1F4aPBabZHZsHrclOe4TgwnrQmQzDnAkrdvahAMG2FZtfIl/Ao0k Q==;
X-CSE-ConnectionGUID: yblApeXBSjmbq7TbfmaeRg==
X-CSE-MsgGUID: wj9xPiSmQiuAxIi3P4lGoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65124566"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65124566"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 04:26:04 -0700
X-CSE-ConnectionGUID: OLMm5rbLQEC+fn5INBl95g==
X-CSE-MsgGUID: fRbWx4KCRR27NNznk+hrJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156599160"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 04:26:03 -0700
Date: Thu, 10 Jul 2025 13:25:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Cc: igt-dev@lists.freedesktop.org, khaled.almahallawy@intel.com,
 jeevaka.badrappan@intel.com
Subject: Re: [PATCH i-g-t] tools/intel_dp_compliance: Enabling XE driver
 support
Message-ID: <20250710112546.njxmvchpmsb5aes2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>,
 igt-dev@lists.freedesktop.org, khaled.almahallawy@intel.com,
 jeevaka.badrappan@intel.com
References: <20250709050744.3050283-1-disantkumar.isvarbhai.mistry@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709050744.3050283-1-disantkumar.isvarbhai.mistry@intel.com>
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

Hi Disantkumar,
On 2025-07-09 at 10:37:44 +0530, Disantkumar Mistry wrote:
> i915 and XE driver has different api for mapping buffer. Enabling XE driver

s/driver has/drivers have/

> support by selecting XE driver specific map buffer api for XE devices.
> 
> Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
> ----
> v2:
>  - Updated commit description
> ---
>  tools/igt_dp_compliance.h   |  1 +
>  tools/intel_dp_compliance.c | 43 +++++++++++++++++++++++++------------
>  2 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
> index 226a13662871..b4357ca55733 100644
> --- a/tools/igt_dp_compliance.h
> +++ b/tools/igt_dp_compliance.h
> @@ -33,6 +33,7 @@
>  #else
>  #include <glib.h>
>  #endif
> +#include <xe/xe_ioctl.h>

This is igt lib so here:

#include "xe/xe_ioctl.h"

>  
>  extern int drm_fd;
>  
> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
> index 99196a450b45..2b2ffd402dc6 100644
> --- a/tools/intel_dp_compliance.c
> +++ b/tools/intel_dp_compliance.c
> @@ -349,7 +349,14 @@ static void dump_info(void)
>  	igt_dump_connectors_fd(drm_fd);
>  	igt_dump_crtcs_fd(drm_fd);
>  }
> -

Keep this empty line.

> +static void *map_buffer(int fd, uint32_t handle, size_t size)
> +{
> +	if (is_xe_device(fd))
> +		return xe_bo_mmap_ext(fd, handle, size, PROT_READ | PROT_WRITE);
> +	else
> +		return gem_mmap__device_coherent(fd, handle, 0, size,
> +				PROT_READ | PROT_WRITE);

Align or use one-liner code.

> +}

Add newline here.

>  static int setup_framebuffers(struct connector *dp_conn)
>  {
>  
> @@ -361,15 +368,19 @@ static int setup_framebuffers(struct connector *dp_conn)
>  	igt_assert(dp_conn->fb);
>  
>  	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
> +
> +	dp_conn->pixmap = map_buffer(drm_fd,
>  					dp_conn->fb_video_pattern.gem_handle,
> -					0, dp_conn->fb_video_pattern.size,
> -					PROT_READ | PROT_WRITE);
> +					dp_conn->fb_video_pattern.size);
> +

While you changing this, align it. Use checkpatch.pl with options
from CONTRIBUTING.md

>  	if (dp_conn->pixmap == NULL)
>  		return -1;
>  
> -	gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
> +
> +	if (is_i915_device(drm_fd))
> +		gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
>  		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);

Align.

> +
>  	dp_conn->fb_size = dp_conn->fb_video_pattern.size;
>  
>  	/* After filling the device memory with 0s it needs to be unmapped */
> @@ -391,15 +402,17 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
>  	igt_assert(dp_conn->failsafe_fb);
>  
>  	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
> +	dp_conn->failsafe_pixmap = map_buffer(drm_fd,
>  						 dp_conn->fb_failsafe_pattern.gem_handle,

Align.

> -						 0, dp_conn->fb_failsafe_pattern.size,
> -						 PROT_READ | PROT_WRITE);
> +						 dp_conn->fb_failsafe_pattern.size);

Align.

> +
>  	if (dp_conn->failsafe_pixmap == NULL)
>  		return -1;
>  
> -	gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +
> +	if (is_i915_device(drm_fd))
> +		gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
> +	       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);

Align and add newline.

>  	dp_conn->failsafe_size = dp_conn->fb_failsafe_pattern.size;
>  
>  	/* After filling the device framebuffer the mapped memory needs to be freed */
> @@ -428,14 +441,16 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
>  	igt_assert(dp_conn->test_pattern.fb);
>  
>  	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
> +
> +	dp_conn->test_pattern.pixmap = map_buffer(drm_fd,
>  						     dp_conn->test_pattern.fb_pattern.gem_handle,

Align.

> -						     0, dp_conn->test_pattern.fb_pattern.size,
> -						     PROT_READ | PROT_WRITE);
> +						     dp_conn->test_pattern.fb_pattern.size);

Align.

> +
>  	if (dp_conn->test_pattern.pixmap == NULL)
>  		return -1;
>  
> -	gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
> +	if (is_i915_device(drm_fd))
> +		gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
>  		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);

Align.

Regards,
Kamil

>  
>  	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
> -- 
> 2.49.0
> 
