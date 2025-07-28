Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D427C83F26
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 08:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E2310E49A;
	Mon, 28 Jul 2025 08:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igQLmQVM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C9710E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753692100; x=1785228100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=t3S1AAuAXUYrECKfKQDruRHoYwkDgLTz6cj//PhX6FE=;
 b=igQLmQVMqAwMMMbz7EBwYzLSbKnvw3eDnpxDFUzAk1eWZ2WrTyztkI/c
 I3znECSGh4IM+FIVwQ65wDnQNn2uV2til1Ghsc5cwgPG2rLqQbS2oPfYe
 wjnLA4M1fQupmjtDvdGbvFZBcPMxBOXisTyFFvo5TqeOQ3bMfivX68Wtc
 toS2Q/gbw2cVqDhfQjRxHVyqT2XoROPZj+guAtJpvh/4nkDpBN7s1FbsS
 wCpdhEUB/ZNQkpfcuLQ4oEB1ybrMft5+Mh7BAdlbCzW6/3Z0MfUyy8qdQ
 Fnqz1SgiTcNeh79cbdQ3mT8lOHHWo2HriCyzUM3uoUdOB9EV2YQh2Uw7q g==;
X-CSE-ConnectionGUID: d7GHRXnDTeWK7ODIsMiQtA==
X-CSE-MsgGUID: VyRtTJvaR6eP1VwjdgOVqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="67285557"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67285557"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 01:41:40 -0700
X-CSE-ConnectionGUID: O3K8u5iSQKW0xCEOTGkJ9g==
X-CSE-MsgGUID: pipFT1hMRjqnXXxSs8rDZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162414885"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 01:41:38 -0700
Date: Mon, 28 Jul 2025 10:41:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Cc: igt-dev@lists.freedesktop.org, khaled.almahallawy@intel.com,
 jeevaka.badrappan@intel.com, ville.syrjala@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v4] tools/intel_dp_compliance: Enabling XE driver
 support
Message-ID: <20250728084135.lkoy66pywzrbv4dx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>,
 igt-dev@lists.freedesktop.org, khaled.almahallawy@intel.com,
 jeevaka.badrappan@intel.com, ville.syrjala@intel.com,
 swati2.sharma@intel.com
References: <20250724052339.955668-1-disantkumar.isvarbhai.mistry@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724052339.955668-1-disantkumar.isvarbhai.mistry@intel.com>
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
On 2025-07-24 at 10:53:39 +0530, Disantkumar Mistry wrote:
> i915 and XE driver have different api for mapping buffer. Enabling XE
> driver support by using igt_fb_map_buffer function which call mapping
> buffer api based on device type.
> 
> Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
> Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> -----------

Please use only three '-' chars here, like:

---

so later on git will drop these version notes.
This could be done at merge, no need for resend.

Regards,
Kamil

> v2 - Fixed Alignment (Kamil)
> v3 - Utilizing existing lib function igt_fb_map_buffer (Syrjälä)
> v4 - updating version history (Swati)
> -----------
> ---
>  tools/intel_dp_compliance.c | 22 +++-------------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
> index 99196a450b45..31572f6c3ebc 100644
> --- a/tools/intel_dp_compliance.c
> +++ b/tools/intel_dp_compliance.c
> @@ -361,15 +361,10 @@ static int setup_framebuffers(struct connector *dp_conn)
>  	igt_assert(dp_conn->fb);
>  
>  	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
> -					dp_conn->fb_video_pattern.gem_handle,
> -					0, dp_conn->fb_video_pattern.size,
> -					PROT_READ | PROT_WRITE);
> +	dp_conn->pixmap = igt_fb_map_buffer(drm_fd, &dp_conn->fb_video_pattern);
>  	if (dp_conn->pixmap == NULL)
>  		return -1;
>  
> -	gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>  	dp_conn->fb_size = dp_conn->fb_video_pattern.size;
>  
>  	/* After filling the device memory with 0s it needs to be unmapped */
> @@ -391,15 +386,10 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
>  	igt_assert(dp_conn->failsafe_fb);
>  
>  	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
> -						 dp_conn->fb_failsafe_pattern.gem_handle,
> -						 0, dp_conn->fb_failsafe_pattern.size,
> -						 PROT_READ | PROT_WRITE);
> +	dp_conn->failsafe_pixmap = igt_fb_map_buffer(drm_fd, &dp_conn->fb_failsafe_pattern);
>  	if (dp_conn->failsafe_pixmap == NULL)
>  		return -1;
>  
> -	gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>  	dp_conn->failsafe_size = dp_conn->fb_failsafe_pattern.size;
>  
>  	/* After filling the device framebuffer the mapped memory needs to be freed */
> @@ -428,16 +418,10 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
>  	igt_assert(dp_conn->test_pattern.fb);
>  
>  	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
> -						     dp_conn->test_pattern.fb_pattern.gem_handle,
> -						     0, dp_conn->test_pattern.fb_pattern.size,
> -						     PROT_READ | PROT_WRITE);
> +	dp_conn->test_pattern.pixmap = igt_fb_map_buffer(drm_fd, &dp_conn->test_pattern.fb_pattern);
>  	if (dp_conn->test_pattern.pixmap == NULL)
>  		return -1;
>  
> -	gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> -
>  	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
>  
>  	memset(dp_conn->test_pattern.pixmap, 0, dp_conn->test_pattern.size);
> -- 
> 2.49.0
> 
