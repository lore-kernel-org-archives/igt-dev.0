Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819C1CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 19:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2106610E319;
	Mon,  2 Sep 2024 19:04:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B3510E319;
 Mon,  2 Sep 2024 19:04:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3690391662982574053=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_lib/intel=5Fbatchbuffer=3A_?=
 =?utf-8?q?Introduce_intel=5Fbb=5Fcreate=5Fwith=5Fcontext=5Fin=5Fmemory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Sep 2024 19:04:25 -0000
Message-ID: <172530386528.908139.17014386916982301200@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902114656.9779-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20240902114656.9779-1-dominik.karol.piatkowski@intel.com>
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

--===============3690391662982574053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_batchbuffer: Introduce intel_bb_create_with_context_in_memory
URL   : https://patchwork.freedesktop.org/series/138090/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15343 -> IGTPW_11677
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11677 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11677, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (3): fi-blb-e6850 bat-arlh-2 fi-elk-e7500 
  Missing    (4): bat-dg2-11 fi-kbl-8809g fi-snb-2520m bat-mtlp-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11677:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_linear_blits@basic:
    - fi-rkl-11600:       [PASS][1] -> [FAIL][2] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-rkl-11600/igt@gem_render_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-rkl-11600/igt@gem_render_linear_blits@basic.html
    - bat-dg1-7:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-dg1-7/igt@gem_render_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-dg1-7/igt@gem_render_linear_blits@basic.html
    - bat-rpls-4:         [PASS][5] -> [FAIL][6] +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-rpls-4/igt@gem_render_linear_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-rpls-4/igt@gem_render_linear_blits@basic.html
    - fi-kbl-7567u:       [PASS][7] -> [FAIL][8] +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html
    - bat-dg2-14:         [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-dg2-14/igt@gem_render_linear_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-dg2-14/igt@gem_render_linear_blits@basic.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][11] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-elk-e7500/igt@gem_render_linear_blits@basic.html
    - bat-dg2-9:          [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-dg2-9/igt@gem_render_linear_blits@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-dg2-9/igt@gem_render_linear_blits@basic.html
    - bat-arlh-2:         NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_render_linear_blits@basic.html

  * igt@gem_render_tiled_blits@basic:
    - fi-pnv-d510:        [PASS][15] -> [FAIL][16] +2 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-pnv-d510/igt@gem_render_tiled_blits@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-pnv-d510/igt@gem_render_tiled_blits@basic.html
    - fi-glk-j4005:       [PASS][17] -> [FAIL][18] +3 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html
    - bat-adlp-9:         [PASS][19] -> [FAIL][20] +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlp-9/igt@gem_render_tiled_blits@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlp-9/igt@gem_render_tiled_blits@basic.html
    - bat-twl-2:          [PASS][21] -> [FAIL][22] +3 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-twl-2/igt@gem_render_tiled_blits@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-twl-2/igt@gem_render_tiled_blits@basic.html
    - fi-cfl-8700k:       [PASS][23] -> [FAIL][24] +3 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html
    - bat-twl-1:          [PASS][25] -> [FAIL][26] +3 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-twl-1/igt@gem_render_tiled_blits@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-twl-1/igt@gem_render_tiled_blits@basic.html
    - bat-apl-1:          [PASS][27] -> [FAIL][28] +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-apl-1/igt@gem_render_tiled_blits@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-apl-1/igt@gem_render_tiled_blits@basic.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][29] +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-blb-e6850/igt@gem_render_tiled_blits@basic.html
    - bat-kbl-2:          [PASS][30] -> [FAIL][31] +2 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-kbl-2/igt@gem_render_tiled_blits@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-kbl-2/igt@gem_render_tiled_blits@basic.html
    - bat-rplp-1:         [PASS][32] -> [FAIL][33] +3 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-rplp-1/igt@gem_render_tiled_blits@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-rplp-1/igt@gem_render_tiled_blits@basic.html
    - fi-kbl-x1275:       [PASS][34] -> [FAIL][35] +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html
    - bat-adlp-11:        [PASS][36] -> [FAIL][37] +2 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlp-11/igt@gem_render_tiled_blits@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlp-11/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - fi-kbl-guc:         [PASS][38] -> [FAIL][39] +2 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-kbl-guc/igt@gem_tiled_blits@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-kbl-guc/igt@gem_tiled_blits@basic.html
    - bat-adls-6:         [PASS][40] -> [FAIL][41] +3 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adls-6/igt@gem_tiled_blits@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adls-6/igt@gem_tiled_blits@basic.html
    - bat-adlm-1:         [PASS][42] -> [FAIL][43] +2 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlm-1/igt@gem_tiled_blits@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlm-1/igt@gem_tiled_blits@basic.html
    - fi-ilk-650:         [PASS][44] -> [FAIL][45] +3 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-ilk-650/igt@gem_tiled_blits@basic.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-ilk-650/igt@gem_tiled_blits@basic.html
    - bat-jsl-1:          [PASS][46] -> [FAIL][47] +3 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-jsl-1/igt@gem_tiled_blits@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-jsl-1/igt@gem_tiled_blits@basic.html
    - fi-tgl-1115g4:      [PASS][48] -> [FAIL][49] +3 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html
    - fi-cfl-guc:         [PASS][50] -> [FAIL][51] +3 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-cfl-guc/igt@gem_tiled_blits@basic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-cfl-guc/igt@gem_tiled_blits@basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [PASS][52] -> [FAIL][53] +3 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
    - bat-arls-2:         [PASS][54] -> [FAIL][55] +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
    - fi-ivb-3770:        [PASS][56] -> [FAIL][57] +3 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html
    - bat-mtlp-8:         [PASS][58] -> [FAIL][59] +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-8:          [PASS][60] -> [FAIL][61] +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html
    - bat-arls-1:         [PASS][62] -> [FAIL][63] +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-1/igt@kms_frontbuffer_tracking@basic.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-1/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-6:         [PASS][64] -> [FAIL][65] +3 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html
    - bat-arls-5:         [PASS][66] -> [FAIL][67] +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-apl-1:          [DMESG-WARN][68] ([i915#11621]) -> [DMESG-FAIL][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_render_linear_blits@basic:
    - {bat-arlh-3}:       [PASS][70] -> [FAIL][71] +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arlh-3/igt@gem_render_linear_blits@basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-3/igt@gem_render_linear_blits@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_11677 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-arlh-2:         NOTRUN -> [SKIP][72] ([i915#9318])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@eof:
    - bat-arlh-2:         NOTRUN -> [SKIP][73] ([i915#11345]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-arlh-2:         NOTRUN -> [SKIP][74] ([i915#1849])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-arlh-2:         NOTRUN -> [SKIP][75] ([i915#10213] / [i915#11671]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-arlh-2:         NOTRUN -> [SKIP][76] ([i915#11343])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arlh-2:         NOTRUN -> [SKIP][77] ([i915#10197] / [i915#11725])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-arlh-2:         NOTRUN -> [SKIP][78] ([i915#10196]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arlh-2:         NOTRUN -> [SKIP][79] ([i915#10206] / [i915#11724])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-blb-e6850:       NOTRUN -> [SKIP][80] +32 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-arlh-2:         NOTRUN -> [SKIP][81] ([i915#10209] / [i915#11681])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_pm:
    - bat-twl-1:          [PASS][82] -> [DMESG-FAIL][83] ([i915#11984])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-twl-1/igt@i915_selftest@live@gt_pm.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-twl-1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-1:         [PASS][84] -> [DMESG-WARN][85] ([i915#11349])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - bat-arlh-2:         NOTRUN -> [SKIP][86] ([i915#10200] / [i915#11666]) +9 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-arlh-2:         NOTRUN -> [SKIP][87] ([i915#11346]) +32 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-elk-e7500:       NOTRUN -> [SKIP][88] +24 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arlh-2:         NOTRUN -> [SKIP][89] ([i915#10208] / [i915#8809])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arlh-2:         NOTRUN -> [SKIP][90] ([i915#10212] / [i915#11726])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - bat-arlh-2:         NOTRUN -> [SKIP][91] ([i915#10214] / [i915#11726])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-arlh-2:         NOTRUN -> [SKIP][92] ([i915#10216] / [i915#11723])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [DMESG-WARN][93] ([i915#11349]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pm_rpm@basic-rte:
    - {bat-arlh-3}:       [INCOMPLETE][95] ([i915#10553]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arlh-3/igt@kms_pm_rpm@basic-rte.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-3/igt@kms_pm_rpm@basic-rte.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-apl-1:          [DMESG-WARN][97] ([i915#180] / [i915#1982]) -> [DMESG-WARN][98] ([i915#180])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-apl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@read:
    - bat-arls-1:         [DMESG-FAIL][99] ([i915#12102]) -> [DMESG-WARN][100] ([i915#12102])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-1/igt@fbdev@read.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-1/igt@fbdev@read.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - bat-adlp-9:         [DMESG-WARN][101] -> [DMESG-WARN][102] ([i915#1982])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196
  [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#10206]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206
  [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
  [i915#11345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11724]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724
  [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#11984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11984
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8001 -> IGTPW_11677

  CI-20190529: 20190529
  CI_DRM_15343: f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11677: 11677
  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/index.html

--===============3690391662982574053==
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
<tr><td><b>Series:</b></td><td>lib/intel_batchbuffer: Introduce intel_bb_create_with_context_in_memory</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138090/">https://patchwork.freedesktop.org/series/138090/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15343 -&gt; IGTPW_11677</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11677 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11677, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (3): fi-blb-e6850 bat-arlh-2 fi-elk-e7500 <br />
  Missing    (4): bat-dg2-11 fi-kbl-8809g fi-snb-2520m bat-mtlp-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11677:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-dg1-7/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-dg1-7/igt@gem_render_linear_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-rpls-4/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-rpls-4/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-dg2-14/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-dg2-14/igt@gem_render_linear_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-elk-e7500/igt@gem_render_linear_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-dg2-9/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-dg2-9/igt@gem_render_linear_blits@basic.html">FAIL</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_render_linear_blits@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-pnv-d510/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-pnv-d510/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlp-9/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlp-9/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-twl-2/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-twl-2/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-twl-1/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-twl-1/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-apl-1/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-apl-1/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-blb-e6850/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-kbl-2/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-kbl-2/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-rplp-1/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-rplp-1/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlp-11/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlp-11/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-kbl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-kbl-guc/igt@gem_tiled_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adls-6/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adls-6/igt@gem_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlm-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlm-1/igt@gem_tiled_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-ilk-650/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-ilk-650/igt@gem_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-jsl-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-jsl-1/igt@gem_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-cfl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-cfl-guc/igt@gem_tiled_blits@basic.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +1 other test fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_render_linear_blits@basic:<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arlh-3/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-3/igt@gem_render_linear_blits@basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11677 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345">i915#11345</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343">i915#11343</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725">i915#11725</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196">i915#10196</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724">i915#11724</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-twl-1/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-twl-1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11984">i915#11984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arlh-3/igt@kms_pm_rpm@basic-rte.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arlh-3/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-arls-1/igt@fbdev@read.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-arls-1/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15343/bat-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11677/bat-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8001 -&gt; IGTPW_11677</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15343: f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11677: 11677<br />
  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3690391662982574053==--
