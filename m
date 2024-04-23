Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81266C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 19:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0F5113636;
	Tue, 23 Apr 2024 19:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eii2noPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91A3113635;
 Tue, 23 Apr 2024 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713901870; x=1745437870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=907IWJCUIziKyY3nFZiun4O0Ze3FxddQ21gUCdD+iXY=;
 b=Eii2noPECukttLJdi/SmojplPMfyjNzRdq/UPcKWOihlOO7qjJihR6Lr
 HSqTLbewXFid6/gWbu0GZ8w2hvWt3pLZJvMCWVRpt8N0vpGrMKfB9XGrU
 pKJx3PdWZrD0tYSZoSGHHE1OciBT2JJfg6GBPIgVFke+oJXDQ16QpLHbo
 upUxvzQQ+x/0t2POgK3dlt/U8mr7WbYa7srRqTUJfFPT3oOlbbrlPe0BU
 slF5+0592EezKj4G7qdG5z5uBDJP2rPjq1+RsHvXuqyJqrVANPqoVzbGs
 3SQEUl+1mEplNkOj1o4KfVI1y0UaXJSruPs+P5Bod0JIkQH8CzGSdQm12 g==;
X-CSE-ConnectionGUID: CK4gKNvdSIKDFp8NuIWxeA==
X-CSE-MsgGUID: CclIG0RyRL6332B1q1qdUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9616256"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9616256"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 12:51:10 -0700
X-CSE-ConnectionGUID: 2XSldRAjRb2ckpK6ZRlFgQ==
X-CSE-MsgGUID: iVRmi35KTpive0qFwAAaAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24445683"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:51:08 -0700
Date: Tue, 23 Apr 2024 21:51:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMveGVf?=
 =?utf-8?Q?evict|exec=5Fthreads?= =?utf-8?Q?=3A?= Use fd reopen to avoid
 corrupting global data (rev3)
Message-ID: <20240423195106.3hfpfjrf253hn5dp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240422144713.76025-1-zbigniew.kempczynski@intel.com>
 <171386267083.1607322.8955517962466115841@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171386267083.1607322.8955517962466115841@8e613ede5ea5>
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

Hi igt-dev,
On 2024-04-23 at 08:57:50 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_evict|exec_threads: Use fd reopen to avoid corrupting global data (rev3)
> URL   : https://patchwork.freedesktop.org/series/132562/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14626_full -> IGTPW_11050_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11050_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11050_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11050/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11050_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14626/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11050/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3.html
>

Unrelated to Xe test, no need for respin (already merged).

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11050_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7815 -> IGTPW_11050
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14626: a53d157b0bd321e30804e935e010d77fc575b033 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11050: b178ef16da1a8b3b1216e98b39687e8c0e4ea997 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11050/index.html
