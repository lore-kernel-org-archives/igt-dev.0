Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A6DC47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 10:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E81C1127EE;
	Mon, 29 Jan 2024 10:10:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1621127EE;
 Mon, 29 Jan 2024 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706523056; x=1738059056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mPlAsJCh0x5sbrQkrz3RFZ4T2PzIzDB5Gj1mSxsGAWw=;
 b=BbqQoVK3JybzNycVXqPh4XMXp0j8TwI6GtyBhZS7ERzkHt38mVWoJl+K
 mVuQuefCtedz3wJMIzLZDzKvyKA7q6h7f0IY4oe/DM5ieAY06he60MM0H
 tkj4tdYNNO3M1El3aJ7bUrn8EhzlXIwIWe1Q3ElExASjZv9JwFKRh5Iue
 K3YXMk290MhhyDqeblyjv7jkBNHoW9+v3kGWZ3mWDTKjSbbPRSaCYXMlq
 oxxy7VjlDGWx5FMEmuoIEjWS1pz5JLb05j2jTcl5zawNpedGNLy87CCBH
 80tn/SDf5lrxG6aI+a55B/C1oTKYjqdo3WShkGim60vbcZ5c7FvrTTAX+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2798765"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2798765"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 02:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="911017948"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="911017948"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 02:10:51 -0800
Date: Mon, 29 Jan 2024 11:10:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 lib/xe/xe_query: Print L3 bank and node masks
Message-ID: <20240129101048.o3q3rvpvclryalmk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240126155129.6-1-francois.dugast@intel.com>
 <170628789472.745726.8342200477255384118@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170628789472.745726.8342200477255384118@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-26 at 16:51:34 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_query: Print L3 bank and node masks
> URL   : https://patchwork.freedesktop.org/series/129204/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14181 -> IGTPW_10593
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10593 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10593, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/index.html
> 
> Participating hosts (37 -> 34)
> ------------------------------
> 
>   Missing    (3): bat-kbl-2 fi-snb-2520m bat-adls-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10593:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14181/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
> 

Unrelated to Xe changes,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10593 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-adlm-1:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-adlm-1/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-adlm-1:         NOTRUN -> [SKIP][4] ([i915#6621])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-adlm-1/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-11:         [PASS][5] -> [DMESG-FAIL][6] ([i915#9500])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14181/bat-dg2-11/igt@i915_selftest@live@workarounds.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-dg2-11/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adlm-1:         NOTRUN -> [SKIP][7] ([fdo#109285])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlm-1:         NOTRUN -> [SKIP][8] ([i915#1849] / [i915#4342])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc:
>     - bat-adlm-1:         NOTRUN -> [SKIP][9] ([i915#9875] / [i915#9900]) +6 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-adlm-1/igt@kms_pipe_crc_basic@hang-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][10] ([i915#9197]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-adlm-1:         NOTRUN -> [SKIP][11] ([i915#5354])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - fi-kbl-7567u:       [PASS][12] -> [DMESG-WARN][13] ([i915#1982])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14181/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-adlm-1:         NOTRUN -> [SKIP][14] ([i915#3555])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-adlm-1:         NOTRUN -> [SKIP][15] ([i915#3708] / [i915#9900])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-adlm-1:         NOTRUN -> [SKIP][16] ([i915#3708]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/bat-adlm-1/igt@prime_vgem@basic-write.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
>   [i915#9500]: https://gitlab.freedesktop.org/drm/intel/issues/9500
>   [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9875]: https://gitlab.freedesktop.org/drm/intel/issues/9875
>   [i915#9900]: https://gitlab.freedesktop.org/drm/intel/issues/9900
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7693 -> IGTPW_10593
> 
>   CI-20190529: 20190529
>   CI_DRM_14181: 6aa961ab469df8db84bee01a55606a91a6ae5d67 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10593: 10593
>   IGT_7693: f5f774ada63296536195fd381d8720f5ac7e2208 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10593/index.html
