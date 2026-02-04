Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C49E9D3E1
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EF810E0B7;
	Wed,  4 Feb 2026 14:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7LYhdbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529FC10E0B7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770215489; x=1801751489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=spgYbo6JNgQYk7/dkIBRmGWziQKjivj65OA9c65Bczw=;
 b=a7LYhdbPuDSJlMFX842lXCC/qM3fXZChJpB6zi7HOzL2RCFZi9Bi05ID
 hm8Wc8hJZ78KmVXm34ik1yHZmI3vlLcYKEsfJuuTleqA5jHnlSGaG8tbW
 US3ryF4AziQNZalM2sgdoQZGY2/avGDrSP7YD92LEkVNEk+nBqefTQP6u
 frnIemJMdfSftRBsHzhaX7Tp7Day2Io0+Rc9oKTLDC3SC07e7fQOc4SWZ
 6eKzYLcgd+3oNrNKAobPLqk2lIEJPrONv+2IAm7uksa9HBG1CS8UNI/sN
 MeNce2kpn1BbduTzpLRP/OgXVe3vnat9fVmgm2tKfS2T7+qbQcoj2n9/B Q==;
X-CSE-ConnectionGUID: lpRoBopYQ1K1MuSKPuEOKA==
X-CSE-MsgGUID: aQXS/VbSQR+/1w/1OdkI0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58978151"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="58978151"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:31:29 -0800
X-CSE-ConnectionGUID: wFnaz8bFQ62E8zyR/xPCfg==
X-CSE-MsgGUID: tXIvbutzRlenrBUCZY+QPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210193640"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:31:28 -0800
Date: Wed, 4 Feb 2026 15:31:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_aux: Protect expressions from premature
 casting in aux macros
Message-ID: <20260204143110.td6nir3zvtu7d6gy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
References: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2026-02-04 at 14:55:01 +0100, Zbigniew Kempczyński wrote:
> Missing brackets around expressions might cause undesired behavior
> during type casting, for example:
> 
> objs = 4096;
> objs = min_t(int, objs, vram_size() / SZ_4K)
> 
> If vram_size() is 0x80000000 casting to int gives negative number,
> so min_t also will be negative even if it wasn't our intention.
> 
> Add round brackets to ensure casting refers to whole expression.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_aux.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index 8ff182384c..56761a3b3e 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -255,8 +255,8 @@ void igt_debug_interactive_mode_check(const char *var, const char *expected);
>  
>  #define clamp(val, lo, hi) min(max(val, lo), hi)
>  
> -#define min_t(t, x, y)	__careful_cmp((typeof(t))x, (typeof(t))y, <, min_t)
> -#define max_t(t, x, y)	__careful_cmp((typeof(t))x, (typeof(t))y, >, max_t)
> +#define min_t(t, x, y)	__careful_cmp((typeof(t))(x), (typeof(t))(y), <, min_t)
> +#define max_t(t, x, y)	__careful_cmp((typeof(t))(x), (typeof(t))(y), >, max_t)
>  
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  #define igt_swap(a, b) do {	\
>  	typeof(a) _tmp = (a);	\
> -- 
> 2.43.0
> 
