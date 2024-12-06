Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB73DE77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 12:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9247510E413;
	Fri,  6 Dec 2024 12:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="noaeeK4I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AFD10E413
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733487351; x=1765023351;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5NIH0vAS3qc/53B3NtgroZqWAxTsZ7apcLIqX2yzkes=;
 b=noaeeK4IEos0QmHnL0wMiTJXnqd0HqtnvmGgenkIDGiwdXPMrKS8AQni
 nU4Hsj/0wVrKfodPgecvs7I2ftBHFXTz86zF0nSpu6AkspzEoTJd4ErHX
 X7LXunuJh3HHGXK8FAY/PBWSAT/PNHP+Gv8yW5GcB8QjZu/9ZLTlsBRia
 KcxnQxn4A7FD4ol+hTwBG2RxpdGKwqiM3Y7TZIIGJ6WtL997SMJb+1HK4
 joosqbsOL42tl3Ja77S+WayDZu6B4AF9vdc6DDRAZl0nV3GrzDeiqQWp+
 4ULdzHL3sErkyoXY61sBIqVO9PUUC5jAwUq6Szut1P1zCgC540Fg4fHUO Q==;
X-CSE-ConnectionGUID: pCTMAoedQD6RG+Mym//lEQ==
X-CSE-MsgGUID: E8Tc5zpxRGaU+i8ZrGZeKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45214052"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="45214052"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 04:15:51 -0800
X-CSE-ConnectionGUID: WYR/tQBJSe2ner6OuccMyQ==
X-CSE-MsgGUID: aD4pFhWcQ8GadyCkvBxfCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="94846892"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.159])
 ([10.245.244.159])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 04:15:50 -0800
Message-ID: <e63f049f-5224-45ae-96c3-3e1aa8a46077@intel.com>
Date: Fri, 6 Dec 2024 12:15:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_bufops: Set NEEDS_VISIBLE_VRAM for each
 buf by default
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20241205104134.22790-1-dominik.grzegorzek@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241205104134.22790-1-dominik.grzegorzek@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On 05/12/2024 10:41, Dominik Grzegorzek wrote:
> Some tests (i.e. xe_eudebug_online, xe_exec_sip) are mapping intel_buf.
> If the backing storage is nvram, any access to mmaped buffer may
> cause segmentation fault. Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM
> by default as intel_bufs might be mapped and this is not harmful.

There is the downside that all objects will now be limited to BAR size 
when using this API. i.e you might have 16G VRAM but only 256M BAR. But 
I guess user can always pass in their own handle if they need something 
more special, so NEEDS_VISIBLE_VRAM is probably a sensible default and 
most tests probably don't care about the limit? Ideally the API would 
have an option to hint that CPU access is something they actually need.

Also: https://patchwork.freedesktop.org/series/141710/

> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
>   lib/intel_bufops.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 619222019..49b91a171 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1021,7 +1021,8 @@ static void __intel_buf_init(struct buf_ops *bops,
>   				cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>   
>   			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
> -			buf->handle = xe_bo_create_caching(bops->fd, 0, bo_size, region, 0,
> +			buf->handle = xe_bo_create_caching(bops->fd, 0, bo_size, region,
> +							   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>   							   cpu_caching);
>   		}
>   	}

