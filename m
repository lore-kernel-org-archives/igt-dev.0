Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF76606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U8FEnT6r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5001310E2F2;
	Mon, 26 Oct 2026 13:58:46 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF7810E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 13:57:46 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-185fd3a4ca3so2316038c88.0
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 06:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793023066; x=1793627866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tKYIR6WEqBX8GruZyRvMnZc1Y9xJMRqr8ID1e83XdMA=;
 b=U8FEnT6rRklRDsYE8S57ZuneLN7uNoJDfM5BdG3fPxRE8M67K2dYp7twWBTnD+x5CI
 hng05MFVATH8BTIgynPsWDKLpu01Kqv4Q3AFQGwdcwNiyFHggZmekvOYb5K8mQdSewvj
 csJJneJFIFeguIagIBwFvzIcbbB77Ph4jcX/ko3j9/wobBOv/A5IN3tKenuhW44SiEVi
 jmdEzfghU0PSj5DaRYJk5v5SimBGNXdMNQZgG/AomcIuREB+7qlii5/Z5BsN/W4hEbM6
 2sYCWtyACJg2+DTIV6Ln74M9qrEvkJQHbzehS7Pkvm62CBEg6zBsszmVkpFcjiKirWEG
 bvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793023066; x=1793627866;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tKYIR6WEqBX8GruZyRvMnZc1Y9xJMRqr8ID1e83XdMA=;
 b=uwuS32ZHCNmWSzaqk1ze5Yq9ok2kX7lsUIPYJmg906wWos4bzPcbDfNz27VMj+G3G9
 LNksCSU46WPz3rH8OvIb/PnKmX08U3/bzmiZx4sy65+SRI4Qxjq3JSDgb+lTUvJDX1Rb
 3bnzFW/08bBYTAOVmDAFDJf04ypiAAre3jh5x7YSUIxoyJUz2RbPWvgSuEqwi4bCH/yc
 soPXOFF19JIXz/oLHsQXFUzIZhMhQ4BYCC3B+Vg6nmwTiw6a223dvgnjwYm1r44R4tu2
 IMxmgcJRz41IO7rllFJnRSdqZEDVs7qB23eKMCSWJ5YnVSYNSwxsKnxQVJhRf3c65nWK
 WeOg==
X-Forwarded-Encrypted: i=1;
 AKwUvByiBXYn16igEBh3XF2VF2njY+dOqgygWGJFz6E4vyWsAVargq/w/GOJfLm9Em4WeiBrSxx/KyWo@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIklB2uTbPPs0RNAXM6cjXaKc9UIdnzSMV+BLHOiumE44eXGgqK
 n9hhAVnTfVHe+KVrN6QkfX2caWdWA5lAfixDAZNPpuJtkgWW9puPUiFGPbcwb5XY36I=
X-Gm-Gg: AYBFou2eqnslky9HpM5G31IgR+fUfUBS4rFR42z9udst3jXi2PGIqndhP/gdh1LXAEW
 YdqX2AORQ/RQjzUWwd9suIC29c0pFaZi7mTcogSTHl1wooCRB1zhs1934oHjwTngwrI4nHakRRC
 JS4uOmLcZ2tM9e/nawiwK92SGapWgTO1AFNfvFxDnKMHsSaP0R4jM6ytqDjxDdUh17D9kz8uq4s
 CDvFtc4z5xktJw0aU/EDFg44EvP08FUyDrwSWytWx7AQtahex4PqlxP6PpO/R0Dqyvx5ofZaXPh
 i/CdAR0RDoJ/LFs8EovpGe1CKw46LypS+abDC+kZXKA2AqWldWJ/0mObVmsyHUpnjtWGV/UPi17
 1HY5rbUmUZS4S8N7AQkG3r3FuRYnd7jDNS89STPRlXno7JXv8pU2XjKYVfrgB6tRPLorFVrN8Ip
 rR27x4zs2O/dEmdvE9TGOI5vW/mQNUYgrUSv5Iw9RQj5kSK4idGpEbhsE0RKdR9Hqyslybh22TR
 oQtXYTSCuHwHeniRv3lP4/asDSjcaBVvj5av+6XIB6tGTNIThsRQFkDIgjwuYdI/bFT0080Ny7O
 p6zwguBuSnV6XhmmcS91vQI=
X-Received: by 2002:a05:7022:e888:b0:187:efba:9ba2 with SMTP id
 a92af1059eb24-1993a1e41acmr11000588c88.44.1793023065818; 
 Mon, 26 Oct 2026 06:57:45 -0700 (PDT)
Received: from [192.55.54.41] ([192.55.54.41])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-19a3736d16fsm24276240c88.12.2026.10.26.06.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 06:57:45 -0700 (PDT)
Message-ID: <de8e6564-1b39-4886-a565-8ff496f9819a@gmail.com>
Date: Mon, 26 Oct 2026 15:57:42 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/9] tests/kms_plane_scaling: add
 plane-downscale-max-crc subtest
To: Luca Coelho <luca@coelho.fi>, igt-dev@lists.freedesktop.org
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-3-juhapekka.heikkila@gmail.com>
 <9c092a0bc661ad3b0cb9d4ff8c7d3e2b0a350f3b.camel@coelho.fi>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <9c092a0bc661ad3b0cb9d4ff8c7d3e2b0a350f3b.camel@coelho.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Luca, thanks for reading theses through; I'll make new set with fixes.

On 19/10/2026 14.45, Luca Coelho wrote:
> On Thu, 2026-10-15 at 16:16 +0300, Juha-Pekka Heikkila wrote:
>> Probe the maximum horizontal and vertical plane downscaling
>> factor and verify the downscaled framebuffer render correctly
>> by verifying via crc.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   tests/kms_plane_scaling.c | 145 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 145 insertions(+)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 41f56a5ed..4b5730cd1 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -189,6 +189,13 @@
>>    * Description: Test for validating max source size.
>>    */
>>   
>> +/**
>> + * SUBTEST: plane-downscale-max-crc
>> + * Description: Probe the maximum horizontal and vertical plane downscaling
>> + *              factor and verify the downscaled framebuffer render correctly
> 
> Non-blocking nitpick: s/render/renders/
> 
> Also same thing in the commit message.
> 
> 
>> + *              by verifying via crc.
>> + */
>> +
>>   IGT_TEST_DESCRIPTION("Test display plane scaling");
>>   
>>   enum scaler_combo_test_type {
>> @@ -709,6 +716,35 @@ static const uint64_t modifiers[] = {
>>   	I915_FORMAT_MOD_4_TILED
>>   };
>>   
>> +static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t rot,
>> +			      int *halign, int *valign)
>> +{
>> +	bool intel = is_intel_device(d->drm_fd);
>> +	int disp_ver = intel ? intel_display_ver(d->devid) : 0;
>> +	int hsub, vsub;
>> +
>> +	*halign = 1;
>> +	*valign = 1;
>> +
>> +	if (!igt_format_is_yuv(format))
>> +		return;
>> +
>> +	igt_format_get_subsampling(format, &hsub, &vsub);
>> +
>> +	/*
>> +	 * these must match to intel_plane_check_src_coordinates() in
>> +	 * i915/Xe driver
>> +	 */
>> +	if (intel && disp_ver >= 20 && igt_format_is_yuv_semiplanar(format)) {
> 
> disp_ver will always be 0 if intel is false, so checking intel here
> again is not necessary.
> 
> 
>> +		*halign = 1;
>> +		*valign = (disp_ver == 35) ? 2 : 1;
> 
> haligns and valign will already be 1 here, so no need to set them
> again.  It would probably be enough and slightly clearer to have only
> this?
> 
> 		if (disp_ver == 35)
> 			*valign = 2;
> 
> ...and do you really need == 35 and not >= 35?

This will need to match to kernel hence no >= 35 but == 35. Eg.this is 
wa needed for display version 35 and no other.

> 
> 
>> +		return;
>> +	}
>> +
>> +	*halign = hsub;
>> +	*valign = vsub;
>> +}
>> +
>>   static int
>>   find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
>>   			    uint32_t format, uint64_t modifier,
>> @@ -790,6 +826,95 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
>>   	return best;
>>   }
>>   
>> +static void
>> +test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
>> +		       bool scale_width)
>> +{
>> +	igt_display_t *display = &d->display;
>> +	const uint32_t format = DRM_FORMAT_XRGB8888;
>> +	const uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>> +	const int band = 64;
>> +	igt_pipe_crc_t *pipe_crc;
>> +	igt_crc_t ref_crc, scaled_crc;
>> +	drmModeModeInfo *mode;
>> +	struct igt_fb ref_fb = {}, src_fb = {};
>> +	igt_plane_t *plane;
>> +	int dst_w, dst_h, dst_scaled, max_src;
>> +	int halign, valign, align;
>> +
>> +	cleanup_crtc(d);
>> +
>> +	igt_require_pipe_crc(d->drm_fd);
>> +
>> +	igt_output_set_crtc(output, crtc);
>> +
>> +	/* Preferred mode; the largest advertised one may not be usable. */
>> +	mode = &output->config.default_mode;
>> +	igt_output_override_mode(output, mode);
>> +
>> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +	igt_require(plane);
>> +
>> +	yuv_src_alignment(d, format, IGT_ROTATION_0, &halign, &valign);
>> +	align = scale_width ? halign : valign;
>> +
>> +	/* dst is a thin band spanning the full extent of the scaled axis */
>> +	dst_w = ALIGN(scale_width ? mode->hdisplay : band, halign);
>> +	dst_h = ALIGN(scale_width ? band : mode->vdisplay, valign);
>> +	dst_scaled = scale_width ? dst_w : dst_h;
>> +
>> +	max_src = find_max_downscale_src_size(d, plane, format, modifier,
>> +					      scale_width, dst_w, dst_h, align);
>> +	skip_if_erange_or_einval(max_src);
>> +	igt_require_f(max_src > dst_scaled,
>> +		      "No %s downscaling headroom (max src %d, dst %d)\n",
>> +		      scale_width ? "horizontal" : "vertical",
>> +		      max_src, dst_scaled);
>> +
>> +	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
>> +		 scale_width ? "horizontal" : "vertical",
>> +		 max_src, dst_scaled, band);
>> +
>> +	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
>> +
>> +	/* Reference: unscaled solid-green framebuffer of the destination size. */
>> +	igt_create_color_fb(display->drm_fd, dst_w, dst_h, format, modifier,
>> +			    0.0, 1.0, 0.0, &ref_fb);
>> +	igt_plane_set_fb(plane, &ref_fb);
>> +	igt_fb_set_position(&ref_fb, plane, 0, 0);
>> +	igt_fb_set_size(&ref_fb, plane, dst_w, dst_h);
>> +	igt_plane_set_position(plane, 0, 0);
>> +	igt_plane_set_size(plane, dst_w, dst_h);
>> +	igt_display_commit2(display, COMMIT_ATOMIC);
>> +	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
>> +
>> +	/* Test: larger solid-green source downscaled into dst rectangle. */
>> +	igt_create_color_fb(display->drm_fd,
>> +			    scale_width ? max_src : dst_w,
>> +			    scale_width ? dst_h : max_src,
>> +			    format, modifier, 0.0, 1.0, 0.0, &src_fb);
>> +	igt_plane_set_fb(plane, &src_fb);
>> +	igt_fb_set_position(&src_fb, plane, 0, 0);
>> +	igt_fb_set_size(&src_fb, plane,
>> +			scale_width ? max_src : dst_w,
>> +			scale_width ? dst_h : max_src);
>> +	igt_plane_set_position(plane, 0, 0);
>> +	igt_plane_set_size(plane, dst_w, dst_h);
>> +	igt_display_commit2(display, COMMIT_ATOMIC);
>> +	igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
>> +
>> +	igt_plane_set_fb(plane, NULL);
>> +	igt_display_commit2(display, COMMIT_ATOMIC);
>> +
>> +	igt_reset_fifo_underrun_reporting(display->drm_fd);
>> +
>> +	igt_pipe_crc_free(pipe_crc);
>> +	igt_remove_fb(display->drm_fd, &ref_fb);
>> +	igt_remove_fb(display->drm_fd, &src_fb);
>> +
>> +	igt_assert_crc_equal(&ref_crc, &scaled_crc);
>> +}
>> +
>>   static uint32_t
>>   test_scaler_with_modifier_crtc(data_t *d,
>>   			       double sf_plane,
>> @@ -1702,6 +1827,26 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   								 output);
>>   			}
>>   		}
>> +
>> +		igt_describe("Probe the maximum horizontal and vertical plane "
>> +			     "downscaling factor and verify the downscaled output "
>> +			     "matches an unscaled reference using CRCs.");
>> +		igt_subtest_with_dynamic("plane-downscale-max-crc") {
>> +			for_each_crtc_with_valid_output(&data.display, crtc, output) {
>> +				if (!crtc_output_combo_valid(&data.display, crtc, output))
>> +					continue;
>> +				if (igt_crtc_num_scalers(crtc) < 1)
>> +					continue;
>> +
>> +				igt_dynamic_f("pipe-%s-%s-horizontal",
>> +					      igt_crtc_name(crtc), igt_output_name(output))
>> +					test_downscale_max_crc(&data, crtc, output, true);
>> +
>> +				igt_dynamic_f("pipe-%s-%s-vertical",
>> +					      igt_crtc_name(crtc), igt_output_name(output))
>> +					test_downscale_max_crc(&data, crtc, output, false);
>> +			}
>> +		}
>>   	}
>>   
>>   	igt_subtest_group()
> 
> 
> --
> Cheers,
> Luca.

