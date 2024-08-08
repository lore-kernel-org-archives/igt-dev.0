Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E67BC52D6F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 13:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE29010E731;
	Thu,  8 Aug 2024 13:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OscNpP5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD0D10E730;
 Thu,  8 Aug 2024 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723123705; x=1754659705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8DV94ZAverF/iQ4Tv09AwrQDV1+/mEuDQLe9OPlK1AY=;
 b=OscNpP5RjK35eB0TIhV/aAA7HAiLlf/u+Wx9UteepKuOeY4e9JH+RoqQ
 PYalIW7PNxyw90eW6qLJCrjnx8siM8IYeHsFPLlzRXT1UNBdJmFuY2C/s
 ow2NQ/TOKCiF5GoaUjAPQezK7wHkuagIrW/YEjTkdwZoT3tTAz/X3VKIF
 pga7mJha/jCX5LRATrWqLrDeosZNJg2uK+45oCvTInq6i03gjIQMxBn8L
 gwqqOUjnkdCpTQkiOPxWALBSLD7RSTdgC8PFo64O1Eyop9vkNG+sAByfn
 I85NuHZ2CG09Q2wKi6iAvAbISO3hFrHl5PXoa3Fm+MbSqDkpAfWSS69ZQ Q==;
X-CSE-ConnectionGUID: B5pF/oV9T4WASC+isNUPIg==
X-CSE-MsgGUID: gzflIHjfTtun1Al6OC5BJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38754758"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="38754758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 06:28:24 -0700
X-CSE-ConnectionGUID: YlHTydEFR1e0VwlToBmHVw==
X-CSE-MsgGUID: Gh8UMlgWSxedI0llN8xkpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="61313894"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 06:28:23 -0700
Date: Thu, 8 Aug 2024 15:28:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_runner?=
 =?utf-8?Q?=3A?= Allow dynamically ignore dmesg errors or warnings (rev3)
Message-ID: <20240808132820.7ypvxfasvpzgjm2m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240806144332.80609-1-kamil.konieczny@linux.intel.com>
 <172311178755.549353.1507838668458541857@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172311178755.549353.1507838668458541857@2413ebb6fbb6>
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
On 2024-08-08 at 10:09:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Allow dynamically ignore dmesg errors or warnings (rev3)
> URL   : https://patchwork.freedesktop.org/series/136494/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7962_full -> XEIGTPW_11543_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11543_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11543_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11543_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/shard-lnl-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
> 

Not related to xe_wedged and runner change.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@2x-flip-vs-panning@ad-dp2-hdmi-a3:
>     - {shard-bmg}:        [PASS][3] -> [DMESG-WARN][4] +6 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning@ad-dp2-hdmi-a3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - {shard-bmg}:        NOTRUN -> [SKIP][5] +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d-dp-2:
>     - {shard-bmg}:        [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/shard-bmg-1/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d-dp-2.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/shard-bmg-8/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d-dp-2.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11543_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#1659]) +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7962 -> IGTPW_11543
> 
>   IGTPW_11543: 7cdda8ee1d271299366792ab59a3dc72e436fe27 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7962: 7962
>   xe-1731-4f5d551409fb5562ab0d732120e7ac9b698b5864: 4f5d551409fb5562ab0d732120e7ac9b698b5864
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/index.html
