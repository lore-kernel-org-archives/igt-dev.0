Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F37CCD1A1
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 09:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824FF10E2FE;
	Thu, 16 Oct 2025 09:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0VfOJz6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE30110E2FE;
 Thu, 16 Oct 2025 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760607622; x=1792143622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/YIQa/rbrAcEsVCr72Ev9IZNZaudlzToWKfNbH889hw=;
 b=Q0VfOJz6MjUxi/oKoo3oNi8MIyEDiPkZSPyrunZYSCQyBl/kUtaGXkim
 5CPsjRM3vvmt+e/Rr11nDwhLr+VXll3BFX7qC5BI4FMe7tsI0aS1p30Ut
 m0Q/im2q9ryjHeuAvIQSGUmB6ErjE+R9VjDaZtmsURYYNBgBW8Z013w+Z
 ABbzbbtQms/ytnTe1jxCQJsAAYfnAjIoCpGDumrvwQ/1D8/7HNyn+YJYb
 3EhytYJRvTkjo7Zli1NCxFbf2NudEA3/rwGl5uHO0pj8Z7OydjD1R65qU
 b5rCuqMngE6BKhLt47mKMuRdMgpi+8yxGvBC6lhRttVW0J9/tYx9avEFg g==;
X-CSE-ConnectionGUID: vG+RWeqyQRuUXufzHjn1+w==
X-CSE-MsgGUID: 9l1XiI5cTpCYaMjyYdNtuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73079341"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="73079341"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 02:40:21 -0700
X-CSE-ConnectionGUID: KOSN+qB9QUSyC4+TU9WPaw==
X-CSE-MsgGUID: 9kii1YGBQ52CikQ9whzuXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="182815792"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.245.219])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 02:40:20 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for tests/gem_eio: Resolve
 timing issues in stress subtests (rev3)
Date: Thu, 16 Oct 2025 11:40:17 +0200
Message-ID: <10737269.nUPlyArG6x@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176060654705.21516.9677119278424745975@97596180aaec>
References: <20251015124419.66460-8-janusz.krzysztofik@linux.intel.com>
 <176060654705.21516.9677119278424745975@97596180aaec>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Thursday, 16 October 2025 11:22:27 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_eio: Resolve timing issues in stress subtests (rev3)
> URL   : https://patchwork.freedesktop.org/series/155531/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17369_full -> IGTPW_13909_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13909_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13909_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13909/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13909_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-rkl:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17369/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13909/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-rkl:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17369/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13909/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-rkl:          NOTRUN -> [ABORT][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13909/shard-rkl-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

None of the above failed tests, only gem_eio, is touched by the change under 
this pre-merge testing, then none of the above potential regressions is 
related.  Please update filters and re-report.

Thanks,
Janusz

> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-rkl:          [SKIP][6] ([i915#14544] / [i915#3637]) -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17369/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13909/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html
> 
>   
> New tests
> ---------
...


