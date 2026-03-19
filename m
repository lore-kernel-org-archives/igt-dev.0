Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA89108E1E9
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 11:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DD410E971;
	Thu, 19 Mar 2026 11:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fcmd8VsZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F4510E971;
 Thu, 19 Mar 2026 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773918477; x=1805454477;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eKojWDOV+XCSDZR5fDS7IoLcX0gclCit8nHMWa1mb3Q=;
 b=Fcmd8VsZx1E5yPzLqYmsuTTCLfV9iQRxa+aeMPapWBiwUBK0MTiqhvAY
 k9othyzwzGDOop146X1TWzcX7MiXOzKujU43LUFvi3xZWc0RfpOS/nlwQ
 pcUpyKXiEC2W59vg9PsTZYwwxpETcoJ2P1VVashgG0mWBwVr5hhWt4cY4
 rq/s5TbFQwlTAbwmuXte3/1X/AyxQ7zzYdvZSsiadd3XP+ljwA26nE7v5
 ignGBLYfVXTXm/OII8i56aHfVzBjONNBsL6wZX0Ebd38vxzwnnK1OKPni
 qMRlJnUHcZUw3Rr5gxENwqGZZprhBCOSRGo5HB0KbkU5b6iQGNaibpK5x Q==;
X-CSE-ConnectionGUID: /LrCc9nQTaKXgQQtDLMwRA==
X-CSE-MsgGUID: 4gFABjmiSlm5y/Fj3zXjWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86347500"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="86347500"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:07:57 -0700
X-CSE-ConnectionGUID: gT3cFQQySGe0PWPyTM43fA==
X-CSE-MsgGUID: HDrOb8LlQgOQ90gG1nsGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="216987963"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:07:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: i915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for
 tests/intel/kms_cdclk: use igt_next_crtc() (rev2)
In-Reply-To: <177384592171.372672.14936377343266266853@a3b018990fe9>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260309162311.706849-1-jani.nikula@intel.com>
 <177384592171.372672.14936377343266266853@a3b018990fe9>
Date: Thu, 19 Mar 2026 13:07:49 +0200
Message-ID: <6e027436d7fa2b7935e2bf6245eabb843fe16107@intel.com>
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

On Wed, 18 Mar 2026, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: tests/intel/kms_cdclk: use igt_next_crtc() (rev2)
> URL   : https://patchwork.freedesktop.org/series/162884/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from IGT_8809 -> IGTPW_14803
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_14803 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14803, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14803/index.html
>
> Participating hosts (42 -> 40)
> ------------------------------
>
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_14803:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@i915_selftest@live@evict:
>     - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8809/fi-skl-6600u/igt@i915_selftest@live@evict.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14803/fi-skl-6600u/igt@i915_selftest@live@evict.html

Unrelated, please re-report.

BR,
Jani.

>
>   
> Known issues
> ------------
>
>   Here are the changes found in IGTPW_14803 that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8809/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14803/bat-arls-5/igt@i915_selftest@live@workarounds.html
>
>   
> #### Possible fixes ####
>
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-9:          [DMESG-FAIL][5] ([i915#12061]) -> [PASS][6] +1 other test pass
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8809/bat-dg2-9/igt@i915_selftest@live@workarounds.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14803/bat-dg2-9/igt@i915_selftest@live@workarounds.html
>
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-tgl-1115g4:      [FAIL][7] ([i915#14867]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8809/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14803/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
>
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#14867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867
>
>
> Build changes
> -------------
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8809 -> IGTPW_14803
>
>   CI-20190529: 20190529
>   CI_DRM_18173: 185629feb8aee7cf88f72d1e67531574f1bea7f5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14803: 14803
>   IGT_8809: 9e55b6cdd3ad1ec8c2264106b035be91d12d8322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14803/index.html

-- 
Jani Nikula, Intel
