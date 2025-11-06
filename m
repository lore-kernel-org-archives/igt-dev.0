Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEFDCCFA13
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 20:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD0D10E9C8;
	Thu,  6 Nov 2025 20:30:48 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C914510E9C8;
 Thu,  6 Nov 2025 20:30:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6290122594008932910=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Limit_debug_logging_in_CI?=
 =?utf-8?q?_for_scaling_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Nov 2025 20:30:47 -0000
Message-ID: <176246104780.27404.4724333591990348173@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
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

--===============6290122594008932910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Limit debug logging in CI for scaling tests
URL   : https://patchwork.freedesktop.org/series/157133/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8613 -> IGTPW_14011
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14011 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14011, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/index.html

Participating hosts (43 -> 42)
------------------------------

  Additional (1): bat-adlp-6 
  Missing    (2): fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14011:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - bat-jsl-5:          NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][2] +44 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a (NEW):
    - bat-twl-1:          NOTRUN -> [SKIP][3] +37 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][4] +90 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - bat-jsl-5:          NOTRUN -> [INCOMPLETE][5] +3 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - bat-twl-2:          NOTRUN -> [SKIP][6] +70 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - bat-jsl-5:          NOTRUN -> [SKIP][7] +57 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d (NEW):
    - bat-rpls-4:         NOTRUN -> [SKIP][8] +63 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - bat-arlh-3:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][10] +44 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rplp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][11] +44 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - bat-adlp-11:        NOTRUN -> [SKIP][12] +134 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  
New tests
---------

  New tests have been introduced between IGT_8613 and IGTPW_14011:

### New IGT tests (47) ###

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-dp-7-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-dp-7-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-7-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-dp-7-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 15.52] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 3.65] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 5.91] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 5.93] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 2.88] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 17.90] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 3.30] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 7.84] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 6.74] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 2.58] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 15.19] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 3.53] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 5.82] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 5.82] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 3.15] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 4.28] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 6.08] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 6.00] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 3.09] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 3.58] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 6.11] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 6.01] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 2.90] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 3.63] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 5.96] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 5.98] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 2.96] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 3.37] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 5.97] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 5.98] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 3.01] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 3.63] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 6.12] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 6.06] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 3.08] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 3.72] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 6.07] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 6.05] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 3.13] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 3.60] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 6.05] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - Statuses : 37 skip(s)
    - Exec time: [0.0, 6.08] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - Statuses : 19 skip(s)
    - Exec time: [0.0, 3.18] s

  

