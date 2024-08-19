Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39C2C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 17:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A09B10E335;
	Mon, 19 Aug 2024 17:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWt/iu/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61A310E334;
 Mon, 19 Aug 2024 17:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724089344; x=1755625344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5EDdHwP3NSDTlp5b2kbIRR1aQkWeX+2lNAivJViiRjE=;
 b=VWt/iu/tSCkBByVG9pZABgZivlW6p/jO9PD2jJTGRBavFOD5+FfsU9/L
 yK97MEO2ZG6QQHYsy5kQXNkxQlRlWxZmuhBKvd2XcjEJ5tFOZYrsjHHCk
 iVaIryFtq4WrkjBmngOrVE5J0NinmvR3A9kVdpszwVEXp5etLtPrjc15K
 utDaiVNXcSogiPfnf7R0XxLHl2fYXLArVi0QN2srFResJ4TVjnzoOBiBy
 GM9V4FmvsLofbQY10JlNnPCik8QAGVS9rZSOCLdAHCp/LsjjKFQziK4jH
 Y3rJ01wXFHDqb6Xq4FaSo9nlg/6CMGqLDSvD1wAMaLget8u09eBZNQPP9 w==;
X-CSE-ConnectionGUID: KIG4h6W8S+eHk2nUOzcl1Q==
X-CSE-MsgGUID: N/kFcjjxRSm+pJH//OgHaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21974717"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="21974717"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 10:42:23 -0700
X-CSE-ConnectionGUID: tcOqOILnT6OTA5gJwSKQRQ==
X-CSE-MsgGUID: 9IPIjrquQ5K5ls1CQFC74Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="65134301"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:42:22 -0700
Date: Mon, 19 Aug 2024 19:42:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tools/dpcd_reg: Advertise the dump command in usage text
Message-ID: <20240819174219.alzwxd7vesphv6or@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240815191626.49244-1-gustavo.sousa@intel.com>
 <172376422949.652113.18276182058834711860@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172376422949.652113.18276182058834711860@2413ebb6fbb6>
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
On 2024-08-15 at 23:23:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/dpcd_reg: Advertise the dump command in usage text
> URL   : https://patchwork.freedesktop.org/series/137354/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7971_full -> XEIGTPW_11586_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11586_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11586_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11586_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7971/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11586/shard-lnl-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - shard-dg2-set2:     [SKIP][3] ([Intel XE#1201]) -> [SKIP][4] +4 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7971/shard-dg2-463/igt@xe_oa@mmio-triggered-reports.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11586/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@xe_exec_threads@threads-cm-userptr:
>     - {shard-bmg}:        [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7971/shard-bmg-6/igt@xe_exec_threads@threads-cm-userptr.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11586/shard-bmg-5/igt@xe_exec_threads@threads-cm-userptr.html
> 

Unrelated to tools change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11586_full that come from known issues:
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7971 -> IGTPW_11586
> 
>   IGTPW_11586: 11586
>   IGT_7971: 54f99657bd69295e49e1ab376fde82d3135bba7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1772-154a177a994af4eb2c38eb592d959d98066b0329: 154a177a994af4eb2c38eb592d959d98066b0329
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11586/index.html
