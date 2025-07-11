Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C269C83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 14:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1414110E292;
	Fri, 11 Jul 2025 14:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvH/fus/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D94010E292
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752244309; x=1783780309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1lt40Pt7p9Nq3oTZAbbtfK7npnRiVU+AcwzcuuhJARM=;
 b=RvH/fus/4VdFtBVhjY56chO4VvXgku1Ejx4HOXia5PpCliLGJe3BMcaM
 t1vtWbJClBT5MaeT8AL5UDkf8C263AiYL39BLxTHestXYggwD6tpvAGCd
 w+ssM66rBqOXXjcqMHkscprQrSiK84c3sodr6w5CFurbyZRMj+0FX31wz
 nVSes/PD2UKT7EUL+z12hAQXMtWo/D5NpowdBfb/fxv6dNAyIYtDmm/7V
 WTBqPCze9mWHnOb9J64Q+7Z2/s7iJ5ZMyJnMAvv6/auyxpvOtLVtWc9uq
 Ro1V7ULgcWMg3ZNKulv/33Vcj7Smr78eTpKGb3kAoIwaoobgz01h4Xmup w==;
X-CSE-ConnectionGUID: VUafEe/QQQOQLGCuDKB9mQ==
X-CSE-MsgGUID: oVeIXt7SQk29FoWTUBWNGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65244292"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="65244292"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 07:31:49 -0700
X-CSE-ConnectionGUID: VX9HFa8ESBKY/FHdf8hozQ==
X-CSE-MsgGUID: HDoorFPNSmG1rPDD5rd6qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="162066685"
Received: from johunt-mobl9.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.78])
 by orviesa005.jf.intel.com with SMTP; 11 Jul 2025 07:31:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Jul 2025 17:31:45 +0300
Date: Fri, 11 Jul 2025 17:31:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Cc: igt-dev@lists.freedesktop.org, khaled.almahallawy@intel.com,
 jeevaka.badrappan@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v2] tools/intel_dp_compliance: Enabling XE driver
 support
Message-ID: <aHEgUdUwMW_xfUWJ@intel.com>
References: <20250711065645.3074530-1-disantkumar.isvarbhai.mistry@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711065645.3074530-1-disantkumar.isvarbhai.mistry@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Jul 11, 2025 at 12:26:45PM +0530, Disantkumar Mistry wrote:
> i915 and XE driver have different api for mapping buffer. Enabling XE driver
> support by selecting XE driver specific map buffer api for XE devices.
> 
> Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
> Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ----
> v2:
>  - Updated commit description
> ---
>  tools/igt_dp_compliance.h   |  1 +
>  tools/intel_dp_compliance.c | 50 ++++++++++++++++++++++++-------------
>  2 files changed, 33 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
> index 226a13662871..89bab0e6b8f8 100644
> --- a/tools/igt_dp_compliance.h
> +++ b/tools/igt_dp_compliance.h
> @@ -33,6 +33,7 @@
>  #else
>  #include <glib.h>
>  #endif
> +#include "xe/xe_ioctl.h"
>  
>  extern int drm_fd;
>  
> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
> index 99196a450b45..60f064442396 100644
> --- a/tools/intel_dp_compliance.c
> +++ b/tools/intel_dp_compliance.c
> @@ -350,6 +350,14 @@ static void dump_info(void)
>  	igt_dump_crtcs_fd(drm_fd);
>  }
>  
> +static void *map_buffer(int fd, uint32_t handle, size_t size)
> +{
> +	if (is_xe_device(fd))
> +		return xe_bo_mmap_ext(fd, handle, size, PROT_READ | PROT_WRITE);
> +	else
> +		return gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
> +}

Can someone please introduce some sanity into lib/ so
that we have a *single* api to do common things?

> +
>  static int setup_framebuffers(struct connector *dp_conn)
>  {
>  
> @@ -361,15 +369,17 @@ static int setup_framebuffers(struct connector *dp_conn)
>  	igt_assert(dp_conn->fb);
>  
>  	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
> -					dp_conn->fb_video_pattern.gem_handle,
> -					0, dp_conn->fb_video_pattern.size,
> -					PROT_READ | PROT_WRITE);
> +	dp_conn->pixmap = map_buffer(drm_fd,
> +				     dp_conn->fb_video_pattern.gem_handle,
> +				     dp_conn->fb_video_pattern.size);
> +
>  	if (dp_conn->pixmap == NULL)
>  		return -1;
>  
> -	gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +	if (is_i915_device(drm_fd))
> +		gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
> +			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +
>  	dp_conn->fb_size = dp_conn->fb_video_pattern.size;
>  
>  	/* After filling the device memory with 0s it needs to be unmapped */
> @@ -391,15 +401,17 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
>  	igt_assert(dp_conn->failsafe_fb);
>  
>  	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
> -						 dp_conn->fb_failsafe_pattern.gem_handle,
> -						 0, dp_conn->fb_failsafe_pattern.size,
> -						 PROT_READ | PROT_WRITE);
> +	dp_conn->failsafe_pixmap = map_buffer(drm_fd,
> +					      dp_conn->fb_failsafe_pattern.gem_handle,
> +					      dp_conn->fb_failsafe_pattern.size);
> +
>  	if (dp_conn->failsafe_pixmap == NULL)
>  		return -1;
>  
> -	gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +	if (is_i915_device(drm_fd))
> +		gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
> +			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +
>  	dp_conn->failsafe_size = dp_conn->fb_failsafe_pattern.size;
>  
>  	/* After filling the device framebuffer the mapped memory needs to be freed */
> @@ -428,15 +440,17 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
>  	igt_assert(dp_conn->test_pattern.fb);
>  
>  	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
> -						     dp_conn->test_pattern.fb_pattern.gem_handle,
> -						     0, dp_conn->test_pattern.fb_pattern.size,
> -						     PROT_READ | PROT_WRITE);
> +
> +	dp_conn->test_pattern.pixmap = map_buffer(drm_fd,
> +						  dp_conn->test_pattern.fb_pattern.gem_handle,
> +						  dp_conn->test_pattern.fb_pattern.size);
> +
>  	if (dp_conn->test_pattern.pixmap == NULL)
>  		return -1;
>  
> -	gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +	if (is_i915_device(drm_fd))
> +		gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
> +			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>  
>  	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
>  
> -- 
> 2.49.0

-- 
Ville Syrjälä
Intel