Known issues
------------

  Here are the changes found in IGTPW_14011 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - fi-cfl-guc:         NOTRUN -> [SKIP][13] +70 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-cfl-guc/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][14] ([i915#8152] / [i915#9792]) +9 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-arls-6:         NOTRUN -> [SKIP][15] ([i915#13046] / [i915#9809])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg2-9:          NOTRUN -> [SKIP][16] ([i915#13046] / [i915#5354] / [i915#9423])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][17] ([i915#9809])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg1-6:          NOTRUN -> [SKIP][18] ([i915#12311] / [i915#5354] / [i915#8152])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-jsl-1:          NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-arls-5:         NOTRUN -> [SKIP][20] ([i915#13046] / [i915#9809])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-arlh-3:         NOTRUN -> [SKIP][21] ([i915#13046])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg1-7:          NOTRUN -> [SKIP][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-adlp-9:         NOTRUN -> [SKIP][23] ([i915#13046])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-twl-2:          NOTRUN -> [SKIP][24] ([i915#13046])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg2-11:         NOTRUN -> [SKIP][25] ([i915#13046] / [i915#5354] / [i915#9423])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-twl-1:          NOTRUN -> [SKIP][26] ([i915#13046])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-jsl-5:          NOTRUN -> [SKIP][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg2-8:          NOTRUN -> [SKIP][28] ([i915#5354] / [i915#8152] / [i915#9423])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-rplp-1:         NOTRUN -> [SKIP][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rplp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - bat-mtlp-9:         NOTRUN -> [SKIP][31] ([i915#6953])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - bat-mtlp-6:         NOTRUN -> [SKIP][32] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9792]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@invalid-parameters:
    - fi-rkl-11600:       NOTRUN -> [SKIP][33] ([i915#8152]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers (NEW):
    - bat-dg1-6:          NOTRUN -> [SKIP][34] ([i915#12247] / [i915#12311] / [i915#8152]) +46 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][35] ([i915#12247]) +39 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][36] ([i915#12247]) +73 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][37] ([i915#12247] / [i915#9423]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-14/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][38] +138 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-ilk-650/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d (NEW):
    - bat-mtlp-9:         NOTRUN -> [SKIP][39] ([i915#12247]) +68 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][40] ([i915#12247] / [i915#9423]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - bat-dg2-11:         NOTRUN -> [SKIP][41] ([i915#12247] / [i915#9423]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a (NEW):
    - bat-apl-1:          NOTRUN -> [SKIP][42] +68 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-apl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][43] ([i915#12247]) +73 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - fi-pnv-d510:        NOTRUN -> [SKIP][44] +48 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-pnv-d510/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - bat-arlh-3:         NOTRUN -> [SKIP][45] ([i915#12247]) +112 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - bat-rpls-4:         NOTRUN -> [SKIP][46] ([i915#9423]) +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rpls-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
    - bat-dg2-8:          NOTRUN -> [SKIP][47] ([i915#12247] / [i915#8152] / [i915#9423]) +13 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - fi-ivb-3770:        NOTRUN -> [SKIP][48] +183 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-ivb-3770/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - bat-dg2-8:          NOTRUN -> [SKIP][49] ([i915#8152] / [i915#9423]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:
    - fi-rkl-11600:       NOTRUN -> [SKIP][50] ([i915#12247] / [i915#8152]) +60 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:
    - bat-mtlp-6:         NOTRUN -> [SKIP][51] ([i915#12247] / [i915#8152]) +32 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - fi-bsw-nick:        NOTRUN -> [SKIP][52] +183 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-bsw-nick/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - fi-rkl-11600:       NOTRUN -> [SKIP][53] ([i915#3555] / [i915#8152]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
    - bat-dg2-8:          NOTRUN -> [SKIP][54] ([i915#3555] / [i915#8152] / [i915#9423]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:
    - bat-mtlp-6:         NOTRUN -> [SKIP][55] ([i915#8152]) +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - fi-rkl-11600:       NOTRUN -> [SKIP][56] ([i915#12247]) +89 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - bat-adlp-11:        NOTRUN -> [SKIP][57] ([i915#8152]) +68 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - bat-dg1-7:          NOTRUN -> [SKIP][58] ([i915#3555])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - bat-rpls-4:         NOTRUN -> [SKIP][59] ([i915#3555] / [i915#9423]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - bat-jsl-5:          NOTRUN -> [SKIP][60] ([i915#3555]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - bat-jsl-1:          NOTRUN -> [SKIP][61] ([i915#3555]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][62] ([i915#3555])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
    - bat-mtlp-6:         NOTRUN -> [SKIP][63] ([i915#12247]) +134 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:
    - bat-dg1-6:          NOTRUN -> [SKIP][64] ([i915#12311] / [i915#8152]) +20 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:
    - bat-dg2-8:          NOTRUN -> [SKIP][65] ([i915#8152]) +11 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - fi-glk-j4005:       NOTRUN -> [SKIP][66] +64 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-glk-j4005/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - bat-mtlp-9:         NOTRUN -> [SKIP][67] ([i915#12247] / [i915#6953]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - bat-dg2-9:          NOTRUN -> [SKIP][68] ([i915#12247] / [i915#6953] / [i915#9423]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - bat-atsm-1:         NOTRUN -> [SKIP][69] ([i915#6078]) +48 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-atsm-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][70] ([i915#12247] / [i915#8152] / [i915#9792]) +13 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b (NEW):
    - bat-arls-6:         NOTRUN -> [SKIP][71] ([i915#12247]) +69 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][72] ([i915#12247] / [i915#6953]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - bat-adlp-6:         NOTRUN -> [SKIP][73] ([i915#6953]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - bat-dg1-7:          NOTRUN -> [SKIP][74] ([i915#12247] / [i915#6953]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - bat-adlp-9:         NOTRUN -> [SKIP][75] ([i915#6953]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - bat-rpls-4:         NOTRUN -> [SKIP][76] ([i915#6953] / [i915#9423]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][77] ([i915#12247]) +39 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][78] ([i915#12247]) +39 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
    - bat-dg2-8:          NOTRUN -> [SKIP][79] ([i915#12247]) +134 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][80] +183 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-kbl-x1275/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
    - bat-adlp-11:        NOTRUN -> [SKIP][81] ([i915#6953] / [i915#8152]) +11 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
    - bat-dg2-8:          NOTRUN -> [SKIP][82] ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][83] ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9792]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:
    - fi-elk-e7500:       NOTRUN -> [SKIP][84] +138 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-elk-e7500/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:
    - bat-mtlp-8:         NOTRUN -> [SKIP][85] ([i915#12247]) +101 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html
    - bat-dg1-6:          NOTRUN -> [SKIP][86] ([i915#12247] / [i915#12311]) +134 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - fi-rkl-11600:       NOTRUN -> [SKIP][87] ([i915#6953] / [i915#8152]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
    - bat-twl-2:          NOTRUN -> [SKIP][88] ([i915#6953]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - bat-arls-5:         NOTRUN -> [SKIP][89] ([i915#12247] / [i915#6953]) +9 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - bat-mtlp-6:         NOTRUN -> [SKIP][90] ([i915#12247] / [i915#3558] / [i915#8152] / [i915#9792]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
    - bat-adlp-11:        NOTRUN -> [SKIP][91] ([i915#3558] / [i915#8152]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
    - bat-dg1-6:          NOTRUN -> [SKIP][92] ([i915#12247] / [i915#12311] / [i915#3558] / [i915#8152]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
    - bat-dg2-8:          NOTRUN -> [SKIP][93] ([i915#12247] / [i915#3558] / [i915#8152] / [i915#9423]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - bat-mtlp-6:         NOTRUN -> [SKIP][94] ([i915#3555] / [i915#8152] / [i915#9792]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
    - bat-adlp-11:        NOTRUN -> [SKIP][95] ([i915#3555] / [i915#8152]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
    - bat-dg1-6:          NOTRUN -> [SKIP][96] ([i915#12311] / [i915#3555] / [i915#8152]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
    - bat-kbl-2:          NOTRUN -> [SKIP][97] +183 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-kbl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][98] +70 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-kbl-7567u/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][99] +71 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-cfl-8700k/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - bat-twl-1:          NOTRUN -> [SKIP][100] ([i915#6953]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - bat-jsl-5:          NOTRUN -> [SKIP][101] ([i915#6953]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - bat-dg2-14:         NOTRUN -> [SKIP][102] ([i915#12247] / [i915#6953] / [i915#9423]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - bat-rplp-1:         NOTRUN -> [SKIP][103] ([i915#6953]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rplp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][104] +107 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-skl-6600u/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][105] +183 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-hsw-4770/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - bat-mtlp-8:         NOTRUN -> [SKIP][106] ([i915#6953]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
    - bat-dg1-6:          NOTRUN -> [SKIP][107] ([i915#12311] / [i915#6953] / [i915#8152]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
    - bat-dg2-8:          NOTRUN -> [SKIP][108] ([i915#6953] / [i915#8152] / [i915#9423]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
    - bat-jsl-1:          NOTRUN -> [SKIP][109] ([i915#6953]) +8 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - bat-dg1-6:          NOTRUN -> [SKIP][110] ([i915#12311] / [i915#3555] / [i915#6953] / [i915#8152]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
    - bat-dg2-8:          NOTRUN -> [SKIP][111] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - bat-mtlp-6:         NOTRUN -> [SKIP][112] ([i915#6953] / [i915#8152] / [i915#9792]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - bat-adlp-6:         NOTRUN -> [SKIP][113] ([i915#3555])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][114] ([i915#12247] / [i915#3555] / [i915#8152] / [i915#9792])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg1-7:          NOTRUN -> [SKIP][115] ([i915#12247] / [i915#3555])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-adlp-9:         NOTRUN -> [SKIP][116] ([i915#3555])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg2-11:         NOTRUN -> [SKIP][117] ([i915#12247] / [i915#3555] / [i915#9423])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg2-14:         NOTRUN -> [SKIP][118] ([i915#12247] / [i915#3555] / [i915#9423])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-rplp-1:         NOTRUN -> [SKIP][119] ([i915#3555])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rplp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][120] ([i915#12247] / [i915#3555] / [i915#8152])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][121] ([i915#12247] / [i915#3555])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg2-9:          NOTRUN -> [SKIP][122] ([i915#12247] / [i915#3555] / [i915#9423])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][123] ([i915#12247] / [i915#3555])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg1-6:          NOTRUN -> [SKIP][124] ([i915#12247] / [i915#12311] / [i915#3555] / [i915#8152])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg2-8:          NOTRUN -> [SKIP][125] ([i915#12247] / [i915#3555] / [i915#8152] / [i915#9423])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][126] ([i915#12247] / [i915#3555])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - bat-mtlp-9:         NOTRUN -> [SKIP][127] ([i915#12247] / [i915#3555] / [i915#6953]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
    - bat-adlp-11:        NOTRUN -> [SKIP][128] ([i915#3555] / [i915#6953] / [i915#8152]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][129] ([i915#12247] / [i915#3555] / [i915#6953]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
    - bat-dg1-6:          NOTRUN -> [SKIP][130] ([i915#12247] / [i915#12311] / [i915#3555] / [i915#6953] / [i915#8152]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
    - bat-dg2-8:          NOTRUN -> [SKIP][131] ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
    - bat-jsl-1:          NOTRUN -> [SKIP][132] ([i915#3555] / [i915#6953])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][133] ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9792]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - fi-kbl-guc:         NOTRUN -> [SKIP][134] +183 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-kbl-guc/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - bat-arls-6:         NOTRUN -> [SKIP][135] ([i915#12247] / [i915#6953]) +9 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:
    - bat-arlh-2:         NOTRUN -> [SKIP][136] ([i915#11346]) +33 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - fi-rkl-11600:       NOTRUN -> [SKIP][137] ([i915#3555] / [i915#6953] / [i915#8152]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - fi-rkl-11600:       NOTRUN -> [SKIP][138] ([i915#12247] / [i915#6953] / [i915#8152]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - bat-dg2-11:         NOTRUN -> [SKIP][139] ([i915#12247] / [i915#6953] / [i915#9423]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][140] ([i915#12247]) +69 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - bat-mtlp-8:         NOTRUN -> [SKIP][141] ([i915#12247] / [i915#6953]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
    - bat-dg1-6:          NOTRUN -> [SKIP][142] ([i915#12247] / [i915#12311] / [i915#6953] / [i915#8152]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][143] +183 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-kbl-8809g/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - bat-arlh-2:         NOTRUN -> [SKIP][144] ([i915#11346] / [i915#12247]) +194 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][145] ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:
    - bat-dg2-8:          NOTRUN -> [SKIP][146] ([i915#12247] / [i915#8152]) +32 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8613 -> IGTPW_14011
  * Linux: CI_DRM_17499 -> CI_DRM_17501

  CI-20190529: 20190529
  CI_DRM_17499: 6aa8d62a50c33f091548cc961a713223d488d6ad @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17501: 9deffe4baace482f9414f36f53f3385868533fd6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14011: 14011
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/index.html

--===============6290122594008932910==
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
<tr><td><b>Series:</b></td><td>Limit debug logging in CI for scaling tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157133/">https://patchwork.freedesktop.org/series/157133/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8613 -&gt; IGTPW_14011</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14011 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14011, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Additional (1): bat-adlp-6 <br />
  Missing    (2): fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14011:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a (NEW):</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d (NEW):</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rplp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> +134 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8613 and IGTPW_14011:</p>
<h3>New IGT tests (47)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-dp-7-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-dp-7-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-7-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-dp-7-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 15.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 5.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 5.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 2.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 17.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 7.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 6.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 15.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 5.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 5.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 3.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 6.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 3.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 6.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 5.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 5.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 5.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 5.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 3.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 6.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 6.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 3.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 6.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 6.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 6.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0, 6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0, 3.18] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14011 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-cfl-guc/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> +70 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +9 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a>)</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rplp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers (NEW):</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-14/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-ilk-650/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a.html">SKIP</a> +138 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d (NEW):</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +4 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-apl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-pnv-d510/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +112 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rpls-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +9 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-ivb-3770/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-bsw-nick/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">SKIP</a> +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +3 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +134 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-glk-j4005/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html">SKIP</a> +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +6 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-atsm-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +48 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b (NEW):</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +39 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +134 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-kbl-x1275/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> +183 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +11 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +6 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-elk-e7500/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html">SKIP</a> +138 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +101 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +134 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +4 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558">i915#3558</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558">i915#3558</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558">i915#3558</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3558">i915#3558</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +4 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-kbl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html">SKIP</a> +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-kbl-7567u/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> +70 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-cfl-8700k/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> +71 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-twl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +4 other tests skip</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rplp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-skl-6600u/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-hsw-4770/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html">SKIP</a> +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +2 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +4 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +4 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +2 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-rplp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-tgl-1115g4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +2 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-adlp-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +5 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +2 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +2 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +2 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-jsl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-kbl-guc/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +6 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arls-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +6 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg1-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-kbl-8809g/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-arlh-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +194 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14011/bat-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8613 -&gt; IGTPW_14011</li>
<li>Linux: CI_DRM_17499 -&gt; CI_DRM_17501</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17499: 6aa8d62a50c33f091548cc961a713223d488d6ad @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17501: 9deffe4baace482f9414f36f53f3385868533fd6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14011: 14011<br />
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6290122594008932910==--
