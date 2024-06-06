Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D6FC27C52
	for <igt-dev@archiver.kernel.org>; Thu,  6 Jun 2024 06:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AF810E848;
	Thu,  6 Jun 2024 06:36:47 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA4610E848;
 Thu,  6 Jun 2024 06:36:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3164265670163869442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_VRR_test_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Jun 2024 06:36:46 -0000
Message-ID: <171765580663.3706.5578094436406098568@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606055205.3296434-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240606055205.3296434-1-bhanuprakash.modem@intel.com>
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

--===============3164265670163869442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VRR test cleanup
URL   : https://patchwork.freedesktop.org/series/134534/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14883 -> IGTPW_11229
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11229 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11229, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/index.html

Participating hosts (35 -> 36)
------------------------------

  Additional (4): bat-arls-4 bat-mtlp-6 bat-jsl-1 bat-arls-3 
  Missing    (3): bat-kbl-2 bat-arls-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11229:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - bat-arls-3:         NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@reset:
    - {bat-arls-4}:       NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-4/igt@i915_selftest@live@reset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14883 and IGTPW_11229:

### New IGT tests (1) ###

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [25.20, 25.37] s

  

Known issues
------------

  Here are the changes found in IGTPW_11229 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#9318])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - bat-arls-3:         NOTRUN -> [SKIP][4] ([i915#9318])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#9318])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-arls-3:         NOTRUN -> [SKIP][6] ([i915#1849])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@fbdev@info.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][7] ([i915#1849] / [i915#2582])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@fbdev@info.html

  * igt@fbdev@write:
    - bat-arls-3:         NOTRUN -> [SKIP][8] ([i915#11191]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@fbdev@write.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][9] ([i915#2582]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@fbdev@write.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][10] ([i915#2190])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-8:          [PASS][11] -> [FAIL][12] ([i915#10378])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14883/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-arls-3:         NOTRUN -> [SKIP][13] ([i915#10213]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-mtlp-6:         NOTRUN -> [SKIP][14] ([i915#4613]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html
    - bat-jsl-1:          NOTRUN -> [SKIP][15] ([i915#4613]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-arls-3:         NOTRUN -> [SKIP][16] ([i915#4083])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_mmap@basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][17] ([i915#4083])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arls-3:         NOTRUN -> [SKIP][18] ([i915#10197] / [i915#10211] / [i915#4079])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-arls-3:         NOTRUN -> [SKIP][19] ([i915#10196] / [i915#4077]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_tiled_blits@basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][20] ([i915#4077]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arls-3:         NOTRUN -> [SKIP][21] ([i915#10206] / [i915#4079])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_tiled_pread_basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][22] ([i915#4079]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-arls-3:         NOTRUN -> [SKIP][23] ([i915#10209])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][24] ([i915#6621])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [PASS][25] -> [DMESG-FAIL][26] ([i915#9500])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14883/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-arls-3:         NOTRUN -> [SKIP][27] ([i915#10200]) +9 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][28] ([i915#4212] / [i915#9792]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-6:         NOTRUN -> [SKIP][29] ([i915#5190] / [i915#9792])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][30] ([i915#4103]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-arls-3:         NOTRUN -> [SKIP][31] ([i915#11190]) +16 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][32] ([i915#9792]) +21 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][33] ([i915#3555] / [i915#9886])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-arls-3:         NOTRUN -> [SKIP][34] ([i915#3637]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][35] ([i915#3637] / [i915#9792]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-arls-3:         NOTRUN -> [SKIP][36] ([i915#10207])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-6:         NOTRUN -> [SKIP][38] ([i915#5274] / [i915#9792])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-3:         NOTRUN -> [SKIP][39] ([i915#4342] / [i915#5354])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_frontbuffer_tracking@basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][40] ([i915#4342] / [i915#5354] / [i915#9792])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-arls-3:         NOTRUN -> [SKIP][41] ([i915#9812])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][42] ([i915#5354] / [i915#9792])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-mtlp-6:         NOTRUN -> [SKIP][43] ([i915#1072] / [i915#9673] / [i915#9732] / [i915#9792]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-arls-3:         NOTRUN -> [SKIP][44] ([i915#9732]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arls-3:         NOTRUN -> [SKIP][45] ([i915#10208] / [i915#8809])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][46] ([i915#3555] / [i915#8809] / [i915#9792])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@flipline:
    - bat-dg2-14:         NOTRUN -> [SKIP][47] ([i915#3555])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-14/igt@kms_vrr@flipline.html
    - bat-rplp-1:         NOTRUN -> [SKIP][48] ([i915#3555])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-rplp-1/igt@kms_vrr@flipline.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][49] ([i915#3555])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-rkl-11600/igt@kms_vrr@flipline.html
    - bat-dg1-7:          NOTRUN -> [SKIP][50] ([i915#3555])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg1-7/igt@kms_vrr@flipline.html
    - bat-adln-1:         NOTRUN -> [SKIP][51] ([i915#3555])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adln-1/igt@kms_vrr@flipline.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][52] ([i915#3555] / [i915#8808])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-8/igt@kms_vrr@flipline.html
    - bat-jsl-1:          NOTRUN -> [SKIP][53] ([i915#3555]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_vrr@flipline.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][54] ([i915#3555])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-tgl-1115g4/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][55] +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][56] +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-blb-e6850/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-dg2-14:         NOTRUN -> [SKIP][57] ([i915#9906]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][58] +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-bsw-nick/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][59] ([i915#9906]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-dg1-7:          NOTRUN -> [SKIP][60] ([i915#9906]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg1-7/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-adlp-11:        NOTRUN -> [SKIP][61] ([i915#10470] / [i915#10501]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][62] +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-kbl-7567u/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-arls-2:         NOTRUN -> [SKIP][63] ([i915#8808] / [i915#9906]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-2/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][64] ([i915#8808] / [i915#9906]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][65] +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-elk-e7500/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-adlm-1:         NOTRUN -> [SKIP][66] ([i915#9900]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlm-1/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][67] ([i915#9906]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-tgl-1115g4/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][68] +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-cfl-guc/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - bat-dg2-9:          NOTRUN -> [SKIP][69] ([i915#9197]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][70] +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adlp-11:        NOTRUN -> [SKIP][71] ([i915#10470])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][72] +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-cfl-8109u/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][73] +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-ivb-3770/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][74] ([i915#9906])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-dg2-8:          NOTRUN -> [SKIP][75] ([i915#9197]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][76] +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-kbl-guc/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-ilk-650:         NOTRUN -> [SKIP][77] +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-ilk-650/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][78] +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-glk-j4005/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - bat-adlp-9:         NOTRUN -> [SKIP][79] ([i915#9906]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-adls-6:         NOTRUN -> [SKIP][80] ([i915#9906]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adls-6/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-jsl-1:          NOTRUN -> [SKIP][81] ([i915#9906]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-adlp-6:         NOTRUN -> [SKIP][82] ([i915#9906]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-vrr.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][83] +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-pnv-d510/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-adln-1:         NOTRUN -> [SKIP][84] ([i915#9906]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adln-1/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-rplp-1:         NOTRUN -> [SKIP][85] ([i915#9906]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-rplp-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-arls-3:         NOTRUN -> [SKIP][86] ([i915#3708])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-fence-flip.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][87] ([i915#3708] / [i915#9792])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-arls-3:         NOTRUN -> [SKIP][88] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][89] ([i915#3708] / [i915#4077]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arls-3:         NOTRUN -> [SKIP][90] ([i915#10212] / [i915#3708])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - bat-arls-3:         NOTRUN -> [SKIP][91] ([i915#10214] / [i915#3708])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-read.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][92] ([i915#3708]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-arls-3:         NOTRUN -> [SKIP][93] ([i915#10216] / [i915#3708])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-write.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][94] ([i915#10216] / [i915#3708])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - {bat-twl-1}:        [INCOMPLETE][95] ([i915#10886]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14883/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-twl-1/igt@i915_selftest@live@gt_lrc.html

  
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
  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11191]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11191
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7879 -> IGTPW_11229

  CI-20190529: 20190529
  CI_DRM_14883: ec3e566521b91eb773769fa1df899a28063a10e9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11229: 80517132054f96a19923f97e8adc8769d6fc1614 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/index.html

--===============3164265670163869442==
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
<tr><td><b>Series:</b></td><td>VRR test cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134534/">https://patchwork.freedesktop.org/series/134534/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14883 -&gt; IGTPW_11229</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11229 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11229, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/index.html</p>
<h2>Participating hosts (35 -&gt; 36)</h2>
<p>Additional (4): bat-arls-4 bat-mtlp-6 bat-jsl-1 bat-arls-3 <br />
  Missing    (3): bat-kbl-2 bat-arls-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11229:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vrr@seamless-rr-switch-drrs:<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@reset:<ul>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-4/igt@i915_selftest@live@reset.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14883 and IGTPW_11229:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-dp-1:<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [25.20, 25.37] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11229 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11191">i915#11191</a>) +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14883/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14883/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) +9 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207">i915#10207</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-14/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-rplp-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-rkl-11600/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg1-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adln-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-tgl-1115g4/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +3 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-blb-e6850/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-bsw-nick/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +3 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg1-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>) +2 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-kbl-7567u/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-elk-e7500/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlm-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-tgl-1115g4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-cfl-guc/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>)</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-cfl-8109u/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +3 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-ivb-3770/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +3 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-kbl-guc/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +3 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-ilk-650/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +3 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-glk-j4005/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adls-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/fi-pnv-d510/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> +3 other tests skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-adln-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-rplp-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-arls-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-mtlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_lrc:<ul>
<li>{bat-twl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14883/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886">i915#10886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11229/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7879 -&gt; IGTPW_11229</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14883: ec3e566521b91eb773769fa1df899a28063a10e9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11229: 80517132054f96a19923f97e8adc8769d6fc1614 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3164265670163869442==--
