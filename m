Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5121D74ED3
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 14:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEFF10EAF8;
	Fri, 23 Jan 2026 14:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMrm2pCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C163C10EAF8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 14:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769177338; x=1800713338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P0RImjfSk0JYqSa7twEkDGKH8BgBCJgaY8IxGnO3/Rs=;
 b=RMrm2pCe3QyjNfIOSRB7r46ph2jj8rgHMffMr266x0ymzu9B0T3F+f0Y
 vjQhmCkmUWNdKly4ByrqG5v8K3NfwVoJYjzt9SJj1G02ZyADsmm1beoWh
 RqNYiS3ScUfG4Ay94duL9PBaUFba+amm38+J8sEHibBUYsXBs2GoqXIeg
 HnvDBwvhYX9oYARVgWidH2trF3GseVTbcccHBQZUgNgiF+lwushunaimp
 naVmevicNaiNEeE+l8SAuGUkYfwqavB6Pt7LQEloOqkEu/AN3lzZpjzF2
 PnF7GgkJNRcnLe4Jyy2JKhEqLXvSthWiY3c0La7oZaKX05YWckeSg9J9D A==;
X-CSE-ConnectionGUID: DT8xHxbRQveHLhMuMkMtrA==
X-CSE-MsgGUID: RGHxJbyJQkCoEO0o4RUSPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="69625570"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="69625570"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 06:08:57 -0800
X-CSE-ConnectionGUID: cbxut65vQD2UvO0m9F5lLw==
X-CSE-MsgGUID: kpvyXrx7Swai+qniDoiydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207058005"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 06:08:56 -0800
Date: Fri, 23 Jan 2026 15:08:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH i-g-t v5 2/5] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Message-ID: <20260123140853.eqardhjots3hudmq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
References: <20260122084526.538837-1-soham.purkait@intel.com>
 <20260122084526.538837-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260122084526.538837-3-soham.purkait@intel.com>
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

Hi Soham,
On 2026-01-22 at 14:15:23 +0530, Soham Purkait wrote:
> Add clamp helper macro to utils.h to remove dependency on lib/xe/*
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> ---
>  tools/gputop.src/utils.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/gputop.src/utils.h b/tools/gputop.src/utils.h
> index 00befed56..7f3e2ac76 100644
> --- a/tools/gputop.src/utils.h
> +++ b/tools/gputop.src/utils.h
> @@ -6,7 +6,6 @@
>  #ifndef COMMON_GPUTOP_H
>  #define COMMON_GPUTOP_H
>  
> -#include <glib.h>
>  #include <math.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> @@ -19,6 +18,16 @@
>  
>  #define PERCLIENT_ENGINE_WIDTH 8
>  
> +#ifndef clamp
> +#define clamp(val, lo, hi)			\
> +({						\
> +	__typeof__(val) _v = (val);		\
> +	__typeof__(lo)  _lo = (lo);		\
> +	__typeof__(hi)  _hi = (hi);		\
> +	_v < _lo ? _lo : (_v > _hi ? _hi : _v);	\
> +})
> +#endif
> +
>  /**
>   * struct gputop_driver
>   *
> -- 
> 2.34.1
> 
