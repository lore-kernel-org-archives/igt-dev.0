Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F85FCD6E4A
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 11:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3565410FDF6;
	Fri, 29 May 2026 11:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dMQdrVd8";
	dkim-atps=neutral
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF4410FDE8
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 11:51:08 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-836ebdeb969so6126587b3a.3
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 04:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780055468; x=1780660268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0LtP4SV1ypVcvHy16Q+pAGub9jxWtj8QEOdQuOEGido=;
 b=dMQdrVd8saDi7VJ+WQnq4oHA06Kj3/CKeYseKnwXuUEGrOziWTlylNQsRYzszZo2Pr
 y7owQyc+CiUXQBFAq1gjdeEcmSHgcWL/DABEW9DkMp6xuYfRV03NyXzhDNgEK6AAzyQd
 0/jpTmUbviTpowXN8ORSjRI5Vr50toOmwKz3wrRoK5aDletDS/mgr6CDjc69WmZfWJaK
 gRwLKyKwPHKZTQXm4Wtzk4O33USJm7XkK7Jj8sG+RK8kO/TtCtEHfPSIld5ldC4+kMPY
 Api98/rtXCIIL744qCDZjEd6yRd8GdmrJGE37jdpeNBZJ+1p83ShwOw+a+DJ6JkcWptM
 OcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780055468; x=1780660268;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0LtP4SV1ypVcvHy16Q+pAGub9jxWtj8QEOdQuOEGido=;
 b=mLicW5F9YSw8Qocci3Rc5NtQO+5R0gx5Q4ZNeHwb0yvI4O0+T/OgRmaOUp096DUebA
 5MO7apWeljCiTsecbDMliUunaucV/kxv5Mo3yDTN2nrrQuYjfDchRlANfGRuPj8BtOuZ
 IWf79ZyZF4Ms/RQ2IxxlkEDBUOkREOkk3gMpBZVe8jSVYfEsCqdLaqNdNxTCkKxsZlv9
 B+7Yajos5I0gv8iN+YN/Ccb4pFhJTEb/GpVTOr5rlOJUpZMQqqwR1MnZUNLct8+ys7Vm
 UockUr7GiduxklIThoZo7SHRncBUiIGFayinSCG9aHNDMa70DNSivZ61iFugHjy7hF3s
 GcQg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9X3VxZUW6PvxpQpV63LmXBOrxad0FurH5unDxicirZfLm6EsOfyt62jT3ac0pjzgHMPLIp4pkf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdEOPKdFosNLSct3L8+MZmCaX1G4DWhfE0JmxJuAVedOKP5aEQ
 Ikxxx6jGhmUt9vtK0Z1mD1bFWWVv2omQJ76/4Td/22lEeJ7Ibc16jP+jb45Rra5B
X-Gm-Gg: Acq92OH5DJokrYnOd0K92cc24ajTiAUY38FdP+ZVfroTgwjuVfKYz6fsEYVnzSmU/td
 SBNvWZ8xG89xvCCB8SjpjqGA2ILQBs+fylqLMLQjQrhRd/uC4Jct00dKdyRfl7gs1EuOE53gpAN
 NQu+s5MtIZXl8Y9/BiMuM85GjUXW11twgN9HCsvhxPag9G5VOZ79ghbe5QCvVFxzDBHRen4ccyx
 FwHqIYyfVkdMqj8IbEDUFqv0883hdeRUZ4cRS+5Fw8bB9LzW6D2s/s+ONia9F2OBtfcDz8EF+WH
 UQl+azb1QJpxxTJFn5GDhdCxuhFhYNPO6HB8yFvUQzunnMegpUGnSsxvFFA2nufK01dsObd4aEo
 JLcypFsPpV3XBD0ayq9pV1oh2qNdXlZNMHY9kVMh3YF1OsEwNgg5fG8gpbVh2d1DVzxAIZ3XqZk
 X6XtqhfnM7y4R7ZYVMLtc8iI5PA2N65fRj25FVlbAXPsR9gUjpaZq0V5lOWF7cH4k9XnTAGc7Cx
 kO7FCQRcAiMl4x0qYj0
