Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E13C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 21:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CB0113DDE;
	Wed, 24 Apr 2024 21:20:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80645113DDB;
 Wed, 24 Apr 2024 21:20:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5067903930326102451=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bv3?=
 =?utf-8?q?=2C1/2=5D_tests/kms=5Fvrr=3A_Add_a_subtest_for_seamless_modeset_t?=
 =?utf-8?q?o_a_virtual_LRR_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <navaremanasi@chromium.org>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Apr 2024 21:20:49 -0000
Message-ID: <171399364951.1632086.11727843960681013141@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424201344.783935-1-navaremanasi@chromium.org>
In-Reply-To: <20240424201344.783935-1-navaremanasi@chromium.org>
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
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============5067903930326102451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode
URL   : https://patchwork.freedesktop.org/series/132866/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7823 -> IGTPW_11065
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11065 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11065, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/index.html

Participating hosts (36 -> 37)
------------------------------

  Additional (4): fi-cfl-8109u bat-jsl-1 fi-apl-guc bat-arls-3 
  Missing    (3): fi-glk-j4005 bat-kbl-2 fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11065:

### IGT changes ###

#### Possible regressions ####

  * igt@debugfs_test@read_all_entries:
    - bat-arls-2:         [PASS][1] -> [FAIL][2] +18 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_fence@nb-await:
    - bat-arls-2:         NOTRUN -> [INCOMPLETE][3] +7 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_exec_fence@nb-await.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-arls-2:         [PASS][4] -> [INCOMPLETE][5] +37 other tests incomplete
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_vrr@seamless-rr-switch-virtual (NEW):
    - {bat-arls-4}:       NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-4/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adls-6:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adls-6/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-jsl-1:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-arls-1:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adlp-6:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adlp-9:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-virtual.html
    - {bat-rpls-4}:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rpls-4/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adln-1:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adln-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-dg2-14:         NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-rplp-1:         NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rplp-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-tgl-1115g4/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-arls-3:         NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_vrr@seamless-rr-switch-virtual.html
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-9/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-jsl-3:          NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  
#### Warnings ####

  * igt@debugfs_test@basic-hwmon:
    - bat-arls-2:         [SKIP][21] ([i915#9318]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@debugfs_test@basic-hwmon.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@debugfs_test@basic-hwmon.html

  * igt@gem_mmap@basic:
    - bat-arls-2:         [SKIP][23] ([i915#4083]) -> [INCOMPLETE][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_mmap@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-arls-2:         [SKIP][25] ([i915#10196] / [i915#4077]) -> [INCOMPLETE][26] +2 other tests incomplete
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_mmap_gtt@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arls-2:         [SKIP][27] ([i915#10197] / [i915#10211] / [i915#4079]) -> [INCOMPLETE][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_render_tiled_blits@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arls-2:         [SKIP][29] ([i915#10206] / [i915#4079]) -> [INCOMPLETE][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_tiled_pread_basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_tiled_pread_basic.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-arls-2:         [SKIP][31] ([i915#10200]) -> [INCOMPLETE][32] +3 other tests incomplete
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-arls-2:         [SKIP][33] ([i915#10200]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  
New tests
---------

  New tests have been introduced between IGT_7823 and IGTPW_11065:

### New IGT tests (1) ###

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11065 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][35] ([i915#9318])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - bat-arls-3:         NOTRUN -> [SKIP][36] ([i915#9318])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@debugfs_test@basic-hwmon.html

  * igt@gem_close_race@basic-threads:
    - bat-arls-2:         [PASS][37] -> [INCOMPLETE][38] ([i915#10922])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_close_race@basic-threads.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_gttfill@basic:
    - bat-arls-2:         [PASS][39] -> [INCOMPLETE][40] ([i915#10929])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_exec_gttfill@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][41] ([i915#2190])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][42] ([i915#2190])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][43] ([i915#4613]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-arls-3:         NOTRUN -> [SKIP][44] ([i915#10213]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][45] ([i915#4613]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html
    - bat-jsl-1:          NOTRUN -> [SKIP][46] ([i915#4613]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-arls-3:         NOTRUN -> [SKIP][47] ([i915#4083])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arls-3:         NOTRUN -> [SKIP][48] ([i915#10197] / [i915#10211] / [i915#4079])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-arls-3:         NOTRUN -> [SKIP][49] ([i915#10196] / [i915#4077]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arls-3:         NOTRUN -> [SKIP][50] ([i915#10206] / [i915#4079])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [PASS][51] -> [DMESG-WARN][52] ([i915#9427])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-arls-3:         NOTRUN -> [SKIP][53] ([i915#10209])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-arls-3:         NOTRUN -> [SKIP][54] ([i915#10200]) +9 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@unused-modifier:
    - bat-arls-2:         [PASS][55] -> [INCOMPLETE][56] ([i915#10377]) +13 other tests incomplete
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@unused-modifier.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@unused-modifier.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-arls-3:         NOTRUN -> [SKIP][57] ([i915#10202]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][58] ([i915#4103]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-3:         NOTRUN -> [SKIP][59] ([i915#9886])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][60] ([i915#3555] / [i915#9886])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-arls-3:         NOTRUN -> [SKIP][61] ([i915#10207])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          NOTRUN -> [SKIP][62]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][63] +27 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-arls-2:         NOTRUN -> [INCOMPLETE][64] ([i915#10377]) +19 other tests incomplete
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-arls-3:         NOTRUN -> [SKIP][65] ([i915#9812])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-arls-2:         NOTRUN -> [INCOMPLETE][66] ([i915#10377] / [i915#10553]) +1 other test incomplete
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-arls-3:         NOTRUN -> [SKIP][67] ([i915#9732]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-arls-2:         NOTRUN -> [SKIP][68] ([i915#10196] / [i915#4077] / [i915#9688])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arls-2:         NOTRUN -> [SKIP][69] ([i915#10208] / [i915#8809])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-arls-3:         NOTRUN -> [SKIP][70] ([i915#10208] / [i915#8809])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@flip-basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][71] ([i915#10843] / [i915#10846]) +9 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-rkl-11600/igt@kms_vrr@flip-basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][72] ([i915#6078]) +9 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-atsm-1/igt@kms_vrr@flip-basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][73] +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-guc/igt@kms_vrr@flip-basic.html
    - bat-jsl-3:          NOTRUN -> [SKIP][74] ([i915#3555]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-3/igt@kms_vrr@flip-basic.html
    - bat-adlp-11:        NOTRUN -> [SKIP][75] ([i915#10470] / [i915#10501]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-11/igt@kms_vrr@flip-basic.html
    - bat-adln-1:         NOTRUN -> [SKIP][76] ([i915#3555]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adln-1/igt@kms_vrr@flip-basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][77] ([i915#3555] / [i915#8808]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-8/igt@kms_vrr@flip-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][78] ([i915#3555]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_vrr@flip-basic.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][79] ([i915#3555]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - fi-pnv-d510:        NOTRUN -> [SKIP][80] +9 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-pnv-d510/igt@kms_vrr@flip-basic-fastset.html
    - bat-jsl-3:          NOTRUN -> [SKIP][81] ([i915#9906]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-3/igt@kms_vrr@flip-basic-fastset.html
    - bat-adln-1:         NOTRUN -> [SKIP][82] ([i915#9906]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adln-1/igt@kms_vrr@flip-basic-fastset.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][83] +9 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-elk-e7500/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][84] +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-kbl-7567u/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - bat-dg2-14:         NOTRUN -> [SKIP][85] ([i915#3555]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-14/igt@kms_vrr@flipline.html
    - bat-rplp-1:         NOTRUN -> [SKIP][86] ([i915#3555]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rplp-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - bat-adlm-1:         NOTRUN -> [SKIP][87] ([i915#9900]) +9 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlm-1/igt@kms_vrr@max-min.html
    - bat-rplp-1:         NOTRUN -> [SKIP][88] ([i915#9906]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rplp-1/igt@kms_vrr@max-min.html
    - fi-ilk-650:         NOTRUN -> [SKIP][89] +9 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-ilk-650/igt@kms_vrr@max-min.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][90] ([i915#9906]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-tgl-1115g4/igt@kms_vrr@max-min.html
    - bat-arls-1:         NOTRUN -> [SKIP][91] ([i915#8808]) +8 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-1/igt@kms_vrr@max-min.html
    - bat-arls-3:         NOTRUN -> [SKIP][92] ([i915#8808]) +7 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_vrr@max-min.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][93] ([i915#9792]) +9 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-6/igt@kms_vrr@max-min.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][94] ([i915#8808] / [i915#9906]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-8/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - bat-adlp-9:         NOTRUN -> [SKIP][95] ([i915#3555])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-9/igt@kms_vrr@negative-basic.html
    - bat-adls-6:         NOTRUN -> [SKIP][96] ([i915#3555])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adls-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][97] +9 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][98] +9 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-blb-e6850/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-dg2-14:         NOTRUN -> [SKIP][99] ([i915#9906]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][100] +9 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-bsw-nick/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][101] ([i915#9197]) +9 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][102] +9 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adlp-11:        NOTRUN -> [SKIP][103] ([i915#10470]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][104] +21 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-8109u/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][105] +9 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-ivb-3770/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-dg2-8:          NOTRUN -> [SKIP][106] ([i915#9197]) +9 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][107] +9 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-kbl-guc/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - bat-adlp-9:         NOTRUN -> [SKIP][108] ([i915#9906]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-adls-6:         NOTRUN -> [SKIP][109] ([i915#9906]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adls-6/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-jsl-1:          NOTRUN -> [SKIP][110] ([i915#9906]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-adlp-6:         NOTRUN -> [SKIP][111] ([i915#9906]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-arls-3:         NOTRUN -> [SKIP][112] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arls-3:         NOTRUN -> [SKIP][113] ([i915#10212] / [i915#3708])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - bat-arls-3:         NOTRUN -> [SKIP][114] ([i915#10214] / [i915#3708])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-arls-3:         NOTRUN -> [SKIP][115] ([i915#10216] / [i915#3708])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-wait@vecs0:
    - {bat-rpls-4}:       [DMESG-WARN][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-rpls-4/igt@gem_exec_fence@basic-wait@vecs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rpls-4/igt@gem_exec_fence@basic-wait@vecs0.html

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-9:          [FAIL][118] ([i915#10378]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][120] ([i915#10594]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-arls-2:         [SKIP][122] ([i915#10200]) -> [INCOMPLETE][123] ([i915#10377]) +4 other tests incomplete
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arls-2:         [SKIP][124] ([i915#10202]) -> [INCOMPLETE][125] ([i915#10377]) +1 other test incomplete
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-2:         [SKIP][126] ([i915#9886]) -> [INCOMPLETE][127] ([i915#10377])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_dsc@dsc-basic.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_dsc@dsc-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196
  [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#10206]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206
  [i915#10207]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10377]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10377
  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
  [i915#10843]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10843
  [i915#10846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10846
  [i915#10922]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10922
  [i915#10929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10929
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9427
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7823 -> IGTPW_11065

  CI-20190529: 20190529
  CI_DRM_14645: ad654139fd5a7773f0310b5f745c105cdba520e8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11065: 11065
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/index.html

--===============5067903930326102451==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132866/">https://patchwork.freedesktop.org/series/132866/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7823 -&gt; IGTPW_11065</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11065 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11065, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/index.html</p>
<h2>Participating hosts (36 -&gt; 37)</h2>
<p>Additional (4): fi-cfl-8109u bat-jsl-1 fi-apl-guc bat-arls-3 <br />
  Missing    (3): fi-glk-j4005 bat-kbl-2 fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11065:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@debugfs_test@read_all_entries.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_exec_fence@nb-await.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">INCOMPLETE</a> +37 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual (NEW):</p>
<ul>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adls-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rpls-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adln-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rplp-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-tgl-1115g4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_mmap@basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_mmap_gtt@basic.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_tiled_pread_basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7823 and IGTPW_11065:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_vrr@seamless-rr-switch-virtual:<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11065 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-threads:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_close_race@basic-threads.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10922">i915#10922</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10929">i915#10929</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9427">i915#9427</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-modifier:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@unused-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@unused-modifier.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10377">i915#10377</a>) +13 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207">i915#10207</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_pipe_crc_basic@read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10377">i915#10377</a>) +19 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_pm_rpm@basic-pci-d3-state.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10377">i915#10377</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-rkl-11600/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10843">i915#10843</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10846">i915#10846</a>) +9 other tests skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-atsm-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +9 other tests skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> +9 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-3/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-11/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>) +6 other tests skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adln-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-pnv-d510/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +9 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adln-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-elk-e7500/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-kbl-7567u/igt@kms_vrr@flip-dpms.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-14/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rplp-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlm-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +9 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rplp-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-ilk-650/igt@kms_vrr@max-min.html">SKIP</a> +9 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-tgl-1115g4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +8 other tests skip</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +7 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +9 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-mtlp-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-9/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adls-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +9 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-blb-e6850/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +9 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-bsw-nick/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +9 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +9 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +2 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-cfl-8109u/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +21 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-ivb-3770/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +9 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +9 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-kbl-guc/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adls-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-wait@vecs0:</p>
<ul>
<li>{bat-rpls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-rpls-4/igt@gem_exec_fence@basic-wait@vecs0.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-rpls-4/igt@gem_exec_fence@basic-wait@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594">i915#10594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10377">i915#10377</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10377">i915#10377</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7823/bat-arls-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-arls-2/igt@kms_dsc@dsc-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10377">i915#10377</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7823 -&gt; IGTPW_11065</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14645: ad654139fd5a7773f0310b5f745c105cdba520e8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11065: 11065<br />
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5067903930326102451==--
