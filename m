Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062EFE9538F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 12:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC5910E35C;
	Wed,  4 Feb 2026 12:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6P9fygu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E8810E35C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770208212; x=1801744212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P7wV5RkTfD0RcEIlhRSy/A1iqlsLiuFI2+UsBrMtvBQ=;
 b=c6P9fyguBNNnBQYi1o9QDsK9d588M8NOy1Q0A7aDOdnA94X8xpjwEd6T
 ZYiqPZvpHT2K65ZTSgTeBCh/SCt6RkhSj5tvHepL+QaZ3TgRN52rdbi0V
 592nT3KD3oV3ZDuviTBucqWLbRNtD4cJ52nkMgz8v+cv8t6efDCXST8Bv
 kN1gPjvVmOkU4MajU3CKENaMSL4K8vFyMSeijEeyu6O6qUD5UxLNfAjto
 6cQ0lix5v5uLT40tlcPB6M3rpYpxRstSqgz6/iqjeERxPYEuKYXuhK5y7
 0s4gvElhEab177cyl5h6F/CARmWVNXQ1FszbSEmjwLBRXmkiwazb5v8bh w==;
X-CSE-ConnectionGUID: 3s/lFkOGRBWcpWgR1i3sOQ==
X-CSE-MsgGUID: GnwnC1s9RnqfWxXLFoFBwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71296480"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71296480"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 04:30:11 -0800
X-CSE-ConnectionGUID: PplNEgFhTo6CU0zUX4w92Q==
X-CSE-MsgGUID: yIFZtorURi6LCAxmekxhHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="247745821"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 04:30:10 -0800
Date: Wed, 4 Feb 2026 13:29:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Renjun Wang <renjunw0@foxmail.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane: Allow
 planar-pixel-format-settings to pass on VKMS
Message-ID: <20260204122952.gl5jttuyhdmr2mm4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Renjun Wang <renjunw0@foxmail.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <tencent_009881AF754F22143F3943B76A2645C05A0A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_009881AF754F22143F3943B76A2645C05A0A@qq.com>
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

Hi Renjun,
On 2026-02-01 at 14:11:43 +0800, Renjun Wang wrote:
> Set expected_rval to 0 for planar-pixel-format-settings tests when
> running on VKMS driver. VKMS currently accepts odd width/height for
> NV12, odd horizontal panning for NV12, and odd vertical panning for
> P016 formats.
> 
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> ---
>  tests/kms_plane.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 21d80847c..57adfe199 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1313,11 +1313,9 @@ static void test_planar_settings(data_t *data)
>  	int devid;
>  	int display_ver = -1;
>  	int rval;
> +	bool is_intel = false;
> +	bool is_vkms = false;
>  
> -	/*
> -	 * If here is added non-intel tests below require will need to be
> -	 * changed to if(..)
> -	 */
>  	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
>  	if (is_intel_device(data->drm_fd)) {
>  		igt_require_intel(data->drm_fd);
> @@ -1325,6 +1323,9 @@ static void test_planar_settings(data_t *data)
>  		igt_require(intel_display_ver(devid) >= 9);
>  		display_ver = intel_display_ver(devid);
>  		igt_require(display_ver >= 9);
> +		is_intel = true;
> +	} else if (is_vkms_device(data->drm_fd)) {
> +		is_vkms = true;
>  	}
>  
>  	output = igt_get_single_output_for_pipe(&data->display, pipe);
> @@ -1337,12 +1338,12 @@ static void test_planar_settings(data_t *data)
>  				  DRM_MODE_ATOMIC_ALLOW_MODESET,
>  				  NULL);
>  
> -	/* test against intel_plane_check_src_coordinates() in i915 */

I am not sure if removing this is proper, maybe move it just below
before 'if((is_intel...'
Same concern below, when you remove other i915 comments.

+cc Karthik and Swati
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

> +	/* Test odd width for NV12 format */

Do we need it here, when just below is DRM_FORMAT_NV12?
Or is it 'odd width' that is worth pointing out?
Same concern below.

Overall looks good. Btw Karthik or Swati, please find someone
from KMS team and send this for testing, I will ack it then.

Regards,
Kamil

>  	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>  				     DRM_FORMAT_MOD_LINEAR)) {
>  		int expected_rval = -EINVAL;
>  
> -		if (display_ver >= 20)
> +		if ((is_intel && display_ver >= 20) || is_vkms)
>  			expected_rval = 0;
>  
>  		igt_create_fb(data->drm_fd, 257, 256,
> @@ -1358,12 +1359,12 @@ static void test_planar_settings(data_t *data)
>  		igt_debug("Odd width NV12 framebuffer test skipped\n");
>  	}
>  
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> +	/* Test odd height for NV12 format */
>  	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>  				     DRM_FORMAT_MOD_LINEAR)) {
>  		int expected_rval = -EINVAL;
>  
> -		if (display_ver >= 20 && display_ver < 35)
> +		if ((is_intel && display_ver >= 20 && display_ver < 35) || is_vkms)
>  			expected_rval = 0;
>  
>  		igt_create_fb(data->drm_fd, 256, 257,
> @@ -1378,13 +1379,12 @@ static void test_planar_settings(data_t *data)
>  	} else {
>  		igt_debug("Odd height NV12 framebuffer test skipped\n");
>  	}
> -
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> +	/*Test odd horizontal panning for NV12 format */
>  	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>  				     DRM_FORMAT_MOD_LINEAR)) {
>  		int expected_rval = -EINVAL;
>  
> -		if (display_ver >= 35)
> +		if ((is_intel && display_ver >= 35) || is_vkms)
>  			expected_rval = 0;
>  
>  		igt_create_fb(data->drm_fd, 810, 590,
> @@ -1401,11 +1401,12 @@ static void test_planar_settings(data_t *data)
>  		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
>  	}
>  
> +	/* Test odd vertical panning for P016 format */
>  	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
>  					    DRM_FORMAT_MOD_LINEAR)) {
>  		int expected_rval = -EINVAL;
>  
> -		if (display_ver >= 20 && display_ver < 35)
> +		if ((is_intel && display_ver >= 20 && display_ver < 35) || is_vkms)
>  			expected_rval = 0;
>  
>  		igt_create_color_fb(data->drm_fd, 256, 260,
> -- 
> 2.47.3
> 
