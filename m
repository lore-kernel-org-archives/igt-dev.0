Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD34CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 17:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8010510E575;
	Wed,  6 May 2026 17:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q2k0714s";
	dkim-atps=neutral
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4DC10E575
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 17:56:46 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2ef38cf04f0so7525248eec.1
 for <igt-dev@lists.freedesktop.org>; Wed, 06 May 2026 10:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778090206; x=1778695006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KUtF0hdkNS6n5ECsYzGRVsKoX+9T8rbiKP7ISKf5b38=;
 b=Q2k0714sNBQYaLK8Mf50ht9A/6NTO43bYg7eHjVq+kiO/zOidCLRI4RPQlYzsXFTHH
 MaOIkwUT5sGCaxc3xiQxQErTcjro7oOC7DnrXI57+PrdY2ZXxXVFoPP6j1S/JIv92BiV
 Qy3qDO5Z2VsLi6yq8Co6Z57br5nukEsJ4t6wLLcL9/tdHR/79MrB2PPZHJTwlXMMrkRl
 fqIroyiOHrWg5ash1djOwqWCrO5/4W/ePIbjNhSe7M+Mxavqz2TmO36uA3gbCM7QELLz
 Ihty541guUj/iV6Jjcl5DI1t7On9ucVoj8WVz6Dit3MgDkY5npzLCh7YWB+R1Z1pleLi
 uofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778090206; x=1778695006;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KUtF0hdkNS6n5ECsYzGRVsKoX+9T8rbiKP7ISKf5b38=;
 b=Z7L6HbmfeC4XQjFd1LRTy2ubFkeNyCFCzo7KplobctwA6TuZ5qozNqalpKeSpa9fuH
 5dcY8c0TBKsV+ao7lsAXhYzagqKPyZ1KdUHk8EfNHy2KkU83w5FG3u15VD66alwBC/by
 x17mL02N/kRpSZPMaAg7zF2czlTpn4anWPmrqvggE1bB4gCy+cTBNrt0f4Ec/sXkPIBT
 q62fOh1yWg45rPrs0qLOkcf7JQk/ShHp+Ybo2B/9jtSnKEBa1ScWdzzUYIEIcFarKVjA
 GV7PazpDq9PS4f8rDHcTVNHVa4NIn2Ef8W2YjKBDKmayAOuXf/YgdFuORrzVJxOYMjb9
 oLyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9mirVNCeqvIp+nqa9KFT1nJ+Tr7lTZhfF3DcRI8xhTFw/JiiUSaMteytLsnI5KqTgfPJSRI6yz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlSOWQ9djbWjVPBTQQ8xM4d+27It+dqvy2anJxLh186awIF6we
 4/xpZjJcM1rv5SRr2gkDsRZpBAhVtope2gxxUWvTLCs6rZvRZDuOtpvevIKeJw56
X-Gm-Gg: AeBDietlSjgDSAMYMD9FeJZ031FYncYe1Mn2FKwBWhIca7dCmNfVRW82uylon9iX5UR
 c9kFhujeeRE8k4naLOR3lJ/y4HqI3Lh+4apI+VKP7deT1l749+QPS86q3SN9UNxOGtcze/qQDCh
 cMWeD+UvEHfBgzRVkZH3iFS/lFsd4BqrHFzKFANInn8oge1CpTqK8psGh0f6tlihyUT0Q11ThlQ
 DgVoeWAcSj6QhJj3HfnASXbAE3FwUimmHbXnb4FQItqxwh3dRfE1ELn3Q6hlgJmw8G4V4x5FFXV
 8kPSJtyPDM+So0wfEG3PQzoehgDvn85lxlUC/IGnpXyPGBp+ji3oGOcjNoJXsY7BQ6uvSQ5BhKN
 1zZN38r0+ijZmbjVxBeqZHEP8GEoMdPHg+fNoyItAxzyM5yYQPxaDYarl5A6QGmFmGyTZziqlfz
 fswy7XGF/Eh68Go/GHP/yHlxWkMbu14dwQIF2JtMkaszRa4e5ntBWNYPQiI5XVIAzC8P3m5QpFt
 d9+
