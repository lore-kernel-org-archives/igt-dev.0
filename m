Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71877FD4F1F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 19:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CD810E0F8;
	Tue, 10 Mar 2026 19:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQIIJDQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175AE10E0F8
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 19:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773169484; x=1804705484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=twnr88GI+Pt5AqAE7S+20/6Y78GUOGMGYDzUHPBORsY=;
 b=kQIIJDQI41nSJLba1J5x/oU7VKRMuNnfLTLeKM+nuwmy1Vv0YlLTDKvs
 YIsGjm9tY4bcxWDQqC56M0E5mHuyLjDjWdv+ORZSW/6K1IR+NLhpNkt5a
 OOmNKqUZXKUa5I7DYV/mxGuARqM4k1Z33WMRravaosEBWE4Fdvx/2TZgR
 pvByaCp/6lZpGQA56YNiRnif8soQS7xGnLblQJLqDcXPyjqGFi4BGYcnz
 lq3+KPH/HTKftrnR1Ld3UgYa09fhQJR8VRy9o9GWThhU6mb3bv1FE22vz
 dp4z9id93XNr9KMEY8TP9unbZaakZtnp77NJLO8XhHYaDqdRyHzF9K/vW g==;
X-CSE-ConnectionGUID: kPNM1X/oQSW5E8OLlf1JJA==
X-CSE-MsgGUID: dKgOGO7SR8KdI7XQMW76Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74270852"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74270852"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 12:04:31 -0700
X-CSE-ConnectionGUID: G/hlrY1xTJqfBRTsj5hwYA==
X-CSE-MsgGUID: q6SQwFYxRf617wn3Cnsvlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="243219686"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:04:29 -0700
Date: Tue, 10 Mar 2026 20:04:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: ramadevi.gandi@intel.com, aditya.chauhan@intel.com,
 shekhar.chauhan@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/pciids: sync with kernel commit be07d8f707e4
Message-ID: <20260310190411.fk6bqkmlyxb255do@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, ramadevi.gandi@intel.com,
 aditya.chauhan@intel.com, shekhar.chauhan@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
References: <20260310165113.8994-1-himanshu.girotra@intel.com>
 <20260310165113.8994-2-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310165113.8994-2-himanshu.girotra@intel.com>
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

Hi himanshu.girotra,
On 2026-03-10 at 22:21:12 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> Synchronize PCI IDs with drm-next kernel up to be07d8f707e4,
> which includes the following changes:
> 
> commit be07d8f707e4 ("drm/xe/nvlp: Add NVL-P platform definition")
> commit 32620e176443 ("drm/pcids: Split PTL pciids group to make wcl subplatform")
> commit aaecfadc22cc ("drm/intel/bmg: Allow device ID usage with single-argument macros")
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/pciids.h | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 6e53fb4cd..33b91cb2e 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -861,7 +861,7 @@
>  	MACRO__(0xE216, ## __VA_ARGS__)
>  
>  #define INTEL_BMG_IDS(MACRO__, ...) \
> -	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
> +	INTEL_BMG_G21_IDS(MACRO__, ## __VA_ARGS__), \
>  	MACRO__(0xE220, ## __VA_ARGS__), \
>  	MACRO__(0xE221, ## __VA_ARGS__), \
>  	MACRO__(0xE222, ## __VA_ARGS__), \
> @@ -880,7 +880,10 @@
>  	MACRO__(0xB08F, ## __VA_ARGS__), \
>  	MACRO__(0xB090, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> -	MACRO__(0xB0B0, ## __VA_ARGS__), \
> +	MACRO__(0xB0B0, ## __VA_ARGS__)
> +
> +/* WCL */
> +#define INTEL_WCL_IDS(MACRO__, ...) \
>  	MACRO__(0xFD80, ## __VA_ARGS__), \
>  	MACRO__(0xFD81, ## __VA_ARGS__)
>  
> @@ -897,4 +900,16 @@
>  #define INTEL_CRI_IDS(MACRO__, ...) \
>  	MACRO__(0x674C, ## __VA_ARGS__)
>  
> +/* NVL-P */
> +#define INTEL_NVLP_IDS(MACRO__, ...) \
> +	MACRO__(0xD750, ## __VA_ARGS__), \
> +	MACRO__(0xD751, ## __VA_ARGS__), \
> +	MACRO__(0xD752, ## __VA_ARGS__), \
> +	MACRO__(0xD753, ## __VA_ARGS__), \
> +	MACRO__(0XD754, ## __VA_ARGS__), \
> +	MACRO__(0XD755, ## __VA_ARGS__), \
> +	MACRO__(0XD756, ## __VA_ARGS__), \
> +	MACRO__(0XD757, ## __VA_ARGS__), \
> +	MACRO__(0xD75F, ## __VA_ARGS__)
> +
>  #endif /* __PCIIDS_H__ */
> -- 
> 2.50.1
> 