X-Received: by 2002:a05:6a00:806:b0:841:dc8d:807a with SMTP id
 d2e1a72fcca58-84212d7f4a6mr2907592b3a.39.1780055468173; 
 Fri, 29 May 2026 04:51:08 -0700 (PDT)
Received: from [134.134.137.76] ([134.134.137.76])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84214d01657sm1742180b3a.59.2026.05.29.04.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 04:51:07 -0700 (PDT)
Message-ID: <3ef68e7d-15a0-43ae-b3d0-abdcb3752d74@gmail.com>
Date: Fri, 29 May 2026 14:51:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 12/25] lib/kms: Make igt_fill_display_format_mod()
 more flexible
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-13-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-13-ville.syrjala@linux.intel.com>
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
> Currently igt_fill_display_format_mod() is hardcoded to operate
> on display->format_mods (and its plane counterparts). We may
> also want an async flip counterpart of this. To make that
> possible adjust the code so that it can operate on other
> igt_format_mods structures.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 34 ++++++++++++++++++++++++----------
>   1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0d604bc76910..dc3486a795a4 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6327,7 +6327,8 @@ format_mods_union(struct igt_format_mods *format_mods_dst,
>   				   format_mods_src->modifiers[i]);
>   }
>   
> -static int display_format_mods_count(igt_display_t *display)
> +static int display_format_mods_count(igt_display_t *display,
> +				     const struct igt_format_mods *(*plane_format_mods)(igt_plane_t *plane))
>   {
>   	igt_crtc_t *crtc;
>   	int count = 0;
> @@ -6336,14 +6337,15 @@ static int display_format_mods_count(igt_display_t *display)
>   		igt_plane_t *plane;
>   
>   		for_each_plane_on_crtc(crtc, plane)
> -			count += plane->format_mods.count;
> +			count += plane_format_mods(plane)->count;
>   	}
>   
>   	return count;
>   }
>   
>   static void display_format_mods_union(igt_display_t *display,
> -				      struct igt_format_mods *format_mods)
> +				      struct igt_format_mods *format_mods,
> +				      const struct igt_format_mods *(*plane_format_mods)(igt_plane_t *plane))
>   {
>   	igt_crtc_t *crtc;
>   
> @@ -6351,29 +6353,41 @@ static void display_format_mods_union(igt_display_t *display,
>   		igt_plane_t *plane;
>   
>   		for_each_plane_on_crtc(crtc, plane)
> -			format_mods_union(format_mods, &plane->format_mods);
> +			format_mods_union(format_mods, plane_format_mods(plane));
>   	}
>   }
>   
> -static void igt_fill_display_format_mod(igt_display_t *display)
> +static void display_format_mods_fill(igt_display_t *display,
> +				     struct igt_format_mods *format_mods,
> +				     const struct igt_format_mods *(*plane_format_mods)(igt_plane_t *plane))
>   {
> -	int count = display_format_mods_count(display);
> +	int count = display_format_mods_count(display, plane_format_mods);
>   
>   	if (!count)
>   		return;
>   
> -	format_mods_alloc(&display->format_mods, count);
> +	format_mods_alloc(format_mods, count);
>   
>   	/*
>   	 * Initial count was an upper bound and may include
>   	 * duplicates. The final count, without duplicates,
>   	 * is determined while filling the arrays.
>   	 */
> -	display->format_mods.count = 0;
> +	format_mods->count = 0;
>   
> -	display_format_mods_union(display, &display->format_mods);
> +	display_format_mods_union(display, format_mods, plane_format_mods);
>   
> -	igt_assert_lte(display->format_mods.count, count);
> +	igt_assert_lte(format_mods->count, count);
> +}
> +
> +static const struct igt_format_mods *plane_format_mods(igt_plane_t *plane)
> +{
> +	return &plane->format_mods;
> +}
> +
> +static void igt_fill_display_format_mod(igt_display_t *display)
> +{
> +	display_format_mods_fill(display, &display->format_mods, plane_format_mods);
>   }
>   
>   /**

