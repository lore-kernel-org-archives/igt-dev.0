Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6470C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 11:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E8810E35B;
	Mon, 17 Jun 2024 11:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eoApkcua";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F338B10E35B
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 11:16:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so26284075e9.1
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 04:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718622977; x=1719227777; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=T5sIdE6g+DDeu4I7IG5oz9Jns7/rbwGYd0F2j1c72i4=;
 b=eoApkcuaJP9e+EZnxAv/qRbHl35TFEsoSvrRu7+8vtqYmzF4F2vX4MY4T0HULQ7SIl
 hXcBmEMICE0oY6s2yupOV/y6LqdCUkmJen9HXq/WQP6gcWEIhPJTMHMEcfzUlohOkSDB
 PyLd9cToTDoO/s8unLezlbGTBzNKtLGKmEMov/CeKIumpzt0JFk7RiAVlB2FGJxfjOkk
 hdlLCdO1HqqxkXPADvBHZyN5dGMKN1KURiu98L60HHfS5qsT9DsPd3K13lo5zZA3UbNv
 WA56pygFyQXLScEz4Ctzjhi6874eW2qUK7eRMuUmdTHDUa8HzJoh+C/ZCC8im5efTLtP
 nf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718622977; x=1719227777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T5sIdE6g+DDeu4I7IG5oz9Jns7/rbwGYd0F2j1c72i4=;
 b=hwWzXUZTyAEEUplXLHw0LYXgBtY+9CSVtrbT722mjoo99COzEU+U2yOICv+Mvpv0W2
 pcOqqN/74yOUQYaY7pPlV2aYxRFOKITIfD6ZTjeMfl7sBD7ZqtkQfx2mWiVoIxfL21Nq
 uvwdrFcL8epcYA8pCzEUwyayWKbFn1VkTfcQJLFAt7Uh7k4egq/o2uAL2/Be7BSjGA1s
 72hFEpvVCfbpIRO9mjNgsF8WbTNIGCxBTleGmw8Mp3Lk0rN8QQkRcmq1O0p+XomJFTxp
 RrBaI4LZngxcv57vFvoolmwqonTCIeHFAYz7ndfF5nvJb4LLFebZT7W9TVIhZ4Cyoc1L
 cMpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJuaVaa6lXV2byJjd5DAjcRpjoIIhTzwnH60gFp6iL/d04jYrEiuLEHGx0/mZOa82Cm47hxeNNb11wYmzxa8NQT8pYmAZ69ElIvu7I8g==
X-Gm-Message-State: AOJu0Yxqv1NRKpmAz9Ri6lppHRYPHdVPZ39t/vO7KjJZHVj8JX/Biew/
 g0DbWtEg8EDSbWB9t9T0mKY9wvMgYwZ4+6bh6yuagM7O+Rjr9kCJkNSEJWI+
X-Google-Smtp-Source: AGHT+IGqaPgFwYifngmAof1sbxiJKDeFeRFlE8oHwLQlOZyZorRCvuyFHzK4KWHfg8bGK0myzfNDGw==
X-Received: by 2002:a05:600c:2197:b0:421:dad7:45cc with SMTP id
 5b1f17b1804b1-422b6ec4a72mr128352915e9.5.1718622976840; 
 Mon, 17 Jun 2024 04:16:16 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4229207d1a7sm115506945e9.1.2024.06.17.04.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:16:16 -0700 (PDT)
Message-ID: <3d1d379c-1405-49ca-9bcf-16cdb99a9fb7@gmail.com>
Date: Mon, 17 Jun 2024 14:16:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 04/12] lib/intel_bufops: Add Tile4 in linear_to and
 to_linear helpers
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-5-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-5-zbigniew.kempczynski@intel.com>
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

On 27.5.2024 10.33, Zbigniew Kempczyński wrote:
> intel_buf_to_linear() and linear_to_intel_buf() allows easy tile/detile,
> only thing they need is to select appropriate implementation. There's
> missing switch for Tile4 so let's add it.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 30ba2547dc..56e37d2da7 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -804,6 +804,10 @@ void intel_buf_to_linear(struct buf_ops *bops, struct intel_buf *buf,
>   		igt_assert(bops->ys_to_linear);
>   		bops->ys_to_linear(bops, buf, linear);
>   		break;
> +	case I915_TILING_4:
> +		igt_assert(bops->tile4_to_linear);
> +		bops->tile4_to_linear(bops, buf, linear);
> +		break;
>   	}
>   
>   	if (buf->compression)
> @@ -836,6 +840,10 @@ void linear_to_intel_buf(struct buf_ops *bops, struct intel_buf *buf,
>   		igt_assert(bops->linear_to_ys);
>   		bops->linear_to_ys(bops, buf, linear);
>   		break;
> +	case I915_TILING_4:
> +		igt_assert(bops->linear_to_tile4);
> +		bops->linear_to_tile4(bops, buf, linear);
> +		break;
>   	}
>   
>   	if (buf->compression)
> @@ -1942,6 +1950,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
>   		}
>   		break;
>   
> +	case I915_TILING_4:
> +		igt_debug("-> use SW on tiling 4\n");
> +		break;
> +
>   	default:
>   		igt_warn("Invalid tiling: %d\n", tiling);
>   		was_changed = false;

