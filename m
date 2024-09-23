Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C39CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 17:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A4D10E1A9;
	Mon, 23 Sep 2024 17:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FnFidxFD";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FD410E1A9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 17:28:11 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-374ba74e9b6so3819353f8f.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 10:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727112490; x=1727717290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3RdE3NDELB4q9TYZMaCT6S0pB05GNKNZ2c9Im92VcI8=;
 b=FnFidxFDukQnMjhE4hC3/5rQcBV6eFykXqct5y2gNKw5BLAkNybBUgAqZKARgusiGB
 bJsxgyQmvbh17uP8WA/EtMKAAJuiR/JX4Rqv+3lw9M1AgiGEy/Yy8hnFwL2F6I44KTIk
 Rx3nVzEyD6Y6Tb51S8tEV+S5lkOFrqIwNsspeBVBS8pkUajy66I198GdbHQB5xpk4JFf
 4jVXvKVq4IXbqzB3TWsfEav/PuMI1OzFVEA4k73VM9zGPlCOi0CChBnyKxTWuY81CmES
 UpPURXi1nepo3mm2UaGdgG/Fbl2gZmvX4C/Kd6v2a5cwcWc1hXl26dLT7KL1rVpsleXk
 bd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727112490; x=1727717290;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3RdE3NDELB4q9TYZMaCT6S0pB05GNKNZ2c9Im92VcI8=;
 b=ddSCy2uqUaOS/YuShKq2qVXy7lNj8PXDR9aAoaa/LUGrCkc1/VJCPo1bnyxmAS5bGA
 rXJnagMKPZuZ4fix857R6uD/pGtG+/kpPEd10GnjQ7oUqFTVxR0UYrFMwYPuC7ylfDwG
 hxcxOzGSWSPy65lEHDQP1YsIJtTf1VWwhHBqEpPrmcnxVrmTuAZmSUkCvHyW/Yl2ZBEp
 n85rj+sL83WEPRquc00XRJp5GwqgyD1XCscJc704F4tTg6zWXSPCbL1wEKvIZjIDhOi1
 zURJdl7PLgePZEsOrH9Frgi72ixy2gp9J9An5U/XVW3OsMQ6NXXmRCH4z/HDHyHCKerw
 STfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLvU0IEDUAVT+pZX47pdTPXoaoGdZa0NUeUNa9BO/HA79zM+snyfueW3s74kBdWn7hfRFXVV7q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLL34IKeNqWYUCRQcAW0sJ5g8Bq2CF+bXikuTFWssNcbxSaL1R
 IlEAMorhDv+SxDn0A42LuVPhl9RG0PxaJqBUVRaIHyC8D1fO1j53+ULuBPGqwW8=
X-Google-Smtp-Source: AGHT+IFjyhB9/oSdd18n1VDu/cWzwNAMSW6x1HBm+4vKCyj/X1CEZVLw5P1ZzdrLmxdRqIp66/ERhg==
X-Received: by 2002:a5d:6089:0:b0:374:c64d:536a with SMTP id
 ffacd0b85a97d-37a422c66f0mr11057177f8f.27.1727112490122; 
 Mon, 23 Sep 2024 10:28:10 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.74])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a90612b38bdsm1254962466b.110.2024.09.23.10.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 10:28:09 -0700 (PDT)
Message-ID: <d8b63fe2-6698-402a-9129-d1fe4b38cbee@gmail.com>
Date: Mon, 23 Sep 2024 20:28:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 17/18] tests/kms_ccs: Try to fix the xe2 blitter
 compression format
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
 <20240918120518.30258-18-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240918120518.30258-18-ville.syrjala@linux.intel.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 18.9.2024 15.05, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Pluck the compression format values from the LNL/BMG table.
> 
> TODO: or should be we using those stateful/stateless values or
>        something? no idea
> TODO: Move this into igt_fb.c
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 32 +++++++++++++++++++++-----------
>   1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index bb18784e6fac..835a3fe5aed2 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -651,19 +651,29 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
>   }
>   
>   static uint32_t blt_compression_format(struct blt_copy_data *blt,
> -				       const struct igt_fb *fb)
> +				       const struct igt_fb *fb,
> +				       int color_plane)
>   {
> -	switch (fb->drm_format) {
> -	case DRM_FORMAT_XRGB8888:
> +	switch (igt_reduce_format(fb->drm_format)) {
> +	case DRM_FORMAT_XRGB16161616F:
> +		return 0x7; /* CMF_R16_G16_B16_A16 */
>   	case DRM_FORMAT_XRGB2101010:
> -	case DRM_FORMAT_P010:
> -	case DRM_FORMAT_P012:
> -	case DRM_FORMAT_P016:
> -	case DRM_FORMAT_YUYV:
> -		return 8;
> +		return 0x3; /* CMF_R10_G10_B10_A2 */
> +	case DRM_FORMAT_XRGB8888:
>   	case DRM_FORMAT_XYUV8888:
> +		return 0x2; /* CMF_R8_G8_B8_A8 */
> +	case DRM_FORMAT_YUYV:
> +		return 0x1; /* CMF_R8_G8 (treated as 16bpp format) */
>   	case DRM_FORMAT_NV12:
> -		return 9;
> +		if (color_plane)
> +			return 0x1; /* CMF_R8_G8 */
> +		else
> +			return 0x0; /* CMF_R8 */
> +	case DRM_FORMAT_P010:
> +		if (color_plane)
> +			return 0x6; /* CMF_R16_G16 */
> +		else
> +			return 0x5; /* CMF_R16 */
>   	default:
>   		igt_assert_f(0, "Unknown format\n");
>   	}
> @@ -712,12 +722,12 @@ static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb
>   		blt_set_copy_object(&blt.dst, dst);
>   
>   		blt_set_object_ext(&ext.src,
> -				blt_compression_format(&blt, src_fb),
> +				blt_compression_format(&blt, src_fb, i),
>   				src_fb->plane_width[i], src_fb->plane_height[i],
>   				SURFACE_TYPE_2D);
>   
>   		blt_set_object_ext(&ext.dst,
> -				blt_compression_format(&blt, dst_fb),
> +				blt_compression_format(&blt, dst_fb, i),
>   				dst_fb->plane_width[i], dst_fb->plane_height[i],
>   				SURFACE_TYPE_2D);
>   

