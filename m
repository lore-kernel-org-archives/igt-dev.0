Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6ECCF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 17:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E95D10E0C2;
	Mon, 23 Sep 2024 17:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CdscihCn";
	dkim-atps=neutral
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8083210E0C2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 17:30:37 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so89897766b.1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727112636; x=1727717436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CztOl8ZlTHnPEs7iLuxzshsaKyYRtO/Xz/Ttn8uc8qY=;
 b=CdscihCn3OEvd68irKrG+LPr+aewRIDMzrPlJwXAnP0qy5vwa5YqfUzFMY8Bloykz7
 UNyiAhVWAxXvrFU4oF1WuSsQQqQtJpD4DLOYSiDgWaxrOLaA5to4W8jHDvDuzTljDayH
 aO0K1V8Z2E6lW5exQDfAYA2cruLaRxNVlf9TqR+t9plB4NqSUIZ2+rLLUJlmRxd7//0b
 UBMj/uin9dunSYS8j6CBnbLmzsknfCwxv50MN0kozlJyUlrmsBqNmQuF2gI5Guy6Ufo3
 Ck159M64iIC1bMLF4VPx157cl41KGYco0wXobEk5bH1YgCEdIW/DIpIhIp0y7LePmFwj
 lr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727112636; x=1727717436;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CztOl8ZlTHnPEs7iLuxzshsaKyYRtO/Xz/Ttn8uc8qY=;
 b=IwYdnh0UQcli8m86tlNtuUtJt/hYpXCB9cz8Jod2WzqVs6Ri5U9Hgcb0lkCHvNBhlm
 B2sVJrD8Xr+NSpT1tVUbXUsAr5Rz1RZMnsqUF/sAbn/ft68/E2NwaBtM7/mD91x5E1F6
 HuVJaIB1YqQFkJAlJm26M2sr98+jev8Gfut0gGAvTmc5U1sGQg9bwAw1KPr7nIxt7h3c
 cxcNu9qIEsrCLfZv8q/5OW0Xn8QvBpdYuZASVc3oYEWVqoo10nIvF/fomnrd/Z1lR6d2
 lsjBzGj8NaGsvwSo1uPjhBUhZ0ne6PwoJkB9MSlzzlEdy1PobFE9YIVT7BB245/Pvwv1
 XQNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBx5QWV+ZfS6bm8UevnngjFVCVcgRPEYQvq0/XbV2HczlPsdefPR1G9zAyZf98j7ZUZniZxTgN@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8RPLLPa4zY2DYRMGycP+zHBK3SVsgRqqICxkPC2m9iOdus/xT
 qFLr3mZBUr3zt+JSYtETyZZ4kFH2B03Io6TIdh68u5Igc4jOffaK
X-Google-Smtp-Source: AGHT+IHAzxyE5AitSTtdrS0TWR4kE+2nJJU913rhWhpy7UvLAbKbKe1pVXw5o1MnDn+9cS59n57DSA==
X-Received: by 2002:a17:907:7216:b0:a8b:58e3:ac1f with SMTP id
 a640c23a62f3a-a92c482d174mr50845366b.12.1727112635776; 
 Mon, 23 Sep 2024 10:30:35 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.74])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a90612df789sm1254921766b.158.2024.09.23.10.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 10:30:35 -0700 (PDT)
Message-ID: <a0a3b85f-d1b4-4a9c-8e67-4cd647ecab57@gmail.com>
Date: Mon, 23 Sep 2024 20:30:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 18/18] lib/intel_aux_pgtable: Pick a more optimal
 aux format for 10bpc
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
 <20240918120518.30258-19-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240918120518.30258-19-ville.syrjala@linux.intel.com>
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
> Pick the (presumably) more optimal 0x18 aux format for
> 10bpc formats. This matches what Mesa uses as well.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/intel_aux_pgtable.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index 8ff48641619e..de0740e950f8 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -23,6 +23,7 @@
>   #define AUX_FORMAT_ARGB_8B	0x0A
>   #define AUX_FORMAT_NV12_21	0x0F
>   #define AUX_FORMAT_RGBA16_FLOAT	0x10
> +#define AUX_FORMAT_ARGB_10B	0x18
>   
>   struct pgtable_level_desc {
>   	int idx_shift;
> @@ -304,7 +305,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
>   	} else {
>   		switch (buf->bpp) {
>   		case 32:
> -			entry.e.format = AUX_FORMAT_ARGB_8B;
> +			if (buf->depth == 30)
> +				entry.e.format = AUX_FORMAT_ARGB_10B;
> +			else
> +				entry.e.format = AUX_FORMAT_ARGB_8B;
>   			entry.e.depth = bpp_to_depth_val(32);
>   			break;
>   		case 64:

