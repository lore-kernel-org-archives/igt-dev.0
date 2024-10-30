Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71A8D6B6B8
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 18:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626A910E7E2;
	Wed, 30 Oct 2024 18:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAQPkase";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6410E7E1;
 Wed, 30 Oct 2024 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730311316; x=1761847316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hPvkxUrx+77o8ed/hK6Nx++Lkjn+ICXehH6FZBjDtmk=;
 b=AAQPkaselFjJNWlXgCjHur5YHdFZDqRrFR65Vd/yV/T5hO+jI5sDjNuy
 GirFCVAjdjeGPFi4z/Blrb8zNWlAdl6TtkjBtb2Put/FBvK8Eu6WEL5kj
 581DbEpA5Xo/Pz9uSb1gIbdk4HhNvvh/eONX1ruI+PKU2fy98heItMK1Z
 Uw5CutjcrqCBiwqoYsvX09QBXV5boyshuYrEe8LmP90p2LQztSdTccSjC
 vWXdJiPvun77Nc01APRqtAR2JjuXnr5l9nHtJTc2b+cTz5zKd3ppqZ9d1
 NlGwoXIiFSziZKQHhKH+vRiY2Nyo/Wh/QelZ4ApbXFim4ENWwu/QGxv3r g==;
X-CSE-ConnectionGUID: 6AdVafYuSUSMqF5PNtmGuw==
X-CSE-MsgGUID: 00KmNeMHS56syGX0IB0KUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41130901"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41130901"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 11:01:55 -0700
X-CSE-ConnectionGUID: M6yPXGrOR/iYnFJ/rGrARg==
X-CSE-MsgGUID: b1WXl2ypQkGLyxXiP1ASPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="86944123"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 11:01:54 -0700
Date: Wed, 30 Oct 2024 19:01:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 rename drm_fdinfo into i915_fdinfo (rev4)
Message-ID: <20241030180152.hrlhgkyhoqc4qn3a@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241028174636.142662-1-kamil.konieczny@linux.intel.com>
 <173030394877.1363982.1120565582264554662@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173030394877.1363982.1120565582264554662@2413ebb6fbb6>
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
On 2024-10-30 at 15:59:08 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: rename drm_fdinfo into i915_fdinfo (rev4)
> URL   : https://patchwork.freedesktop.org/series/140053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8088_full -> XEIGTPW_12002_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12002_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12002_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12002_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12002/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg2-set2:     [PASS][2] -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-434/igt@kms_hdr@static-toggle.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12002/shard-dg2-464/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_plane_lowres@tiling-none:
>     - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +2 other tests incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-1/igt@kms_plane_lowres@tiling-none.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12002/shard-bmg-1/igt@kms_plane_lowres@tiling-none.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move@edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][6] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12002/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
>     - shard-bmg:          [SKIP][7] ([Intel XE#1130]) -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12002/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
> 

These are unrelated to i915 test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12002_full that come from known issues:
> 
> ### IGT changes ###

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8088 -> IGTPW_12002
>   * Linux: xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 -> xe-2144-fb992a15d9b3dc0ed1395b1a30a27f50fb8dba63
> 
>   IGTPW_12002: c029b7af9176d96707744643d72fcf4b8941160c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0
>   xe-2144-fb992a15d9b3dc0ed1395b1a30a27f50fb8dba63: fb992a15d9b3dc0ed1395b1a30a27f50fb8dba63
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12002/index.html
