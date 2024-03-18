Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B559C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 10:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2FA10F581;
	Mon, 18 Mar 2024 10:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M4AX7wQI";
	dkim-atps=neutral
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBB010F581
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 10:59:57 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-430b870163eso17116761cf.1
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710759596; x=1711364396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eVtGp7iUw1YSPMINVIBatg0V3MAj3K+YCIejVS4zWfA=;
 b=M4AX7wQIki90pTBwmH/DeXTv/37avkL9gsOMzhAiuDqBpd8BOlN9JKbZdustzq6/JK
 WT6s7JS0IK/OI3S5TG9iAQ8pmvyXS+MSzvkuuwJq6AHkM3ZVAY1HK7NHbpMvuzHGyjDB
 im2ctxig+HXHNcmH/eijwIHCvlzK+FuNqxucVo39AbQ4aiAlg98D+C3+8s0l6zz7lV1w
 huMzzCRi1YHNvMANEy8pStBxiARUYLyHwLLcedZqUTr8c75aMCRNlBmOBGlcbPMflEi3
 yHDU0BOom7PtOshCXaHItcNF2jOWQ+6CODSBZVX6d2CtKqWxlcqXTjrPHYBeWJYse05N
 jUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710759596; x=1711364396;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eVtGp7iUw1YSPMINVIBatg0V3MAj3K+YCIejVS4zWfA=;
 b=RM8Uh5+/mZC1blhXCw7jacM92+fQXDqvh6Rgmil/lb71K3jndOHQRmNSObaN+xc6HR
 yu8KK4XJbXwJPwCGCqQMWcwK+8o6E/+IvhT2zjTSC6hw2HhapyKDikCdev7BTWzMe6H3
 ceLNV8OiXEHtyLEdlwDlSM7iC5nkm6NklpTlB2NkFEybNya8XRyVnKG8oyI4NgnKBAEl
 Wyiqj6buD5Xf1ban6HpnzJtSQc/lK4zGjzSnJlL1+ZhoOi9n5L/pZPprIBMMIwPKLJv/
 FRE6J1FLfJWorXa06mkkQWeAyaOPt+BuiJXikWbpXKvA1z3OjMKZRJjnaRezBExa7PnA
 rjaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUahQGRrekba1ncqCfO22oFCgRj3PE0lvCejZ2cvuHvZ/2SKEJJRVEunmGCpt3yQkCftqwQ7kmdzOFZZ6kNayNOlvVcJ7pDBwr5BT2PBw==
X-Gm-Message-State: AOJu0YwnEYrmCwYKYY3/6WoVbaHXXUJ9TU8bOeObWfEwJRFMjsvny9wx
 /jKNZin+G6196eMaHWlZka+PXzHm/9Rz9dP/ENuz2y5n2kpabitU
X-Google-Smtp-Source: AGHT+IFLOvWvZJ5UvjhBdDXUnhBwB+nbkUTkTbam9Bxip4jQy+5/JL8Bfv73SXFD8pGN9XvxE64QEA==
X-Received: by 2002:ac8:6692:0:b0:430:b674:8ebd with SMTP id
 d18-20020ac86692000000b00430b6748ebdmr11049049qtp.16.1710759596152; 
 Mon, 18 Mar 2024 03:59:56 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.71])
 by smtp.googlemail.com with ESMTPSA id
 fx10-20020a05622a4aca00b0042f14f31cd9sm1886424qtb.92.2024.03.18.03.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 03:59:55 -0700 (PDT)
Message-ID: <d29af901-2fe3-48a6-9f61-0ce3963a7c10@gmail.com>
Date: Mon, 18 Mar 2024 12:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/3] lib/igt_sriov_device: fix musl libc build
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20240315131901.28144-1-kamil.konieczny@linux.intel.com>
 <20240315131901.28144-2-kamil.konieczny@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240315131901.28144-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

For series

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 15.3.2024 15.18, Kamil Konieczny wrote:
> On musl build the PATH_MAX define is missing, fixed this with
> including limits.h
> 
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/igt_sriov_device.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index f425a5ecf..a0ef05d5c 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -5,6 +5,7 @@
>   
>   #include <dirent.h>
>   #include <errno.h>
> +#include <limits.h>
>   #include <pciaccess.h>
>   
>   #include "drmtest.h"

