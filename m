Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B2CD37489
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 13:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FAA10E83E;
	Thu, 17 Oct 2024 13:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nHSDiz8u";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AE610E83E
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 13:28:06 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so2864185e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729171685; x=1729776485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qy3yyhUhA4/KFCW8xHOip3oOb3pjAPGkd90Lw5ZRM0Q=;
 b=nHSDiz8u8Cj8AXNP2WoYIsE/6CiYziJnTIPtDmEfZZxzOp2EF4NKdEtjudlqiz4rmJ
 E2xjh+Seo9O0zenBKc24OKTNSWk1I3FXzAvJuQqhzz7NIaK8gcqc+EBfauFVT/Jy5a6B
 sY0mxeBiviUUFeEBNw0ru3CEUlB1DwRFvZgo/LL2h4ZfjMLtolecdYp6IP8WPJO1keuU
 1+XoR5y5QDsDJxzICbkoRsIf1vj8FzJNwJ7waWQREMY5mN6YpdAmpbYztrtit93A5IO0
 Va8xB4fDwF8hfE5O4VDrfh9KND6gXoNwZfZQuhicf6eJWHUYsj9wUm6rS85aZHw+/+03
 t60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729171685; x=1729776485;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qy3yyhUhA4/KFCW8xHOip3oOb3pjAPGkd90Lw5ZRM0Q=;
 b=XoE78DVgRUX0QycYhnf/cDHkj/s/GQaYJtQ3A9U82dnHeiQ9VRn9bKlrpZevYHjSbo
 0MLPmUh8mm9y9vQzUx0n/LAKJ7rAqDGJnLSxxkif3wxTZXbo+iNeP0zNCHlrX+4LA1AX
 2KSlJuIqxnf90sN1kbCmEnKl4aj6wiy/EBcTaBxts0F2wD3nn7KrwZUpo9aa1in/m+tw
 0GasOKKhWUgEaoWi8vN8IXOSdsv3UxaPPCeJMSvD5j2HXz9RycRg2IgwFZU6zzB8oDCc
 rDdwyql08mZ877m+Az5/yD4ANVDOIqJldNnLSBkIc+IlUjgeycO6apyV4lI4z+mMKMQ8
 pxJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwl3pUgBHY9KjQa53Q9oa4Y/u5UpeVw9esvMjEe+6CsSbQmtIpb7VTrRKklsbSOruhDoirNwJn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4r3vPLAHVsXU1VcorCnnW224ldT6em80iUNdoZkgNLlf8hK0+
 KXp0dBwnaP7SNVWkT+fTAmTHypAyiSiFt662voBA3o3Fx+O1toup
X-Google-Smtp-Source: AGHT+IFINkWQjOEHqAYImIEzRjt62tPtG8BCqhH57hmmw/5CBkF0JF9lmDr0rAUfQcPvl9IA0CHvcA==
X-Received: by 2002:a05:600c:1c9e:b0:430:57f2:bae5 with SMTP id
 5b1f17b1804b1-4311df42aa5mr164444765e9.27.1729171684353; 
 Thu, 17 Oct 2024 06:28:04 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.74])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-37d7fc445fesm7260831f8f.113.2024.10.17.06.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 06:28:03 -0700 (PDT)
Message-ID: <45e1c657-f91c-4452-9033-90ebd0be7fd1@gmail.com>
Date: Thu, 17 Oct 2024 16:27:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] MAINTAINERS: Change Bhanuprakash's email address
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20241017121852.45488-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20241017121852.45488-1-kamil.konieczny@linux.intel.com>
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

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 17.10.2024 15.18, Kamil Konieczny wrote:
> Current one will become inactive in few weeks.
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1a310ef26..90c3c0880 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2,5 +2,5 @@ Petri Latvala <adrinael@adrinael.net>
>   Arkadiusz Hiler <arek@hiler.eu>
>   Kamil Konieczny <kamil.konieczny@linux.intel.com>
>   Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> -Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> +Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
>   Ashutosh Dixit <ashutosh.dixit@intel.com>

