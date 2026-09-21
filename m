Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22D3C982EE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6385410E38A;
	Mon, 21 Sep 2026 12:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEKvH5rL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDC010E151
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789994692; x=1821530692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lkAMwHJPo6B8W6T0gcgk4/dWyaFy6wXPQVzW9coC24U=;
 b=UEKvH5rLkwCmkdzD1NwOSXFJQ34oVMsTLCmiXZk+JNNUOY9Dg/VLpsoS
 mgh/nWosMFKa68B2U5YgEHnXhs8tqOixJyrpVaNcR3RAB8SR+nny772vw
 WI1LENbDqJcIqx+UKv9Mcjt3AdG6j50pOs/N1C6Ld61dBXewQPS7m2srr
 2IzjTv4VJOgfUgBoZRdECH2DpwE1vT5x+l6O2GgZyA5qfU9S7UJVRNBOP
 qzdLlZCRDZo52aTtFA2eZPON06u0C0rPhPpbqOG30umGVdphqCjKvLE0D
 vs3U09jHse8TjQmq0vUCGCOYZbPiOQITkbpoo9IBPARvgSoq5tedTRJgP g==;
X-CSE-ConnectionGUID: eBliwFg4QYKSvqeSKYFJ6A==
X-CSE-MsgGUID: PdJwQJtVTB6rg3EasWz08A==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90523135"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90523135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:44:52 -0700
X-CSE-ConnectionGUID: 4OEJnP06TKy26GrYBhwwtQ==
X-CSE-MsgGUID: RDVhbhmkRRG9cNKBQ31ySQ==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:44:51 -0700
Date: Mon, 21 Sep 2026 14:44:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com
Subject: Re: [PATCH i-g-t v6] intel-ci: Add multigpu svm to CRI Core blocklist
Message-ID: <20260921124449.2mugm7epgkb3dgjl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com
References: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
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

Hi Venkateswara,
On 2026-09-21 at 17:26:10 +0530, Venkateswara Rao Muppidi wrote:
> Add multiGPU SVM tests to the CRI core blocklist,
> as multiGPU tests require a separate test configuration.
> 
> Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 4172f055b..2e7779064 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -17,7 +17,7 @@ igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
>  ##################################################################
>  # Valid skip: multigpu runs in separate config
>  ##################################################################
> -igt@.*@.*multigpu.*
> +igt@.*multigpu.*
>  igt@xe_peer2peer@.*
>  #################################################################
>  # Valid skip: No render engine support on CRI
> -- 
> 2.43.0
> 
