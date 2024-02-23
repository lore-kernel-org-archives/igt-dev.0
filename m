Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D8CC48BC4
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 08:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDF510EB33;
	Fri, 23 Feb 2024 08:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqKa6Itk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7A110EB33
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708676875; x=1740212875;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=V92CeOnzluv5/y7K0800qQAk6H00BJUIFLrGNb3RTk4=;
 b=HqKa6ItkqXhPVrYhJRNFHkuEqiU23G0mNkFAxcYLtfcRjQDRjAL+N8hW
 gzeKfFfcoafaMIqYDM7t3T/udo4Cq2yOq+Wj7mHC9bPTU2KlOqZALQRCb
 IrPUa8rynYgklvTC9LOUCHKHuAhZT8wWTE9ihq/aamIbFzGgOHE0bsEIe
 465iEou/6r8MMn8ryRxsUP96POgDVsz/Rx3fTM+eocVhq1I1OLWJ1YmaV
 kZOGxPrzgcmbeMq++qUI1qq9DMx9GJ/CRp1BnngUm741dGfvp8mMSKG8n
 hoK3OC6Xcj7mRHF1h7ERmuWiLlL7GYFbePOqe2Pqonjoyz7Vz2VqTvyN8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3120383"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3120383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10532769"
Received: from astasiak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.16.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:27:53 -0800
Date: Fri, 23 Feb 2024 09:27:50 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib=2Figt=5Fdra?=
 =?utf-8?Q?w=3A?= Don't call i915 specific ioctls on xe in draw rectangle
Message-ID: <20240223082750.amfm47plo2ojfslw@zkempczy-mobl2>
References: <20240222131803.61066-1-zbigniew.kempczynski@intel.com>
 <170861711400.217031.16359350262435292511@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170861711400.217031.16359350262435292511@8e613ede5ea5>
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

On Thu, Feb 22, 2024 at 03:51:54PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_draw: Don't call i915 specific ioctls on xe in draw       
>             rectangle                                                         
>    URL:     https://patchwork.freedesktop.org/series/130256/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10721/index.html  
> 
>          CI Bug Log - changes from XEIGT_7723_BAT -> XEIGTPW_10721_BAT
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_10721_BAT absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_10721_BAT, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (4 -> 4)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_10721_BAT:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
>           * bat-atsm-2: PASS -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
> Build changes
> 
>      * IGT: IGT_7723 -> IGTPW_10721
>      * Linux: xe-823-661a9b14c215bc3ba24badcac80ce4eb3f57d3ff ->
>        xe-824-ae1e283133b83b0de46f00b0ac0bca913e159216
> 
>    IGTPW_10721:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10721/index.html
>    IGT_7723: 7723
>    xe-823-661a9b14c215bc3ba24badcac80ce4eb3f57d3ff:
>    661a9b14c215bc3ba24badcac80ce4eb3f57d3ff
>    xe-824-ae1e283133b83b0de46f00b0ac0bca913e159216:
>    ae1e283133b83b0de46f00b0ac0bca913e159216
