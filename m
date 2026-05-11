Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65BECD484E
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 22:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AE510E8E9;
	Mon, 11 May 2026 22:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCOuf5PO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A357E10E8F8
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 21:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778536795; x=1810072795;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=hwhB3WEoCMgIIDeCaaRJV0cL/O82LiXBP0f7s5wkPFY=;
 b=hCOuf5PO7OkYIV+Kk1hhlTGSf8BTbROuAwZqp82ABcLUpd7caghiKAsE
 Z9yQhjNx8So5d//GVQwuNWa+iSCHzQn4S9Df84ENFzgy5wLCOfx5Em1mm
 rwmDzQ7y9ypiQht3rOVgo3prb8Jc+u1wzQ17qH3XjVv20kbvoJh1qa9Aa
 4zuG43cj+OYQA0Y9rwKr3L+vartA2unZkdfCuD9DilNXdDU/2Lv750zze
 qgYvMMHcd2e8Qo+oGRmXkAghvZwiOeJt8WPMhBDT7JA4WdRTdxRxCNMTo
 YJswi6mWjBf4Ksngn5pSVYWS4+NnSnkrbwJaDEXGxRbea7zSfIPeC/1mK A==;
X-CSE-ConnectionGUID: t7lsmZyiQuakQZMDDyeKWQ==
X-CSE-MsgGUID: gRGa03ZETiaxGAJfd7R4SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89741351"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="89741351"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:59:55 -0700
X-CSE-ConnectionGUID: ZwVE7dIFRhipAnwIPMDb6A==
X-CSE-MsgGUID: rM87Z0jZTrik5wijC9DMNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="241930481"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:59:53 -0700
Date: Mon, 11 May 2026 23:59:51 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: igt-dev@lists.freedesktop.org, Vidya Srinivas <vidya.srinivas@intel.com>
Subject: Re: [i-g-t, v2,
 1/2] tests/kms_plane: Restructure planar-pixel-format-settings
 test and make it Intel only
In-Reply-To: <20260506184936.76492-2-juhapekka.heikkila@gmail.com>
Message-ID: <68b6e875-2806-8bf7-7a7e-29b61cf2a316@intel.com>
References: <20260506184936.76492-2-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1517410982-1778536062=:541093"
Content-ID: <ffefc670-a9d1-d8dd-596a-c8feee55ba21@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1517410982-1778536062=:541093
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <6f1cc2fc-52db-09ae-762c-1db3e258fae1@intel.com>

Hi JP,

On Wed, 6 May 2026, Juha-Pekka Heikkila wrote:
> Separate different planar pixel format tests onto their own dynamic subtests
> to make it easier for debugging. All tests here are only testing Intel
> hw related restrictions hence it make zero sense to run this on vkms or

s/make/makes/

