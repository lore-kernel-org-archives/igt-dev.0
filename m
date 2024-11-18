Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27E0D49209
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 10:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B295C10E0B0;
	Mon, 18 Nov 2024 10:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjOSZh+3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278CE10E0B0;
 Mon, 18 Nov 2024 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731926165; x=1763462165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LmwfZ/elG7Ih57rgN5/LzwU9VzwvfhlacvC6mh3J6b4=;
 b=PjOSZh+3cNTqYXOKc7jmePJxcAqDiGJkaM2A2Jb8oAlj+A9IA8mZjb1s
 vXl4h069jgd6fmkJAFREP6qp9P8rrqJ0RhfVpL1/rzQHkyUUyWUhGpypE
 im3QczldcBJpxSCjNQFuOoeB05nCWnrFb7wZN3KmuN5LD6LGOa9HxGkNQ
 +/sBPKdWNA17dWoe0pdeIJujUDT6c6Bm4LDesWFSVYzQ3dSBerxyCCtkk
 kHegtktnWdwkT2AJYxrut5U63D9f5nO08ZpgQAow5+jXYeuLSlmkv9Zs7
 XYE+SvWmNqhBf7Ad4OeQFJQ0zBIul8a1zsVCXInCLKkRlqhhvcomEjImN A==;
X-CSE-ConnectionGUID: ANbh2zeiQ7Opn98qMhWRvQ==
X-CSE-MsgGUID: Dix0KjZQQ56dqbEonew6HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42949058"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="42949058"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:36:04 -0800
X-CSE-ConnectionGUID: nkvyuCJ/TDy9tKlJtV5lFg==
X-CSE-MsgGUID: G9D8Oor0TbSBH2bcSop8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89202235"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.157])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:36:03 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= Fi.CI.BAT: failure for intel-ci: Blocklist
 igt@i915_module_load@load
Date: Mon, 18 Nov 2024 11:35:59 +0100
Message-ID: <3251378.5fSG56mABF@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <173168570170.283831.3221381805830522809@2413ebb6fbb6>
References: <20241115145854.19330-2-janusz.krzysztofik@linux.intel.com>
 <173168570170.283831.3221381805830522809@2413ebb6fbb6>
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

On Friday, 15 November 2024 16:48:21 CET Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Blocklist igt@i915_module_load@load
> URL   : https://patchwork.freedesktop.org/series/141406/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8114 -> IGTPW_12116
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12116 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12116, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/index.html
> 
> Participating hosts (46 -> 46)
> ------------------------------
> 
>   Additional (1): bat-mtlp-8 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12116:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-adlp-9:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/bat-adlp-9/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-adlp-9/igt@i915_selftest@live.html

Not related, please update CBL filters and re-report.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12116 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][3] ([i915#9318])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_mmap@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][5] ([i915#4083])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@gem_mmap@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][6] ([i915#4079]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][7] ([i915#4077]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][8] ([i915#11681] / [i915#6621])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][9] ([i915#4212] / [i915#5190])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][10] ([i915#4212]) +8 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][11] ([i915#4213]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][12] ([i915#3555] / [i915#3840] / [i915#9159])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][13]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][14] ([i915#5274])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         [PASS][15] -> [SKIP][16] ([i915#9197]) +3 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][17] ([i915#4077] / [i915#9688]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][18] ([i915#3555] / [i915#8809])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][19] ([i915#3708]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][20] ([i915#3708] / [i915#4077]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][21] ([i915#10216] / [i915#3708])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/bat-mtlp-8/igt@prime_vgem@basic-write.html
> 
>   
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
>   [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8114 -> IGTPW_12116
> 
>   CI-20190529: 20190529
>   CI_DRM_15707: c43ac257e8f2dfe3a5f56d3565472cb8051ca32d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12116: 12116
>   IGT_8114: 8114
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/index.html
> 




