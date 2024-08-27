Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D85C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 15:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6AE10E0F7;
	Tue, 27 Aug 2024 15:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jh7IXB1o";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B224410E0F7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 15:16:31 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-371bb8322b2so3050896f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 08:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724771790; x=1725376590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ROWBz0TVNAi4BVGL6mas+jR3pA+Yh1NaYuXYDoKhqEs=;
 b=Jh7IXB1ohhYKnehgQsC/5CiXDN1X/xTeOoVbEMamh/QoWwp/D9ZcF+v5PRbVFJmU9E
 w1i955iWyPWlxryEpgGh1aQ4bkzx/Wsn7WDRqblfhYFcVZe6BYeV6YZP3UutCaKIp8JR
 r0VFu0dQN6F7ih8kSKiGQhxGMJRQSQKtm1siQGt4MkNZgmoafMnJowl8d810echhKwGT
 on5dHmeib/PYS0Fvft41iSIibUBlKO/vCB6ZvBHEXdS9b8HynqCJXwERjlviuMUYiMND
 ocSvCmxh6UOVonTwWkYLGI5XGPYpHy7zOO3ruu6t9XQtF23nCu9bej2gYIf0IIy/XCaQ
 Mecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724771790; x=1725376590;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ROWBz0TVNAi4BVGL6mas+jR3pA+Yh1NaYuXYDoKhqEs=;
 b=V57b0pr8vosbnpDak+4A/tWnLk1Hiy2YBW/ug4NWepY0OZIXaY/B+i01BYf2MuyVS0
 u1J4UdQYA374vh5Sfgs+m1IgIdtHi5X9satFUr/vqv2LpRKdF7AczctQVMOZlhekwSMs
 pxD86Ti45E8PWrMh002kfscoWXILh0VBn+45RT4VSokL7gKEZEQM5v7xYVrvsbTugvPo
 YzNGVJQD7x7p/rBlSxPD4jZw1WaUqN9eDuATo/SgY+I/K8MAlTejJz+veruHnWwF5LWX
 wyngm6hACK24QMPXsXw5Niw2CCE4TTOT83dHt4OaSHbUXf5MdX4QxRIxWtVVk86dUOa3
 vNuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9x24Kher0i70NzxSghiNfABU49+EZz5gP07lZZuHq5coWG3en1bkTtYp80Y76TlqyNXWHwC6w@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylXJ8yIqoN+dRpm6tMh+mbNg5SMTorYzOybYUBwPg5IdSGJ2tw
 T1+seRf3uYBoMzrydHCN7ZboKHijoD2JcIVDe19L2gchmj0GfRw0
X-Google-Smtp-Source: AGHT+IHwLh1qPQJgbOIYFrLaQpDxdfwarnv3jOCJGpvO8dmr5WB/Sp1S7XePoeEbWBsIHOaZOaZKiA==
X-Received: by 2002:a5d:4884:0:b0:371:8451:5a82 with SMTP id
 ffacd0b85a97d-3748c8496d7mr2345449f8f.15.1724771789652; 
 Tue, 27 Aug 2024 08:16:29 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3730813c0dcsm13393495f8f.37.2024.08.27.08.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:16:29 -0700 (PDT)
Message-ID: <45e652e0-0fc6-41ad-bc61-cd70b58169ca@gmail.com>
Date: Tue, 27 Aug 2024 18:16:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/37] lib/intel_aux_pgtable: Library to add support
 for RGB16161616_64B format
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 "Lobo, Melanie" <melanie.lobo@intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-2-ville.syrjala@linux.intel.com>
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

On 3.7.2024 2.27, Ville Syrjala wrote:
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
> cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> [vsyrjala: s/0x1/0x10/ to make the format correct, note that it's for TGL+]

I'm feeling bit challenged on this s/0x1/0x10/ change. When looking at 
bpsec 43868 Melanie's original '1' look correct. Rest of those 
AUX_FORMAT_* match to what's in 43868. Then with bspec 43869 this '10' 
look correct but what will we get on MTL with this? I think Melanie's 
original kernel change was targeting for MTL hence this was not looked at.

/Juha-Pekka

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

