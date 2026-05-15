Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E069CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 12:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF62510E105;
	Fri, 15 May 2026 12:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GSQzpOFT";
	dkim-atps=neutral
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD57D10E128
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 12:50:36 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-12c1a170a50so12818014c88.0
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778849436; x=1779454236; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RncuURuf1rooxz4pDnJV5FNpnW3h2yPCravzIJKKZRY=;
 b=GSQzpOFTVglnJjrG5Li8dqgnKE1XbvwmDbVsfVQEyeCNtx5Dm+lP0M9KXjQIwasltt
 y0OR9GYPLuPU2risBuyf7aAow64sQdyMZQ8Dgf3f+dDX2ma2fEgU75hLMtWI1xJPoyuJ
 z15R+tinjeKMMXxZoBZUW00vTisA3/Jr0/3MLzwtwv6m5Dl6YgIp8jigG9ZmrFY0fOAI
 SRcfzkrI/0V5cBgzbzXFNjSyknLTTpHTCpAwdBlTE1IEle0FedrSCTU54ZRzrC01Bn3b
 PSxfOIlbAGkIZt3z0+C2uHzJmLH8cZjbpl5QPHiX/ixWpf0BOgvthCQdC8a3V/zNxArI
 YCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778849436; x=1779454236;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RncuURuf1rooxz4pDnJV5FNpnW3h2yPCravzIJKKZRY=;
 b=HW0iDJs1bjDAicn2gLYUoxT0JyTvUzViVgWEU4h2aKWlQE8epujCRTSXazCj6bnpTY
 ezPYob5kT94SL4Z34PJQNoJ9FhGmk0KkXXyagk5vHSDnCwmIm7hGbttV9lWRLfgnYbLp
 6kLbybfllyMSE36w8sJAcDMGT74snHtFjlQcHb9nt/UlSgkT5HeYRuIggnhqweAciKUJ
 suhUHlL0iy6tXUrf8CHWCt7LtoVn1/kOKQpd4BM3+1H8YJs6nnttvwwne6kDCBfrlj+E
 QRGpbibeN5CqV+B00GRW8S9iLW3c3hf3fs+X1pSvl1HJPe+tSyim9AdC+bZmf+BkCHf7
 QTow==
X-Gm-Message-State: AOJu0Yz404IkiRvYySdgRdq2VYJEfiTiwCVbofMo6REOrCwkQtXe7pBd
 DMgSKe10KuqWOxBsr2mr4fG0tkUBGqgwMbjiIXgDKxiQscXyPRBdZAu4
X-Gm-Gg: Acq92OFaRGH5/9oMhFK9r+mKtZF3V0t+YF9PNqiVWupD4bC5rYNftUhnEHt9SD0x/8o
 O8vlSoBShI1D8Kh66DT7clejYz1dG/H8nAGYENLMubkCclrMC6LzI111ccEznDCnh4NLl7cDnEU
 9d7FeZY0ZCfR70RZ2yvP6W8aPpbePatSd6241F3WeS8M0I5VyXcp3ixZNaLbB3/Mr5g/ESI3U/y
 6Hvdj3BAXpa4g/uWJTLiC8BMDCkPE4LciveGbZIFaQrb80UecT5szRvKbqT0CVoDCxJxxdJY78V
 BIA+FqlCENRFuGcb+lsaDqWdJB/FQdEjgKGn/HcUXfwyiPJoqKjdoEfWROZqC3VS7aj5PJ5gPzH
 E87ZuHUmoWfsOubTi8gJiYvCwUu7HCqrNejTCIt1nXTZdYazzGHAUZXBtOtNPh0Ap4J5bUbwGth
 PXp/KSZdxJao7s7kqiYBuJ4jGhBvjaRNsqGvqrHh3kWBqfW663t7RKs368644tUwNcsA==