> other drivers. I added back the original limitation to make these Intel only.
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
> tests/kms_plane.c | 322 ++++++++++++++++++++++++++--------------------
> 1 file changed, 186 insertions(+), 136 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 7962c733a..6c08f1de8 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -41,8 +41,25 @@
> #include "xe/xe_query.h"
>
> /**
> - * SUBTEST: planar-pixel-format-settings
> - * Description: verify planar settings for pixel format are handled correctly
> + * SUBTEST: planar-pixel-format-settings@nv12-odd-width
> + * Description: Verify odd-width (257px) NV12 framebuffer is rejected by the
> + *              kernel on Intel hardware (display ver < 20 expects -EINVAL).
> + * Driver requirement: i915, xe
> + *
> + * SUBTEST: planar-pixel-format-settings@nv12-odd-height
> + * Description: Verify odd-height (257px) NV12 framebuffer is rejected by the
> + *              kernel on Intel hardware (display ver < 20 or >= 35 expects -EINVAL).
> + * Driver requirement: i915, xe
> + *
> + * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
> + * Description: Verify odd horizontal pan on NV12 framebuffer is rejected by
> + *              the kernel on Intel hardware (display ver < 35 expects -EINVAL).
> + * Driver requirement: i915, xe
> + *
> + * SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan
> + * Description: Verify odd vertical pan on P016 framebuffer and check CRC
> + *              matches a reference XRGB8888 blue fill on Intel hardware.
> + * Driver requirement: i915, xe
>  *
>  * SUBTEST: plane-position-%s
>  * Description: Verify plane position using two planes to create a %arg[1]
> @@ -1354,165 +1371,197 @@ test_pixel_formats(data_t *data, igt_crtc_t *crtc)
> 	igt_remove_fb(data->drm_fd, &primary_fb);
> }
>
> -static void test_planar_settings(data_t *data)
> +static igt_plane_t *
> +planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
> {
> -	igt_display_t *display = &data->display;
> -	igt_crtc_t *crtc;
> -	igt_output_t *output;
> -	igt_fb_t fb, fb_ref;
> -	igt_plane_t *primary;
> -	igt_crc_t crc, crc_ref;
> -	int devid;
> -	int display_ver = -1;
> +	igt_display_reset(&data->display);
> +	igt_output_set_crtc(output, crtc);
> +	igt_display_commit_atomic(&data->display,
> +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +}
> +
> +static void
> +test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> +		    int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb;
> +	int expected_rval = display_ver >= 20 ? 0 : -EINVAL;
> 	int rval;
> -	bool is_vkms = false;
>
> -	/*
> -	 * If here is added non-intel tests below require will need to be
> -	 * changed to if(..)
> -	 */
> -	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
> -	if (is_intel_device(data->drm_fd)) {
> -		igt_require_intel(data->drm_fd);
> -		devid = intel_get_drm_devid(data->drm_fd);
> -		igt_require(intel_display_ver(devid) >= 9);
> -		display_ver = intel_display_ver(devid);
> -		igt_require(display_ver >= 9);
> -	} else if (is_vkms_device(data->drm_fd)) {
> -		is_vkms = true;
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd width NV12 test skipped - format/mod not supported\n");
> +		return;
> 	}
>
> -	crtc = igt_first_crtc_with_single_output(display, &output);
> +	igt_create_fb(data->drm_fd, 257, 256,
> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +					     DRM_MODE_ATOMIC_TEST_ONLY,
> +					     NULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd width NV12 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
>
> -	igt_output_set_crtc(output, crtc);
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +static void
> +test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> +		     int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb;
> +	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
> +	int rval;
>
> -	igt_display_commit_atomic(&data->display,
> -				  DRM_MODE_ATOMIC_ALLOW_MODESET,
> -				  NULL);
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> -				     DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> -
> -		if (display_ver >= 20 || is_vkms)
> -			expected_rval = 0;
> -
> -		igt_create_fb(data->drm_fd, 257, 256,
> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						     DRM_MODE_ATOMIC_TEST_ONLY,
> -						     NULL);
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
> -	} else {
> -		igt_debug("Odd width NV12 framebuffer test skipped\n");
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd height NV12 test skipped - format/mod not supported\n");
> +		return;
> +	}
> +
> +	igt_create_fb(data->drm_fd, 256, 257,
> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +					     DRM_MODE_ATOMIC_TEST_ONLY,
> +					     NULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd height NV12 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
> +
> +static void
> +test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
> +			     igt_output_t *output, int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb;
> +	int expected_rval = display_ver >= 35 ? 0 : -EINVAL;
> +	int rval;
> +
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd h-pan NV12 test skipped - format/mod not supported\n");
> +		return;
> 	}
>
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> -				     DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> +	igt_create_fb(data->drm_fd, 810, 590,
> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_plane_set_size(primary, 810, 590);
> +	igt_plane_set_position(primary, -501, 200);
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +					     DRM_MODE_ATOMIC_TEST_ONLY,
> +					     NULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd horizontal pan NV12 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
>
> -		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
> -			expected_rval = 0;
> +static void
> +test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
> +			   igt_output_t *output, int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb, fb_ref;
> +	igt_crc_t crc, crc_ref;
> +	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
> +	int rval;
>
> -		igt_create_fb(data->drm_fd, 256, 257,
> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						     DRM_MODE_ATOMIC_TEST_ONLY,
> -						     NULL);
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
> -	} else {
> -		igt_debug("Odd height NV12 framebuffer test skipped\n");
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd v-pan P016 test skipped - format/mod not supported\n");
> +		return;
> 	}
>
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> -				     DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> +	igt_create_color_fb(data->drm_fd, 256, 260,

[...]

> +			    DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, &fb);
>
> -		if (display_ver >= 35 || is_vkms)
> -			expected_rval = 0;
> +	igt_plane_set_fb(primary, &fb);
> +	igt_plane_set_position(primary, 1, 1);
> +	igt_plane_set_size(primary, 256, 256);
> +	igt_fb_set_position(&fb, primary, 0, 3);
> +	igt_fb_set_size(&fb, primary, 256, 256);

I get it's a restructure, but is it okay that we created 256x260
framebuffer and here we are setting it's size to 256x256?

If I am missing something and the comment doesn't really apply:

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

