Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7F1FE5202
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 11:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C8810E3DE;
	Fri, 24 Apr 2026 11:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K47AMY8I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6371010E3BB;
 Fri, 24 Apr 2026 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777028759; x=1808564759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Nw7USqn9+4bWEgSGLxqdCHeF7o8AmhvPErGiznV4a1A=;
 b=K47AMY8IJbfSBZp6G9ZhCCXjhefvxOpXKqYYEOSl0f8nI3y0QvFaNLvi
 HtYX7qTySpDFlzLxJc5kxI2cngFO56fa4/8a2swNlxEQTfXsCp2KD1F+R
 /4Gl6tQCpDXQV5YkJXvMVYgp78LoFvHOll+OiKeBJAiZ0KhRj7riBVMX6
 IB19EBrU0NOkLzGddk+6B38drAFXwoI9SNtJR7zTvPryZ4NPfVKx8xuuE
 2ENU1ELwUOIGg5It9w75Jm4xxtKkQ/DHDoMTKjzW7M5Ckxf+xDz/0znsh
 4ZwvqiRINGzLZh4lMlnXiZliIs1of4prOd6uO0dpvpJ16Xg4YKlED6hvv Q==;
X-CSE-ConnectionGUID: DJZRwTfIRgGsmPZ4MRyZyg==
X-CSE-MsgGUID: OwYKcEQlSdicmgkyDqzWLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65539298"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="65539298"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 04:05:59 -0700
X-CSE-ConnectionGUID: OsZY6NvMS6yyBv6DlEpwVA==
X-CSE-MsgGUID: ROJPYcV2SPiv0SvANcDswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="232782598"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:05:58 -0700
Date: Fri, 24 Apr 2026 13:05:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/kms_pwrite_crc: Create basic subtest (rev2)
Message-ID: <20260424110555.dnggxvpvc4egphs3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260421120652.27364-1-kamil.konieczny@linux.intel.com>
 <177683769029.484500.6556124151044098000@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177683769029.484500.6556124151044098000@a3b018990fe9>
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
On 2026-04-22 at 06:01:30 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_pwrite_crc: Create basic subtest (rev2)
> URL   : https://patchwork.freedesktop.org/series/165171/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18352_full -> IGTPW_15027_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15027_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15027_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15027/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15027_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_lowres@tiling-x:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-dg2-8/igt@kms_plane_lowres@tiling-x.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15027/shard-dg2-4/igt@kms_plane_lowres@tiling-x.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15027/shard-dg2-4/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglu-1:       NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15027/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@perf_pmu@most-busy-check-all@rcs0:
>     - shard-mtlp:         [PASS][5] -> [FAIL][6] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-mtlp-6/igt@perf_pmu@most-busy-check-all@rcs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15027/shard-mtlp-5/igt@perf_pmu@most-busy-check-all@rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-rkl:          [SKIP][7] ([i915#14544]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15027/shard-rkl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 

Unrelated.

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_18352_full and IGTPW_15027_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_pwrite_crc@basic:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.32, 1.00] s
> 

There was a test rename, as seen in results on i915 all passes.

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15027_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#6230])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15027/shard-rkl-4/igt@api_intel_bb@crc32.html
>     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#6230])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15027/shard-dg1-13/igt@api_intel_bb@crc32.html
>     - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#6230])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15027/shard-tglu-8/igt@api_intel_bb@crc32.html
> 
...cut...
