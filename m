Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E94DC2BA18
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 11:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCF910E359;
	Mon, 17 Jun 2024 11:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WNviwTpj";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8617410E359
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 11:16:52 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-35f1c567ae4so3263860f8f.1
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718623011; x=1719227811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zNHelrPfBnjFjENa6YRdULm0peyuPzCP4JyiJFuRusY=;
 b=WNviwTpjoT+UDUv5OrdjljODiFrek2oxf1aF3iPd55gxpjni4iqT/rqKhTMKj4RM4M
 emFdHdBvDoNd4oJuSQ3cwHR0aoIMHuxH26qzHh/HaeHHWfpqfo147hbuH1pJqMULHmgr
 5s5lDjKxuSBTO1kmWigFxdNnOiCVz23bbyJtyNgyOHoMx62XKoNwGwCi2mq8ESd+/D1P
 hE9IW429TXxbCOLydOlCuNuQGGYz+oitnidFfcMWsxzHGovuIfyy2i2DG8z2tRrc1PkH
 JkVgS68zfeyounN4J3bKGzY1y2mHnrMYioy4B1z4pgOrj7lpm9wOoQctdvr3XAlLMtAt
 aHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718623011; x=1719227811;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNHelrPfBnjFjENa6YRdULm0peyuPzCP4JyiJFuRusY=;
 b=Pr7zBG7X0d0tYLsjer5IFIEjmKIJet+lV1fMAF7mgAAf4Cci5dYm/Amg3JfdRB+Ruh
 4jiZYQwIxW1YLTDZ0tjtEQJ9LH5v1c7II2gXdf3dn29tAuK5oRk5VrFEUm/Wy99VgL98
 0KWwYX6FY4L1myb1896A6409jazHbclYb0uDB28WKNrwxR1sp/RmZ7YnOnoUvayjZ3/U
 8KINRquJn3DTT6OUYxVXGYGYpAlxvaCaPT/qrTmKSAVpi+Uc2rrT2ggbwVm25h0zpBih
 HtdKS6K8DoFFYa3KzCpSwEBmqJA+3Mv9uRmy448S46ZeUkFaVPoflfwrCrBv6W/sgIe7
 NUZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZBFo1J2UGQP3HmJAzDpQ1g8em9vBUwi6zxIuF2P2KBFDawcXofF5sSR7Ll0jf3Is8NR5ewdYvUrVRjP0+odWgYH1a3YH6s+3+dJLgkg==
X-Gm-Message-State: AOJu0Ywy4ws77GibxiwLB+oO3LgjEkpuKUccdambqOvSW95ULzRZqe7I
 jBDP8hkFf8lQ8TgbK+r7IPwlSdBsfsbCSpjC9j0qpRFmGVUvTdsE
X-Google-Smtp-Source: AGHT+IG4fDQw0ubu6P+MtUftln0bQlLMQrWb6B653YOzq39OsQlW2bUYdG74Ew4mOdp50DMSp98eQA==
X-Received: by 2002:adf:e68e:0:b0:35f:24d9:5c58 with SMTP id
 ffacd0b85a97d-3607a788a7fmr6627268f8f.60.1718623010670; 
 Mon, 17 Jun 2024 04:16:50 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3607509c8d8sm11663613f8f.32.2024.06.17.04.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:16:50 -0700 (PDT)
Message-ID: <6e78efd2-f0cb-4789-bec0-563b716cd13b@gmail.com>
Date: Mon, 17 Jun 2024 14:16:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 07/12] lib/intel_bufops: Add Ys tiling in linear_to
 and to_linear path
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-8-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-8-zbigniew.kempczynski@intel.com>
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

I don't think we have anywhere in kernel Ys enabled. I suppose this is 
just for your tool use, hence

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 27.5.2024 10.33, Zbigniew Kempczyński wrote:
> To iterate over all tilings we need to have each case addressed
> in the code. Add missing Ys case.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_blt.c       | 3 +++
>   lib/intel_bufops.c    | 6 ++++--
>   lib/intel_cmds_info.h | 1 +
>   3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index d1200ca862..20c42eec14 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -540,6 +540,7 @@ const char *blt_tiling_name(enum blt_tiling_type tiling)
>   	case T_TILE4:  return "tile4";
>   	case T_TILE64: return "tile64";
>   	case T_YFMAJOR: return "yfmajor";
> +	case T_YSMAJOR: return "ysmajor";
>   	default:
>   		break;
>   	}
> @@ -582,6 +583,7 @@ int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
>   	case T_TILE4:  return I915_TILING_4;
>   	case T_TILE64: return I915_TILING_64;
>   	case T_YFMAJOR: return I915_TILING_Yf;
> +	case T_YSMAJOR: return I915_TILING_Ys;
>   	default:
>   		break;
>   	}
> @@ -606,6 +608,7 @@ enum blt_tiling_type i915_tile_to_blt_tile(uint32_t tiling)
>   	case I915_TILING_4:	return T_TILE4;
>   	case I915_TILING_64:	return T_TILE64;
>   	case I915_TILING_Yf:	return T_YFMAJOR;
> +	case I915_TILING_Ys:	return T_YSMAJOR;
>   	default:
>   		igt_assert_f(0, "Unknown tiling!\n");
>   	}
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 36b9aa2a8c..38b720624e 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1697,8 +1697,6 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>   		bops->y_to_linear = copy_y_to_linear;
>   		bops->linear_to_tile4 = copy_linear_to_tile4;
>   		bops->tile4_to_linear = copy_tile4_to_linear;
> -		bops->linear_to_ys = NULL;
> -		bops->ys_to_linear = NULL;
>   
>   		return bops;
>   	}
> @@ -1956,6 +1954,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
>   		igt_debug("-> use SW on tiling Yf\n");
>   		break;
>   
> +	case I915_TILING_Ys:
> +		igt_debug("-> use SW on tiling Ys\n");
> +		break;
> +
>   	default:
>   		igt_warn("Invalid tiling: %d\n", tiling);
>   		was_changed = false;
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index 6f7d655083..7960e0412e 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -14,6 +14,7 @@ enum blt_tiling_type {
>   	T_YMAJOR,
>   	T_TILE4,
>   	T_YFMAJOR,
> +	T_YSMAJOR,
>   	T_TILE64,
>   	__BLT_MAX_TILING
>   };

