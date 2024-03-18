Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C3CC54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 08:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4173310F4AD;
	Mon, 18 Mar 2024 08:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j1YMxhRg";
	dkim-atps=neutral
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C2310F4AD
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 08:42:41 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so590893166b.1
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 01:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710751359; x=1711356159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3pnVyIuZNArSOP3CKZLQgKQRlkmpaxx9QFsE3hZjxgk=;
 b=j1YMxhRgv4SAtbYQbbjXsM8AkqV3nAmg1vMlbI7ot7ML0cw2oPK0qjUwmDuV9kQ0p1
 ePIo2jyMTJaGyCnjrybwqXTntWkdW6nJ+ksRahtnNtBIK+K8KO6aIXdgeR/LmAOx4zZn
 s3NV9BQaaXonz8WKpLRMUx9Tq9nmsSC6lLnIM8yOQD0TnB45Ug4Y8GUEaAbnFT/wGUdU
 lu+e404exT8+1uOfqA1m5/6W5RJO5MZDmInuGb4bUSLmerG7AgH16z85uxJf2TsYxKWj
 x3HrT0C0EWNxqO4VGj9QLt71nJAJkzHIhZfosslLTLBsrE1zfe+sQpvnyU/E+fPTUON9
 4uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710751359; x=1711356159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3pnVyIuZNArSOP3CKZLQgKQRlkmpaxx9QFsE3hZjxgk=;
 b=q8cqdHYlp0yS8YXzJYQKAJrLmy6Sjda+KXrv6gauwTTupTDq2Ht+e60DgEhYGMVDSQ
 RUne5DxfwpCExFAd8BU/1r+6mjQCuuIahwtJJydjpxvuj3i3+dL8qMLJIPbhS/a9U8dt
 XJCjPkOMSdLPBzeRr28EjCdjiQW0o247kTj/4KMFO2x3e8fHnvsR8FKdATWec86AHEce
 ZVeqphlWCeaZm2t/WJQGW6+kL+pAm6L2zyaCz1MUz1+7gIs3XA4uFLx4R3cHJ5Qw5V4Y
 UMMzipmkC40C2niaKY/r10Lf9jeJXZjhl0aZ1cO6CrAE7KfRt+8pbqZJe7YFJvc9X+o8
 xn0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNBKFev61A1TPKga4gYdfii/0V5hRyEGUqy47bBzSK2a8/QFZWX6mShbBWcpC26vvybTRWdvilvTNUCy6glCFJftnWgCbxUkF6FAF2wg==
X-Gm-Message-State: AOJu0YzLzWfhISYYT6VO5spD0OP6tHBoElBKcvU/Y7gimMnnf0bC2jbY
 tmvntA9tkCi9CVJnpuAfEStsEgWHmNnKFSINr4GE2guqeVbDRsKy
X-Google-Smtp-Source: AGHT+IGOYTuKAPE+mTbQlm/jQidp6Ijlv0EGUfyISuq6pWrA0kO/0MTZUFo0itQmj+okQ+sPbpxJfg==
X-Received: by 2002:a17:907:807:b0:a46:c09b:f1f3 with SMTP id
 wv7-20020a170907080700b00a46c09bf1f3mr1567331ejb.41.1710751358850; 
 Mon, 18 Mar 2024 01:42:38 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.71])
 by smtp.googlemail.com with ESMTPSA id
 v17-20020a1709063bd100b00a46caa13e67sm357511ejf.105.2024.03.18.01.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 01:42:38 -0700 (PDT)
Message-ID: <2ad7c886-a5c4-417e-bce3-4fb5aa473940@gmail.com>
Date: Mon, 18 Mar 2024 10:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_ccs: fix bo size for ccs
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240315162701.309560-1-matthew.auld@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240315162701.309560-1-matthew.auld@intel.com>
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

On 15.3.2024 18.27, Matthew Auld wrote:
> Don't just assume it will always fit into the default page size. When
> passing in custom -W or -H the raw CCS size could be larger than BO,
> leading to assertions.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/xe_ccs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index d6f5408a7..aec83a057 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -108,7 +108,7 @@ static void surf_copy(int xe,
>   	const uint32_t bpp = 32;
>   	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
>   	uint64_t bb_size, ccssize = mid->size / CCS_RATIO(xe);
> -	uint64_t ccs_bo_size = xe_get_default_alignment(xe);
> +	uint64_t ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(xe));
>   	uint32_t *ccscopy;
>   	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>   	uint32_t sysmem = system_memory(xe);

