Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69BFCD4840
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 16:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534B010E81D;
	Mon, 11 May 2026 16:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mWLCji0B";
	dkim-atps=neutral
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A409E10E843
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 16:42:38 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-2bdcf5970cdso3259271eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 09:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778517758; x=1779122558; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=udBI1UXox2CosKx6vTt4Xb0VETQi855f1COWKxCVJ3Y=;
 b=mWLCji0B4e66rPQb33A36tcklAg7/jxysfjI9qHnOTOf2hlrxHpxw38hg/U/A92038
 N42olfg8IC4B0H96UYGdMJB9fOYblwxKvcz9flyT85mpQrpIuyw4IHi9OD1hH4K4MjlP
 6/Ar4KPC0AC4r88IbAy3wJKV5quhvPh7M1XMmVWYdr3nHIz2rRRQEKGHmt/VQFo6QWKG
 MSrv9myhxJZIfrwpqYhtLVBXnZpBP2vrNYuG/Ra++pt6Ofdurmhl2Eff1ielL+MeDdZ2
 kdoI343VphLhgwM+OScq/mdF5N5xH6HFNXmauo+GBpwP4sxTLdYOMhd7giwWEdXQJ5Bk
 rKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778517758; x=1779122558;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=udBI1UXox2CosKx6vTt4Xb0VETQi855f1COWKxCVJ3Y=;
 b=izLFYuQa4/FDTNvuXu/B2z0HymimAzHsk411SzHjVXLrBKCnzBL803M7yvPYTr1x4w
 +C16d4Oa5RhvSN/3HMCPpFfyvDPM5yNYWXGPgeJUfKUJlGBHaKCyEcN9c6YYy6ISm4fS
 sOkxMYPQbvb+2ncVDZEVLdPHyK2RIgktx6ue+24KgfaS7Z5Wna1aJGURGvI5Zbf7+8yr
 SoXsrT9+2NqO/e56N00YJgmpFtiBpfzH7cEUcFkEAhMUfr6S0dS7g6jf8x2nbSn6SFxc
 nl7+FUzsKRuy21J2Y8CoRDFMz5SSBwZ4eFej1Aq8PkIQ0pbR2xGgdf+7PW9/jg7+bUO1
 Cwvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+8u3RKqfNXYqRaw3mDEQGMMb9W0WKVlfpYhnC9ezpMaq5UYOo2Gp1OQMcsF3qMh185fgyZikG0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx50vDtE2XOY5ww8fHjtNhw7z3kYA/nG/9ztx+DRcC1z8F5/lm6
 lhkdj+LpzFU2/LK79YOqXmCGLYVpRDtCRkTx+Io9Ga/pSfv31gPvFrXv0zvQneKh
X-Gm-Gg: Acq92OEnGb8hX+WDHtv2zzNxG8TUahmmfLKiNAcycBisTRHntSB9TtlGbc9A+XC2bXF
 pMz0QqncH63NtxISgN+coJkkjvCU7ocAG3HLlc84UKArUqsaGXY3Srg4JCPiSKje8TbXFUv/43E
 ml4EkYnSbrWrXEwk3cxSDwW7fkjXXl+ELbsf+H0C+HDJTIUlTAMjTGC3ABQgRin0l87zeNSnNyh
 /hi0Oww/aVd9ieT0343Jy4W6qnGmm9tqsr2kR1Whk2l8x4bLnapZnNNZnxvVnbQn9wNZCWcQqn8
 NHCq7wk/MOQwNd1k0812as4K4XyJIG8LVqFqUzma+8GpzX382ab8Te+2pemoJF3wisVOxdR3h3F
 bxb4Kit4cI5bDSAzETKjJeJpb5MqoSqa4k4YTC9B8eYEMF/K03KzEQKLTmLyN9FsIHXmOt6fCAt
 T9YQoYojiZ7818tPB7RKTIPNZCvLC02lDtlBruuEnIRWKBDdy4j0e7AJsd9lfHPcvARrHvIOc9f
 GhU
X-Received: by 2002:a05:7301:4591:b0:2ed:e16:6b39 with SMTP id
 5a478bee46e88-2ff946e0259mr148523eec.17.1778517757549; 
 Mon, 11 May 2026 09:42:37 -0700 (PDT)
