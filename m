Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BB3C79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 16:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5654F10E130;
	Wed,  9 Sep 2026 16:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6OwvP6/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884410E130
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788972252; x=1820508252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bXSz6p+fKeQ3MgBl5If5wzzocEdUYHDsyM2m67KH7ok=;
 b=L6OwvP6/K6hUuAQ0NHRD169I6Qj6IRhLMFFrmhL1gvjRVrgnT7zWsqOB
 /Buv8CdCkl9PjQEjMytPAT4boUKlF8GqvT+lRVhFOgcYM6hEFMJlbWYPR
 TVvgxsA7jMI+eoHXrBRnPnsZDyzFNluvQIAqXgVqTTPYJniLFHkfTvcEx
 2ENEXhWr2w2LW7Gz8fHQKHXP/COkPVRk9NfHZCPt3+gU8ZKEgAtva9P+d
 2NdJr1gOX4DryLp2++PGGJRtLZcpNtTFwqUQB4dSU5x5i75bGXqzOlDet
 shhb80+3NVx0TKuklKZSND3naSCTDGhWObmMccRxheoA2WY5xRi9e+hQR g==;
X-CSE-ConnectionGUID: S9iUwNoURLOeVEM6SyKPxQ==
X-CSE-MsgGUID: TJIhC0FkSE+C/UBrY3YT6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91924367"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="91924367"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:44:11 -0700
X-CSE-ConnectionGUID: jESpCvpfSZqb2xXcvNKnnA==
X-CSE-MsgGUID: /NmP5AaDRGOvOAOXwwSvRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="274879829"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 09:44:10 -0700
Date: Wed, 9 Sep 2026 18:44:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org, Julia Filipchuk <julia.filipchuk@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel-ci: Allow PXP negative testing
 on CRI.
Message-ID: <20260909164408.7v7ubwpe6afmucaw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 igt-dev@lists.freedesktop.org,
 Julia Filipchuk <julia.filipchuk@intel.com>
References: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
 <20260909002705.431136-8-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909002705.431136-8-alan.previn.teres.alexis@intel.com>
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

Hi Alan,
On 2026-09-08 at 17:27:06 -0700, Alan Previn wrote:
> igt:xe_pxp:pxp-bo-alloc/pxp-queue-alloc subtests should be run

imho better:

xe_pxp@pxp-bo-alloc/pxp-queue-alloc subtests could be run

> on platforms that don't support PXP since they would perform
> negative testing.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 12085c4df..4172f055b 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -9,11 +9,11 @@ igt@fbdev@.*
>  # Valid skip: Features / hardware blocks not present on CRI
>  #   - xe_huc_copy@: No HuC support on CRI.
>  #   - xe_oa@oa-tlb-invalidate: valid only for older gen12 platforms.
> -#   - xe_pxp@.*: No PXP (Protected Xe Path) support on CRI.
> +#   - xe_pxp@.*: No PXP on CRI so skip except negative-pxp tests
>  ##################################################################
>  igt@xe_huc_copy@.*
>  igt@xe_oa@oa-tlb-invalidate
> -igt@xe_pxp@.*
> +igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
>  ##################################################################
>  # Valid skip: multigpu runs in separate config
>  ##################################################################
> -- 
> 2.43.0
> 
