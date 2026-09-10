Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10FBC79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 14:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BC210E5F7;
	Thu, 10 Sep 2026 14:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M41mtiUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7453710F492
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789051407; x=1820587407;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=979Mt7PdhF3jH/2cZ6P19U/RjXmojRlybKKgpjoiY8M=;
 b=M41mtiUMEuBf8qfThn0SeTPvISn9lkPga3JqFNscO4ObRyHGrTVnNoI5
 oked3U+ukC8WF63b8QpyV7aoAaVbEtM8iOfPXpRlOo+sCIW/Wz4u22RbN
 BCOAWWc4PkK3DfCve+iG7AXx1ewM3TRR1ucPJdw1bRaWipnVeEeX+befn
 Ea/0zg95Ad6FAskIqEJxFRsSm926xId/IXmBjsepk/i3wJIUdbqABlfpx
 iDbBcg/ZrIVHOEQDE3panZ8FhHpI72qtwMuYKRagiVQpI6hLsAw3wNapM
 mP8mdyXzKwGqeH6vCJ6hV3GaMJN93qHijzubGjFPUNR2sRXv5kle4MyY9 A==;
X-CSE-ConnectionGUID: B43E/UmCQUWxFJgeBWz7CA==
X-CSE-MsgGUID: cPZN/jmUSB24zuN22R/zTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92017715"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="92017715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 07:43:27 -0700
X-CSE-ConnectionGUID: dK0qS+/WRwCfcQRl/LzWRg==
X-CSE-MsgGUID: NBFVQXcvTviJbZOIFlHAlg==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:43:26 -0700
Date: Thu, 10 Sep 2026 16:43:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org, Julia Filipchuk <julia.filipchuk@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel-ci: Allow PXP negative testing
 on CRI.
Message-ID: <20260910144309.67bggi2b2ow6rtum@kamilkon-DESK.igk.intel.com>
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
> on platforms that don't support PXP since they would perform
> negative testing.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Applied with fixes in commit subjects and descriptions.



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
