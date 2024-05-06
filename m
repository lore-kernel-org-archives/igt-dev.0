Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F695C10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 10:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE19112F61;
	Mon,  6 May 2024 10:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="v/gCmeme";
	dkim-atps=neutral
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5339D112F61
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 10:37:17 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so1838532e87.3
 for <igt-dev@lists.freedesktop.org>; Mon, 06 May 2024 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1714991835; x=1715596635;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NQFQ7IBid64XPWr5xbcYpiuXtx7IglDd51Wi8jsFRhM=;
 b=v/gCmemegJSgxdpxJXbpfPrsUYPKAc+rtDhH2brFBNMZTjMsrL+T+cZIDwQ98rMcsc
 b5Lj4HXJpNvMjsdQZR/qiOPu9cif8cuES16Zbntj/wDFCqL63uCvI3/cFUuoTTsJWAn+
 G7glQFRSiEs+F1G49mcujlXmGLDN1K6jnOAaj/VrW7J7C9zqTBtfrXme9Qf7obZl2PQK
 4C3wZ34E1Y/nMDaYXlZ2ai+bW8eIj2W07b51lE+lWtg26fTQclOztpMKe7FGKKJGkJ1n
 10YyVinGscgQPIRSencju2O21xw6fb+MgsfofOd4lmjlUR8QO5UBZgZERwvahk/QjXf1
 468Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714991835; x=1715596635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NQFQ7IBid64XPWr5xbcYpiuXtx7IglDd51Wi8jsFRhM=;
 b=VqTw18346taplZN8Z5uVH/eWDJL6MsnH8Ppqz9zr1C5FLuEWVxOS8AIf0z74MtHVdp
 laQDT+u/yZjsi8GdfIZEmntK+3H10ToA69DmT3LfYD/4CeVF8H0imXD3Rp63WU9ybZ0m
 wt0eNhmXQ1b7cjbSwjGOIqv16IkBGEjKIdgrFDTUiDQwnv1XV4YrpZRXRl+MK2TFeI2O
 7eU3yXG353Aq/abwBkxK94mHaVhbNHV1C9KmvRlpky5zSbvRzIqb7OrCrxRYyFtxXd3B
 AvynRgKpBaFzw7aXN7I5Z1vL+YW2cz/aA+o8n4yaTasiTQuQ+RZ2TKkJzHVBx6bhqOsw
 E6zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlsgFJUXv++LVuWHVezGeLamwkrxsRW6go3uVYDbjkFDjnpNK3tRTWXOWTCP51M5AD0L5qm3xwXeMafwl/sE5hsgKaq6Npre8WLVaZ3w==
X-Gm-Message-State: AOJu0YyqlL7M/amryksOJtFc2zyDcH8qz03hmRTlQ0vr7SVfhiHR6deF
 LIXXP4vnLTObP8D+rNrpD32rFxALDrZ8jQ0s/Q+LvNY8GWklJ+V+7g0K5ZRs5ZA=
X-Google-Smtp-Source: AGHT+IFKq7ayeH/ID+956s0NHLi6ebEtr/LMFWgQU2oI0cxc9VkeFJyJjkKTtvzxlB6lq9xb873jCA==
X-Received: by 2002:a05:6512:32ac:b0:51e:543c:a45d with SMTP id
 q12-20020a05651232ac00b0051e543ca45dmr6801780lfe.20.1714991835135; 
 Mon, 06 May 2024 03:37:15 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c1c0d00b0041be58cdf83sm15629979wms.4.2024.05.06.03.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 03:37:14 -0700 (PDT)
Message-ID: <b1c38cda-2c62-401d-b5a5-dc518a600aa0@ursulin.net>
Date: Mon, 6 May 2024 11:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 00/12] gputop: Add support for xe
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240504064643.25863-1-lucas.demarchi@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 04/05/2024 07:46, Lucas De Marchi wrote:
> v3 of https://lore.kernel.org/all/20240423234431.1959354-1-lucas.demarchi@intel.com
> 
> I moved some gputop eye candy to a separate series:
> https://lore.kernel.org/all/20240501173303.115737-1-lucas.demarchi@intel.com
> 
> This now also moves all the refactors to come as prep patches. The
> drm-total-cycles addition is  in the last 3 patches.
> 
> As requested fdinfo and drm-clients libraries now don't take any
> decision: they only read the fdinfo and calculate the deltas
> respectively. The decision about what aproach to use to calculate the
> client utilization is left to gputop.

Approach LGTM so ack for the series. Hopefully someone else can do the 
detailed review.

Just two observations - 3/13 I don't know what the "fixup" is, supposed 
to be and 12/13 incorrectly mentions it is adding some assert to 
intel_gpu_top.

Regards,

Tvrtko

> Lucas De Marchi (13):
>    lib/igt_drm_fdinfo: Extract ignore_space()
>    lib/igt_drm_fdinfo: Allow any number of spaces before unit
>    fixup! lib/igt_drm_fdinfo: Allow any number of spaces before unit
>    lib/igt_drm_fdinfo: Stop passing key twice
>    lib/igt_drm_fdinfo: Remove prefix arg from parse functions
>    lib/igt_drm_fdinfo: Parse drm-cycles
>    lib/igt_drm_fdinfo: Start tracking available engine keys
>    treewide: Rename engine busyness variables
>    lib/igt_drm_clients: Move engine fields to substruct
>    lib/igt_drm_clients: Record drm-cycles
>    lib/igt_drm_fdinfo: Parse drm-total-cycles
>    lib/igt_drm_clients: Record total cycles
>    gputop: Add support to drm-cycles/drm-total-cycles
> 
>   lib/igt_drm_clients.c    |  55 ++++++++++----
>   lib/igt_drm_clients.h    |  27 ++++++-
>   lib/igt_drm_fdinfo.c     | 154 +++++++++++++++++++++------------------
>   lib/igt_drm_fdinfo.h     |  17 ++++-
>   tests/intel/drm_fdinfo.c |  44 +++++------
>   tools/gputop.c           |  45 ++++++++++--
>   tools/intel_gpu_top.c    |  24 +++---
>   7 files changed, 235 insertions(+), 131 deletions(-)
> 
