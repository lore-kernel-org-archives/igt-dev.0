Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE909CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5364E10FE08;
	Fri, 29 May 2026 12:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="smloRi6n";
	dkim-atps=neutral
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F0E10FDF7
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:06:04 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-136b46c3540so6869062c88.1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 05:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780056363; x=1780661163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eu0D2oXorPg1Gr6eOZJBR5WjpQWsDM5lMUsCae2Xfj8=;
 b=smloRi6nwCgUvGQwYeiPM8H3pw+ytxBheWWL/RkxfqpZ+cONfwox2nP/LKYVVuHmkq
 Z5Ukol21Aww9FRBaIbBa7AMhnTRpk48OhqJjEI+en/gBXcPDBcVDejxcL95hNxvrjt4I
 RBwN2pDliyPnrleJACOi55fi1am4897m+f3Osv52+7XzvQD2P4pTNJ+7HwYnUZ3a8erB
 52EhXXf37Yxt0iVWFaBfSjoJ8EPpEft1edBYQl8W58SH+Y6B2/SqC2v5bxFJUzinRsmW
 V9nI3Ln9UwNe681SV1F0SJrofhblpC19IeDngvH4rU9wbcquphE6I9FswPUhliPb8hvi
 0c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780056363; x=1780661163;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eu0D2oXorPg1Gr6eOZJBR5WjpQWsDM5lMUsCae2Xfj8=;
 b=GOsWPnVEeOl2A8Mne32m/2VcBNV/jtis4CXm0te7biKZSbVni1kvEfukMHXBcS/2OW
 P6pyzHQt9M2TpXg8Ybbt0sKU2Z40WaMk7Cy4hv31KAAAv8Xec3Mal4PMqcGX0RbprlbV
 Mn1el2BNiS4dZZIDVckvcRsXzQDzbGx5jyeOumciQlHbPSXsImDPXuoc6gl1CIeO9uU5
 QGjKTXOMaXmeNt/TvVeUfQgUghMNZjU4eUDDVAhphWobNVOQfjaNttw30cCdFPQY887f
 +EUoJBbRFQQfuUFPLhfqpuoLahg2kfZSz2vNc4sRVal6CwUU9QOqvlOiWltEbSca/tI8
 YkmA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cWDELTdifs/k8pvEYvCOsYsnpK3am7NYdnA4gb3VMjaaIL/IZIAxd3lvzjEruxYF9L9BpKRw6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFFpA5OHzP3nUNsa5MRn3SBEXzaJ/F3DrVn0TleWYDXH+hSYL2
 zxtiHCUTxIk2Dp9yW7/0BxmKYIpNlaK2Y7i4kMoQ/2zfQSSbkIqEisGCzqXX1LN1
X-Gm-Gg: Acq92OGXr33ImxFcRzuRLQDwHzMQIjcl8XRZPQHPZzwMJpkgrwMCpAZBaU9Qqq8+Trn
 R3A1AifLvJ3KTgY/nrfqFZQMUc+0ONwbEoG0uTbZpWwcXztQvAP7Fp0hDmOHuW7LjzBxiaO3NMd
 ox4tUXijofrW+JMP/kKHMCl3DtfCVaCWEXaW2Rdr8hgjlQ4ffXTTWCDDdILC7dRCWcXLws6n1Hp
 MUMIU3GxwV5q7xNS0gv2Pmqv5BOw0SymEGFNGKcaOtYv/BkRp9KT9l3/33ovrza16kris/UXT7E
 eQaiiCMWF9P0VTZEVmqTbRh7f+hGmILQQJAkwuhwkvLZcGG6P+FgOQDwaD9iioVT8TJWxWKkvuS
 hg/HxmfboumTic42O3Bu+wRJjVP4VMt0iLBYkjXwulkMk4sl7vR5qfse9Ddgc9ybX3FUjZgKjwU
 8Ry1pxEQSeLYUUNXI9Y99RAPV9bcAR+dTs28/fq9QyuIjiwhOWtDDDpcCVJymGimGbS1tsZYUux
 g6y
X-Received: by 2002:a05:7300:a889:b0:2da:1874:f3bd with SMTP id
 5a478bee46e88-304eb1f5cefmr1222862eec.16.1780056363462; 
 Fri, 29 May 2026 05:06:03 -0700 (PDT)
Received: from [192.55.54.47] ([192.55.54.47])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed578c48sm1188112eec.20.2026.05.29.05.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 05:06:02 -0700 (PDT)
Message-ID: <6539e62a-966d-44f3-b83c-962be090d4fc@gmail.com>
Date: Fri, 29 May 2026 15:05:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 17/25] lib/kms: Add helpers to query
 igt_format_mods
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-18-ville.syrjala@linux.intel.com>
 <20260513031759.27394-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260513031759.27394-1-ville.syrjala@linux.intel.com>
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

I think those new functions here would need some small comment block 
above them since they're in lib and not static. Otherwise they look all 
ok to me.

On 13/05/2026 06.17, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add three new helpers for igt_format_mods:
> - igt_format_mods_has_format_and_modifier()
> - igt_format_mods_has_format()
> - igt_format_mods_has_modifier()
> 
> These should be useful to some tests, avoiding for the tests
> to iterate the igt_format_mods directly.
> 
> v2: Fix _modifier type in igt_format_mods_*()
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++--
>   lib/igt_kms.h |  8 ++++++++
>   2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 75f7ca2d64e0..96fc7837b783 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6285,8 +6285,8 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   	}
>   }
>   
> -static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
> -						    uint32_t format, uint64_t modifier)
> +bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
> +					     uint32_t format, uint64_t modifier)
>   {
>   	uint64_t _modifier;
>   	uint32_t _format;
> @@ -6299,6 +6299,36 @@ static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods
>   	return false;
>   }
>   
> +bool igt_format_mods_has_format(const struct igt_format_mods *format_mods,
> +				uint32_t format)
> +{
> +	uint64_t _modifier;
> +	uint32_t _format;
> +
> +	for_each_format_and_modifier(format_mods, _format, _modifier) {
> +		if (_format == format)
> +			return true;
> +		(void)_modifier;
> +	}
> +
> +	return false;
> +}
> +
> +bool igt_format_mods_has_modifier(const struct igt_format_mods *format_mods,
> +				  uint64_t modifier)
> +{
> +	uint64_t _modifier;
> +	uint32_t _format;
> +
> +	for_each_format_and_modifier(format_mods, _format, _modifier) {
> +		if (_modifier == modifier)
> +			return true;
> +		(void)_format;
> +	}
> +
> +	return false;
> +}
> +
>   /**
>    * igt_plane_has_format_mod:
>    * @plane: Target plane
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 2f4526407aa2..037defa63657 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1204,8 +1204,16 @@ bool igt_connector_event_detected(struct udev_monitor *mon, uint32_t conn_id,
>   void igt_flush_uevents(struct udev_monitor *mon);
>   void igt_cleanup_uevents(struct udev_monitor *mon);
>   
> +bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
> +					     uint32_t format, uint64_t modifier);
> +bool igt_format_mods_has_format(const struct igt_format_mods *format_mods,
> +				uint32_t format);
> +bool igt_format_mods_has_modifier(const struct igt_format_mods *format_mods,
> +				  uint64_t modifier);
> +
>   bool igt_display_has_format_mod(igt_display_t *display, uint32_t format, uint64_t modifier);
>   bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format, uint64_t modifier);
> +bool igt_plane_has_modifier(igt_plane_t *plane, uint64_t modifier);
>   
>   /**
>    * igt_vblank_after_eq:

