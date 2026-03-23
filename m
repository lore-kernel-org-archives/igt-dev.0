Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBE4EC01D4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 11:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1EE10E101;
	Mon, 23 Mar 2026 11:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lX97ZzG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF0F10E101;
 Mon, 23 Mar 2026 11:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774266752; x=1805802752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KhPMZB2OC+7/8nlGGHMMQQapHrszAuMZLMpcXnpVSMU=;
 b=lX97ZzG2ZTPjX6yA+LUOTJopINKtbjtN/MK4CjYHXWlr8Rk6lflPc4If
 D2IhX/9izjDGWYLQHXXEaaDolX726cgtQ4Z04ius8+CxTH3B2Y3EgPH6V
 oqobdGrpuWiqO/DEnb4MXCojKBXczC0+9PBNIh338UMQOdCPskr7lInsp
 JbRFxkn2Vtle9w2BccY4EtfR7RCwIYbV0HGekOBv8b8QlqGCEzBeQFR0r
 rbH4yP9IJ3DfhLI4+JGbdOfPr1ipHOEm/4EDyMfsqgAH5HjIWzlWKsiVp
 r+vErpST6Uh0iXFAtcDLPaBFYw0H3M9xHOS6C/GC05uq7lMNnHowaHy34 Q==;
X-CSE-ConnectionGUID: b7wrvYDvSHOC8Fmy8i7CBg==
X-CSE-MsgGUID: 7sd5cUmDRoqLtEq5Q+qQsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="77871191"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="77871191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 04:52:31 -0700
X-CSE-ConnectionGUID: 8ODLY270SG+uhAT6e4s6qw==
X-CSE-MsgGUID: ksJn/D63RXCfZJbXFSxZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="223195643"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 04:52:29 -0700
Date: Mon, 23 Mar 2026 12:52:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm8=?= =?utf-8?Q?r?=
 lib/uwildmat: Move to a dedicated vendored library directory
Message-ID: <20260323115213.gqjdbqekrm33z5oa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260319151542.52645-1-kamil.konieczny@linux.intel.com>
 <177402637955.382001.2367818186602699750@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177402637955.382001.2367818186602699750@a3b018990fe9>
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
On 2026-03-20 at 17:06:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/uwildmat: Move to a dedicated vendored library directory
> URL   : https://patchwork.freedesktop.org/series/163535/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8811_FULL -> XEIGTPW_14813_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14813_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14813_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14813_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14813/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:
>     - shard-bmg:          [PASS][2] -> [FAIL][3] +4 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8811/shard-bmg-10/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14813/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-3-pipe-d-dp-2:
>     - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +3 other tests dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8811/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-3-pipe-d-dp-2.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14813/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-3-pipe-d-dp-2.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-2-pipe-a-hdmi-a-3:
>     - shard-bmg:          [PASS][6] -> [DMESG-FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8811/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-2-pipe-a-hdmi-a-3.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14813/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-2-pipe-a-hdmi-a-3.html

Unrelated,

Regards,
Kamil

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14813_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +8 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14813/shard-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
...cut...
