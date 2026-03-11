Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF451103E2E8
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 21:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F47210E3F6;
	Wed, 11 Mar 2026 21:50:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369A110E3F6;
 Wed, 11 Mar 2026 21:50:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1206334730566873778=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Skip_intel_unsupported_do?=
 =?utf-8?q?wnscale_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Mar 2026 21:50:23 -0000
Message-ID: <177326582318.347693.5979283880381308377@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
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

--===============1206334730566873778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Skip intel unsupported downscale tests
URL   : https://patchwork.freedesktop.org/series/163003/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8795 -> IGTPW_14728
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14728 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14728, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14728:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][1] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
    - bat-adlp-9:         NOTRUN -> [SKIP][2] +4 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
    - bat-adlp-6:         NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] +4 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][5] +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
    - bat-rplp-1:         NOTRUN -> [SKIP][6] +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rplp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][7] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - bat-jsl-5:          NOTRUN -> [INCOMPLETE][8] +3 other tests incomplete
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-jsl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - bat-arlh-3:         NOTRUN -> [SKIP][9] +50 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-arlh-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - bat-twl-2:          NOTRUN -> [SKIP][10] +40 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-twl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - bat-jsl-5:          NOTRUN -> [SKIP][11] +27 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-jsl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - bat-twl-1:          NOTRUN -> [SKIP][12] +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-twl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - bat-adlp-11:        NOTRUN -> [SKIP][13] +163 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
    - bat-rpls-4:         NOTRUN -> [SKIP][14] +23 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rpls-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling (NEW):
    - bat-mtlp-9:         NOTRUN -> [SKIP][15] +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
    - bat-arls-6:         NOTRUN -> [SKIP][16] +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-arls-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  
New tests
---------

  New tests have been introduced between IGT_8795 and IGTPW_14728:

