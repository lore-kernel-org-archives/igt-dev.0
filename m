Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2F6CF9C5B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 09:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8F010E3C4;
	Mon, 23 Sep 2024 09:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XKLfswcA";
	dkim-atps=neutral
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A1C10E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 09:51:45 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so582360766b.3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727085104; x=1727689904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7KubEJHWy9aUtgvK8rSvpJmQSaJLHfZrjxVNYo56R6c=;
 b=XKLfswcALnbijF3aTq6tiVODCxA4z6T9a/jTUh0EON6keEZfLPk3OxndckEBsDXX1K
 22xle1WFdnH6QoEq4892334FHrMFm3Ezi8+InA13NBvcuppRANbIlLKHGtZj1FwBSu7x
 CSnFqNFInFvaA7bW9bcF4G6mqlwmLtRaSXV3+xoDOaABFSgRtGNy3i9hHL/SZ+X9hi/g
 CZzk9PGJzu2Hq//lyo7bRoZRIFrnrCCky0WkudA0XR3Hc5ZS9l8kdrW4eY5ztiG+rYfk
 xHrVbf2TMybf/KqdhMBjY13sh1BXWaK2C8n+RwUtiVLXx1BFWq4XOKzUpH41y77GbqBa
 vc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727085104; x=1727689904;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7KubEJHWy9aUtgvK8rSvpJmQSaJLHfZrjxVNYo56R6c=;
 b=NSNRCwNUhkBiqa6rPQf1j+28SAuTJV0X1VCkxuu8kVnQnCVXanYg+azFJorEQxvMVW
 B7+Zp6xKgGq0EmoBWGhQ/p/ETn04SMImUIXjNzECfVYP4O77YrKJGsklIiDl1PgMHTcS
 CIHR6wB8sn8xsh6nT8vQ1e0RrR28lYbLCPd2NnziSAtxqzPvMvdQMlyQ1kKDh4Bw1XZb
 rwVWfs9xFmL+J0pXA4Iuw+rcrxzgWGmIS8s0BKChWeSxYUUNIhsbWLloKG3iaIX6lxjM
 iIHUMmqASzzzKHrJoHfXd4Tx1SEbTNnM85DH8j8uczZ2o8v7FN34AW4mYgawMaXJaezZ
 /wqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC4GPThz5qVzTfa6++P/25LukYITe/hlphIbVJDbwMTwxjN2gRju3QEqjPuUWZKUAKpIzM1LeF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQSV3Ix0rGhu7E1yR9BFlfFXskRfvQo8svrtTfvSy7GsAz8+6T
 mHOR60+uYhJg0xNG4eHqNWQY3Usaqz40T5D/eCH1F9rEpjGB6Af5jOSruVk/P9Q=
X-Google-Smtp-Source: AGHT+IFjfZzL2rS0+MZzrVztDR3IHDcV+3+pvl3TQYLHHa8p62gdmHY0+a7W68hMji7oOuMZfTO+LQ==
X-Received: by 2002:a17:907:70c:b0:a91:158a:d975 with SMTP id
 a640c23a62f3a-a91158aeba2mr12723066b.65.1727085103757; 
 Mon, 23 Sep 2024 02:51:43 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.69])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a90610f427dsm1193619166b.54.2024.09.23.02.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 02:51:43 -0700 (PDT)
Message-ID: <2a6f730c-e1c8-40eb-860b-5852bb4292a9@gmail.com>
Date: Mon, 23 Sep 2024 12:51:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 01/18] lib/intel_aux_pgtable: Library to add
 support for RGB16161616_64B format
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
 <20240918120518.30258-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240918120518.30258-2-ville.syrjala@linux.intel.com>
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
> From: Melanie Lobo <melanie.lobo@intel.com>
> 
> TGL+ supports RGB16161616_64B FP16 format which is a binary
> floating-point computer number format that occupies 16 bits
> in computer memory.
> 
> This was tested with kernel patch,
> https://patchwork.freedesktop.org/series/124957/
> https://lore.kernel.org/all/20231201091133.23508-1-melanie.lobo@intel.com/
> 
> [vsyrjala: s/0x1/0x10/ to make the format correct for TGL.
> The original number was for DG2/MTL media compression, but
> for those platforms bspec says:
>   "Compression format from AUX page walk is ignored.
>    Instead compression format from Surface State is used."
>   so we can just always use the TGL numbers here.
> ]
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/intel_aux_pgtable.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index 3cbb0e26f35c..8ff48641619e 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -22,6 +22,7 @@
>   #define AUX_FORMAT_AYUV		0x09
>   #define AUX_FORMAT_ARGB_8B	0x0A
>   #define AUX_FORMAT_NV12_21	0x0F
> +#define AUX_FORMAT_RGBA16_FLOAT	0x10
>   
>   struct pgtable_level_desc {
>   	int idx_shift;
> @@ -306,6 +307,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
>   			entry.e.format = AUX_FORMAT_ARGB_8B;
>   			entry.e.depth = bpp_to_depth_val(32);
>   			break;
> +		case 64:
> +			entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
> +			entry.e.depth = bpp_to_depth_val(64);
> +			break;
>   		default:
>   			igt_assert(0);
>   		}

