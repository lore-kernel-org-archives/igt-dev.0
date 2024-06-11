Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCCEC27C77
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 15:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5734610E681;
	Tue, 11 Jun 2024 15:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmf+Stm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6280610E681;
 Tue, 11 Jun 2024 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718120118; x=1749656118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fJ+nm68zIUoLdDTudjR4+YzjHB24DotkYRuEAb0vBHA=;
 b=kmf+Stm0dnDijNWWBf6Q1Z9iNN0VZEAO2YKhfytnauAwXoS9/lSBZ7y2
 ANlX4P55KRKgwyvODM6R8vp/nk3K+4zikBjDcNwg6bVlglE4o1ipgXZAT
 NS/jQ9WarHnlhB7L8A1ZSikZnwTwQjCqqpAbftA2staiISoGKuotDevG3
 tQ0k4nZVicr8tLJMYinhRI9evdrcLWC36kwn0jY61GxYCZf/OyYfoIFc0
 e4bXsgpHqBeLroIMUz/E1KDKALEmG4AQRg4f3u/NmKF/IAzCLk9RgsAVP
 9TR2nbQrLrZOsGeeRRO0/gwq04to0cSXj+gTz+6nvCubtVu4tLboKq2LX w==;
X-CSE-ConnectionGUID: qEpNLVYaTCSrbfqKdIvR7g==
X-CSE-MsgGUID: siQXCH0uSG23SbpdgolinQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="17761596"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="17761596"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 08:35:17 -0700
X-CSE-ConnectionGUID: JUeNbE92TLKlK8WgUCJzNQ==
X-CSE-MsgGUID: cBJbwFgpTwmkAdLZHoTCFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40084144"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 08:35:15 -0700
Date: Tue, 11 Jun 2024 17:35:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tests/core_hotunplug: Make it fail in subtests
Message-ID: <20240611153512.67nfk6vzzlixv3js@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
 <171785557958.29541.4615837872717615076@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171785557958.29541.4615837872717615076@a6498e030952>
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
On 2024-06-08 at 14:06:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_hotunplug: Make it fail in subtests
> URL   : https://patchwork.freedesktop.org/series/134626/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14904_full -> IGTPW_11238_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11238_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11238_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11238/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11238_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-dg2:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11238/shard-dg2-10/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-dg1:          [FAIL][2] ([i915#11279]) -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/shard-dg1-18/igt@gem_softpin@noreloc-s3.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11238/shard-dg1-17/igt@gem_softpin@noreloc-s3.html
> 

This is not related to core_hotunplug

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11238_full that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7880 -> IGTPW_11238
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14904: 2bea08bd31298d60d416b2a6ed346bb53dd28037 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11238: 755e4e0164dbde8a7fc84ea3e0c71dbae6263d42 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11238/index.html
