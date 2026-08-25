Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5B1C61DB6
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 08:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FAF10E96D;
	Tue, 25 Aug 2026 08:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jtT38P3F";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E209610E96D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 08:39:19 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2d530328efbso38610095ad.0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787647159; x=1788251959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NnRRmF1BXlb7pLWXhF8uVOo1GMwEbxwfSTP5sNnkjKo=;
 b=jtT38P3FBgP9bylXoURT7k5znLqKvnvvxXxphWoOTOEHlSBPytR3dseUslU6LmoxBC
 HkBOZ0obl6QjHe/Py0J9m+7UaCDmqJoRpAIfCLWVdcMh+b2wrHyMBIHHVpRkweip+4hf
 mJNKFNbpYxn9BC2fH82eNvVj6e4ZfhTuB+qLdtTLSvGsCvZxtLnD0xYC9H63KRf3oXHI
 dtcv5DGsLXxmuRaKr5iBZ16JJMhvCGybvpi+nAAyhY6sv6WVKlaFuyQvEAjSmlTH+8Rd
 4CxBqY9LzL8CQx/OyM086XtrPTqH6XnunJLCGAxdSiOsE3wL8SLm0lrPnaWWfEurXlSj
 cyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787647159; x=1788251959;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NnRRmF1BXlb7pLWXhF8uVOo1GMwEbxwfSTP5sNnkjKo=;
 b=kBszxr4q8/4RSxUHBnPhP3pb1xCdiwrb6o+DenPQM82fmwazj0Fr6k1g+yfRmEj7qq
 uz2e3yuhvtM9HgPy2bSGoPyi8jqQIP9g5Q4Wcfc6a4hbSfgElQXx7nMzULgzljNp8co7
 7UYEXr6Y2WgK7Zx8Vp7KQTgeSHWMpDKuKcUaYn+skcTKCnaXNLpwbgXvPxcwT8cCga4d
 sYIVF2QP6Rvy2ACBJrwPQ2FAA7p1hzjUXc10wF0pEC+n7jE+4QDeRHw3zT2xZQT6dCRl
 MscDihRIwxosz93VpQ6EIzk8T8VE3rZw1ZvTbGMjk23+AwjhSwA+hjMlsMbz5feKYR5+
 xMBQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp28IjH3JnqI/NkFeX63so47yKdL17oIJNCWju/iqkBWXpAe264zxKht73JTIdRx6W0JZnPnwLV@lists.freedesktop.org
X-Gm-Message-State: AFuF++lxCyux02LevFiwuIFXNF7I3wgf8snXnqTkhmU4hFBBgAvBiynT
 D8XrIVJyxdiW3sTQBvbPL/RJaX4yv3c0R6lmJG8z4uQE+amNjom2ddi1
X-Gm-Gg: AR+sD10QRqJyH7JxHmCSH6O3DJhdAjLKZ7shI99GXKmUIDrWyDaz/sg112j9puTWXN5
 IwREBsKMF06pvA7xAVuoGy9mT/2i728ljUoWMHYKWdTzW5ScwdeD4ObNqsfSaCOjeih6ZnIDEID
 RmsFioBlggwIvG7jjkxBmcAZTEq1Isvk9HpwVkzDsjZP9OwY5hnJ5m/Cr6cQD2qVROPhnJ5OOOg
 +HvRoaaf26exWeD2IYa7gHgiL2nIK6sjoiK7jTvE+FMILQ2suQKmKTUtp4CgC9gYliCMWGbSjU3
 QMz8Zj4Wdp1miXAOMOvc6CAtOhbk9FhYC364VZPCpZTzfZKJepTkv8ucsmmxnkZqfFkmkXncfHz
 0Dhupd0+E8SfqZmHKrOkPy3EX84Zt08yWOTXusexzWl0H6EgcnUvsqGr0XaUsxHkMI/2qUozcND
 0LMAEhwIHGoNepANUxojy4/mZUSn2XVYNdd79uLSdrQHYeakPV/8PDq80GtYbgOfwTb00Dv2ek8
 68CkTewGRAL0aEAVC1mVdGfv6ABSGs=
X-Received: by 2002:a17:903:2a8d:b0:2d6:df31:5bd0 with SMTP id
 d9443c01a7336-2d6df315e54mr90704855ad.10.1787647159243; 
 Tue, 25 Aug 2026 01:39:19 -0700 (PDT)