X-Received: by 2002:a05:7300:5796:b0:2dd:5641:ef2 with SMTP id
 5a478bee46e88-2f54a38c2ecmr2109981eec.25.1778090205772; 
 Wed, 06 May 2026 10:56:45 -0700 (PDT)
Received: from [192.55.54.41] ([192.55.54.41])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2f56cec592asm4753797eec.5.2026.05.06.10.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 10:56:45 -0700 (PDT)
Message-ID: <15e04e2a-519d-4a95-903e-fc5dca1c9c36@gmail.com>
Date: Wed, 6 May 2026 20:56:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_plane: Add test_nv12_tile4_src_y
 planar settings test
To: Luca Coelho <luca@coelho.fi>, igt-dev@lists.freedesktop.org
References: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
 <20260424171123.3963793-3-juhapekka.heikkila@gmail.com>
 <2fc6fddd76c5cd00fdb3f8cd6ab7def75a93b008.camel@coelho.fi>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <2fc6fddd76c5cd00fdb3f8cd6ab7def75a93b008.camel@coelho.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Luca,

On 05/05/2026 10.27, Luca Coelho wrote:
> On Fri, 2026-04-24 at 20:11 +0300, Juha-Pekka Heikkila wrote:
>> Add Intel specific dynamic subtest test_nv12_tile4_src_y under
>> planar-pixel-format-settings test. This test target dpt
>> misconfiguration with specially crafted nv12 framebuffer
>> with tile4.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
> 
> Generally the test seems reasonable, but a bit more explanation on what
> it is actually testing would be nice.  The commit message doesn't
> really mention the actual problem that it is trying to test.
> 
> 
>>   tests/kms_plane.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 95 insertions(+)
>>
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index 6c08f1de8..303bd333f 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -61,6 +61,12 @@
>>    *              matches a reference XRGB8888 blue fill on Intel hardware.
>>    * Driver requirement: i915, xe
>>    *
>> + * SUBTEST: planar-pixel-format-settings@nv12-tile4-src-y
>> + * Description: Verify that an NV12 Tile4 framebuffer with src_y=1 renders
>> + *              correctly on Intel hardware.  CRC comparison detects
>> + *              corruption.
>> + * Driver requirement: xe
>> + *
> 
> Also the description here seems a bit more complete, IMHO.

Not sure about that excessive commenting on commit message when the test 
is documented here in the source. This bug here anyway is quite much as 
described on commit message as well as here; here this specially crafted 
nv12 did hit special 'sweet spot' triggering reading of unmapped memory 
through dpt.

