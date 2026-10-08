Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC1BCA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 10:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8640510FD70;
	Thu,  8 Oct 2026 10:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVsiPoM4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EB510E7AB
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791453603; x=1822989603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q3hBn7IFP6Mc5YMlzfF9l7DoLDhmdDhvvN4Dh0khYcg=;
 b=KVsiPoM4jiEEOr4n8Bit+e00HDMnb/OvJnt7CK6BFIscCOd30BYhb3g3
 u3710ILWw2WzE7Xty7dkKZQe7ccwYNE9fmbHkbzY0FuUMIuIFQc6jl4xY
 n+z/D7Yeptjo3uCF0xpBQgb2YTSfv0+vD1jbrg8Al6VJFtSvFaxu/9RFl
 QOJ4gs6lEg10o6bTpmbiSBfpyFZDJQoIAzKz9CWc4QztRcc2LBRyTbE9y
 zvlY2rKlRFPLMhOYJOZBRVPDQPcZpy/d+Vh9u2sdBDoInK1lVzSVaJtMN
 D7/P0uM6fFkt88rXRM4/Ff8KJ2lSNzSEa916W+kQ35P8D4196poFEzQEY g==;
X-CSE-ConnectionGUID: K0egaNbfTJWM9u+hr5j/KA==
X-CSE-MsgGUID: T/Od0dE9Qye4ApckEMQFew==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="121770"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="121770"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:00:03 -0700
X-CSE-ConnectionGUID: Xanob9n7SIaqpADfFwqoTA==
X-CSE-MsgGUID: vHJIDiFySdqif3i6r5T8AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="6127"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:00:01 -0700
Date: Thu, 8 Oct 2026 11:59:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH i-g-t] Revert "intel-ci: Allow PXP negative testing on CRI"
Message-ID: <20261008095942.ux335bsybvyw6744@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20261008044627.2730162-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008044627.2730162-1-himanshu.girotra@intel.com>
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

Hi Himanshu,
On 2026-10-08 at 10:16:27 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> This reverts commit f38ee7c7b3e3e5377808bfd793b56c536c16fda4.
> 
> Both pxp-bo-alloc and pxp-queue-alloc require the render engine
> class to run, even as negative tests. CRI does not expose a render
> engine, so unblocking them just makes the subtests SKIP on every
> CRI run instead of being excluded, adding noise and hurting the
> overall pass rate in CI without providing any coverage.
> 
> Re-block xe_pxp@.* on CRI until the tests are reworked to fall
> back to a non-render engine class when render is unavailable, so
> negative testing can still happen on platforms like CRI.
> 

I see it is already merged, so please rembember in future to
add to cc author(s), here

+cc author Alan Previn <alan.previn.teres.alexis@intel.com>

Regards,
Kamil

> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 2e7779064..41328186c 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -9,11 +9,11 @@ igt@fbdev@.*
>  # Valid skip: Features / hardware blocks not present on CRI
>  #   - xe_huc_copy@: No HuC support on CRI.
>  #   - xe_oa@oa-tlb-invalidate: valid only for older gen12 platforms.
> -#   - xe_pxp@.*: No PXP on CRI so skip except negative-pxp tests
> +#   - xe_pxp@.*: No PXP (Protected Xe Path) support on CRI.
>  ##################################################################
>  igt@xe_huc_copy@.*
>  igt@xe_oa@oa-tlb-invalidate
> -igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
> +igt@xe_pxp@.*
>  ##################################################################
>  # Valid skip: multigpu runs in separate config
>  ##################################################################
> -- 
> 2.53.0
> 
