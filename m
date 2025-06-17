Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96223C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 10:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B0410E144;
	Tue, 17 Jun 2025 10:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2FnA/QO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1880F10E144;
 Tue, 17 Jun 2025 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750157364; x=1781693364;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rVrvPIw780JG4No5qssdmJU1HDusOd2DYKSuYPgaCeg=;
 b=F2FnA/QOfLVEVUd6D58+9b1mNCWQwIfq9uTl6dlHZtthchUNxbebZ3J0
 W+NGhWn3MQCzw7JjqhDB61Sy4izGpZyP6e2hUJtxzdhU/lF+vrL36tbeh
 c9MGnjd2Jq/PFbjaEUTtbYHdPPBSV29nz8eW2aJXE48ekHMbMy+lPn0Br
 GNd+Uuz9Oxz+xV6FAdfkN7Ulaw+JQ0BbRIL3pTWA0euKTvydUT2/o4yX/
 xM0TYOzAZBAnJktlCmqLktv3tzmwTETLwpCAdo+cMXycmWKIA3aSYjP2Y
 anQ+fCpqJLA6GzT/dA4ghaphO4K9a6yQrKzB6ewTCW73S17cB/0oElPrY Q==;
X-CSE-ConnectionGUID: c5WXm4fHTdei9UtbvATA3w==
X-CSE-MsgGUID: YfJezQC2SoadClS+o8iKIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52032364"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52032364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:49:23 -0700
X-CSE-ConnectionGUID: 5o1VsztGR7CqwgBJP3ib6A==
X-CSE-MsgGUID: knd+aWFZS1ip1IRVnln9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="152602084"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 03:49:21 -0700
Date: Tue, 17 Jun 2025 12:49:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 runner/executor: Abort if dmesg is flooded
Message-ID: <20250617104906.ys2vznlnwkdygntt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250613162013.103165-1-kamil.konieczny@linux.intel.com>
 <174983766749.78228.14743131806257281945@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174983766749.78228.14743131806257281945@1538d3639d33>
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
On 2025-06-13 at 18:01:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/executor: Abort if dmesg is flooded
> URL   : https://patchwork.freedesktop.org/series/150246/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8411_BAT -> XEIGTPW_13295_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13295_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13295_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13295_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>     - bat-lnl-1:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
> 

please do not file a bug, this is a bug/feature instroduced by
this patch in igt_runner.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13295_BAT that come from known issues:
> 
...cut...