X-Received: by 2002:a05:7022:251f:b0:133:1d3d:f93e with SMTP id
 a92af1059eb24-13504a4f6bfmr1565054c88.42.1778849435579; 
 Fri, 15 May 2026 05:50:35 -0700 (PDT)
Received: from [192.55.54.45] ([192.55.54.45])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-134cbdcf140sm9701929c88.5.2026.05.15.05.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 05:50:35 -0700 (PDT)
Message-ID: <b2009494-39ab-4769-b310-504be9d957d6@gmail.com>
Date: Fri, 15 May 2026 15:50:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v2,1/2] tests/kms_plane: Restructure
 planar-pixel-format-settings test and make it Intel only
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org, Vidya Srinivas <vidya.srinivas@intel.com>
References: <20260506184936.76492-2-juhapekka.heikkila@gmail.com>
 <68b6e875-2806-8bf7-7a7e-29b61cf2a316@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <68b6e875-2806-8bf7-7a7e-29b61cf2a316@intel.com>
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



On 12/05/2026 00.59, Michał Grzelak wrote:
> Hi JP,
> 
> On Wed, 6 May 2026, Juha-Pekka Heikkila wrote:
>> Separate different planar pixel format tests onto their own dynamic 
>> subtests
>> to make it easier for debugging. All tests here are only testing Intel
>> hw related restrictions hence it make zero sense to run this on vkms or
> 
> s/make/makes/
> 
>> other drivers. I added back the original limitation to make these 
>> Intel only.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
>> ---
>> tests/kms_plane.c | 322 ++++++++++++++++++++++++++--------------------
>> 1 file changed, 186 insertions(+), 136 deletions(-)
>>
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index 7962c733a..6c08f1de8 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -41,8 +41,25 @@
>> #include "xe/xe_query.h"
>>
>> /**
>> - * SUBTEST: planar-pixel-format-settings
>> - * Description: verify planar settings for pixel format are handled 
>> correctly
>> + * SUBTEST: planar-pixel-format-settings@nv12-odd-width
>> + * Description: Verify odd-width (257px) NV12 framebuffer is rejected 
>> by the
>> + *              kernel on Intel hardware (display ver < 20 expects - 
>> EINVAL).
>> + * Driver requirement: i915, xe
>> + *
>> + * SUBTEST: planar-pixel-format-settings@nv12-odd-height
>> + * Description: Verify odd-height (257px) NV12 framebuffer is 
>> rejected by the
>> + *              kernel on Intel hardware (display ver < 20 or >= 35 
>> expects -EINVAL).
>> + * Driver requirement: i915, xe
>> + *
>> + * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
>> + * Description: Verify odd horizontal pan on NV12 framebuffer is 
>> rejected by
>> + *              the kernel on Intel hardware (display ver < 35 
>> expects -EINVAL).
>> + * Driver requirement: i915, xe
>> + *
>> + * SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan
>> + * Description: Verify odd vertical pan on P016 framebuffer and check 
>> CRC
>> + *              matches a reference XRGB8888 blue fill on Intel 
>> hardware.
>> + * Driver requirement: i915, xe
>>  *
>>  * SUBTEST: plane-position-%s
>>  * Description: Verify plane position using two planes to create a 
>> %arg[1]
>> @@ -1354,165 +1371,197 @@ test_pixel_formats(data_t *data, igt_crtc_t 
>> *crtc)
>>     igt_remove_fb(data->drm_fd, &primary_fb);
>> }
>>
>> -static void test_planar_settings(data_t *data)
>> +static igt_plane_t *
>> +planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>> {
>> -    igt_display_t *display = &data->display;
>> -    igt_crtc_t *crtc;
>> -    igt_output_t *output;
>> -    igt_fb_t fb, fb_ref;
>> -    igt_plane_t *primary;
>> -    igt_crc_t crc, crc_ref;
>> -    int devid;
>> -    int display_ver = -1;
>> +    igt_display_reset(&data->display);
>> +    igt_output_set_crtc(output, crtc);
>> +    igt_display_commit_atomic(&data->display,
>> +                  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +    return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +}
>> +
>> +static void
>> +test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t 
>> *output,
>> +            int display_ver)
>> +{
>> +    igt_plane_t *primary = planar_test_setup(data, crtc, output);
>> +    igt_fb_t fb;
>> +    int expected_rval = display_ver >= 20 ? 0 : -EINVAL;
>>     int rval;
>> -    bool is_vkms = false;
>>
>> -    /*
>> -     * If here is added non-intel tests below require will need to be
>> -     * changed to if(..)
>> -     */
>> -    igt_require_f(data->display.is_atomic, "Atomic mode-set not 
>> supported\n");
>> -    if (is_intel_device(data->drm_fd)) {
>> -        igt_require_intel(data->drm_fd);
>> -        devid = intel_get_drm_devid(data->drm_fd);
>> -        igt_require(intel_display_ver(devid) >= 9);
>> -        display_ver = intel_display_ver(devid);
>> -        igt_require(display_ver >= 9);
>> -    } else if (is_vkms_device(data->drm_fd)) {
>> -        is_vkms = true;
>> +    if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> +                      DRM_FORMAT_MOD_LINEAR)) {
>> +        igt_debug("Odd width NV12 test skipped - format/mod not 
>> supported\n");
>> +        return;
>>     }
>>
>> -    crtc = igt_first_crtc_with_single_output(display, &output);
>> +    igt_create_fb(data->drm_fd, 257, 256,
>> +              DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> +    igt_plane_set_fb(primary, &fb);
>> +    rval = igt_display_try_commit_atomic(&data->display,
>> +                         DRM_MODE_ATOMIC_ALLOW_MODESET |
>> +                         DRM_MODE_ATOMIC_TEST_ONLY,
>> +                         NULL);
>> +    igt_plane_set_fb(primary, NULL);
>> +    igt_remove_fb(data->drm_fd, &fb);
>> +    igt_assert_f(rval == expected_rval,
>> +             "Odd width NV12 framebuffer: got %d, expected %d\n",
>> +             rval, expected_rval);
>> +}
>>
>> -    igt_output_set_crtc(output, crtc);
>> -    primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +static void
>> +test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t 
>> *output,
>> +             int display_ver)
>> +{
>> +    igt_plane_t *primary = planar_test_setup(data, crtc, output);
>> +    igt_fb_t fb;
>> +    int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : 
>> -EINVAL;
>> +    int rval;
>>
>> -    igt_display_commit_atomic(&data->display,
>> -                  DRM_MODE_ATOMIC_ALLOW_MODESET,
>> -                  NULL);
>> -    /* test against intel_plane_check_src_coordinates() in i915 */
>> -    if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> -                     DRM_FORMAT_MOD_LINEAR)) {
>> -        int expected_rval = -EINVAL;
>> -
>> -        if (display_ver >= 20 || is_vkms)
>> -            expected_rval = 0;
>> -
>> -        igt_create_fb(data->drm_fd, 257, 256,
>> -                  DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> -        igt_plane_set_fb(primary, &fb);
>> -        rval = igt_display_try_commit_atomic(&data->display,
>> -                             DRM_MODE_ATOMIC_ALLOW_MODESET |
>> -                             DRM_MODE_ATOMIC_TEST_ONLY,
>> -                             NULL);
>> -        igt_remove_fb(data->drm_fd, &fb);
>> -        igt_assert_f(rval == expected_rval, "Odd width NV12 
>> framebuffer\n");
>> -    } else {
>> -        igt_debug("Odd width NV12 framebuffer test skipped\n");
>> +    if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> +                      DRM_FORMAT_MOD_LINEAR)) {
>> +        igt_debug("Odd height NV12 test skipped - format/mod not 
>> supported\n");
>> +        return;
>> +    }
>> +
>> +    igt_create_fb(data->drm_fd, 256, 257,
>> +              DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> +    igt_plane_set_fb(primary, &fb);
>> +    rval = igt_display_try_commit_atomic(&data->display,
>> +                         DRM_MODE_ATOMIC_ALLOW_MODESET |
>> +                         DRM_MODE_ATOMIC_TEST_ONLY,
>> +                         NULL);
>> +    igt_plane_set_fb(primary, NULL);
>> +    igt_remove_fb(data->drm_fd, &fb);
>> +    igt_assert_f(rval == expected_rval,
>> +             "Odd height NV12 framebuffer: got %d, expected %d\n",
>> +             rval, expected_rval);
>> +}
>> +
>> +static void
>> +test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
>> +                 igt_output_t *output, int display_ver)
>> +{
>> +    igt_plane_t *primary = planar_test_setup(data, crtc, output);
>> +    igt_fb_t fb;
>> +    int expected_rval = display_ver >= 35 ? 0 : -EINVAL;
>> +    int rval;
>> +
>> +    if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> +                      DRM_FORMAT_MOD_LINEAR)) {
>> +        igt_debug("Odd h-pan NV12 test skipped - format/mod not 
>> supported\n");
>> +        return;
>>     }
>>
>> -    /* test against intel_plane_check_src_coordinates() in i915 */
>> -    if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> -                     DRM_FORMAT_MOD_LINEAR)) {
>> -        int expected_rval = -EINVAL;
>> +    igt_create_fb(data->drm_fd, 810, 590,
>> +              DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> +    igt_plane_set_fb(primary, &fb);
>> +    igt_plane_set_size(primary, 810, 590);
>> +    igt_plane_set_position(primary, -501, 200);
>> +    rval = igt_display_try_commit_atomic(&data->display,
>> +                         DRM_MODE_ATOMIC_ALLOW_MODESET |
>> +                         DRM_MODE_ATOMIC_TEST_ONLY,
>> +                         NULL);
>> +    igt_plane_set_fb(primary, NULL);
>> +    igt_remove_fb(data->drm_fd, &fb);
>> +    igt_assert_f(rval == expected_rval,
>> +             "Odd horizontal pan NV12 framebuffer: got %d, expected 
>> %d\n",
>> +             rval, expected_rval);
>> +}
>>
>> -        if ((display_ver >= 20 && display_ver < 35) || is_vkms)
>> -            expected_rval = 0;
>> +static void
>> +test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
>> +               igt_output_t *output, int display_ver)
>> +{
>> +    igt_plane_t *primary = planar_test_setup(data, crtc, output);
>> +    igt_fb_t fb, fb_ref;
>> +    igt_crc_t crc, crc_ref;
>> +    int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : 
>> -EINVAL;
>> +    int rval;
>>
>> -        igt_create_fb(data->drm_fd, 256, 257,
>> -                  DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> -        igt_plane_set_fb(primary, &fb);
>> -        rval = igt_display_try_commit_atomic(&data->display,
>> -                             DRM_MODE_ATOMIC_ALLOW_MODESET |
>> -                             DRM_MODE_ATOMIC_TEST_ONLY,
>> -                             NULL);
>> -        igt_remove_fb(data->drm_fd, &fb);
>> -        igt_assert_f(rval == expected_rval, "Odd height NV12 
>> framebuffer\n");
>> -    } else {
>> -        igt_debug("Odd height NV12 framebuffer test skipped\n");
>> +    if (!igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
>> +                      DRM_FORMAT_MOD_LINEAR)) {
>> +        igt_debug("Odd v-pan P016 test skipped - format/mod not 
>> supported\n");
>> +        return;
>>     }
>>
>> -    /* test against intel_plane_check_src_coordinates() in i915 */
>> -    if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> -                     DRM_FORMAT_MOD_LINEAR)) {
>> -        int expected_rval = -EINVAL;
>> +    igt_create_color_fb(data->drm_fd, 256, 260,
> 
> [...]
> 
>> +                DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
>> +                0.0, 0.0, 1.0, &fb);
>>
>> -        if (display_ver >= 35 || is_vkms)
>> -            expected_rval = 0;
>> +    igt_plane_set_fb(primary, &fb);
>> +    igt_plane_set_position(primary, 1, 1);
>> +    igt_plane_set_size(primary, 256, 256);
>> +    igt_fb_set_position(&fb, primary, 0, 3);
>> +    igt_fb_set_size(&fb, primary, 256, 256);
> 
> I get it's a restructure, but is it okay that we created 256x260
> framebuffer and here we are setting it's size to 256x256?

That just set the src size. All these current tests for planar settings 
are playing with src/dst sizes trying to hit specific special cases, and 
on the same timee not hit some undelated issue.

> 
> If I am missing something and the comment doesn't really apply:
> 
> Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
> 
>> +
>> +    rval = igt_display_try_commit_atomic(&data->display,
>> +                         DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +                         NULL);
>> +    if (rval == 0) {
>> +        set_legacy_lut(data, crtc, LUT_MASK);
>> +        igt_wait_for_vblank_count(crtc, 1);
>> +
>> +        data->pipe_crc = igt_crtc_crc_new(crtc,
>> +                          IGT_PIPE_CRC_SOURCE_AUTO);
>> +        igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>> +
>> +        /* reference: plain blue XRGB8888 of the same visible size */
>> +        igt_create_color_fb(data->drm_fd, 256, 256,
>> +                    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +                    0.0, 0.0, 1.0, &fb_ref);
>> +        igt_plane_set_fb(primary, &fb_ref);
>> +        rval = igt_display_try_commit_atomic(&data->display,
>> +                             DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +                             NULL);
>>
>> -        igt_create_fb(data->drm_fd, 810, 590,
>> -                  DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>> -        igt_plane_set_fb(primary, &fb);
>> -        igt_plane_set_size(primary, 810, 590);
>> -        igt_plane_set_position(primary, -501, 200);
>> -        rval = igt_display_try_commit_atomic(&data->display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET |
>> -                             DRM_MODE_ATOMIC_TEST_ONLY, NULL);
>> +        igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>> +        set_legacy_lut(data, crtc, 0xffff);
>> +        igt_pipe_crc_free(data->pipe_crc);
>> +        data->pipe_crc = NULL;
>>
>> -        igt_remove_fb(data->drm_fd, &fb);
>> -        igt_assert_f(rval == expected_rval, "Odd horizontal pan NV12 
>> framebuffer\n");
>> +        igt_plane_set_fb(primary, NULL);
>> +        igt_remove_fb(data->drm_fd, &fb_ref);
>> +        igt_assert_crc_equal(&crc_ref, &crc);
>>     } else {
>> -        igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
>> +        igt_plane_set_fb(primary, NULL);
>>     }
>>
>> -    if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
>> -                        DRM_FORMAT_MOD_LINEAR)) {
>> -        int expected_rval = -EINVAL;
>> +    igt_remove_fb(data->drm_fd, &fb);
>> +    igt_assert_f(rval == expected_rval,
>> +             "Odd vertical pan P016 framebuffer: got %d, expected %d\n",
>> +             rval, expected_rval);
>> +}
>>
>> -        if ((display_ver >= 20 && display_ver < 35) || is_vkms)
>> -            expected_rval = 0;
>> +static void test_planar_settings(data_t *data)
>> +{
>> +    igt_display_t *display = &data->display;
>> +    igt_crtc_t *crtc;
>> +    igt_output_t *output;
>> +    int display_ver;
>>
>> -        igt_create_color_fb(data->drm_fd, 256, 260,
>> -                  DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
>> -                  0.0, 0.0, 1.0,
>> -                  &fb);
>> +    igt_require(display->is_atomic);
>>
>> -        igt_plane_set_fb(primary, &fb);
>> -        igt_plane_set_position(primary, 1, 1);
>> -        igt_plane_set_size(primary, 256, 256);
>> +    /* All sub-tests below are Intel-specific. */
>> +    igt_require_intel(data->drm_fd);
>> +    display_ver = intel_display_ver(intel_get_drm_devid(data->drm_fd));
>> +    igt_require(display_ver >= 9);
> 
> BTW, now this check looks much easier to read. :)
> 
> BR,
> Michał
> 
>>
>> -        /* set odd v pan and check with crc fb didn't break */
>> -        igt_fb_set_position(&fb, primary, 0, 3);
>> -        igt_fb_set_size(&fb, primary, 256, 256);
>> -        rval = igt_display_try_commit_atomic(&data->display,
>> -                             DRM_MODE_ATOMIC_ALLOW_MODESET,
>> -                             NULL);
>> -        if (rval == 0) {
>> -            set_legacy_lut(data,
>> -                       crtc,
>> -                       LUT_MASK);
>> -            igt_wait_for_vblank_count(crtc,
>> -                          1);
>> -            data->pipe_crc = igt_crtc_crc_new(crtc,
>> -                              IGT_PIPE_CRC_SOURCE_AUTO);
>> -            igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>> -
>> -            igt_create_color_fb(data->drm_fd, 256, 256,
>> -                DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> -                0.0, 0.0, 1.0,
>> -                &fb_ref);
>> -
>> -            igt_plane_set_fb(primary, &fb_ref);
>> -            rval = igt_display_try_commit_atomic(&data->display,
>> -                             DRM_MODE_ATOMIC_ALLOW_MODESET,
>> -                             NULL);
>> +    crtc = igt_first_crtc_with_single_output(display, &output);
>> +    igt_require_f(crtc, "No suitable output/crtc pair found\n");
>>
>> -            igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>> -            set_legacy_lut(data,
>> -                       crtc,
>> -                       0xffff);
>> +    igt_dynamic("nv12-odd-width")
>> +        test_nv12_odd_width(data, crtc, output, display_ver);
>>
>> -            igt_pipe_crc_free(data->pipe_crc);
>> -            data->pipe_crc = NULL;
>> +    igt_dynamic("nv12-odd-height")
>> +        test_nv12_odd_height(data, crtc, output, display_ver);
>>
>> -            igt_remove_fb(data->drm_fd, &fb_ref);
>> -            igt_assert_crc_equal(&crc_ref, &crc);
>> -        }
>> +    igt_dynamic("nv12-odd-horizontal-pan")
>> +        test_nv12_odd_horizontal_pan(data, crtc, output, display_ver);
>>
>> -        igt_remove_fb(data->drm_fd, &fb);
>> -        igt_assert_f(rval == expected_rval, "Odd vertical pan P016 
>> framebuffer\n");
>> -    } else {
>> -        igt_debug("Odd vertical pan P016 framebuffer test skipped\n");
>> -    }
>> +    igt_dynamic("p016-odd-vertical-pan")
>> +        test_p016_odd_vertical_pan(data, crtc, output, display_ver);
>> }
>>
>> static bool is_pipe_limit_reached(int count)
>> @@ -1621,8 +1670,9 @@ run_tests_for_pipe_plane(data_t *data)
>>         run_test(data, dynamic_test_handler);
>>     }
>>
>> -    igt_describe("verify planar settings for pixel format are 
>> accepted or rejected correctly");
>> -    igt_subtest_f("planar-pixel-format-settings")
>> +    igt_describe("verify planar pixel format settings are accepted or 
>> rejected correctly"
>> +             " on Intel hardware");
>> +    igt_subtest_with_dynamic_f("planar-pixel-format-settings")
>>         test_planar_settings(data);
>> }
>>
>>