> +
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					     NULL);
> +	if (rval == 0) {
> +		set_legacy_lut(data, crtc, LUT_MASK);
> +		igt_wait_for_vblank_count(crtc, 1);
> +
> +		data->pipe_crc = igt_crtc_crc_new(crtc,
> +						  IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> +
> +		/* reference: plain blue XRGB8888 of the same visible size */
> +		igt_create_color_fb(data->drm_fd, 256, 256,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 0.0, 1.0, &fb_ref);
> +		igt_plane_set_fb(primary, &fb_ref);
> +		rval = igt_display_try_commit_atomic(&data->display,
> +						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						     NULL);
>
> -		igt_create_fb(data->drm_fd, 810, 590,
> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		igt_plane_set_size(primary, 810, 590);
> -		igt_plane_set_position(primary, -501, 200);
> -		rval = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						     DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> +		set_legacy_lut(data, crtc, 0xffff);
> +		igt_pipe_crc_free(data->pipe_crc);
> +		data->pipe_crc = NULL;
>
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd horizontal pan NV12 framebuffer\n");
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &fb_ref);
> +		igt_assert_crc_equal(&crc_ref, &crc);
> 	} else {
> -		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
> +		igt_plane_set_fb(primary, NULL);
> 	}
>
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
> -					    DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd vertical pan P016 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
>
> -		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
> -			expected_rval = 0;
> +static void test_planar_settings(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_crtc_t *crtc;
> +	igt_output_t *output;
> +	int display_ver;
>
> -		igt_create_color_fb(data->drm_fd, 256, 260,
> -			      DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
> -			      0.0, 0.0, 1.0,
> -			      &fb);
> +	igt_require(display->is_atomic);
>
> -		igt_plane_set_fb(primary, &fb);
> -		igt_plane_set_position(primary, 1, 1);
> -		igt_plane_set_size(primary, 256, 256);
> +	/* All sub-tests below are Intel-specific. */
> +	igt_require_intel(data->drm_fd);
> +	display_ver = intel_display_ver(intel_get_drm_devid(data->drm_fd));
> +	igt_require(display_ver >= 9);

BTW, now this check looks much easier to read. :)

BR,
Micha³

>
> -		/* set odd v pan and check with crc fb didn't break */
> -		igt_fb_set_position(&fb, primary, 0, 3);
> -		igt_fb_set_size(&fb, primary, 256, 256);
> -		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -						     NULL);
> -		if (rval == 0) {
> -			set_legacy_lut(data,
> -				       crtc,
> -				       LUT_MASK);
> -			igt_wait_for_vblank_count(crtc,
> -						  1);
> -			data->pipe_crc = igt_crtc_crc_new(crtc,
> -							  IGT_PIPE_CRC_SOURCE_AUTO);
> -			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> -
> -			igt_create_color_fb(data->drm_fd, 256, 256,
> -				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -				0.0, 0.0, 1.0,
> -				&fb_ref);
> -
> -			igt_plane_set_fb(primary, &fb_ref);
> -			rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -						     NULL);
> +	crtc = igt_first_crtc_with_single_output(display, &output);
> +	igt_require_f(crtc, "No suitable output/crtc pair found\n");
>
> -			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> -			set_legacy_lut(data,
> -				       crtc,
> -				       0xffff);
> +	igt_dynamic("nv12-odd-width")
> +		test_nv12_odd_width(data, crtc, output, display_ver);
>
> -			igt_pipe_crc_free(data->pipe_crc);
> -			data->pipe_crc = NULL;
> +	igt_dynamic("nv12-odd-height")
> +		test_nv12_odd_height(data, crtc, output, display_ver);
>
> -			igt_remove_fb(data->drm_fd, &fb_ref);
> -			igt_assert_crc_equal(&crc_ref, &crc);
> -		}
> +	igt_dynamic("nv12-odd-horizontal-pan")
> +		test_nv12_odd_horizontal_pan(data, crtc, output, display_ver);
>
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd vertical pan P016 framebuffer\n");
> -	} else {
> -		igt_debug("Odd vertical pan P016 framebuffer test skipped\n");
> -	}
> +	igt_dynamic("p016-odd-vertical-pan")
> +		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
> }
>
> static bool is_pipe_limit_reached(int count)
> @@ -1621,8 +1670,9 @@ run_tests_for_pipe_plane(data_t *data)
> 		run_test(data, dynamic_test_handler);
> 	}
>
> -	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
> -	igt_subtest_f("planar-pixel-format-settings")
> +	igt_describe("verify planar pixel format settings are accepted or rejected correctly"
> +		     " on Intel hardware");
> +	igt_subtest_with_dynamic_f("planar-pixel-format-settings")
> 		test_planar_settings(data);
> }
>
>
--8323329-1517410982-1778536062=:541093--
