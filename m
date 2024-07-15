Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7198CC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 16:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED04892A6;
	Mon, 15 Jul 2024 16:18:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D0F892A6;
 Mon, 15 Jul 2024 16:18:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7484888426403529444=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/kms=5Fplane=5Fscaling?=
 =?utf-8?q?=3A_Improvise_the_scaling_BW_issues=2E_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 15 Jul 2024 16:18:12 -0000
Message-ID: <172106029253.231691.2595118811996799393@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
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

--===============7484888426403529444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Improvise the scaling BW issues. (rev4)
URL   : https://patchwork.freedesktop.org/series/135806/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15080 -> IGTPW_11409
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11409 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11409, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/index.html

Participating hosts (39 -> 40)
------------------------------

  Additional (4): fi-kbl-7567u bat-dg2-11 bat-jsl-1 fi-elk-e7500 
  Missing    (3): bat-arlh-2 fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11409:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
    - fi-rkl-11600:       NOTRUN -> [SKIP][1] +71 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1:
    - bat-jsl-1:          NOTRUN -> [SKIP][2] +67 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][3] +82 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:
    - bat-twl-1:          NOTRUN -> [SKIP][4] +67 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d-edp-1:
    - bat-adlp-6:         NOTRUN -> [SKIP][5] +95 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-1:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][6] +95 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-2:
    - bat-arls-1:         NOTRUN -> [SKIP][7] +95 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b-edp-1:
    - bat-twl-2:          NOTRUN -> [SKIP][8] +67 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a-dp-3:
    - bat-arls-5:         NOTRUN -> [SKIP][9] +82 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a-dp-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:
    - bat-arls-2:         NOTRUN -> [SKIP][10] +95 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:
    - bat-rplp-1:         NOTRUN -> [SKIP][11] +95 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rplp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-hdmi-a-2:
    - bat-dg1-7:          NOTRUN -> [SKIP][12] +95 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-c-dp-1:
    - bat-adlp-9:         NOTRUN -> [SKIP][13] +95 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-c-dp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_11409 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][14] ([i915#4613]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-jsl-1:          NOTRUN -> [SKIP][15] ([i915#4613]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-7567u:       NOTRUN -> [DMESG-WARN][16] ([i915#11621]) +33 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - fi-cfl-guc:         NOTRUN -> [SKIP][17] +32 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-cfl-guc/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][18] ([i915#8152] / [i915#9792]) +23 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg2-9:          NOTRUN -> [SKIP][19] ([i915#5354] / [i915#8152] / [i915#9423])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-arls-2:         NOTRUN -> [SKIP][20] ([i915#9809])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][21] ([i915#9809])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-jsl-1:          NOTRUN -> [SKIP][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-arls-5:         NOTRUN -> [SKIP][23] ([i915#9809])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg1-7:          NOTRUN -> [SKIP][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-adlp-9:         NOTRUN -> [SKIP][26] ([i915#9843])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-twl-2:          NOTRUN -> [SKIP][27] ([i915#9843])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg2-11:         NOTRUN -> [SKIP][28] ([i915#5354] / [i915#9423])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-11/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-twl-1:          NOTRUN -> [SKIP][29] ([i915#9843])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg2-14:         NOTRUN -> [SKIP][30] ([i915#5354] / [i915#9423])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-14/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg2-8:          NOTRUN -> [SKIP][31] ([i915#5354] / [i915#9423])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-rplp-1:         NOTRUN -> [SKIP][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rplp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-arls-1:         NOTRUN -> [SKIP][34] ([i915#9809])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - bat-dg2-9:          NOTRUN -> [SKIP][35] ([i915#6953] / [i915#8152] / [i915#9423]) +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@intel-max-src-size.html
    - bat-arls-2:         NOTRUN -> [SKIP][36] ([i915#6953])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@kms_plane_scaling@intel-max-src-size.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][37] ([i915#6953])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@intel-max-src-size.html
    - bat-rplp-1:         NOTRUN -> [SKIP][38] ([i915#6953])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rplp-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-1:
    - bat-dg2-8:          NOTRUN -> [FAIL][39] ([i915#8292])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:
    - bat-adlp-6:         NOTRUN -> [FAIL][40] ([i915#8292])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - bat-adls-6:         NOTRUN -> [FAIL][41] ([i915#8292]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adls-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][42] ([i915#8292])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - bat-dg1-7:          NOTRUN -> [FAIL][43] ([i915#8292])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
    - bat-dg2-11:         NOTRUN -> [FAIL][44] ([i915#8292])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-11/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
    - bat-rpls-4:         NOTRUN -> [FAIL][45] ([i915#8292])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rpls-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
    - bat-dg2-14:         NOTRUN -> [FAIL][46] ([i915#8292])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - bat-mtlp-6:         NOTRUN -> [SKIP][47] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9792]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-2-invalid-num-scalers:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][48] +34 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-cfl-8109u/igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-2-invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-edp-1:
    - bat-twl-2:          NOTRUN -> [SKIP][49] ([i915#9423]) +17 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][50] +47 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-cfl-8700k/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - fi-blb-e6850:       NOTRUN -> [SKIP][51] +48 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-blb-e6850/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-dp-1:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][52] +32 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-7567u/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-dp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-edp-1:
    - bat-arls-2:         NOTRUN -> [SKIP][53] ([i915#5176] / [i915#9423]) +25 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:
    - bat-adlp-6:         NOTRUN -> [SKIP][54] ([i915#9423]) +23 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html
    - bat-rplp-1:         NOTRUN -> [SKIP][55] ([i915#9423]) +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rplp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - bat-adlp-11:        NOTRUN -> [SKIP][56] ([i915#8152]) +23 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - fi-pnv-d510:        NOTRUN -> [SKIP][57] +48 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-pnv-d510/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1:
    - bat-jsl-1:          NOTRUN -> [SKIP][58] ([i915#9423]) +24 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-dp-1:
    - bat-adlp-9:         NOTRUN -> [SKIP][59] ([i915#9423]) +23 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-dp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-dp-3:
    - bat-arls-5:         NOTRUN -> [SKIP][60] ([i915#5176]) +23 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-dp-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][61] ([i915#5176]) +25 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html
    - bat-jsl-1:          NOTRUN -> [SKIP][62] ([i915#9423] / [i915#9723]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - bat-adlm-1:         NOTRUN -> [SKIP][63] ([i915#8152]) +23 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-2:
    - bat-arls-1:         NOTRUN -> [SKIP][64] ([i915#5176] / [i915#9423]) +23 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - fi-kbl-guc:         NOTRUN -> [SKIP][65] +48 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-guc/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-dp-1:
    - bat-apl-1:          NOTRUN -> [SKIP][66] +30 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-apl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-dp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-hdmi-a-2:
    - fi-glk-j4005:       NOTRUN -> [SKIP][67] +75 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-glk-j4005/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-edp-1:
    - bat-jsl-1:          NOTRUN -> [DMESG-WARN][68] ([i915#6020]) +1 other test dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-1:
    - fi-rkl-11600:       NOTRUN -> [DMESG-WARN][69] ([i915#9970])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-2:
    - bat-rpls-4:         NOTRUN -> [DMESG-WARN][70] ([i915#9970]) +1 other test dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][71] ([i915#9423]) +31 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - bat-adlm-1:         NOTRUN -> [SKIP][72] ([i915#3555] / [i915#8152]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:
    - bat-jsl-1:          NOTRUN -> [SKIP][73] ([i915#5176]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - bat-twl-1:          NOTRUN -> [SKIP][74] ([i915#9423]) +10 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - fi-rkl-11600:       NOTRUN -> [SKIP][75] ([i915#5176] / [i915#9423]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][76] ([i915#5176] / [i915#9423]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
    - bat-dg1-7:          NOTRUN -> [SKIP][77] ([i915#5176] / [i915#9423]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html
    - bat-rpls-4:         NOTRUN -> [SKIP][78] ([i915#5176] / [i915#9423]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:
    - bat-adls-6:         NOTRUN -> [SKIP][79] ([i915#5176] / [i915#9423]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adls-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - bat-dg2-9:          NOTRUN -> [SKIP][80] ([i915#8152] / [i915#9423]) +22 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - fi-ilk-650:         NOTRUN -> [SKIP][81] +48 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-ilk-650/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c-hdmi-a-1:
    - fi-rkl-11600:       NOTRUN -> [SKIP][82] ([i915#9423]) +29 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d-hdmi-a-2:
    - bat-dg1-7:          NOTRUN -> [SKIP][83] ([i915#9423]) +31 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - bat-atsm-1:         NOTRUN -> [SKIP][84] ([i915#6078]) +48 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-atsm-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - bat-dg2-14:         NOTRUN -> [SKIP][85] ([i915#9423]) +107 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2:
    - bat-rpls-4:         NOTRUN -> [SKIP][86] ([i915#9423]) +136 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][87] +48 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-x1275/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
    - bat-adlp-11:        NOTRUN -> [SKIP][88] ([i915#6953] / [i915#8152]) +11 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-edp-1:
    - bat-jsl-1:          NOTRUN -> [SKIP][89] ([i915#6953]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-dp-3:
    - bat-arls-5:         NOTRUN -> [SKIP][90] ([i915#8152]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-dp-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - bat-arls-5:         NOTRUN -> [SKIP][91] ([i915#6953] / [i915#8152]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - fi-bsw-nick:        NOTRUN -> [SKIP][92] +48 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-bsw-nick/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
    - bat-kbl-2:          NOTRUN -> [SKIP][93] +48 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-kbl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b-dp-1:
    - bat-dg2-8:          NOTRUN -> [SKIP][94] ([i915#9423]) +119 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b-dp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - bat-adlm-1:         NOTRUN -> [SKIP][95] ([i915#3558] / [i915#8152]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][96] ([i915#3558] / [i915#8152] / [i915#9792]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
    - bat-dg2-9:          NOTRUN -> [SKIP][97] ([i915#3558] / [i915#8152] / [i915#9423]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
    - bat-adlp-11:        NOTRUN -> [SKIP][98] ([i915#3558] / [i915#8152]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - bat-adlm-1:         NOTRUN -> [SKIP][99] ([i915#6953] / [i915#8152]) +11 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - bat-mtlp-6:         NOTRUN -> [SKIP][100] ([i915#3555] / [i915#8152] / [i915#9792]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
    - bat-dg2-9:          NOTRUN -> [SKIP][101] ([i915#3555] / [i915#8152] / [i915#9423]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
    - bat-adlp-11:        NOTRUN -> [SKIP][102] ([i915#3555] / [i915#8152]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - bat-twl-2:          NOTRUN -> [SKIP][103] ([i915#6953]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][104] +48 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-8809g/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][105] +48 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-ivb-3770/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][106] +53 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-elk-e7500/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
    - bat-adlm-1:         NOTRUN -> [SKIP][107] ([i915#3555] / [i915#6953] / [i915#8152]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - bat-mtlp-6:         NOTRUN -> [SKIP][108] ([i915#6953] / [i915#8152] / [i915#9792]) +11 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - bat-dg2-9:          NOTRUN -> [SKIP][109] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
    - bat-adlp-11:        NOTRUN -> [SKIP][110] ([i915#3555] / [i915#6953] / [i915#8152]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-hdmi-a-1:
    - bat-adls-6:         NOTRUN -> [SKIP][111] ([i915#9423]) +127 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adls-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1:
    - bat-twl-1:          NOTRUN -> [SKIP][112] ([i915#6953]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d-edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][113] ([i915#3555]) +12 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-2:
    - bat-dg2-11:         NOTRUN -> [SKIP][114] ([i915#9423]) +119 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-2.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-arls-2:         [DMESG-WARN][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15080/bat-arls-2/igt@i915_pm_rpm@module-reload.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-8:          [DMESG-FAIL][117] ([i915#9500]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15080/bat-dg2-8/igt@i915_selftest@live@hangcheck.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-8/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@ring_submission:
    - bat-arls-2:         [DMESG-FAIL][119] ([i915#10262]) -> [PASS][120] +36 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15080/bat-arls-2/igt@i915_selftest@live@ring_submission.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@i915_selftest@live@ring_submission.html

  
  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6020]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6020
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9843]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9843
  [i915#9970]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9970


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7926 -> IGTPW_11409

  CI-20190529: 20190529
  CI_DRM_15080: 9c881256c5489c72b35d18e2dc56792959f1eb1f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11409: 11409
  IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/index.html

--===============7484888426403529444==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Improvise the scaling BW issues. (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135806/">https://patchwork.freedesktop.org/series/135806/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15080 -&gt; IGTPW_11409</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11409 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11409, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/index.html</p>
<h2>Participating hosts (39 -&gt; 40)</h2>
<p>Additional (4): fi-kbl-7567u bat-dg2-11 bat-jsl-1 fi-elk-e7500 <br />
  Missing    (3): bat-arlh-2 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11409:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1.html">SKIP</a> +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> +82 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html">SKIP</a> +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d-edp-1:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d-edp-1.html">SKIP</a> +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-1:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-1.html">SKIP</a> +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-2.html">SKIP</a> +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b-edp-1:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b-edp-1.html">SKIP</a> +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a-dp-3:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a-dp-3.html">SKIP</a> +82 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1.html">SKIP</a> +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rplp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-hdmi-a-2:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-hdmi-a-2.html">SKIP</a> +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-c-dp-1:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-c-dp-1.html">SKIP</a> +95 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11409 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-cfl-guc/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> +32 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +23 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9843">i915#9843</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9843">i915#9843</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-11/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9843">i915#9843</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-14/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rplp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +11 other tests skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rplp-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-1:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adls-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>) +1 other test fail</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-11/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rpls-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-2-invalid-num-scalers:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-cfl-8109u/igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-2-invalid-num-scalers.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-edp-1:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-cfl-8700k/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-blb-e6850/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-dp-1:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-7567u/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-dp-1.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-edp-1:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +23 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rplp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-pnv-d510/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-dp-1:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-dp-3:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a>) +25 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-2:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-guc/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-dp-1:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-apl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-dp-1.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-glk-j4005/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-hdmi-a-2.html">SKIP</a> +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-edp-1:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6020">i915#6020</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-1:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9970">i915#9970</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-2:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9970">i915#9970</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +2 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-tgl-1115g4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adls-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-ilk-650/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c-hdmi-a-1:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-rkl-11600/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg1-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-atsm-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +136 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-x1275/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> +48 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-edp-1:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-jsl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-dp-3:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-bsw-nick/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">SKIP</a> +48 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-kbl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b-dp-1:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +119 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558">i915#3558</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558">i915#3558</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558">i915#3558</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558">i915#3558</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +4 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +4 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-kbl-8809g/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> +48 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-ivb-3770/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> +48 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/fi-elk-e7500/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> +53 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlm-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +5 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adlp-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-hdmi-a-1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-adls-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +127 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-twl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d-edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-2:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +119 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15080/bat-arls-2/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15080/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15080/bat-arls-2/igt@i915_selftest@live@ring_submission.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11409/bat-arls-2/igt@i915_selftest@live@ring_submission.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7926 -&gt; IGTPW_11409</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15080: 9c881256c5489c72b35d18e2dc56792959f1eb1f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11409: 11409<br />
  IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7484888426403529444==--