Received: from [192.55.54.45] ([192.55.54.45])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d6768f1379sm24424275ad.82.2026.08.25.01.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:39:17 -0700 (PDT)
Message-ID: <02c75d33-80d5-4f73-b1bc-b06996972b5d@gmail.com>
Date: Tue, 25 Aug 2026 11:39:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane: fix planar subtest documentation
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20260824190522.314000-1-swati2.sharma@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260824190522.314000-1-swati2.sharma@intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 24/08/2026 22.05, Swati Sharma wrote:
> Document only the parent subtest and keep dynamic descriptions
> as comments above their test functions.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_plane.c | 47 +++++++++++++++++++++--------------------------
>   1 file changed, 21 insertions(+), 26 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 14d2d810f..388b869ea 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -41,31 +41,9 @@
>   #include "xe/xe_query.h"
>   
>   /**
> - * SUBTEST: planar-pixel-format-settings@nv12-odd-width
> - * Description: Verify odd-width (257px) NV12 framebuffer is rejected by the
> - *              kernel on Intel hardware (display ver < 20 expects -EINVAL).
> - * Driver requirement: i915, xe
> - *
> - * SUBTEST: planar-pixel-format-settings@nv12-odd-height
> - * Description: Verify odd-height (257px) NV12 framebuffer is rejected by the
> - *              kernel on Intel hardware (display ver < 20 or >= 35 expects -EINVAL).
> - * Driver requirement: i915, xe
> - *
> - * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
> - * Description: Verify odd horizontal pan on NV12 framebuffer is rejected by
> - *              the kernel on Intel hardware (display ver < 35 expects -EINVAL).
> - * Driver requirement: i915, xe
> - *
> - * SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan
> - * Description: Verify odd vertical pan on P016 framebuffer and check CRC
> - *              matches a reference XRGB8888 blue fill on Intel hardware.
> - * Driver requirement: i915, xe
> - *
> - * SUBTEST: planar-pixel-format-settings@nv12-tile4-src-y
> - * Description: Verify that an NV12 Tile4 framebuffer with src_y=1 renders
> - *              correctly on Intel hardware. CRC comparison detects
> - *              corruption.
> - * Driver requirement: xe
> + * SUBTEST: planar-pixel-format-settings
> + * Description: Verify planar pixel format settings are accepted or rejected
> + *              correctly on Intel hardware.
>    *
>    * SUBTEST: plane-position-%s
>    * Description: Verify plane position using two planes to create a %arg[1]
> @@ -1386,6 +1364,10 @@ planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   	return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   }
>   
> +/*
> + * Verify odd-width (257px) NV12 framebuffer is rejected by the kernel on
> + * Intel hardware (display ver < 20 expects -EINVAL).
> + */
>   static void
>   test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   		    int display_ver)
> @@ -1415,6 +1397,10 @@ test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   		     rval, expected_rval);
>   }
>   
> +/*
> + * Verify odd-height (257px) NV12 framebuffer is rejected by the kernel on
> + * Intel hardware (display ver < 20 or >= 35 expects -EINVAL).
> + */
>   static void
>   test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   		     int display_ver)
> @@ -1444,6 +1430,10 @@ test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   		     rval, expected_rval);
>   }
>   
> +/*
> + * Verify odd horizontal pan on NV12 framebuffer is rejected by the kernel on
> + * Intel hardware (display ver < 35 expects -EINVAL).
> + */
>   static void
>   test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
>   			     igt_output_t *output, int display_ver)
> @@ -1475,6 +1465,10 @@ test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
>   		     rval, expected_rval);
>   }
>   
> +/*
> + * Verify odd vertical pan on P016 framebuffer and check CRC matches a
> + * reference XRGB8888 blue fill on Intel hardware.
> + */
>   static void
>   test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
>   			   igt_output_t *output, int display_ver)
> @@ -1540,7 +1534,8 @@ test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
>   }
>   
>   /*
> - * test_nv12_tile4_src_y - NV12 Tile4 with src_y=1 CRC correctness check.
> + * Verify that an NV12 Tile4 framebuffer with src_y=1 renders correctly on
> + * Intel hardware. CRC comparison detects corruption.
>    *
>    * If kernel program wrong UV DPT va, hardware read chroma from
>    * an unmapped page, producing incorrect picture and crc mismatch