### New IGT tests (9) ###

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_14728 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers (NEW):
    - bat-dg1-6:          NOTRUN -> [SKIP][17] ([i915#12311]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][18] +149 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-bsw-n3050/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
    - bat-dg2-14:         NOTRUN -> [SKIP][19] ([i915#9423]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-14/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][20] ([i915#9423]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - bat-dg2-8:          NOTRUN -> [SKIP][21] ([i915#9423]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - fi-pnv-d510:        NOTRUN -> [SKIP][22] +44 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-pnv-d510/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - bat-rpls-4:         NOTRUN -> [SKIP][23] ([i915#9423]) +9 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rpls-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - fi-ivb-3770:        NOTRUN -> [SKIP][24] +149 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-ivb-3770/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
    - bat-apl-1:          NOTRUN -> [SKIP][25] +33 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-apl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - fi-bsw-nick:        NOTRUN -> [SKIP][26] +149 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-bsw-nick/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - fi-rkl-11600:       NOTRUN -> [SKIP][27] ([i915#15329] / [i915#3555]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
    - fi-cfl-8109u:       NOTRUN -> [DMESG-WARN][28] ([i915#13735] / [i915#15673]) +85 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-8109u/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - fi-rkl-11600:       NOTRUN -> [SKIP][29] ([i915#15329]) +123 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][30] +71 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-skl-6600u/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - bat-dg1-7:          NOTRUN -> [SKIP][31] ([i915#15329] / [i915#3555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - bat-rpls-4:         NOTRUN -> [SKIP][32] ([i915#3555] / [i915#9423]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - bat-jsl-5:          NOTRUN -> [SKIP][33] ([i915#3555]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-jsl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][34] ([i915#15329] / [i915#3555])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
    - fi-cfl-guc:         NOTRUN -> [SKIP][35] +35 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-guc/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - fi-cfl-8109u:       NOTRUN -> [DMESG-WARN][36] ([i915#13735]) +1 other test dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-8109u/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:
    - fi-ilk-650:         NOTRUN -> [SKIP][37] +114 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-ilk-650/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][38] ([i915#15329]) +28 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][39] +35 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-8109u/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - bat-dg1-7:          NOTRUN -> [SKIP][40] ([i915#15329]) +28 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - fi-glk-j4005:       NOTRUN -> [SKIP][41] +33 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-glk-j4005/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25 (NEW):
    - bat-mtlp-9:         NOTRUN -> [SKIP][42] ([i915#6953]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - bat-dg2-9:          NOTRUN -> [SKIP][43] ([i915#6953] / [i915#9423]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][44] ([i915#6078]) +44 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-atsm-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - bat-dg1-6:          NOTRUN -> [SKIP][45] ([i915#12311] / [i915#6953]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - bat-dg2-8:          NOTRUN -> [SKIP][46] ([i915#6953] / [i915#9423]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][47] ([i915#6953]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - bat-adlp-6:         NOTRUN -> [SKIP][48] ([i915#6953]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - bat-dg1-7:          NOTRUN -> [SKIP][49] ([i915#6953]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - bat-adlp-9:         NOTRUN -> [SKIP][50] ([i915#6953]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - bat-rpls-4:         NOTRUN -> [SKIP][51] ([i915#6953] / [i915#9423]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][52] +149 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-kbl-x1275/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
    - bat-adlp-11:        NOTRUN -> [SKIP][53] ([i915#6953]) +10 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:
    - fi-elk-e7500:       NOTRUN -> [SKIP][54] +114 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-elk-e7500/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:
    - bat-mtlp-8:         NOTRUN -> [SKIP][55] ([i915#15329]) +32 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html
    - bat-dg1-6:          NOTRUN -> [SKIP][56] ([i915#12311] / [i915#15329]) +158 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - fi-rkl-11600:       NOTRUN -> [SKIP][57] ([i915#15329] / [i915#6953]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
    - bat-twl-2:          NOTRUN -> [SKIP][58] ([i915#6953]) +8 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-twl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - bat-adlp-11:        NOTRUN -> [SKIP][59] ([i915#3555]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
    - bat-dg1-6:          NOTRUN -> [SKIP][60] ([i915#12311] / [i915#15329] / [i915#3555]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
    - bat-kbl-2:          NOTRUN -> [SKIP][61] +149 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-kbl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25 (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][62] +35 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-kbl-7567u/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][63] +35 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-8700k/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - bat-twl-1:          NOTRUN -> [SKIP][64] ([i915#6953]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-twl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - bat-jsl-5:          NOTRUN -> [SKIP][65] ([i915#6953]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-jsl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - bat-dg2-14:         NOTRUN -> [SKIP][66] ([i915#6953] / [i915#9423]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - bat-rplp-1:         NOTRUN -> [SKIP][67] ([i915#6953]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rplp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - fi-hsw-4770:        NOTRUN -> [SKIP][68] +149 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-hsw-4770/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][69] ([i915#15329] / [i915#6953]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
    - bat-dg1-6:          NOTRUN -> [SKIP][70] ([i915#12311] / [i915#15329] / [i915#6953]) +6 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - bat-dg1-6:          NOTRUN -> [SKIP][71] ([i915#12311] / [i915#15329] / [i915#3555] / [i915#6953]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25 (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][72] ([i915#3555])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg1-7:          NOTRUN -> [SKIP][73] ([i915#3555])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-adlp-9:         NOTRUN -> [SKIP][74] ([i915#3555])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg2-14:         NOTRUN -> [SKIP][75] ([i915#3555] / [i915#9423])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-rplp-1:         NOTRUN -> [SKIP][76] ([i915#3555])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rplp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][77] ([i915#3555])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][78] ([i915#3555])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg2-9:          NOTRUN -> [SKIP][79] ([i915#3555] / [i915#9423])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][80] ([i915#3555])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg1-6:          NOTRUN -> [SKIP][81] ([i915#12311] / [i915#3555])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - bat-dg2-8:          NOTRUN -> [SKIP][82] ([i915#3555] / [i915#9423])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][83] ([i915#3555])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - bat-mtlp-9:         NOTRUN -> [SKIP][84] ([i915#3555] / [i915#6953]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
    - bat-adlp-11:        NOTRUN -> [SKIP][85] ([i915#3555] / [i915#6953]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][86] ([i915#3555] / [i915#6953]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - bat-arls-6:         NOTRUN -> [SKIP][87] ([i915#6953]) +9 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-arls-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25 (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][88] ([i915#6953]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - bat-mtlp-8:         NOTRUN -> [SKIP][89] ([i915#6953]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][90] +149 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-kbl-8809g/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - bat-arlh-2:         NOTRUN -> [SKIP][91] ([i915#11346]) +160 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-arlh-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][92] ([i915#15329] / [i915#3555] / [i915#6953]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8795 -> IGTPW_14728

  CI-20190529: 20190529
  CI_DRM_18132: 4f823cb4f9faf6611f35c6a8a71ab696e3a734d6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14728: 1f97b741128aa72461743d89511ab7dbe09aed67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8795: 8795

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/index.html

--===============1206334730566873778==
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
<tr><td><b>Series:</b></td><td>Skip intel unsupported downscale tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163003/">https://patchwork.freedesktop.org/series/163003/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8795 -&gt; IGTPW_14728</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14728 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14728, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14728:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> +4 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> +4 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> +4 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> +4 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rplp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-jsl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-arlh-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-twl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-jsl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-twl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">SKIP</a> +163 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rpls-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling (NEW):</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> +4 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-arls-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8795 and IGTPW_14728:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14728 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers (NEW):</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-bsw-n3050/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> +149 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-14/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +4 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-pnv-d510/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rpls-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-ivb-3770/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> +149 other tests skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-apl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-bsw-nick/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">SKIP</a> +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-8109u/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +85 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +123 other tests skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-skl-6600u/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-jsl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-guc/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-8109u/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-ilk-650/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-8109u/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-glk-j4005/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25 (NEW):</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +6 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-atsm-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-kbl-x1275/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> +149 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-11/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-elk-e7500/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +32 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +158 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +6 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-twl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-kbl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html">SKIP</a> +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25 (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-kbl-7567u/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> +35 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-cfl-8700k/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> +35 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-twl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-jsl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rplp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-hsw-4770/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> +149 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25 (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-rplp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg1-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-tgl-1115g4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +2 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-adlp-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +4 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-arls-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25 (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-kbl-8809g/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/bat-arlh-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +160 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14728/fi-rkl-11600/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8795 -&gt; IGTPW_14728</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18132: 4f823cb4f9faf6611f35c6a8a71ab696e3a734d6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14728: 1f97b741128aa72461743d89511ab7dbe09aed67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8795: 8795</p>

</body>
</html>

--===============1206334730566873778==--
