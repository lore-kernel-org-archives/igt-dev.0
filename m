Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC8CC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 22:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D788C10E12E;
	Mon, 29 Jul 2024 22:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="FPSyETp9";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6771F10E12E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 22:43:33 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1fc566ac769so21670225ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 15:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722293013; x=1722897813;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lp+Z9fIWLOozTVgpwuA8RFIZuXGq9cyihh3n8p9aYUs=;
 b=FPSyETp9CilbAyEb9aob7eCSc5B6A6m//TH71bMKd1xVAjD1T1CNSEQ3ROdVm//MEs
 3ILpif+QPLgzQ+eBbH9v2PhHq1f9vEkFTKVtXx6RvMgenxNmZP6eRMKvdU6d6vPdBnJo
 8u6ox3bdnTpHVjC6dSCAG5CY+95JBv65O21DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722293013; x=1722897813;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lp+Z9fIWLOozTVgpwuA8RFIZuXGq9cyihh3n8p9aYUs=;
 b=CS9xidXo0/VQhXLZ+yikluMvWRSnoFuKu+t6zJGr76r/y9VKSFd0tVequ4RQUzwkLY
 6rYJ5aUbXM5tQVExs0foIYuI7nJlxS8QQ1DqggizJKvN+/kzmrHa+vhAdRYrTUQ5m44w
 JCSLI5l28Z/1I6tURjcoQ3XbNfYO4L8+HVWfF23ofgl9rOreVUCbkjPTQuyN+L1bhXyH
 o+rzp2v6y9rIUcHUqSnPxvaxHIVZEYuBfbC7LmoI2SxSBEyVyfm5NEY+yIxrQCPRMo4m
 VZeaHxb4b/eaIzujLUMnuLkArL/w5lumNvYODwSvejJWmYbWlmD7zW4GvRcftDs7lH+q
 ljPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvX1miE6qrTW8n4Eb1vZR9/VEjAYd1wto/cLpdps1Wh3JDjRRwpWe2SMj2wg/Ppqr9URBSrkBSJRXOgZxMq1F0AjMtAqLBz2CwwfsccQ==
X-Gm-Message-State: AOJu0YxyHj4t+1HRR4QbXyqBV3u0I6KtCwWxBjTuqduqWRivi+S4yBxS
 SkhsAeIqRpGMFXn8ZLyLiMObwjgwBbJPSd24Z6ctwaVzXs16Av9EC9j9ZGsoLg==
X-Google-Smtp-Source: AGHT+IHv5yPEZHAJxcDKFWvHGTOXzA0vK510SOrehFyt3ZHQqzJjQvNtp8zSd2GGN1JJBroJS9L3zQ==
X-Received: by 2002:a17:902:c409:b0:1fc:41a4:60b6 with SMTP id
 d9443c01a7336-1ff046727aamr81159745ad.0.1722293012606; 
 Mon, 29 Jul 2024 15:43:32 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7cf1ac1sm88447325ad.84.2024.07.29.15.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 15:43:32 -0700 (PDT)
Message-ID: <1a266b9f-80b7-4ad8-b9bc-a427b4928d19@broadcom.com>
Date: Mon, 29 Jul 2024 15:43:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 0/4] Add vmwgfx prime tests
To: Zack Rusin <zack.rusin@broadcom.com>, igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 kamil.konieczny@linux.intel.com
References: <20240729043846.1892343-1-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240729043846.1892343-1-zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

LGTM

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

Thanks,

Maaz Mombasawala <maaz.mombasawala@broadcom.com>


On 7/28/24 21:37, Zack Rusin wrote:
> The following series makes some adjustments for testing prime/dma-buf
> on vmwgfx, adds a vmwgfx dedicated test for it and fixes some minor
> issues.
> 
> The last patch in the series adds very basic prime tests to dumb_buffer
> test to verify dumb_buffer<->prime functionality.
> 
> v2: Add a reference counting and dumb buffer tests plus fix issues
> spotted by Kamil
> v3: Fix a silly compile error in vmw_prime test and remove dumb buffer
> test
> v4: checkpatch.pl improvements suggested by Kamil
> 
> Maaz Mombasawala (1):
>   tests/vmwgfx: Removing incorrect assert in mob_repeated_unref
> 
> Zack Rusin (3):
>   lib/vmwgfx: Allow using any buffer handle as a surface backing
>   tests/vmwgfx: Add a prime test
>   tests/vmwgfx: Fix and extend the reference counting test
> 
>  lib/igt_vmwgfx.c                |  76 ++---
>  lib/igt_vmwgfx.h                |  43 +--
>  tests/vmwgfx/meson.build        |   7 +-
>  tests/vmwgfx/vmw_mob_stress.c   |   5 +-
>  tests/vmwgfx/vmw_prime.c        | 584 ++++++++++++++++++++++++++++++++
>  tests/vmwgfx/vmw_ref_count.c    | 214 +++++++++---
>  tests/vmwgfx/vmw_surface_copy.c |   8 +-
>  tests/vmwgfx/vmw_tri.c          |  12 +-
>  8 files changed, 821 insertions(+), 128 deletions(-)
>  create mode 100644 tests/vmwgfx/vmw_prime.c
> 

