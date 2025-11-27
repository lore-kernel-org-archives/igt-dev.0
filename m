Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650B1CFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 14:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BA010E08F;
	Thu, 27 Nov 2025 14:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGXz3Mnc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEED10E08F;
 Thu, 27 Nov 2025 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764252424; x=1795788424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7yS8h+KCEY9x2Iqj3Z6G1jZDn3IiT4HsTilIZpXIhYs=;
 b=SGXz3MnczmJdySHRCifnmKVkBqb0SEc1QWD9TWCFcrPjKxBmM85AF3H4
 /F9GBPchk/4dQYYaGxTP41ITcgZA9mmd/GnlQrpOkc/tyE9LL/NbauNYl
 POTCTt/+6Ik+tlOrdxHdxslPm0Cju4BcpY0XwRQW7IzVsjeRkLsJk2hob
 FybAqcnz96GPmjBTsKZ8gN3ukeYWqa5iX1F/bymAq89wiNK7SD5XLTodS
 QEGfwP8VzI67sTz0GXe6+evRqE09XVXzcVXlW1ajThLLwCY7P1fGMjrP+
 G3fiyuImINJqMxBfYdVqY//wgcY3A+9M/0yPde0SH5qMXbU9W5DQN903L w==;
X-CSE-ConnectionGUID: PaiV6sG2QLG3TEfxWH157w==
X-CSE-MsgGUID: 47teOjXJTJ65vpQ+Lxu9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83909146"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="83909146"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 06:07:03 -0800
X-CSE-ConnectionGUID: vZCCuOs0RYaUuYoV+k38nQ==
X-CSE-MsgGUID: /Oa6Wd5vRZiho6uRUGA5hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193140641"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 06:07:02 -0800
Date: Thu, 27 Nov 2025 15:06:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/igt_dir: Fix fdopendir usage (rev2)
Message-ID: <20251127140645.tt372hxowejbr3ti@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251124172534.61724-1-kamil.konieczny@linux.intel.com>
 <176417143381.30390.16924481700320377884@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176417143381.30390.16924481700320377884@a3b018990fe9>
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
On 2025-11-26 at 15:37:13 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_dir: Fix fdopendir usage (rev2)
> URL   : https://patchwork.freedesktop.org/series/157981/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17588_full -> IGTPW_14115_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14115_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14115_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14115/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14115_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17588/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14115/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_content_protection@dp-mst-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14115/shard-dg2-11/igt@kms_content_protection@dp-mst-suspend-resume.html
> 
>   * igt@kms_content_protection@suspend-resume:
>     - shard-tglu-1:       NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14115/shard-tglu-1/igt@kms_content_protection@suspend-resume.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
>     - shard-rkl:          NOTRUN -> [SKIP][5] +4 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14115/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
>     - shard-dg1:          NOTRUN -> [SKIP][6] +9 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14115/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
>     - shard-tglu:         NOTRUN -> [SKIP][7] +9 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14115/shard-tglu-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
> 
>   * igt@testdisplay:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14115/shard-snb5/igt@testdisplay.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
>     - shard-rkl:          [SKIP][9] ([i915#14544]) -> [SKIP][10] +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17588/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14115/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
> 

Unrelated, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14115_full that come from known issues:
> 
