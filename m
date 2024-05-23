Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835D5C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 14:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8CA10E133;
	Thu, 23 May 2024 14:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6dG1PVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18ED888D9;
 Thu, 23 May 2024 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716473484; x=1748009484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jK31dUWqfO3T5EkN+YZV5DQj06+Nhf0KSK0YOTpIjxE=;
 b=b6dG1PVJpSnpLzNiJ7T3Ml4tD1atbCOnDDskl86sBlBwPJlaYASNf/B0
 H4i47ckb/SMtNgQoWYIyB/MDKlojMuNol1dAGDKM9I3uoWIQooeQTQ5bi
 Kcw/oH0Id1Q3yoMWHCu2hdHKFnhH/Mv65/Hw5G2HDryOtqGPhJXqkt4Mv
 VvDG3EcsGHxWGegNaNF0n8oX00D5401Ip+ogZBwyiJ3Pvm27znSNNiqLt
 rx7rP8U94jzHSv09mZmbIzIZtAAgbkPQtrGDMpAnbP51JS3OGGI0SMLiO
 6ElIoZYXoSC2UNPzJXpP/m87tPtVwM71TeYzAfS7Vo7+1LB9s2BSTK6BB w==;
X-CSE-ConnectionGUID: XO8HCSUrSBOoMwM+cGxWIA==
X-CSE-MsgGUID: h0BV/uIZR/KssOHhZ1rZdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24202780"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="24202780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:10:28 -0700
X-CSE-ConnectionGUID: fTppPMZHSl6MzAfLzARk8g==
X-CSE-MsgGUID: pZTzKx8FQDm+TkAiyi0TWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="38075262"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 07:10:27 -0700
Date: Thu, 23 May 2024 16:10:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
	I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for lib:
 sync i915_pciids.h and _local.h with kernel
Message-ID: <20240523141024.tg5h2y3rvutdbo5i@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <cover.1716373923.git.jani.nikula@intel.com>
 <171639852158.2167935.544217577465359235@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171639852158.2167935.544217577465359235@8e613ede5ea5>
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
On 2024-05-22 at 17:22:01 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib: sync i915_pciids.h and _local.h with kernel
> URL   : https://patchwork.freedesktop.org/series/133915/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7867_full -> XEIGTPW_11177_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11177_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11177_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 2)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11177_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a6:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2] +5 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a6.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11177/shard-dg2-466/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a6.html
> 

Unrelated to adding new pci ids.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x256:
>     - {shard-lnl}:        [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-256x256.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11177/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-256x256.html
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-edp1:
>     - {shard-lnl}:        [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-edp1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11177/shard-lnl-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>     - {shard-lnl}:        NOTRUN -> [ABORT][7] +1 other test abort
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11177/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>     - {shard-lnl}:        NOTRUN -> [FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11177/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_plane@plane-panning-bottom-right@pipe-b:
>     - {shard-lnl}:        [PASS][9] -> [ABORT][10] +3 other tests abort
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right@pipe-b.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11177/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right@pipe-b.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - {shard-lnl}:        NOTRUN -> [SKIP][11]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11177/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11177_full that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7867 -> IGTPW_11177
>   * Linux: xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd -> xe-1326-60134578b28bbd5dca007a0d8abaa6daaca9ddaf
> 
>   IGTPW_11177: b2c2edb42403917736414e00184336a877f7cb36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: b134db8544f8d5b8a960b368afe12820c3cbe8cd
>   xe-1326-60134578b28bbd5dca007a0d8abaa6daaca9ddaf: 60134578b28bbd5dca007a0d8abaa6daaca9ddaf
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11177/index.html
