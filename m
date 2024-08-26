Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E1EC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 11:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D1F10E1C8;
	Mon, 26 Aug 2024 11:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eL4k+pV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E9810E191;
 Mon, 26 Aug 2024 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724670017; x=1756206017;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pYnjKf8mIZrb5YB3Di2EX+KOebDy6NfmTJYCyR/tSSk=;
 b=eL4k+pV/KT87194qNbfsf+cuF7scSYLlZdjxIuvSHzDBDvm5xChWYt89
 Ahywh7R9/1GVNLJAuULOjeGZKZIkrGoMOM2HGaZGjxiEqL6vSEd2lM1yj
 MTDNw47VQEeJYxTvVoDElK6YBcedpG3Um9FiptxETzr4oB36PmX19J0oS
 Gn0LW//2ML9fNkkNQdwrGZ14YT1yMBEJOdpxoft4oWCQqLLYAcrGdOkUh
 1wf3BKwWEMBKWW0zZ3tRTB15/9HJcMef9ZeTOW3fYIA/s5OZ9WdI4N1Il
 0Dc/eOFE88b/bUSQJr8KuLV9/g0gcBFnEVwVBLvqTZtPk9XJKEjcqbtaW w==;
X-CSE-ConnectionGUID: 9mHiXJkuRqWo7/1lP6Te7Q==
X-CSE-MsgGUID: dhkWayPtS+Ka+sPogk+fWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="34459203"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="34459203"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 04:00:17 -0700
X-CSE-ConnectionGUID: dO+JSVpxSuGjvYffCm+zLA==
X-CSE-MsgGUID: onYGPG+7Tx+tnN8yTTz40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="63193533"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 04:00:16 -0700
Date: Mon, 26 Aug 2024 13:00:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for Fix
 compilation for musl in intel/kms_pm_backlight (rev2)
Message-ID: <20240826110013.wseb64o6f6lsxhaq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240823155747.69745-1-kamil.konieczny@linux.intel.com>
 <172454541508.765791.6021214062827944625@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172454541508.765791.6021214062827944625@2413ebb6fbb6>
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
On 2024-08-25 at 00:23:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix compilation for musl in intel/kms_pm_backlight (rev2)
> URL   : https://patchwork.freedesktop.org/series/137557/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7989_full -> IGTPW_11624_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11624_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11624_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11624/index.html
> 
> Participating hosts (8 -> 9)
> ------------------------------
> 
>   Additional (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11624_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11624/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>     - shard-dg1:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11624/shard-dg1-13/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][3] +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11624/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11624/shard-tglu-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 

These are unrelated to a change,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11624_full that come from known issues:
> 
> ### IGT changes ###
> 
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7989 -> IGTPW_11624
> 
>   CI-20190529: 20190529
>   CI_DRM_15286: 96041621daaf71059d790a2ddbaa60114371eada @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11624: 11624
>   IGT_7989: 7989
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11624/index.html
