Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09893C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 11:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B6810E366;
	Mon, 17 Jun 2024 11:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U8++ml4q";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C3510E35B
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 11:16:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-35f1dc4ab9aso3408325f8f.3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 04:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718623018; x=1719227818; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lDrn3W59nIV7oNvURDnZguWKHEBlplDJD2u01BzVhRg=;
 b=U8++ml4qJJL7harbwi4CQRA10HWBpmwQXR88w32CWSNlZBJ7NrcVlYKC0+mDpzGg4J
 zvEBWByejT2C0Ktt79A1xG0Cl3EP61TmFvsTBHVij67os4gFBujoD8/QJ76tO7QMH6wF
 FmxKQjC3QrT+JTwM912KqSvIk04Gi+7Unw45+fzU1zr6j4YlalUt/YKGj+V9jdCgpnNB
 Ju16mSL+MItLzUkWqMqB3rVAIfOXKYY3CccmOyOPN+OiCuCiFZYzVb3Hg2LmOqj/1iqB
 GsKlywDLoxwigx9gugPDQId3gqdn+p+pj4uuNLV5DCye5Ob9ZatAGZRsDitkYtVV/To5
 /8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718623018; x=1719227818;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lDrn3W59nIV7oNvURDnZguWKHEBlplDJD2u01BzVhRg=;
 b=eDM32zKX1CduZFI+FaKvcbcAiarOEOzBsy9NewCmWDeVm+oknX9FK4EpmdAlVchO2m
 YOqPEdtJz4I5STOmL+KVmL9UWOq8BGThfSrhbQ+Frf6IJnUpuqcSoyLClCaRNyuYKQBq
 rsMgwCusLMGbJOwxXeM5cwE4HKn3MFrPAvPLq46wfvnwxYp1qu5wysjklPnltg40eiLl
 jM7ZALApFnTpQcjbN62rcfmSUQKeC85DtpBIrOqHKDgzZrWg+RinCr56kzTxOSiU3TIJ
 O05VbHWGnVXikaqyKeB54Qbnn85ogs3RUUR9te68RU2UuJ57WWHKvJfdpSHzC5Py3IC3
 1tpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaLbioYjMwipI+s0kYlDYs28WgYNNKNSULf+4/lHqZ+tkA4FOL2zme3F/9dxs/be7RwEklMvcziKfpLrzlNutdcQss/Fci5GO0oeAxbQ==
X-Gm-Message-State: AOJu0YyG14iW74Q/pIFy418kTZtLi1/0xVtLCZOKmln7Jcs05eKHKYjc
 Hw+3hqvrhE6/0ManIL4cw044OfZmRx0GaYLm/A5BaWebespsZ3fKr1TiGzoo
X-Google-Smtp-Source: AGHT+IF+R2p8skrdHJEreQs+ldm+8gUNG8Zl02CLe0b6wAWYlIA6CfUBAKz52i5/PS9Le7WK5LEbNQ==
X-Received: by 2002:a5d:5987:0:b0:35f:f58:38f6 with SMTP id
 ffacd0b85a97d-3607a7838c6mr7030903f8f.49.1718623017748; 
 Mon, 17 Jun 2024 04:16:57 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3607509c8d8sm11663613f8f.32.2024.06.17.04.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:16:57 -0700 (PDT)
Message-ID: <0c550cbc-995e-4cff-9564-8bb672aadc3a@gmail.com>
Date: Mon, 17 Jun 2024 14:16:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 08/12] lib/intel_bufops: Drop unnecessary Tile4
 function assignment
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-9-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-9-zbigniew.kempczynski@intel.com>
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
> Initialization is executed in bufops creation using appropriate
> template in which all functions are already assigned so there's
> no sense to assign them one more time for xe.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 38b720624e..70f70bfa9e 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1695,8 +1695,6 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>   		bops->x_to_linear = copy_x_to_linear;
>   		bops->linear_to_y = copy_linear_to_y;
>   		bops->y_to_linear = copy_y_to_linear;
> -		bops->linear_to_tile4 = copy_linear_to_tile4;
> -		bops->tile4_to_linear = copy_tile4_to_linear;
>   
>   		return bops;
>   	}