> 
> 
>>    * SUBTEST: plane-position-%s
>>    * Description: Verify plane position using two planes to create a %arg[1]
>>    *
>> @@ -1534,6 +1540,92 @@ test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
>>   		     rval, expected_rval);
>>   }
>>   
>> +/*
>> + * test_nv12_tile4_src_y - NV12 Tile4 with src_y=1 CRC correctness check.
>> + *
>> + * If kernel program wrong UV DPT va, hardware read chroma from
>> + * an unmapped page, producing incorrect picture and crc mismatch
>> + */
>> +static void
>> +test_nv12_tile4_src_y(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>> +{
>> +	igt_plane_t *primary;
>> +	struct igt_fb nv12_fb, ref_fb;
>> +	igt_crc_t crc, crc_ref;
>> +	drmModeModeInfo *mode;
>> +
>> +	/* required size for this test, do not change! */
>> +	const int fb_w = 1280, fb_h = 768;
>> +	int ret;
>> +
>> +	igt_require_xe(data->drm_fd);
>> +	igt_display_reset(&data->display);
>> +	igt_output_set_crtc(output, crtc);
>> +
>> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +	mode    = igt_output_get_mode(output);
>> +
>> +	igt_require_f(igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>> +					       I915_FORMAT_MOD_4_TILED),
>> +		      "Primary plane does not support NV12 + Tile4\n");
>> +
>> +	igt_require_f(fb_w <= mode->hdisplay && fb_h <= mode->vdisplay,
>> +		      "Mode %dx%d too small for %dx%d NV12 test FB\n",
>> +		      mode->hdisplay, mode->vdisplay, fb_w, fb_h);
>> +
>> +	igt_create_color_fb(data->drm_fd, fb_w, fb_h,
>> +			    DRM_FORMAT_NV12, I915_FORMAT_MOD_4_TILED,
>> +			    0.0, 0.0, 1.0, &nv12_fb);
>> +
>> +	/*
>> +	 * src_y = 1 - this is trigger for dpt uv offset bug
>> +	 */
>> +	igt_plane_set_fb(primary, &nv12_fb);
>> +	igt_fb_set_position(&nv12_fb, primary, 0, 1);
>> +	igt_fb_set_size(&nv12_fb, primary, fb_w, fb_h - 1);
>> +	igt_plane_set_position(primary, 0, 0);
>> +	igt_plane_set_size(primary, fb_w, fb_h - 1);
>> +
>> +	ret = igt_display_try_commit_atomic(&data->display,
>> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +	if (ret != 0) {
>> +		igt_plane_set_fb(primary, NULL);
>> +		igt_remove_fb(data->drm_fd, &nv12_fb);
>> +		igt_skip("NV12 Tile4 src_y=1 rejected by kernel (ret=%d)\n", ret);
>> +	}
>> +
>> +	data->pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
>> +	set_legacy_lut(data, crtc, LUT_MASK);
>> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>> +
>> +	/*
>> +	 * Get reference crc to check above went ok
>> +	 */
>> +	igt_create_color_fb(data->drm_fd, fb_w, fb_h - 1,
>> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +			    0.0, 0.0, 1.0, &ref_fb);
>> +	igt_plane_set_fb(primary, &ref_fb);
>> +	igt_fb_set_position(&ref_fb, primary, 0, 0);
>> +	igt_fb_set_size(&ref_fb, primary, fb_w, fb_h - 1);
>> +	igt_plane_set_position(primary, 0, 0);
>> +	igt_plane_set_size(primary, fb_w, fb_h - 1);
>> +	igt_display_commit_atomic(&data->display,
>> +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> 
> Nitpick: maybe it's because I'm not the most familiar person regarding
> this, but it would be nice if both setups (this one immediately above
> and the one with src_y = 1 earlier) would visually match each other, so
> it would be easier to see what is actually different between them.
> Maybe this would even deserve a helper function so it's very clear what
> the difference is between the two?

yea, i think you're right here. I did make these two do same things with 
the exception of not creating the failing case for reference, that is 
xrgb8888 and linear and so forth..while in reality all is needed here to 
show what the image should be, would be igt_create_color_fb(), 
igt_plane_set_fb(), commit.

> 
> 
>> +
>> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>> +	set_legacy_lut(data, crtc, 0xffff);
>> +	igt_pipe_crc_free(data->pipe_crc);
>> +	data->pipe_crc = NULL;
>> +
>> +	igt_plane_set_fb(primary, NULL);
>> +	igt_display_commit_atomic(&data->display,
>> +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +	igt_remove_fb(data->drm_fd, &nv12_fb);
>> +	igt_remove_fb(data->drm_fd, &ref_fb);
>> +
>> +	igt_assert_crc_equal(&crc_ref, &crc);
>> +}
>> +
>>   static void test_planar_settings(data_t *data)
>>   {
>>   	igt_display_t *display = &data->display;
>> @@ -1562,6 +1654,9 @@ static void test_planar_settings(data_t *data)
>>   
>>   	igt_dynamic("p016-odd-vertical-pan")
>>   		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
>> +
>> +	igt_dynamic("nv12-tile4-src-y")
>> +		test_nv12_tile4_src_y(data, crtc, output);
>>   }
>>   
>>   static bool is_pipe_limit_reached(int count)
> 
> 
> --
> Cheers,
> Luca.

