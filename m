Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1FAC5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A039510E3AC;
	Tue, 27 Aug 2024 16:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gpWIKOmI";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556B510E3AC
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:52:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4281c164408so49525345e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724777558; x=1725382358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=M7pWA+mcq+ICBiBT5KLRLvRD18VXpZJWHEyjCY0eKjw=;
 b=gpWIKOmI1xOxbAFGTH7Fvh2xtBxZAWqiX0lvIFbIjrMyLiMpcKzezw1UHjnahSRc4D
 9Dm0/Zu7qMVAY0WT0SUxLLjqqhR7oJQSqo7OIj89c0Usa15lu9BkKSM1lFG4XODWPQmW
 WAizafJPOznvbc/8rE4Ark/43V1oy9V4ObD8Z8Tx4v2tnlIDTsAeSjazEmRiD6XX7qyE
 ZjzQc8/igpTXV+tx1Lo0HZQJfVVfQ9ESy6Kp2VHnhWQGa516co0GSJou1HVxDMO/TVWf
 8TFz8pe8o2JwWPRudgekzrm3dNHnSuXeujcqBVl2eJI8mS6aPmbA19VvuMPMWpR6heoD
 Qj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724777558; x=1725382358;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M7pWA+mcq+ICBiBT5KLRLvRD18VXpZJWHEyjCY0eKjw=;
 b=IITzNXRHOtMMIRj1lwuym6OVs5mpQAyEZRiEjvp8V+KvGXxRLtCcmjvIZe2Vm/H0bU
 7QZk18MYA0UK6x17fDSOp/X1CmQtV1R5bkUQNkxbdpgX71c1fPszZW3LXpv1jUifzNLB
 65CYtQgE4sSQpR6XEURz+LBqIlnFg/VSLw9ff9JBX+U0qkWe+aHt+q12Wry2bYw+Ugf9
 OYmJJksrdL3ffwyYTHQBcr2LVh//CxstphgjsJmlxvlHLLNpHjuky6JagKbchAkxzdPp
 ty2tKJEVz2i3ZWkkIGYbsdECmy1lla7YauGxj4S16we8TH6mheB6yMVgmpM7Xq9dbqgG
 xpgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3IhK96yu+rer9M+q1FUwd9CfHVxqTuR6FqpQZ1qdojS+Bl94TH36h+H2LINTVyTfLYs635qgW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEuKUzTo71PJD8TrOslNm00jM9GQ70exz4BefWEpgJwr8oR6vT
 DqxPHMxm3296v+HW1vhF6Dm6vrn0b7o45w6QNFP7tg8dfNzHwNddzSnwJo2AddI=
X-Google-Smtp-Source: AGHT+IHF+6dU00a6ZHwycbYwSYTWcC5pF5zWrdECUjpb+Wax0T5wAZFLlr2cwIS4PKt1h0kNXLXH+Q==
X-Received: by 2002:a05:600c:1d04:b0:426:6455:f124 with SMTP id
 5b1f17b1804b1-42b9ad4b869mr26913725e9.0.1724777557528; 
 Tue, 27 Aug 2024 09:52:37 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3730813c515sm13495002f8f.25.2024.08.27.09.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:52:37 -0700 (PDT)
Message-ID: <5370317e-e348-4512-8abd-2f02271bc1ee@gmail.com>
Date: Tue, 27 Aug 2024 19:52:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 21/37] lib/igt_fb: Add DRM_FORMAT_XRGB2101010
 compression format for the
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-22-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-22-ville.syrjala@linux.intel.com>
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
> Pick the correct compression format for the block copy when
> using a 2:10:10:10 pixel format.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index fd115f833bc5..e120ee9dcf70 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2879,6 +2879,7 @@ const struct {
>   	enum blt_compression_type type;
>   	uint32_t return_value;
>   } compression_mappings[] = {
> +	{ DRM_FORMAT_XRGB2101010, COMPRESSION_TYPE_3D, 0xc },
>   	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_3D, 0x8 },
>   	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
>   	{ DRM_FORMAT_XYUV8888, COMPRESSION_TYPE_MEDIA, 9 },

