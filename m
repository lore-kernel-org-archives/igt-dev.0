Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B911CCF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 09:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A55410E3C9;
	Mon, 23 Sep 2024 09:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gA5TST22";
	dkim-atps=neutral
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED6510E3C9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 09:52:00 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a8d43657255so665049766b.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 02:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727085119; x=1727689919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/EidNMSEnYBmK6ub0ps44szmMcv8KFyutE/OvTbcjs=;
 b=gA5TST221SuHAHFS+uU0bGwuZlHZWEz4Lbao/qB5UMEiZwE0MPOvjqJf2GRulfsZFB
 SVA93Eb2oWTH/z2QpfEU9K6KDENdPNmMrLUnX1VnDtHKuvTCR6eY+zedbmWNOkJeKD0G
 W9Buc5QnngBeujnFXi3mwWJM6M7Aa1sgWb4+/cOlzprFII/yBwXYtUJLpiIsTLNH2ixd
 /rb6BYad8RYcvHABb7cdW6uyPn5SUKAEEDXT8HCXDz7i5fzp+4n+JY++IaKhIzSkJyLz
 to5X07Qf7n9fI9V4IRegK18fI3HanaUF6sKabgAredHummLxNcSkp51S4Okkx7mzZ2VS
 rnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727085119; x=1727689919;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z/EidNMSEnYBmK6ub0ps44szmMcv8KFyutE/OvTbcjs=;
 b=iH9NQfKqbl+QqsvGLhAvuFVJ7N0+WiNNiR4X/035AHB3lQpPb5Y5R6z2YM2+U5SywH
 RlNoM2ccEJfBAAIy/KcL7zMyJR/OnAu2E1tAxvbxAvKdxaOkF2YjWcBZ8tCvzGTl0AlV
 hQBRdHn4If84k+ZeAFdmV+Bqa/Y8iZb1gQETdd7xyRhHC5GS+x2EL7swPkSYN0MqRby4
 wrKSRtODmaRh9AZjw53HMEHKelhXsg4khQ5WUOg0wrqDY2KRlg5CFESSmbu0q6diWug1
 cFqceCnGYR+6UXoFUm2jPm6A7du8L0PjLlqexxAKaIyBmXZ43p5toh7IBY06XN923vpI
 214g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPrX9QkdPg310TcFYVbmg1DJZjYGCzyjDHrksTRPr1m/ot062VTTzvvxmHWZONFYWp4Lx31u6J@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC7WmqHEeP5ZgJeNdgWFUEyd60Iz/3PAlpeSnl+W5W2z8HJmai
 jrCZx8LghP7iZ3chxc9SG7PTus0KO/AQmNw0r9QMc4wnRpwOxPVaNWIdAojG5c4=
X-Google-Smtp-Source: AGHT+IHw4M8IVKCKxS+9tJZ7GtH5JAMLhL+9b6maRZSP+q5UixC/NKXUl2UHpE7ECmmCoJTdvxAFuw==
X-Received: by 2002:a17:907:1c19:b0:a8a:86f8:4eed with SMTP id
 a640c23a62f3a-a90d4fbc65cmr1197251666b.10.1727085118851; 
 Mon, 23 Sep 2024 02:51:58 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.69])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a90612b78c1sm1191585166b.101.2024.09.23.02.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 02:51:58 -0700 (PDT)
Message-ID: <94856692-658b-4ff6-80b1-261863fd1d95@gmail.com>
Date: Mon, 23 Sep 2024 12:51:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 05/18] lib/rendercopy: Skip AUX surface setup in
 TGL+
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
 <20240918120518.30258-6-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240918120518.30258-6-ville.syrjala@linux.intel.com>
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

Took a while to realize why this didn't break anything but since hw 
agree it's all ok. I wonder if on the changed line this check
"buf->ccs[0].stride" is really needed, I think that happen only with 
flatccs which doesn't exist on <gen12

Anyway,
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 18.9.2024 15.05, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> On TGL+ the AUX stuff is handled via the magic AUX pagetables.
> Mesa code tells me that the hardware only uses that the
> SURFACE_STATE AUX stuff for MCS, which is of no interest to us.
> So just skip the AUX setup in SURFACE_STATE.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/rendercopy_gen9.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index b33e7fc9feba..719307e6f45b 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -261,8 +261,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   		else
>   			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
>   
> -		if (buf->ccs[0].stride) {
> -
> +		if (intel_gen(ibb->devid) < 12 && buf->ccs[0].stride) {
>   			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
>   
>   			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,

