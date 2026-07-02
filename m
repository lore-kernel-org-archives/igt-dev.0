Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C473C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 12:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BC610E4CD;
	Thu,  2 Jul 2026 12:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGg2IuCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61EF10F356
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782996853; x=1814532853;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CMx3XUnkiiZ2XqktNG1H1q4bzmA8JGYWWBE1iH4cUF8=;
 b=eGg2IuCLA4v/Rq3dp4ovvDcfdO8VgwDajCa4/ek06+f3X2GRTsaYGgSi
 vvP5K0jj/B3Moj8Iq/Kzpp2KzSEIaQBYMgLJetHEBems1sATfvEmcU0EN
 FcVORp/Q4SXLcu/nDbuG+EPctR1ypy6GRDn/TTLhbHOXdYPpSDaNVyReP
 PG/OPTSPNmxLAbEjSG2pBdTzuVpsvPji7jcyTsEf2nqU0v+tbaCjGmDtF
 QwNcRO58b3u8Yci4FAeT1zL09GHA23twoVxDDqViIm9lGdbrSA9ZDc5aQ
 qthFafKY/d6px33062fmwRbp1IlHAnu1aLnrssZicow2lRfXfp0BUaPaU g==;
X-CSE-ConnectionGUID: 6zsD90CdRiWhFABBNfzfbA==
X-CSE-MsgGUID: V7BoazX6QmaoFWjko82nxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83942716"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="83942716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 05:54:13 -0700
X-CSE-ConnectionGUID: L1NDZq9SQuKibCISfufmMw==
X-CSE-MsgGUID: fsfeVydsTXKtVvQaDuvjZQ==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 05:54:11 -0700
Date: Thu, 2 Jul 2026 14:54:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com
Subject: Re: [PATCH i-g-t 09/25] lib/i915: intel_decode: replace igt.h with
 minimal headers
Message-ID: <20260702125408.aa7grw7qgtvkbzz6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
 <c2f41066e4b11feffee458813a5e2333299f78da.1782288071.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c2f41066e4b11feffee458813a5e2333299f78da.1782288071.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-06-24 at 10:47:16 +0200, Sebastian Brzezinka wrote:

improve subject, imho better:

[PATCH i-g-t 09/25] lib/i915/intel_decode: replace igt.h with minimal headers

Regards,
Kamil

> intel_decode.c only uses two symbols from the IGT universe:
> intel_gen() and intel_get_device_info(), both provided by
> intel_chipset.h.  The DRM_PRINTFLIKE macro used for the
> instr_out() format attribute is provided by xf86drm.h.
> 
> This is a prerequisite for building intel_decode.c into a static
> sub-library (lib_i915_decode) that tools can link without pulling
> in the full libigt.so stack.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/i915/intel_decode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
> index b78993c47..7e21d1cff 100644
> --- a/lib/i915/intel_decode.c
> +++ b/lib/i915/intel_decode.c
> @@ -29,7 +29,8 @@
>  #include <stdarg.h>
>  #include <string.h>
>  
> -#include "igt.h"
> +#include <xf86drm.h>
> +#include "intel_chipset.h"
>  #include "intel_decode.h"
>  
>  /* Struct for tracking intel_decode state. */
> -- 
> 2.53.0
> 
