Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5624C10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 13:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B98910F8C6;
	Mon,  6 May 2024 13:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAmlMB0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1343710F8C6
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715000489; x=1746536489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Day+q+dMOolfAYfgAmyEMoESseSrJS+SwDYyFYKsOjM=;
 b=aAmlMB0Flsx6m1ABFFlQriHeA4qil0riSDqG/7VztDE1WcDt5L14iUJ+
 +t/10MmgTB/+8Bvy2bb8Eu6aNpXF/JyEFS8+ZCf5AmNXpDwc8bpOPA2NH
 1Po1hqgYa4bb3UdaSeUnoCHno4jtWORwN34Qoo2tTMpP6v4Sf3yMXeSVi
 TAiAEo0iswTf7FC9+Cu03fnxG0FRaRnEnH+PjsH8LmGpYjPQk0JT+M5a0
 kBUzaE9hBh/PzA17Ge9OS6oveC8u6JRS8QwSU0kd5LGnc3L/jjYVTvnF0
 RsQiwHMG+nflmnDol+M0N7kZuR6g17TkJVMS3Tq+R+DMC8Vh9oHtsQXGK A==;
X-CSE-ConnectionGUID: UiG5VtQeRka9z+OISZ2J9Q==
X-CSE-MsgGUID: kdFT9dJ+TUitv1MYUCEKMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10865665"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10865665"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:01:29 -0700
X-CSE-ConnectionGUID: BQPOtImNShiiqZgRQiBdUQ==
X-CSE-MsgGUID: 552wSBUTSVGVCqkXQmrYFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28165562"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 06:01:28 -0700
Date: Mon, 6 May 2024 15:01:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/meson.build: Generate test-list for cross build
Message-ID: <20240506130125.yu5ycz4lfyfzro2u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Vignesh Raman <vignesh.raman@collabora.com>
References: <20240502064309.56280-1-vignesh.raman@collabora.com>
 <171464314465.1848758.14480140290673064072@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171464314465.1848758.14480140290673064072@8e613ede5ea5>
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
On 2024-05-02 at 09:45:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/meson.build: Generate test-list for cross build
> URL   : https://patchwork.freedesktop.org/series/133130/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14689 -> IGTPW_11092
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11092 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11092, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/index.html
> 
> Participating hosts (40 -> 39)
> ------------------------------
> 
>   Additional (1): bat-dg2-11 
>   Missing    (2): fi-tgl-1115g4 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11092:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@reset:
>     - fi-apl-guc:         [PASS][1] -> [DMESG-WARN][2] +36 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/fi-apl-guc/igt@i915_selftest@live@reset.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/fi-apl-guc/igt@i915_selftest@live@reset.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11092 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][3] ([i915#9318])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@debugfs_test@read_all_entries:
>     - fi-apl-guc:         [PASS][4] -> [DMESG-WARN][5] ([i915#10900] / [i915#8585]) +5 other tests dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/fi-apl-guc/igt@debugfs_test@read_all_entries.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/fi-apl-guc/igt@debugfs_test@read_all_entries.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][7] ([i915#4083])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@gem_mmap@basic.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][8] ([i915#4083])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@gem_mmap@basic.html
> 
>   * igt@gem_mmap_gtt@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][9] ([i915#4077]) +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@gem_mmap_gtt@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][10] ([i915#4079]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][11] ([i915#4077]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][12] ([i915#4079]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_module_load@reload:
>     - fi-apl-guc:         [PASS][13] -> [DMESG-WARN][14] ([i915#180] / [i915#1982] / [i915#8585])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/fi-apl-guc/igt@i915_module_load@reload.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/fi-apl-guc/igt@i915_module_load@reload.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg2-11:         NOTRUN -> [SKIP][15] ([i915#6621])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@i915_pm_rps@basic-api.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][16] ([i915#6621])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-arls-3:         [PASS][17] -> [DMESG-WARN][18] ([i915#9522])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/bat-arls-3/igt@i915_selftest@live@gt_mocs.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-arls-3/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@kms_addfb_basic@addfb25-4-tiled:
>     - fi-apl-guc:         [PASS][19] -> [DMESG-WARN][20] ([i915#10900]) +35 other tests dmesg-warn
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][21] ([i915#4212]) +7 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][22] ([i915#5190])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][23] ([i915#5190])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][24] ([i915#4212]) +8 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][25] ([i915#4215] / [i915#5190])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][26] ([i915#4103] / [i915#4213]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][27] ([i915#4213]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][28] ([i915#3555] / [i915#3840])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_dsc@dsc-basic.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][29] ([i915#3555] / [i915#3840] / [i915#9159])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
>     - fi-apl-guc:         [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +26 other tests dmesg-warn
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
>     - fi-apl-guc:         [PASS][32] -> [DMESG-WARN][33] ([i915#180] / [i915#1982]) +1 other test dmesg-warn
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][34]
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][35]
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-11:         NOTRUN -> [SKIP][36] ([i915#5274])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][37] ([i915#5274])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
>     - fi-apl-guc:         [PASS][38] -> [DMESG-WARN][39] ([i915#180] / [i915#8585]) +8 other tests dmesg-warn
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-dg2-11:         NOTRUN -> [SKIP][40] ([i915#5354])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][41] ([i915#4077] / [i915#9688])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-dg2-11:         NOTRUN -> [SKIP][42] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-dg2-11:         NOTRUN -> [SKIP][43] ([i915#3555])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][44] ([i915#3555] / [i915#8809])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-dg2-11:         NOTRUN -> [SKIP][45] ([i915#3708])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-dg2-11:         NOTRUN -> [SKIP][46] ([i915#3708] / [i915#4077]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][47] ([i915#3708] / [i915#4077]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][48] ([i915#3708]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-dg2-11:         NOTRUN -> [SKIP][49] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-dg2-11/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][50] ([i915#10216] / [i915#3708])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-8/igt@prime_vgem@basic-write.html
> 

This change do not touch any tests, only meson.build
After supress please do not re-run.

Regards,
Kamil

>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - {bat-mtlp-9}:       [CRASH][51] ([i915#10911]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-n3050:       [ABORT][53] ([i915#10800]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14689/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10800]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10800
>   [i915#10900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10900
>   [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
>   [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#8585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
>   [i915#9522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9522
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7828 -> IGTPW_11092
> 
>   CI-20190529: 20190529
>   CI_DRM_14689: 8f904f61a50ed9e9869bead4a4dd767fce79a025 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11092: 11092
>   IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11092/index.html
