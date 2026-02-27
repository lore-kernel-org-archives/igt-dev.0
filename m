Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2594BFD5302
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 06:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FAC10E13A;
	Fri, 27 Feb 2026 06:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhAXLpKc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDE710E13A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 06:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772175505; x=1803711505;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IVsv+2MAMiZboJ89Rv31UNtl204hNgiFvahkrGV9+Ik=;
 b=LhAXLpKcX2t+DMWPDdMrnvlvv6EOfzykWrB7qy2FYvsoIk4bxZr/QK6c
 0/GoQWedCIDXdy9rTJOmykKbR800RWqJ/qf1CxtiCELeHEwYPQt3PlWsG
 i8cTE9CBUjQFoDBO4GHyG+0gCo1FKSYmJlEt9V4aGF8GjLErmK/M68TU1
 Ee+iIhlIWu+Yu6pXS1MXBE3OPRUmOuV/z7tLBa6cqWunIQMy2ATtT2W4I
 sEaDDYsytRk1vHcMFP7g3g0yaADktOXHcgVh1JqmOCeKrRjFj7yZnlEU0
 a3fHKfshW7IYaPMVLcFhT5y3Hi3QKaEA3ZwuMSdhZvbW6IOscIsI0dNyj g==;
X-CSE-ConnectionGUID: 5RId34uLR2mFWXAo8L7iVg==
X-CSE-MsgGUID: uC5J0lSkQcucUErt4crugw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83887841"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83887841"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:58:25 -0800
X-CSE-ConnectionGUID: UGdRYzJ2SziPg3/Ym0Ysbg==
X-CSE-MsgGUID: 0Ix4WMIyQaqaPwi4fyEzRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216827251"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.84])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:58:24 -0800
Date: Fri, 27 Feb 2026 07:58:21 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/5] lib/allocator: add canonicalize helper for 57
 bit
Message-ID: <m55xk5h55ducehsczszrrqhsdrpyyqg2l7gif54nrpccm77jx7@4iwdvzyjrez4>
References: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
 <20260224082800.1581935-3-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224082800.1581935-3-priyanka.dandamudi@intel.com>
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

On Tue, Feb 24, 2026 at 01:57:57PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> 
> The efficient 64-bit mode introduced with XE3p requires a 57-bit
> canonicalize for the ppgtt virtual address.
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/intel_allocator.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> index 9cd83ea270..87c1453e91 100644
> --- a/lib/intel_allocator.h
> +++ b/lib/intel_allocator.h
> @@ -219,12 +219,18 @@ void intel_allocator_bind(uint64_t allocator_handle,
>  #define INTEL_ALLOCATOR_SIMPLE 2
>  
>  #define GEN8_GTT_ADDRESS_WIDTH 48
> +#define XE3_PPGTT_ADDRESS_WIDTH 57
>  
>  static inline uint64_t CANONICAL(uint64_t offset)
>  {
>  	return sign_extend64(offset, GEN8_GTT_ADDRESS_WIDTH - 1);
>  }
>  
> +static inline uint64_t CANONICAL_57B(uint64_t offset)
> +{
> +	return sign_extend64(offset, XE3_PPGTT_ADDRESS_WIDTH - 1);
> +}
> +

Drop this one, use xe_canonical_va() instead.

--
Zbigniew


>  #define DECANONICAL(offset) (offset & ((1ull << GEN8_GTT_ADDRESS_WIDTH) - 1))
>  
>  static inline uint64_t get_simple_ahnd(int fd, uint32_t ctx)
> -- 
> 2.43.0
> 
