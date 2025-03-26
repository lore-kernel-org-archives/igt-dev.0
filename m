Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3022DC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 09:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D448610E68B;
	Wed, 26 Mar 2025 09:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TORCF2r8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CE310E68B;
 Wed, 26 Mar 2025 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742982651; x=1774518651;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8ZSplIPF53NGM9CTdAIcEtZTYA3gBBS5WRp4PngXvmw=;
 b=TORCF2r8vQDFS7rlOyy1Rv6mpFZ0mI9WtUzEjoHFoELi2LcfHahVufch
 ngPaXKH6t+os30oenCkakbyS1OUC5Fkdsm4bL+CApx4RHApumJO1+GbRU
 Z0cBN5fIstjOKUokRc4qnUTRPFh1Jg5kBGwew7au2x6Z0qsU+Hh66q4Nn
 XzetdNwh6gd4vAzzGCHxilmiTooFQt/AeQQnEbfnfe7bJ3FC1Cwkwspq9
 L2A+9E2Q/2ZEt9rEUENydBcVtxevK7htaJ/jnaM/2K+sTXnwnPsSxjX+1
 /YFkC36t4CjQRA8hDSAb/EJvDcC+mQB5bmBrRBlqFRNeGqZwRfPRLlDNv w==;
X-CSE-ConnectionGUID: 7JUdLZlRQ3GjvbJUrFNhZg==
X-CSE-MsgGUID: WwG8CQKaRc+3LE6LnXgv/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44421858"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44421858"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:50:47 -0700
X-CSE-ConnectionGUID: ERX8wMMhT1OBkyJDi3kiGA==
X-CSE-MsgGUID: 6ES4Bdy0TnanERU/z6Nhmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="125513904"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:50:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for lib/dsc: use
 intel_display_caps instead of i915_display_capabilities
In-Reply-To: <174295146489.3302.9664331582388144948@e6b6f09ec485>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250325130842.1821042-1-jani.nikula@intel.com>
 <174295146489.3302.9664331582388144948@e6b6f09ec485>
Date: Wed, 26 Mar 2025 11:50:43 +0200
Message-ID: <8734f086j0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 26 Mar 2025, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: lib/dsc: use intel_display_caps instead of i915_display_capabilities
> URL   : https://patchwork.freedesktop.org/series/146736/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from IGT_8284 -> IGTPW_12829
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_12829 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12829, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12829/index.html
>
> Participating hosts (41 -> 40)
> ------------------------------
>
>   Missing    (1): fi-snb-2520m 
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_12829:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@i915_selftest@live@workarounds:
>     - bat-rplp-1:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-rplp-1/igt@i915_selftest@live@workarounds.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12829/bat-rplp-1/igt@i915_selftest@live@workarounds.html

Unrelated.

BR,
Jani.

>
>   
> Known issues
> ------------
>
>   Here are the changes found in IGTPW_12829 that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@dmabuf@all-tests:
>     - bat-apl-1:          [PASS][3] -> [INCOMPLETE][4] ([i915#12904]) +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8284/bat-apl-1/igt@dmabuf@all-tests.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12829/bat-apl-1/igt@dmabuf@all-tests.html
>
>   
>   [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>
>
> Build changes
> -------------
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8284 -> IGTPW_12829
>
>   CI-20190529: 20190529
>   CI_DRM_16320: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12829: 12829
>   IGT_8284: 8284
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12829/index.html

-- 
Jani Nikula, Intel
