Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9430CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 11:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5209C10FDBE;
	Fri, 29 May 2026 11:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M0+j884g";
	dkim-atps=neutral
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18DD10FDBC
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 11:33:34 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-304ddfcf72cso1573301eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 04:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780054414; x=1780659214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PJV9CiW4vOFvNhFbj+eg9P1B3ypcTy2RXxrIdC6PrSk=;
 b=M0+j884gZBU7mG8/tg/qTncFGm3MvZ2YDUNugfGrISGTtRUX3xXS5+tzjk8VWzfaID
 RcNyGBJltsRaFeSgS8UZMV+MCOGnm9T4V4CIN4Z7cm24RZzX3iboG1Mc2zbqBQdvkci1
 FJRb+poEUq3xo2SheQTbPO9y81DElcK1GapAtMAOFi9hH0WynqYoHTxfIvOcheKcEcHH
 vaVYaqGin/6lJTVM3ZiP+LkDZ5H3G+rLPSlWgHeTHbZ1JMayuSY3PF3vp4muMBzuRcEc
 PoFbklHAodPv69sgKqKR3wb2cg1cD+LoRRlGT6pp+lR5KdyznFB8sASyoGV7TiN4Iswj
 aQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780054414; x=1780659214;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PJV9CiW4vOFvNhFbj+eg9P1B3ypcTy2RXxrIdC6PrSk=;
 b=ONYPJl9z0+Ov+nJRXgncGnxKTMhw65mkdGRVsl65jIIIIfZmJNANadnJxMvoBY1jE+
 YJ5ypoKIVgI2RmeDxXaETwjA91IjuHPW/V055YJxDK5bUnCGkZMP8z2OAtq292ESWvMS
 rJH8KqOO44o06erBf9UKOTAFsOTFgiJFW/UnRmIgfXh6l9T83CO8lIf3W9Az+RAXcBu0
 XzRN2leiQ90tyjytYsaXJWs7mY5b5iLc5FPVXShoB5aFu3MhuOcyljg92hW15zvPPEy3
 2JRCRzjcb4RFITtxY12IuUkr7wIbdNhNPZPJsEefYKFX4dKMV405GDLFjIs86oER0odk
 tI4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9BZJm7RqzAeQyWOAYeYjL7Q/pgbxNsiy2zcaz64ZuGKTHszNoeKUVqc9pHcGl1Pfu1Xeep2ppO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN2NJ7k4HrSBi82ZhlYMi5JU4LSHBdLFY3JpKVSleZ5Cv3rQb+
 sapQ3uZrN8epl3Img/gfcv86r9NmbhJnjbBoZf/iSvCG0TeaVp0NTDcLboUoFR1y
X-Gm-Gg: Acq92OE8lRa1B1Z9HbNbahhzGQfsS+3ATYxKx3J2xqlGsFfJyoQ6k+xhfILO1UBEDZj
 ShlPG02BNTY0WSL4XznM4huejGlLwVmWD/HL1JQ6rl77WclzFc4aUSYP9jKp8NxySkBEwsX/Ul8
 sFU0QpajFqE3V4Xw0GY1OOKQUWeByr+m+hNFj/pcHUS3F97tZf+6XLjlm3EtRkTSGL2GxVGs7NP
 g2zNA6LaNv1Q+UMOwbm9K5YuU98lot5o1rMTkiMdez/v2dSnmfBzoYdsnVkH1uHu3M6O5/NMcbr
 E7KhuzPk42rKp6yI/62h9bWGRwZMrn2IyI9yjvnT596PXadyafpeMy4QepLOYwsS1cvthDwkU6l
 fCs7Y0PEyVaptGPFrHztEZBt70zDh6S60bFOL54LVXlp7ADyqKiHlEjnNhDT8v+kyu0YjrjXCbA
 x7tT7gYrfI+hEAs8zK4rzaJ4CnoQNk+LMf2repbTHhmmAiaENl/Gclnu1O8DzpwUsWJws17NMmp
 41O
X-Received: by 2002:a05:7301:4186:b0:304:7a67:6104 with SMTP id
 5a478bee46e88-304ead93de4mr946307eec.7.1780054413954; 
 Fri, 29 May 2026 04:33:33 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ee0dd8e1sm1195935eec.21.2026.05.29.04.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 04:33:33 -0700 (PDT)
Message-ID: <d08b71b2-fdb1-44b5-9ebd-15fe36fd4024@gmail.com>
Date: Fri, 29 May 2026 14:33:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 08/25] lib/kms: Pass target format_mods to
 igt_add_display_format_mod()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-9-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-9-ville.syrjala@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 12/05/2026 15.21, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Generalize igt_add_display_format_mod() into format_mods_append() that
> can be used to add a format+mod into any struct igt_format_mods.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2a4e91d9ed7e..f1a783aee6dd 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6317,21 +6317,21 @@ static int igt_count_display_format_mod(igt_display_t *display)
>   }
>   
>   static void
> -igt_add_display_format_mod(igt_display_t *display, uint32_t format,
> -			   uint64_t modifier)
> +format_mods_append(struct igt_format_mods *format_mods,
> +		   uint32_t format, uint64_t modifier)
>   {
>   	int i;
>   
> -	if (igt_format_mods_has_format_and_modifier(&display->format_mods,
> +	if (igt_format_mods_has_format_and_modifier(format_mods,
>   						    format, modifier))
>   		return;
>   
> -	i = display->format_mods.count;
> +	i = format_mods->count;
>   
> -	display->format_mods.formats[i] = format;
> -	display->format_mods.modifiers[i] = modifier;
> +	format_mods->formats[i] = format;
> +	format_mods->modifiers[i] = modifier;
>   
> -	display->format_mods.count++;
> +	format_mods->count++;
>   }
>   
>   static void igt_fill_display_format_mod(igt_display_t *display)
> @@ -6357,9 +6357,9 @@ static void igt_fill_display_format_mod(igt_display_t *display)
>   		for_each_plane_on_crtc(crtc,
>   				       plane) {
>   			for (int i = 0; i < plane->format_mods.count; i++) {
> -				igt_add_display_format_mod(display,
> -							   plane->format_mods.formats[i],
> -							   plane->format_mods.modifiers[i]);
> +				format_mods_append(&display->format_mods,
> +						   plane->format_mods.formats[i],
> +						   plane->format_mods.modifiers[i]);
>   				igt_assert_lte(display->format_mods.count, count);
>   			}
>   		}

