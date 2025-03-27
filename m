Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F378C36013
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 20:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110A510E94F;
	Thu, 27 Mar 2025 20:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mg+zwfDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B015510E163;
 Thu, 27 Mar 2025 20:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743105789; x=1774641789;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=zITHCj0yG+D5RIrmXMtnoalBdcIUt8nN+n8V756ko10=;
 b=Mg+zwfDa2alp6Tpgi+MexSaOSbt9DpmssqlGClLFW9T5aLqjaJxvgo7o
 OksrmggBUGuQ5CpUpCt/ichwt7NtWOsC2LOa56TbJ07wn6d66r4THFt+r
 q+MGaY2twpsv1QYcfT9SzV1OnYhJVhFvBMIzOAzb8zgeftc5c//U1BvmV
 UrqlIWUjuxTD9U5FslGsPW3q0Gvff+KYpUmnFYbziuhjV+U2bUNnJji5M
 0lY2T55JQbOeKbmeDrLRjFVdv8lqgOKgaufegebluX1l653/DQSexzPh+
 oAff1VJpdATnQWO7fAC4Vzsxzja8lp/ZiIkSbJZmFQM/dzSBZtpmSpHlr A==;
X-CSE-ConnectionGUID: AT6tfQJGSFq07FTfebTezg==
X-CSE-MsgGUID: kIPVjI/NThq17NKLbjnn3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43698330"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="43698330"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:03:08 -0700
X-CSE-ConnectionGUID: mldtIGojTpO9XZF5QcmtPQ==
X-CSE-MsgGUID: lDOzomjES7OikOGunZFcUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125050757"
Received: from kbrylows-mobl6.ger.corp.intel.com (HELO [10.245.96.173])
 ([10.245.96.173])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:03:08 -0700
Message-ID: <e3e6a7ba-e49b-41b9-ba38-d27e253a09f4@linux.intel.com>
Date: Thu, 27 Mar 2025 21:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_man/lsgpu?=
 =?UTF-8?Q?=3A_Add_man_page_for_lsgpu?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250327110616.59257-1-peter.senna@linux.intel.com>
 <174309460093.11772.18289412343678412859@e6b6f09ec485>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174309460093.11772.18289412343678412859@e6b6f09ec485>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 3/27/2025 5:56 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: man/lsgpu: Add man page for lsgpu
> URL   : https://patchwork.freedesktop.org/series/146860/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16326_full -> IGTPW_12857_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12857_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12857_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12857_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-rkl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16326/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-dg2:          NOTRUN -> [SKIP][3] +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html
>     - shard-dg1:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-mtlp:         NOTRUN -> [SKIP][5] +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-mtlp-6/igt@kms_plane_multiple@2x-tiling-none.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-tglu-1:       NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-rkl:          NOTRUN -> [SKIP][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html
>     - shard-tglu:         NOTRUN -> [SKIP][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-rkl:          [PASS][10] -> [INCOMPLETE][11] +1 other test incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16326/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@perf_pmu@rc6@runtime-pm-gt0:
>     - shard-rkl:          [PASS][12] -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16326/shard-rkl-1/igt@perf_pmu@rc6@runtime-pm-gt0.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12857/shard-rkl-6/igt@perf_pmu@rc6@runtime-pm-gt0.html
> 

These are unrelated to my change. Please fix and resubmit.

Thank you,

Peter
