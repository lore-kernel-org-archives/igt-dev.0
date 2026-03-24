Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB362E9A74D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC0C10E55F;
	Tue, 24 Mar 2026 09:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UDD9rIOL";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8771410E55F
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:43:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2AEA04E427C4;
 Tue, 24 Mar 2026 09:43:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 007606011D;
 Tue, 24 Mar 2026 09:43:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE369104511C2; Tue, 24 Mar 2026 10:43:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774345408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=423r3FSn0RrbkXA5wq9dnrRJMD8WbBdWhCy2txXUyoI=;
 b=UDD9rIOLJb7f089rDosA+r42wo20Ao7XB8cgUfTG8j5s0eJfn3MOYy2klkJN7xTN6DENws
 Dl7mQ8M6B/B//Fqa2Tvj3MU9y5pHTXW32l7ksL6URGWn2QlbRAbT4iUX55TpnM1ns5M8cL
 Q0NYXiY2GELSm/MutrtzN1fn1WxRTK1K8LusDu74De/cTZK5F5LtGu1f/gcNkgAdar1/J5
 Z66Hl647l7CwS4F3GLs4atruyJbaDkI+vYK3GUjeILp00183lulNhFGQQb1DdeXbSo31Un
 PnoZhYseS4nsSF6IEU8cpCjGEG3Q+P5g6KX0yAVL1BtXlYMS68jJFAyTJzadOg==
Message-ID: <3d23bd04-5f8b-4183-b173-d73196c48e9b@bootlin.com>
Date: Tue, 24 Mar 2026 10:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane: Allow planar-pixel-format-settings
 to pass on VKMS
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Renjun Wang <renjunw0@foxmail.com>, Swati Sharma <swati2.sharma@intel.com>
References: <20260320101606.22163-1-kamil.konieczny@linux.intel.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260320101606.22163-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 3/20/26 11:16, Kamil Konieczny wrote:
> From: Renjun Wang <renjunw0@foxmail.com>
> 
> Enable planar-pixel-format-settings subtests when running on VKMS
> driver. VKMS currently accepts odd width|height for NV12, odd
> horizontal panning for NV12, and odd vertical panning for P016
> format.
> 
> v2: remove is_intel var (Kamil), keep all comments (Swati)
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Does it make sense to rename display_ver to intel_display_ver?

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   tests/kms_plane.c | 35 +++++++++++++++++++++++------------
>   1 file changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index d5bab62bb..7f7e2d9a6 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1365,11 +1365,8 @@ static void test_planar_settings(data_t *data)
>   	int devid;
>   	int display_ver = -1;
>   	int rval;
> +	bool is_vkms = false;
>   
> -	/*
> -	 * If here is added non-intel tests below require will need to be
> -	 * changed to if(..)
> -	 */
>   	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
>   	if (is_intel_device(data->drm_fd)) {
>   		igt_require_intel(data->drm_fd);
> @@ -1377,6 +1374,8 @@ static void test_planar_settings(data_t *data)
>   		igt_require(intel_display_ver(devid) >= 9);
>   		display_ver = intel_display_ver(devid);
>   		igt_require(display_ver >= 9);
> +	} else if (is_vkms_device(data->drm_fd)) {
> +		is_vkms = true;
>   	}
>   
>   	crtc = igt_first_crtc_with_single_output(display, &output);
> @@ -1387,13 +1386,15 @@ static void test_planar_settings(data_t *data)
>   	igt_display_commit_atomic(&data->display,
>   				  DRM_MODE_ATOMIC_ALLOW_MODESET,
>   				  NULL);
> -
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> +	/*
> +	 * Test odd width for NV12 format.
> +	 * For Intel i915/xe test against intel_plane_check_src_coordinates()
> +	 */
>   	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>   				     DRM_FORMAT_MOD_LINEAR)) {
>   		int expected_rval = -EINVAL;
>   
> -		if (display_ver >= 20)
> +		if (display_ver >= 20 || is_vkms)
>   			expected_rval = 0;
>   
>   		igt_create_fb(data->drm_fd, 257, 256,
> @@ -1409,12 +1410,15 @@ static void test_planar_settings(data_t *data)
>   		igt_debug("Odd width NV12 framebuffer test skipped\n");
>   	}
>   
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> +	/*
> +	 * Test odd height for NV12 format.
> +	 * For Intel i915/xe test against intel_plane_check_src_coordinates()
> +	 */
>   	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>   				     DRM_FORMAT_MOD_LINEAR)) {
>   		int expected_rval = -EINVAL;
>   
> -		if (display_ver >= 20 && display_ver < 35)
> +		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
>   			expected_rval = 0;
>   
>   		igt_create_fb(data->drm_fd, 256, 257,
> @@ -1430,12 +1434,15 @@ static void test_planar_settings(data_t *data)
>   		igt_debug("Odd height NV12 framebuffer test skipped\n");
>   	}
>   
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> +	/*
> +	 * Test odd horizontal panning for NV12 format.
> +	 * For Intel i915/xe test against intel_plane_check_src_coordinates()
> +	 */
>   	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>   				     DRM_FORMAT_MOD_LINEAR)) {
>   		int expected_rval = -EINVAL;
>   
> -		if (display_ver >= 35)
> +		if (display_ver >= 35 || is_vkms)
>   			expected_rval = 0;
>   
>   		igt_create_fb(data->drm_fd, 810, 590,
> @@ -1452,11 +1459,15 @@ static void test_planar_settings(data_t *data)
>   		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
>   	}
>   
> +	/*
> +	 * Test odd vertical panning for P016 format.
> +	 * For Intel i915/xe test against intel_plane_check_src_coordinates()
> +	 */
>   	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
>   					    DRM_FORMAT_MOD_LINEAR)) {
>   		int expected_rval = -EINVAL;
>   
> -		if (display_ver >= 20 && display_ver < 35)
> +		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
>   			expected_rval = 0;
>   
>   		igt_create_color_fb(data->drm_fd, 256, 260,

