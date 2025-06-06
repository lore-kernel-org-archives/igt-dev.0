Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3ADC61CE7
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 15:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB22910EAEC;
	Fri,  6 Jun 2025 15:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RR6FkpKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C310010EAFB;
 Fri,  6 Jun 2025 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749224747; x=1780760747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zQGquQFNQb/P472s+3wVCipQj25v1F8uKAuvbj41hIY=;
 b=RR6FkpKQfNCHZyjg1kE7fo1VsudMG5HU39/g5flJvJt+aIKrw1SHpjwh
 oWdd2Go48BbSMXUQE6M5e9Vt5CTmX2f6Z6gkIm/7dQixIsqGXaJjISldl
 p7C8eoQYidVa4tmgi0PG0p49kNs/YFb2CB7tG92OjhCHTBpYsLL5oCkWT
 QU19FUDdHjjqAD96tF2SN7kcXbo0ONC+0AyZYWh+/MJr7dZs/yYJz+pHB
 TIZA2qZ2yIEkAOavc+p0ktEOilCbCd7LJhgX7tQaWDFVzFJhgQS5RvwT0
 +I56HLepD91pbXvV8BK1jJK+ILt0mSnuiXK68f7DNuH38SbuoO9/M5uge Q==;
X-CSE-ConnectionGUID: du2H9DLwTiW7AyOntVrT0w==
X-CSE-MsgGUID: fShXcrRwQ4uGmTBtWTOY4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51256803"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51256803"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:45:47 -0700
X-CSE-ConnectionGUID: +orp6/nuTg2ktahGgdqMyA==
X-CSE-MsgGUID: WwccY7JcS0WZXL+UI+6iRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145793276"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 08:45:46 -0700
Date: Fri, 6 Jun 2025 17:45:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Extend IGT to support Android (rev15)
Message-ID: <20250606154542.slirfyh6px7vtlyl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
 <174914507194.52551.12366021160560098655@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174914507194.52551.12366021160560098655@1538d3639d33>
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
On 2025-06-05 at 17:37:51 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Extend IGT to support Android (rev15)
> URL   : https://patchwork.freedesktop.org/series/148432/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8396_FULL -> XEIGTPW_13244_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13244_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13244_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13244_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-bal-userptr:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8396/shard-dg2-435/igt@xe_exec_threads@threads-bal-userptr.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13244/shard-dg2-432/igt@xe_exec_threads@threads-bal-userptr.html
> 

Unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13244_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-2-4-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#3767]) +15 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13244/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-2-4-mc-ccs.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8396 -> IGTPW_13244
> 
>   IGTPW_13244: 522d6bb8e1da9cc508103a5930e22949921ece2d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8396: 8396
>   xe-3194-573b98ac3ff9ff95c3316789e97980277e4ffe2b: 573b98ac3ff9ff95c3316789e97980277e4ffe2b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13244/index.html
