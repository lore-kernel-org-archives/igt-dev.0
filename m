Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A6CC25B76
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 07:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0361310E2DB;
	Mon,  3 Jun 2024 07:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kO0tjPGK";
	dkim-atps=neutral
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE48F10E2DB
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 07:26:22 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a68b54577aaso172431966b.3
 for <igt-dev@lists.freedesktop.org>; Mon, 03 Jun 2024 00:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717399581; x=1718004381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vN9GC/FBQoPS0mXLiqSA0WhfClMzyuYuFhIJtYOc+SU=;
 b=kO0tjPGKFtWIXNveivRWvy8hBmWyvN3APO81gab0gVpfdY8KzqWIckKxdjow+fL1Yf
 qgWbEFza6jxmrQQYdRaYIFJrD6v5/nMR2W9Cx9gVXGoxtq9c48BhPmzxPq+i7deBiotn
 x8/Hum/ihRHRNF8QZFcjIvrHmahv9VxyyMD66giwVjVtlsreGmBe/xl+X0pzJg7WHBRr
 hvS+mGUtsvka5LlnmXtBD25iPOLbZmOe6J+rZ7qp1Pe3PM53pzuxGFnz6oAjrwXS7IGX
 TKlwPNfVY6xvA+gGWl0iBWBGOtHqQy1KCWk8iYfOnBCW7bVbpaRXEc5O+cuocmduEzi/
 O7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717399581; x=1718004381;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vN9GC/FBQoPS0mXLiqSA0WhfClMzyuYuFhIJtYOc+SU=;
 b=euN1kzpOB6tnneMVapMTfDCSr0gY+2Ky8iVNWNlrITj2YH+Kg4lCjNtlZRDodtWRl1
 eMngI4ruUAcdDL9DqrVJm3VRSuQ7ij4R/7KWoL5uGw/ROFfJHs2ea/1zBq5t0+7lTAU4
 SAQRMpGzijGPJgajULDbkl3XcuwdOnDv38xn4Aj8qMpI9GiocY5X5R6/Qc1czpJ/u5MP
 FDDZWUabMU7aNEveJ23QpKhLMU5hetcpJZW6sB7kSRXXY+65olsRhKmxP2iawPab3KKl
 OyW7ZUTGLiHrEc11oo2QqZIdpxPPDFf6ePCX9M7riiLPZBT+MECPzOgw9SFzr7WQmAF6
 ii2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoILsYd+86+wqA2K3tYuK7C1/H3laNLkzAZBUGz0zz01ivd2QqtBBOWvgSfPIl9Mk7RSBpOwBfv/I3ur0X2gYfRYN8YguMOB3N87flGg==
X-Gm-Message-State: AOJu0Yxj3QbntdW+XLZ2CFG45AS1BFUfszCXcTdOqaYDY5IgY+2cIyJI
 sOHI6jqMHt/0YHKfLI60C6CwHK0bB/0wfUsvW0p1zRRPv4JSOj34
X-Google-Smtp-Source: AGHT+IGBa8LNdMk0Ae81eKVEcnlHqcQL+iL18LtSlifxaiX+aPnEBPpgsQArsbLIOw+B6s0SVS07Wg==
X-Received: by 2002:a17:906:7185:b0:a68:ebfe:16da with SMTP id
 a640c23a62f3a-a68ebfe18cemr223333566b.8.1717399580958; 
 Mon, 03 Jun 2024 00:26:20 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a67eab85ecbsm449722166b.173.2024.06.03.00.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 00:26:20 -0700 (PDT)
Message-ID: <afa3fff6-5142-43d4-8fe4-9238cc2bc100@gmail.com>
Date: Mon, 3 Jun 2024 10:26:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/12] lib/intel_bufops: Fix offset returned for
 Tile4
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-2-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-2-zbigniew.kempczynski@intel.com>
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
> Functions which calculates offset in bufops for specific tiling should
> return it in bytes, not in cpp. Fix this issue for Tile4.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 52a5f322ea..313c2665ae 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -377,7 +377,6 @@ static void *tile4_ptr(void *ptr,
>   		((tile_y & 3) << __builtin_ctz(owords)) +
>   		(tile_x & (owords - 1));
>   	igt_assert((pos & (cpp - 1)) == 0);
> -	pos = pos >> __builtin_ctz(cpp);
>   
>   	return ptr + pos;
>   }

