Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABCCC54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963BC10E3DC;
	Tue, 27 Aug 2024 17:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jzvmp4xG";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1847910E3DC
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:41:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-371afae614aso3082107f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724780483; x=1725385283; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6TIu8Uddcg2t8rgLo/DqxWaKWLb2lOl8tQSR0JnTAE=;
 b=Jzvmp4xG4gqegpbwtPb6ypcaHWz4DeG0SLTZqEqTiC381gX0yAji8/ETILpdPTI1AZ
 VARurybzMhPInDIAhz6Lmd7LLTlcG2pYJ0ZbhZgzJGsSxBbTVqO3/q9T49+9yeTrhGya
 h3TPia3JaZxjdDJ7jCy7yuOe+1fqUjApjsqlBptHNEQp2piqnLNXUzETN1u/XyUvQ1UQ
 dJccxIdaws4hvjlOuotBzmo6ioooydz26AcQk5oNyL9DoxTY4iFoJIZ2XUT5aLlKtwLr
 KpfH9ECTwEq7un+Ew/ymizj/G/19cOenmbHOHebeUjnOQwO6alZ7J/73Ack56XeC5BnW
 wtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724780483; x=1725385283;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z6TIu8Uddcg2t8rgLo/DqxWaKWLb2lOl8tQSR0JnTAE=;
 b=HFDqoLv96/1qP7gaWfJ/Ku5uaoF0VKdHGTMmw5O7o0gP/Xl3nBIwFk+tOIS7yCEJe8
 y92t96wpuzh0I76sF+bnGYZ0a6HMH5OobrnGVm5YBywPnWZzZytQeYvdx47OXocqxaid
 aGdy1Wp+3BNE1javciTM30yb3i2keskBNePWoUxh7/AntEzCq/PrX+Apf8bAv0eLHgNH
 0V/l+nP7MMb8sNjNeB1kLuN7Uo3nen19/dGxhQ19GugwMCuzjRAy48TKYFGFT9fxtWdl
 RIbHtsLgkAzHSPMoB1bmuPqjCTtbVpe5dXi03TIByo24D8pdwhXpS85ypy/+kwdk3OQL
 GIpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsnML5QpbDTuB2iueY44DJkm907uElZCfk4WvLMwFSkM2mQmpoy1H4I442PVlgPEDkarZ4kQh6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCU+Ew9eN8/ZZpyIjkN1jeOXWc3utGDaJX06QfOKPDmhv8IpZB
 bGTNyvU2CtrMglOEFMybFEOiF1QKNTtqrUY4y6ym3+d4QkK5HXSuXnb8NgE/+G4=
X-Google-Smtp-Source: AGHT+IHjGpQr5dpr+I5XeWEam9iprNJGW3itHpZr9g2PB+Lu8BtjTVJmYwKropV1Tr6Jg75dA3TgyQ==
X-Received: by 2002:adf:f583:0:b0:371:8af5:4742 with SMTP id
 ffacd0b85a97d-37311841f82mr7896577f8f.3.1724780483057; 
 Tue, 27 Aug 2024 10:41:23 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac5159555sm192622455e9.18.2024.08.27.10.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:41:22 -0700 (PDT)
Message-ID: <eb857f98-9b70-433e-b5f8-cfa5cf076b9b@gmail.com>
Date: Tue, 27 Aug 2024 20:41:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 29/37] lib/igt_fb: Treat 2:10:10:10 properly
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-30-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-30-ville.syrjala@linux.intel.com>
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

On 3.7.2024 2.28, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Populate buf->deoth for 10bpc formats so that rendercopy and veboxcopy
> know to use the correct hardware format for these.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index ab04733fef61..c92997449c3f 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2657,6 +2657,18 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>   				    DEFAULT_MOCS_INDEX);
>   	intel_buf_set_name(buf, name);
>   
> +	/* only really needed for proper CCS handling */
> +	switch (fb->drm_format) {
> +	case DRM_FORMAT_ABGR2101010:
> +	case DRM_FORMAT_ARGB2101010:
> +	case DRM_FORMAT_XBGR2101010:
> +	case DRM_FORMAT_XRGB2101010:
> +		buf->depth = 30;
> +		break;
> +	default:
> +		break;
> +	}
> +
>   	/* Make sure we close handle on destroy path */
>   	intel_buf_set_ownership(buf, true);
>   