Received: from [192.55.54.45] ([192.55.54.45])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2f8859eb034sm14179919eec.5.2026.05.11.09.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 09:42:37 -0700 (PDT)
Message-ID: <d28c8296-e773-4ba3-8d5a-b56433690ab0@gmail.com>
Date: Mon, 11 May 2026 19:42:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_plane: Restructure
 planar-pixel-format-settings test and make it Intel only
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
 <20260424171123.3963793-2-juhapekka.heikkila@gmail.com>
 <1571e8c4-35a2-421f-aba0-159234c51bec@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <1571e8c4-35a2-421f-aba0-159234c51bec@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 11/05/2026 17.14, Naladala, Ramanaidu wrote:
> Hi JP,
> 
> On 4/24/2026 10:41 PM, Juha-Pekka Heikkila wrote:
>> Separate different planar pixel format tests onto their own dynamic subtests
>> to make it easier for debugging. All tests here are only testing Intel
>> hw related restrictions hence it make zero sense to run this on vkms or
>> other drivers. I added back the original limitation to make these Intel only.
> observe the commit message styling issue
> WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line.

This has not been enforced on igt, see for example your own last 
committed patch. fwiw I've set my margin at 80 chars.

>> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
>> ---
>>   tests/kms_plane.c | 322 ++++++++++++++++++++++++++--------------------
>>   1 file changed, 186 insertions(+), 136 deletions(-)
>>
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index 7962c733a..6c08f1de8 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -41,8 +41,25 @@
>>   #include "xe/xe_query.h"
>>   
>>   /**
>> - * SUBTEST: planar-pixel-format-settings
>> - * Description: verify planar settings for pixel format are handled correctly
>> + * SUBTEST: planar-pixel-format-settings@nv12-odd-width
>> + * Description: Verify odd-width (257px) NV12 framebuffer is rejected by the
>> + *              kernel on Intel hardware (display ver < 20 expects -EINVAL).
>> + * Driver requirement: i915, xe
>> + *
>> + * SUBTEST: planar-pixel-format-settings@nv12-odd-height
>> + * Description: Verify odd-height (257px) NV12 framebuffer is rejected by the
>> + *              kernel on Intel hardware (display ver < 20 or >= 35 expects -EINVAL).
>> + * Driver requirement: i915, xe
>> + *
>> + * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
>> + * Description: Verify odd horizontal pan on NV12 framebuffer is rejected by
>> + *              the kernel on Intel hardware (display ver< 35 expects -EINVAL). + * Driver requirement: i915, xe + * + * 
>> SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan + * 
>> Description: Verify odd vertical pan on P016 framebuffer and check CRC 
>> + * matches a reference XRGB8888 blue fill on Intel hardware. + * 
>> Driver requirement: i915, xe * * SUBTEST: plane-position-%s * 
>> Description: Verify plane position using two planes to create a 
>> %arg[1] @@ -1354,165 +1371,197 @@ test_pixel_formats(data_t *data, 
>> igt_crtc_t *crtc) igt_remove_fb(data->drm_fd, &primary_fb);
>>   }
>>   
>> -static void test_planar_settings(data_t *data)
>> +static igt_plane_t *
>> +planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>>   {
>> -	igt_display_t *display = &data->display;
>> -	igt_crtc_t *crtc;
>> -	igt_output_t *output;
>> -	igt_fb_t fb, fb_ref;
>> -	igt_plane_t *primary;
>> -	igt_crc_t crc, crc_ref;
>> -	int devid;
>> -	int display_ver = -1;
>> +	igt_display_reset(&data->display);
>> +	igt_output_set_crtc(output, crtc);
>> +	igt_display_commit_atomic(&data->display,
>> +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +	return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +}
>> +
>> +static void
>> +test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>> +		    int display_ver)
>> +{
>> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
>> +	igt_fb_t fb;
>> +	int expected_rval = display_ver >= 20 ? 0 : -EINVAL;
>>   	int rval;
>> -	bool is_vkms = false;
>>   
>> -	/*
>> -	 * If here is added non-intel tests below require will need to be
>> -	 * changed to if(..)
>> -	 */
>> -	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
>> -	if (is_intel_device(data->drm_fd)) {
>> -		igt_require_intel(data->drm_fd);
>> -		devid = intel_get_drm_devid(data->drm_fd);
>> -		igt_require(intel_display_ver(devid) >= 9);
>> -		display_ver = intel_display_ver(devid);
>> -		igt_require(display_ver >= 9);
>> -	} else if (is_vkms_device(data->drm_fd)) {
>> -		is_vkms = true;
>> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> +				      DRM_FORMAT_MOD_LINEAR)) {
>> +		igt_debug("Odd width NV12 test skipped - format/mod not supported\n");
>> +		return;
>>   	}
>>   
>> -	crtc = igt_first_crtc_with_single_output(display, &output);
>> +	igt_create_fb(data->drm_fd, 257, 256,
>> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> +	igt_plane_set_fb(primary, &fb);
>> +	rval = igt_display_try_commit_atomic(&data->display,
>> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
>> +					     DRM_MODE_ATOMIC_TEST_ONLY,
>> +					     NULL);
>> +	igt_plane_set_fb(primary, NULL);
>> +	igt_remove_fb(data->drm_fd, &fb);
>> +	igt_assert_f(rval == expected_rval,
>> +		     "Odd width NV12 framebuffer: got %d, expected %d\n",
>> +		     rval, expected_rval);
>> +}
>>   
>> -	igt_output_set_crtc(output, crtc);
>> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +static void
>> +test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>> +		     int display_ver)
>> +{
>> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
>> +	igt_fb_t fb;
>> +	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
>> +	int rval;
>>   
>> -	igt_display_commit_atomic(&data->display,
>> -				  DRM_MODE_ATOMIC_ALLOW_MODESET,
>> -				  NULL);
>> -	/* test against intel_plane_check_src_coordinates() in i915 */
>> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> -				     DRM_FORMAT_MOD_LINEAR)) {
>> -		int expected_rval = -EINVAL;
>> -
>> -		if (display_ver >= 20 || is_vkms)
>> -			expected_rval = 0;
>> -
>> -		igt_create_fb(data->drm_fd, 257, 256,
>> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> -		igt_plane_set_fb(primary, &fb);
>> -		rval = igt_display_try_commit_atomic(&data->display,
>> -						     DRM_MODE_ATOMIC_ALLOW_MODESET |
>> -						     DRM_MODE_ATOMIC_TEST_ONLY,
>> -						     NULL);
>> -		igt_remove_fb(data->drm_fd, &fb);
>> -		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
>> -	} else {
>> -		igt_debug("Odd width NV12 framebuffer test skipped\n");
>> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> +				      DRM_FORMAT_MOD_LINEAR)) {
>> +		igt_debug("Odd height NV12 test skipped - format/mod not supported\n");
>> +		return;
>> +	}
>> +
>> +	igt_create_fb(data->drm_fd, 256, 257,
>> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> +	igt_plane_set_fb(primary, &fb);
>> +	rval = igt_display_try_commit_atomic(&data->display,
>> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
>> +					     DRM_MODE_ATOMIC_TEST_ONLY,
>> +					     NULL);
>> +	igt_plane_set_fb(primary, NULL);
>> +	igt_remove_fb(data->drm_fd, &fb);
>> +	igt_assert_f(rval == expected_rval,
>> +		     "Odd height NV12 framebuffer: got %d, expected %d\n",
>> +		     rval, expected_rval);
>> +}
>> +
>> +static void
>> +test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
>> +			     igt_output_t *output, int display_ver)
>> +{
>> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
>> +	igt_fb_t fb;
>> +	int expected_rval = display_ver >= 35 ? 0 : -EINVAL;
>> +	int rval;
>> +
>> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> +				      DRM_FORMAT_MOD_LINEAR)) {
>> +		igt_debug("Odd h-pan NV12 test skipped - format/mod not supported\n");
>> +		return;
>>   	}
>>   
>> -	/* test against intel_plane_check_src_coordinates() in i915 */
>> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> -				     DRM_FORMAT_MOD_LINEAR)) {
>> -		int expected_rval = -EINVAL;
>> +	igt_create_fb(data->drm_fd, 810, 590,
>> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> +	igt_plane_set_fb(primary, &fb);
>> +	igt_plane_set_size(primary, 810, 590);
>> +	igt_plane_set_position(primary, -501, 200);
>> +	rval = igt_display_try_commit_atomic(&data->display,
>> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
>> +					     DRM_MODE_ATOMIC_TEST_ONLY,
>> +					     NULL);
>> +	igt_plane_set_fb(primary, NULL);
>> +	igt_remove_fb(data->drm_fd, &fb);
>> +	igt_assert_f(rval == expected_rval,
>> +		     "Odd horizontal pan NV12 framebuffer: got %d, expected %d\n",
>> +		     rval, expected_rval);
>> +}
> Observed some peace of code is repeated multiple times. Move the 
> duplicates into single function.

This is a restructure, not a rewrite. Also if you carefully see the 
repeating patterns, it would reduce test readability if things are 
broken into too small parts.

>>   
>> -		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
>> -			expected_rval = 0;
>> +static void
>> +test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
>> +			   igt_output_t *output, int display_ver)
>> +{
>> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
>> +	igt_fb_t fb, fb_ref;
>> +	igt_crc_t crc, crc_ref;
>> +	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
>> +	int rval;
>>   
>> -		igt_create_fb(data->drm_fd, 256, 257,
>> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> -		igt_plane_set_fb(primary, &fb);
>> -		rval = igt_display_try_commit_atomic(&data->display,
>> -						     DRM_MODE_ATOMIC_ALLOW_MODESET |
>> -						     DRM_MODE_ATOMIC_TEST_ONLY,
>> -						     NULL);
>> -		igt_remove_fb(data->drm_fd, &fb);
>> -		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
>> -	} else {
>> -		igt_debug("Odd height NV12 framebuffer test skipped\n");
>> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
>> +				      DRM_FORMAT_MOD_LINEAR)) {
>> +		igt_debug("Odd v-pan P016 test skipped - format/mod not supported\n");
>> +		return;
>>   	}
>>   
>> -	/* test against intel_plane_check_src_coordinates() in i915 */
>> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> -				     DRM_FORMAT_MOD_LINEAR)) {
>> -		int expected_rval = -EINVAL;
>> +	igt_create_color_fb(data->drm_fd, 256, 260,
>> +			    DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
>> +			    0.0, 0.0, 1.0, &fb);
>>   
>> -		if (display_ver >= 35 || is_vkms)
>> -			expected_rval = 0;
>> +	igt_plane_set_fb(primary, &fb);
>> +	igt_plane_set_position(primary, 1, 1);
>> +	igt_plane_set_size(primary, 256, 256);
>> +	igt_fb_set_position(&fb, primary, 0, 3);
>> +	igt_fb_set_size(&fb, primary, 256, 256);
>> +
>> +	rval = igt_display_try_commit_atomic(&data->display,
>> +					     DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +					     NULL);
>> +	if (rval == 0) {
>> +		set_legacy_lut(data, crtc, LUT_MASK);
>> +		igt_wait_for_vblank_count(crtc, 1);
>> +
>> +		data->pipe_crc = igt_crtc_crc_new(crtc,
>> +						  IGT_PIPE_CRC_SOURCE_AUTO);
>> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>> +
>> +		/* reference: plain blue XRGB8888 of the same visible size */
>> +		igt_create_color_fb(data->drm_fd, 256, 256,
>> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +				    0.0, 0.0, 1.0, &fb_ref);
>> +		igt_plane_set_fb(primary, &fb_ref);
>> +		rval = igt_display_try_commit_atomic(&data->display,
>> +						     DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +						     NULL);
>>   
>> -		igt_create_fb(data->drm_fd, 810, 590,
>> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> -		igt_plane_set_fb(primary, &fb);
>> -		igt_plane_set_size(primary, 810, 590);
>> -		igt_plane_set_position(primary, -501, 200);
>> -		rval = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET |
>> -						     DRM_MODE_ATOMIC_TEST_ONLY, NULL);
>> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>> +		set_legacy_lut(data, crtc, 0xffff);
> Required igt_wait_for_vblank_count(crtc, 1) to restore the LUT and 
> instead of magic number create a macro.

It doesn't make sense to add extra wait here. We're at the end of test.
Changing that magic number here alone would break the usage pattern how 
the same function is used everywhere else in same kms_plane binary.

>> +		igt_pipe_crc_free(data->pipe_crc);
>> +		data->pipe_crc = NULL;
>>   
>> -		igt_remove_fb(data->drm_fd, &fb);
>> -		igt_assert_f(rval == expected_rval, "Odd horizontal pan NV12 framebuffer\n");
>> +		igt_plane_set_fb(primary, NULL);
>> +		igt_remove_fb(data->drm_fd, &fb_ref);
>> +		igt_assert_crc_equal(&crc_ref, &crc);
>>   	} else {
>> -		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
>> +		igt_plane_set_fb(primary, NULL);
>>   	}
>>   
>> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
>> -					    DRM_FORMAT_MOD_LINEAR)) {
>> -		int expected_rval = -EINVAL;
>> +	igt_remove_fb(data->drm_fd, &fb);
>> +	igt_assert_f(rval == expected_rval,
>> +		     "Odd vertical pan P016 framebuffer: got %d, expected %d\n",
>> +		     rval, expected_rval);
>> +}
>>   
>> -		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
>> -			expected_rval = 0;
>> +static void test_planar_settings(data_t *data)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	igt_crtc_t *crtc;
>> +	igt_output_t *output;
>> +	int display_ver;
>>   
>> -		igt_create_color_fb(data->drm_fd, 256, 260,
>> -			      DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
>> -			      0.0, 0.0, 1.0,
>> -			      &fb);
>> +	igt_require(display->is_atomic);
>>   
>> -		igt_plane_set_fb(primary, &fb);
>> -		igt_plane_set_position(primary, 1, 1);
>> -		igt_plane_set_size(primary, 256, 256);
>> +	/* All sub-tests below are Intel-specific. */
>> +	igt_require_intel(data->drm_fd);
>> +	display_ver = intel_display_ver(intel_get_drm_devid(data->drm_fd));
>> +	igt_require(display_ver >= 9);
>>   
>> -		/* set odd v pan and check with crc fb didn't break */
>> -		igt_fb_set_position(&fb, primary, 0, 3);
>> -		igt_fb_set_size(&fb, primary, 256, 256);
>> -		rval = igt_display_try_commit_atomic(&data->display,
>> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
>> -						     NULL);
>> -		if (rval == 0) {
>> -			set_legacy_lut(data,
>> -				       crtc,
>> -				       LUT_MASK);
>> -			igt_wait_for_vblank_count(crtc,
>> -						  1);
>> -			data->pipe_crc = igt_crtc_crc_new(crtc,
>> -							  IGT_PIPE_CRC_SOURCE_AUTO);
>> -			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>> -
>> -			igt_create_color_fb(data->drm_fd, 256, 256,
>> -				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> -				0.0, 0.0, 1.0,
>> -				&fb_ref);
>> -
>> -			igt_plane_set_fb(primary, &fb_ref);
>> -			rval = igt_display_try_commit_atomic(&data->display,
>> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
>> -						     NULL);
>> +	crtc = igt_first_crtc_with_single_output(display, &output);
>> +	igt_require_f(crtc, "No suitable output/crtc pair found\n");
>>   
>> -			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>> -			set_legacy_lut(data,
>> -				       crtc,
>> -				       0xffff);
>> +	igt_dynamic("nv12-odd-width")
>> +		test_nv12_odd_width(data, crtc, output, display_ver);
>>   
>> -			igt_pipe_crc_free(data->pipe_crc);
>> -			data->pipe_crc = NULL;
>> +	igt_dynamic("nv12-odd-height")
>> +		test_nv12_odd_height(data, crtc, output, display_ver);
>>   
>> -			igt_remove_fb(data->drm_fd, &fb_ref);
>> -			igt_assert_crc_equal(&crc_ref, &crc);
>> -		}
>> +	igt_dynamic("nv12-odd-horizontal-pan")
>> +		test_nv12_odd_horizontal_pan(data, crtc, output, display_ver);
>>   
>> -		igt_remove_fb(data->drm_fd, &fb);
>> -		igt_assert_f(rval == expected_rval, "Odd vertical pan P016 framebuffer\n");
>> -	} else {
>> -		igt_debug("Odd vertical pan P016 framebuffer test skipped\n");
>> -	}
>> +	igt_dynamic("p016-odd-vertical-pan")
>> +		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
>>   }
>>   
>>   static bool is_pipe_limit_reached(int count)
>> @@ -1621,8 +1670,9 @@ run_tests_for_pipe_plane(data_t *data)
>>   		run_test(data, dynamic_test_handler);
>>   	}
>>   
>> -	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
>> -	igt_subtest_f("planar-pixel-format-settings")
>> +	igt_describe("verify planar pixel format settings are accepted or rejected correctly"
>> +		     " on Intel hardware");
>> +	igt_subtest_with_dynamic_f("planar-pixel-format-settings")
>>   		test_planar_settings(data);
>>   }
>>   

