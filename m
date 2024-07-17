Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B64C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F75910E010;
	Wed, 17 Jul 2024 14:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UphmfPU2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F7510E010;
 Wed, 17 Jul 2024 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224970; x=1752760970;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xIUXr2pu3+fRXdWXa92HYnkTzLslczwTQ/hGbMTinwk=;
 b=UphmfPU2LIRvuGcv6LhHDAn8dJT20MynGKwccGm7d/vjVC7sdDhAdFzE
 2cUvDkNcDMld1hK7GnTYvUcsX2W7wozDyLDv12HWTjzq4NtUICtD5P2aX
 UtaMpS3Mt4iCTZyD5oLyYJ+19ZaPQuBilGN683WR9YDNFV8udHNoHYoas
 N03BeuqK9taP4uYAfmwVfqbJ8R2+j/AacDxuldoudu/7vX5lcY/yI5OVx
 EtbvLECqekfr3ZfiBPbsnWN5P02UFjTKZ9HaZOKsxtgQIj5pLINx4+ext
 mQhrG7AvXKpD490lqKb37MNvRJiMtJGlAlMKHCyvDZ6hSG35Ht5aiBHcj A==;
X-CSE-ConnectionGUID: D6/dwwGDQbW7B3fK5wvHuw==
X-CSE-MsgGUID: OlhfntNQS5uc5b7jGPMbKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29310478"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29310478"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:02:27 -0700
X-CSE-ConnectionGUID: feO4sm5JTo+07EeWmJQsMQ==
X-CSE-MsgGUID: 0EK9e3+LRFin3SZNl+vjww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54589015"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 07:02:25 -0700
Date: Wed, 17 Jul 2024 16:02:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for Add
 gputop support for sysfs profiling knob
Message-ID: <20240717140222.pzdhlhjgvvv4liqa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
References: <20240716205756.2973341-1-adrian.larumbe@collabora.com>
 <172116884872.253641.10055681844016776312@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172116884872.253641.10055681844016776312@2413ebb6fbb6>
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
On 2024-07-16 at 22:27:28 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add gputop support for sysfs profiling knob
> URL   : https://patchwork.freedesktop.org/series/136161/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7927_full -> XEIGTPW_11414_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11414_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11414_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11414_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-lnl:          NOTRUN -> [FAIL][1] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>     - shard-lnl:          [PASS][2] -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][4] -> [FAIL][5] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-lnl:          [PASS][6] -> [INCOMPLETE][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [DMESG-WARN][8] ([Intel XE#2019]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-466/igt@xe_module_load@many-reload.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/shard-dg2-463/igt@xe_module_load@many-reload.html
> 

This is unrelated to change in tools/gputop.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11414_full that come from known issues:
> 
> ### IGT changes ###
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7927 -> IGTPW_11414
>   * Linux: xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9 -> xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576
> 
>   IGTPW_11414: 11414
>   IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9: b6af83ceb593bc4e0d79acda73684462b13a15b9
>   xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576: 297dce9fadb6008b164278f5d702b4d7ba402576
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/index.html
