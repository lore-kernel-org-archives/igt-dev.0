Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD492C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 20:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA3910E3D0;
	Wed, 16 Jul 2025 20:58:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65C910E3D0;
 Wed, 16 Jul 2025 20:58:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6572989121493360342=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Refactor_pixel_format_te?=
 =?utf-8?q?st_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Jul 2025 20:58:17 -0000
Message-ID: <175269949776.167933.10362969328948175183@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250715220810.287204-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250715220810.287204-1-ramanaidu.naladala@intel.com>
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

--===============6572989121493360342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor pixel format test handling
URL   : https://patchwork.freedesktop.org/series/151672/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8460_full -> IGTPW_13478_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13478_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13478_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/index.html

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): shard-glk10 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13478_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:
    - shard-snb:          [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-snb2/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb6/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-a} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][4] +8 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-a.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][5] +8 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb.html
    - shard-rkl:          NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb.html
    - shard-dg1:          NOTRUN -> [SKIP][7] +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-a} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][8] +17 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [PASS][9] -> [WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
    - shard-rkl:          [PASS][11] -> [WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
    - shard-dg1:          [PASS][13] -> [WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
    - shard-tglu:         [PASS][15] -> [WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
    - shard-mtlp:         [PASS][17] -> [WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-rkl:          [PASS][19] -> [CRASH][20] +1 other test crash
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-tglu:         [PASS][21] -> [CRASH][22] +3 other tests crash
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c:
    - shard-mtlp:         [PASS][23] -> [CRASH][24] +1 other test crash
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c.html
    - shard-rkl:          NOTRUN -> [CRASH][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - shard-dg2:          [PASS][26] -> [CRASH][27] +3 other tests crash
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html
    - shard-dg1:          [PASS][28] -> [CRASH][29] +3 other tests crash
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  
#### Warnings ####

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-mtlp:         [SKIP][30] ([i915#12247]) -> [CRASH][31] +1 other test crash
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  
New tests
---------

  New tests have been introduced between IGT_8460_full and IGTPW_13478_full:

### New IGT tests (86) ###

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 4.73] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-a:
    - Statuses : 5 skip(s)
    - Exec time: [0.00, 1.94] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-b:
    - Statuses : 5 skip(s)
    - Exec time: [0.00, 2.77] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-d:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 16.43] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.00, 8.28] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.00, 8.11] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.04] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar@pipe-d:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 8.74] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.00, 1.51] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.00, 2.43] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-c:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 2.37] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 2.43] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.00, 3.04] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed@pipe-a:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.56] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed@pipe-b:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.46] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed@pipe-c:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed@pipe-d:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.87] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar@pipe-a:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar@pipe-b:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar@pipe-d:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.01, 5.91] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.00, 2.69] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.00, 2.64] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb@pipe-c:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.02, 0.29] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.02, 0.29] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.00, 3.00] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed@pipe-a:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.49] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed@pipe-b:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.85] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed@pipe-c:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed@pipe-d:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar@pipe-a:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar@pipe-b:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.22] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar@pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 6.57] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb@pipe-a:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 2.71] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb@pipe-b:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 2.62] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.22, 1.20] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb@pipe-d:
    - Statuses : 4 pass(s)
    - Exec time: [0.22, 1.22] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.01, 2.96] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed@pipe-a:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 1.48] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed@pipe-b:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 1.85] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.05] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.01, 1.43] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar@pipe-a:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 0.42] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar@pipe-b:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 1.22] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar@pipe-d:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-rgb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.01, 2.17] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed@pipe-a:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 1.06] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed@pipe-b:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 1.56] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed@pipe-d:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar@pipe-a:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar@pipe-b:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.17] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar@pipe-d:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 5.53] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb@pipe-a:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.24] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb@pipe-b:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.22] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.20, 1.19] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb@pipe-d:
    - Statuses : 4 pass(s)
    - Exec time: [0.21, 1.13] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.01, 2.16] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed@pipe-a:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 1.05] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed@pipe-b:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 1.61] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.07] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.29] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar@pipe-a:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar@pipe-b:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.14] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar@pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.00, 5.62] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb@pipe-a:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.22] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb@pipe-b:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.22] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb@pipe-c:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.16] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb@pipe-d:
    - Statuses : 4 pass(s)
    - Exec time: [0.21, 1.22] s

  

Known issues
------------

  Here are the changes found in IGTPW_13478_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - shard-rkl:          [PASS][32] -> [SKIP][33] ([i915#14544] / [i915#2582]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@fbdev@eof.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@fbdev@eof.html

  * igt@fbdev@info:
    - shard-rkl:          [PASS][34] -> [SKIP][35] ([i915#14544] / [i915#1849] / [i915#2582])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@fbdev@info.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@fbdev@info.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#3281]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][37] ([i915#7697])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][38] ([i915#3555] / [i915#9323]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][39] ([i915#13356]) +1 other test incomplete
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@gem_ccs@suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#9323])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#7697])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg2-9:        NOTRUN -> [SKIP][42] ([i915#7697])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_close_race@multigpu-basic-process.html
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#14544] / [i915#7697])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][44] -> [INCOMPLETE][45] ([i915#12353]) +1 other test incomplete
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_ctx_isolation@preservation-s3.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#8555])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-16/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#8555]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#280])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#280])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-dg2:          [PASS][50] -> [ABORT][51] ([i915#10030] / [i915#8213])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-7/igt@gem_eio@in-flight-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][52] -> [FAIL][53] ([i915#5784])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-18/igt@gem_eio@reset-stress.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2-9:        NOTRUN -> [SKIP][54] ([i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4771])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4812])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-glk11:        NOTRUN -> [SKIP][57] ([i915#6334]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk11/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#6334]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4812]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-14/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3539])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2-9:        NOTRUN -> [SKIP][61] ([i915#3539])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][62] ([i915#3539] / [i915#4852])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-dg2-9:        NOTRUN -> [SKIP][63] ([i915#3281]) +9 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3281])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3281]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#14544] / [i915#3281])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3281]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg2-9:        NOTRUN -> [SKIP][68] ([i915#4537] / [i915#4812]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][69] -> [INCOMPLETE][70] ([i915#11441] / [i915#13304]) +1 other test incomplete
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_whisper@basic-contexts:
    - shard-rkl:          [PASS][71] -> [DMESG-WARN][72] ([i915#12964]) +27 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_exec_whisper@basic-contexts.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_exec_whisper@basic-contexts.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4860])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-7/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg2-9:        NOTRUN -> [SKIP][74] ([i915#4860])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4613])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][76] ([i915#4613]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#4613]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#4613]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-5/igt@gem_lmem_swapping@smem-oom.html
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#14544] / [i915#4613])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][80] -> [TIMEOUT][81] ([i915#5493]) +1 other test timeout
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#4613])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][83] ([i915#284])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4083]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@big-copy-xy:
    - shard-dg2-9:        NOTRUN -> [SKIP][85] ([i915#4077]) +8 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_mmap_gtt@big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4077]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4077]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4077]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4083]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@write:
    - shard-dg2-9:        NOTRUN -> [SKIP][90] ([i915#4083]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_mmap_wc@write.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4083])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3282])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
    - shard-dg2-9:        NOTRUN -> [SKIP][93] ([i915#3282]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3282]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-dg2-9:        NOTRUN -> [SKIP][95] ([i915#4270]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#14544] / [i915#4270])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4270]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          [PASS][98] -> [TIMEOUT][99] ([i915#12964]) +1 other test timeout
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4270]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          [PASS][101] -> [TIMEOUT][102] ([i915#12917] / [i915#12964])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-on.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2-9:        NOTRUN -> [SKIP][103] ([i915#5190] / [i915#8428]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#5190] / [i915#8428])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#8428])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][106] ([i915#3297]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-7/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#3297])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3281] / [i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@gem_userptr_blits@relocations.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#2856])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-dg2-9:        NOTRUN -> [SKIP][111] ([i915#2856])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gen9_exec_parse@batch-zero-length.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#2527])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#2527] / [i915#2856]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#2527] / [i915#2856]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#2856]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-7/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_drm_fdinfo@busy-check-all@bcs0:
    - shard-dg2-9:        NOTRUN -> [SKIP][116] ([i915#11527]) +7 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@i915_drm_fdinfo@busy-check-all@bcs0.html

  * igt@i915_drm_fdinfo@busy-hang@vecs0:
    - shard-dg2-9:        NOTRUN -> [SKIP][117] ([i915#14073]) +15 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@i915_drm_fdinfo@busy-hang@vecs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#14073]) +7 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#14118])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          [PASS][120] -> [DMESG-WARN][121] ([i915#14545])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-8/igt@i915_module_load@resize-bar.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][122] -> [INCOMPLETE][123] ([i915#12455] / [i915#13820]) +1 other test incomplete
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rpm@gem-mmap-type:
    - shard-rkl:          [PASS][124] -> [SKIP][125] ([i915#13328] / [i915#14544])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@i915_pm_rpm@gem-mmap-type.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@i915_pm_rpm@gem-mmap-type.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#11681])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-15/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-dg2-9:        NOTRUN -> [SKIP][127] ([i915#11681]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#4387])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#6188])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][130] ([i915#4817])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk6/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [PASS][131] -> [INCOMPLETE][132] ([i915#4817])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@i915_suspend@sysfs-reader.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#7707])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#7707])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-10/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][135] ([i915#4212])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4212])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-tglu:         [PASS][137] -> [FAIL][138] ([i915#10991]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#9531])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#9531])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#1769] / [i915#3555])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#1769] / [i915#3555])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][143] ([i915#5956]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-3.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][144] -> [FAIL][145] ([i915#11808]) +1 other test fail
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#4538] / [i915#5286])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-15/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#5286])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#5286]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#5286]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][150] ([i915#5138])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-rkl:          [PASS][151] -> [SKIP][152] ([i915#14544]) +44 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#3638]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][154] +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3638])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][156] +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-9:        NOTRUN -> [SKIP][157] ([i915#5190]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#4538] / [i915#5190]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#4538])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][160] ([i915#4538] / [i915#5190]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][161]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#6187]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#5190]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#6095]) +145 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][165] ([i915#10307] / [i915#6095]) +34 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#10307] / [i915#6095]) +137 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][168] ([i915#12313]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#6095]) +19 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-glk11:        NOTRUN -> [SKIP][170] +226 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#6095]) +9 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#6095]) +47 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2:          [PASS][173] -> [ABORT][174] ([i915#8213])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][175] +301 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-3:
    - shard-dg2:          NOTRUN -> [ABORT][176] ([i915#8213])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#6095]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][178] ([i915#6095]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#6095]) +39 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#14098] / [i915#6095]) +39 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#13781]) +3 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#11151] / [i915#7828]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-6/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#11151] / [i915#14544] / [i915#7828])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#11151] / [i915#7828]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#11151] / [i915#7828]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#11151] / [i915#7828]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#11151] / [i915#7828])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2-9:        NOTRUN -> [SKIP][188] ([i915#11151] / [i915#7828]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#11151] / [i915#7828]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@ctm-green-to-red:
    - shard-rkl:          [PASS][190] -> [SKIP][191] ([i915#12655] / [i915#14544])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_color@ctm-green-to-red.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_color@ctm-green-to-red.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#3116] / [i915#3299])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3299])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][194] ([i915#3299])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#6944] / [i915#9424])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#7118] / [i915#7162] / [i915#9424])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#8814])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3555]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [PASS][199] -> [FAIL][200] ([i915#13566]) +5 other tests fail
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#13049])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#13049])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#3555]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][204] -> [FAIL][205] ([i915#13566]) +1 other test fail
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][206] ([i915#4103] / [i915#4213])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-rkl:          [PASS][207] -> [SKIP][208] ([i915#11190] / [i915#14544]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-dg2-9:        NOTRUN -> [SKIP][209] ([i915#13046] / [i915#5354])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#13046] / [i915#5354]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#4103])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#13691])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#3555] / [i915#3804])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#1769] / [i915#3555] / [i915#3804])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3804])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3804])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#1257])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#13749])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#13749])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#13749])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#13707])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#3840] / [i915#9688])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg2-9:        NOTRUN -> [SKIP][223] ([i915#3840] / [i915#9688])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-9:        NOTRUN -> [SKIP][224] ([i915#3840])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3555] / [i915#3840])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-9:        NOTRUN -> [SKIP][226] ([i915#3840] / [i915#9053])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#3955])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#3469])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#1839])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#1839]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#4881])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#3637] / [i915#9934]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-9:        NOTRUN -> [SKIP][233] ([i915#9934]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][234] -> [TIMEOUT][235] ([i915#14033]) +1 other test timeout
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#9934]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#3637] / [i915#9934]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#9934])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#3637] / [i915#9934]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#9934]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@dpms-off-confusion@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][241] ([i915#12964]) +5 other tests dmesg-warn
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-rkl:          [PASS][242] -> [SKIP][243] ([i915#14544] / [i915#3637]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#14544] / [i915#3637]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#2672]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#14544] / [i915#3555])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#2672] / [i915#3555])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#2672]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#2587] / [i915#2672]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#2587] / [i915#2672] / [i915#3555])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][255] ([i915#2672]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#2672] / [i915#3555]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#2672] / [i915#8813]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-rkl:          [PASS][258] -> [SKIP][259] ([i915#14544] / [i915#3555]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#2672] / [i915#3555]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#2587] / [i915#2672]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [PASS][263] -> [SKIP][264] ([i915#14544] / [i915#1849] / [i915#5354]) +10 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][265] +6 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#1825]) +6 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#5354]) +10 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#5439])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#10433] / [i915#3458])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#3458]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#14544] / [i915#1849] / [i915#5354]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#8708]) +8 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-9:        NOTRUN -> [SKIP][273] ([i915#5354]) +16 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][274] ([i915#8708]) +9 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] +62 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#1825]) +8 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-9:        NOTRUN -> [SKIP][277] ([i915#10055])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#8708])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][279] ([i915#3458]) +10 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#3023]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#3458]) +8 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#8708]) +6 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8228])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#12713])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8228])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2-9:        NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [PASS][287] -> [SKIP][288] ([i915#3555] / [i915#8228]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-rkl:          [PASS][289] -> [SKIP][290] ([i915#14544] / [i915#3555] / [i915#8826]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_invalid_mode@zero-clock.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][291] -> [SKIP][292] ([i915#12388])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#12388])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#12388])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#12388] / [i915#14544])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#12388])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#12394])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-9:        NOTRUN -> [SKIP][298] ([i915#12339])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@atomic-implicit-crtc:
    - shard-dg1:          [PASS][299] -> [DMESG-WARN][300] ([i915#4423]) +4 other tests dmesg-warn
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-16/igt@kms_lease@atomic-implicit-crtc.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-14/igt@kms_lease@atomic-implicit-crtc.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#14544]) +10 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-glk11:        NOTRUN -> [SKIP][302] ([i915#11190]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-rkl:          [PASS][303] -> [SKIP][304] ([i915#14544] / [i915#9581])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane@planar-pixel-format-settings.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-rkl:          [PASS][305] -> [SKIP][306] ([i915#14544] / [i915#8825]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_plane@plane-panning-top-left.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-rkl:          [PASS][307] -> [SKIP][308] ([i915#14544] / [i915#7294]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_plane_alpha_blend@alpha-basic.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][309] ([i915#12178])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][310] ([i915#7862]) +1 other test fail
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][311] ([i915#10647] / [i915#12169])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][312] ([i915#10647]) +1 other test fail
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#3555])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#13958])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#13958])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-9:        NOTRUN -> [SKIP][316] ([i915#14259])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-9:        NOTRUN -> [SKIP][317] ([i915#13046] / [i915#5354] / [i915#9423])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-9:        NOTRUN -> [SKIP][318] ([i915#12247] / [i915#9423])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#14544] / [i915#8152]) +9 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#12247]) +5 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#12247]) +4 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * {igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][322] +53 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#12247] / [i915#6953])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#12247]) +8 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#12247]) +3 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#12247] / [i915#6953])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-rkl:          [PASS][327] -> [SKIP][328] ([i915#12247] / [i915#14544] / [i915#8152]) +5 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#12247]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-rkl:          [PASS][330] -> [SKIP][331] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-rkl:          [PASS][332] -> [SKIP][333] ([i915#14544] / [i915#6953] / [i915#8152])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-9:        NOTRUN -> [SKIP][334] ([i915#12247] / [i915#3555] / [i915#9423])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2-9:        NOTRUN -> [SKIP][335] ([i915#12247]) +7 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - shard-rkl:          [PASS][336] -> [SKIP][337] ([i915#12247] / [i915#14544]) +3 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#9812])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#9685]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-9:        NOTRUN -> [SKIP][340] ([i915#3828])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#14104])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#8430])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-9:        NOTRUN -> [SKIP][343] ([i915#9519])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-rkl:          [PASS][344] -> [SKIP][345] ([i915#9519])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#14544] / [i915#1849])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [PASS][347] -> [SKIP][348] ([i915#9519])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg2:          NOTRUN -> [SKIP][349] +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-rkl:          [PASS][350] -> [SKIP][351] ([i915#14544] / [i915#6524])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_prime@basic-crc-vgem.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          [PASS][352] -> [SKIP][353] ([i915#11521] / [i915#14544]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_properties@plane-properties-legacy.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][354] ([i915#11520]) +6 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][355] ([i915#11520]) +7 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#11520]) +3 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#11520]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#11520]) +3 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][359] ([i915#11520]) +10 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][360] ([i915#11520]) +4 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk11/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#9683])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#9683])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#9732]) +10 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#9688]) +5 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-mmap-cpu:
    - shard-dg2-9:        NOTRUN -> [SKIP][365] ([i915#1072] / [i915#9732]) +13 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_psr@fbc-psr-sprite-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][366] ([i915#9732]) +12 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#1072] / [i915#9732]) +4 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#1072] / [i915#9732]) +12 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#1072] / [i915#9732]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2-9:        NOTRUN -> [SKIP][371] ([i915#4235])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][372] ([i915#12755]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-snb:          [PASS][373] -> [FAIL][374] ([i915#5465]) +2 other tests fail
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-snb6/igt@kms_setmode@basic.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb4/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-9:        NOTRUN -> [SKIP][375] ([i915#3555]) +6 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][376] ([i915#8623])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglu:         NOTRUN -> [SKIP][377] +32 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][378] ([i915#9906])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#3555]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#9906])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#9906]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-dg2-9:        NOTRUN -> [SKIP][382] ([i915#9906])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][383] ([i915#2437])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-5/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu-1:       NOTRUN -> [SKIP][384] ([i915#2437] / [i915#9412])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [PASS][385] -> [FAIL][386] ([i915#10538]) +1 other test fail
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@perf@polling@0-rcs0.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-mtlp:         [PASS][387] -> [FAIL][388] ([i915#11943])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-1/igt@perf_pmu@all-busy-idle-check-all.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [FAIL][389] ([i915#14433])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk1/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2-9:        NOTRUN -> [SKIP][390] ([i915#8516])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#3708])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#3291] / [i915#3708]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@prime_vgem@basic-fence-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#9917])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
    - shard-tglu-1:       NOTRUN -> [FAIL][394] ([i915#12910]) +8 other tests fail
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-rkl:          [SKIP][395] ([i915#14544] / [i915#2582]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@fbdev@write.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@fbdev@write.html

  * igt@gem_create@hog-create:
    - shard-rkl:          [DMESG-WARN][397] ([i915#12964]) -> [PASS][398] +39 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@gem_create@hog-create.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_create@hog-create.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [FAIL][399] ([i915#9561]) -> [PASS][400] +1 other test pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_isolation@dirty-switch:
    - shard-mtlp:         [ABORT][401] ([i915#13562]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-6/igt@gem_ctx_isolation@dirty-switch.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@gem_ctx_isolation@dirty-switch.html

  * igt@gem_ctx_isolation@dirty-switch@bcs0:
    - shard-mtlp:         [ABORT][403] -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-6/igt@gem_ctx_isolation@dirty-switch@bcs0.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@gem_ctx_isolation@dirty-switch@bcs0.html

  * igt@gem_ctx_isolation@dirty-switch@rcs0:
    - shard-mtlp:         [DMESG-WARN][405] ([i915#13562]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-6/igt@gem_ctx_isolation@dirty-switch@rcs0.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@gem_ctx_isolation@dirty-switch@rcs0.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][407] ([i915#5784]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_gttfill@basic:
    - shard-rkl:          [DMESG-WARN][409] ([i915#12917] / [i915#12964]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@gem_exec_gttfill@basic.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-rkl:          [INCOMPLETE][411] ([i915#13304]) -> [PASS][412] +1 other test pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_exec_suspend@basic-s0.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [TIMEOUT][413] ([i915#12917] / [i915#12964]) -> [PASS][414] +3 other tests pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_pxp@display-protected-crc.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@gem_pxp@display-protected-crc.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-rkl:          [SKIP][415] ([i915#14544]) -> [PASS][416] +35 other tests pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][417] ([i915#5138]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-6/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_color@ctm-negative:
    - shard-rkl:          [SKIP][419] ([i915#12655] / [i915#14544]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_color@ctm-negative.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_color@ctm-negative.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][421] ([i915#13566]) -> [PASS][422] +3 other tests pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][423] ([i915#13566]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_cursor_crc@cursor-random-64x21.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][425] ([i915#11190] / [i915#14544]) -> [PASS][426] +2 other tests pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-rkl:          [SKIP][427] ([i915#14544] / [i915#3637]) -> [PASS][428] +3 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip@absolute-wf_vblank.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][429] ([i915#14544] / [i915#3555]) -> [PASS][430] +3 other tests pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg2:          [FAIL][431] ([i915#6880]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][433] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][434] +8 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          [SKIP][435] -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-snb4/igt@kms_hdmi_inject@inject-audio.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [SKIP][437] ([i915#3555] / [i915#8228]) -> [PASS][438]
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-4/igt@kms_hdr@static-swap.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_hdr@static-swap.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_invalid_mode@clock-too-high.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_lease@lease-unleased-crtc:
    - shard-dg1:          [ABORT][441] ([i915#4423]) -> [PASS][442]
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-17/igt@kms_lease@lease-unleased-crtc.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_lease@lease-unleased-crtc.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-rkl:          [SKIP][443] ([i915#14544] / [i915#8825]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-dg1:          [DMESG-WARN][445] ([i915#4423]) -> [PASS][446]
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-14/igt@kms_plane_alpha_blend@alpha-basic.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-rkl:          [SKIP][447] ([i915#14544] / [i915#7294]) -> [PASS][448]
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-rkl:          [SKIP][449] ([i915#14544] / [i915#8152]) -> [PASS][450]
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:
    - shard-rkl:          [SKIP][451] ([i915#12247] / [i915#14544]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b:
    - shard-rkl:          [SKIP][453] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][454]
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][455] ([i915#14544] / [i915#9519]) -> [PASS][456]
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][457] ([i915#9519]) -> [PASS][458] +1 other test pass
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][459] ([i915#9519]) -> [PASS][460] +1 other test pass
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-rkl:          [SKIP][461] ([i915#11521] / [i915#14544]) -> [PASS][462]
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr@psr2-basic@edp-1:
    - shard-mtlp:         [FAIL][463] -> [PASS][464] +1 other test pass
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-7/igt@kms_psr@psr2-basic@edp-1.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_psr@psr2-basic@edp-1.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][465] ([i915#5465]) -> [PASS][466] +1 other test pass
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-7/igt@kms_setmode@basic.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][467] ([i915#5465]) -> [PASS][468] +2 other tests pass
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [FAIL][469] ([i915#4349]) -> [PASS][470] +3 other tests pass
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-19/igt@perf_pmu@semaphore-busy@vcs1.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html
    - shard-mtlp:         [FAIL][471] ([i915#4349]) -> [PASS][472] +4 other tests pass
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-1/igt@perf_pmu@semaphore-busy@vcs1.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          [FAIL][473] ([i915#4349]) -> [PASS][474] +5 other tests pass
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-1/igt@perf_pmu@semaphore-busy@vecs0.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@perf_pmu@semaphore-busy@vecs0.html

  
#### Warnings ####

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          [SKIP][475] ([i915#14544] / [i915#7697]) -> [SKIP][476] ([i915#7697])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_basic@multigpu-create-close.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          [SKIP][477] ([i915#9323]) -> [SKIP][478] ([i915#14544] / [i915#9323])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@gem_ccs@suspend-resume.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          [SKIP][479] ([i915#6335]) -> [SKIP][480] ([i915#14544] / [i915#6335])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          [SKIP][481] ([i915#280]) -> [SKIP][482] ([i915#14544] / [i915#280]) +1 other test skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][483] ([i915#4525]) -> [SKIP][484] ([i915#14544] / [i915#4525]) +2 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][485] -> [ABORT][486] ([i915#11713])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-7/igt@gem_exec_big@single.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][487] ([i915#3281]) -> [SKIP][488] ([i915#14544] / [i915#3281]) +10 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#3281]) -> [SKIP][490] ([i915#3281]) +3 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [SKIP][491] ([i915#14544] / [i915#7276]) -> [SKIP][492] ([i915#7276])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          [SKIP][493] ([i915#4613]) -> [SKIP][494] ([i915#14544] / [i915#4613]) +3 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          [SKIP][495] ([i915#14544] / [i915#4613]) -> [SKIP][496] ([i915#4613]) +2 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_lmem_swapping@verify.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_lmem_swapping@verify.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][497] ([i915#3282]) -> [SKIP][498] ([i915#14544] / [i915#3282]) +6 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@snoop:
    - shard-rkl:          [SKIP][499] ([i915#14544] / [i915#3282]) -> [SKIP][500] ([i915#3282]) +2 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_pread@snoop.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_pread@snoop.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          [SKIP][501] ([i915#14544] / [i915#4270]) -> [TIMEOUT][502] ([i915#12917] / [i915#12964])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          [TIMEOUT][503] ([i915#12917] / [i915#12964]) -> [SKIP][504] ([i915#4270])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [SKIP][505] ([i915#4270]) -> [TIMEOUT][506] ([i915#12917] / [i915#12964])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][507] ([i915#8411]) -> [SKIP][508] ([i915#14544] / [i915#8411]) +1 other test skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][509] ([i915#3297]) -> [SKIP][510] ([i915#14544] / [i915#3297]) +2 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          [SKIP][511] ([i915#14544] / [i915#3297]) -> [SKIP][512] ([i915#3297])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          [SKIP][513] ([i915#14544] / [i915#3297] / [i915#3323]) -> [SKIP][514] ([i915#3297] / [i915#3323])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          [SKIP][515] ([i915#2527]) -> [SKIP][516] ([i915#14544] / [i915#2527])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          [SKIP][517] ([i915#14498]) -> [SKIP][518] ([i915#14498] / [i915#14544])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-idle.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][519] ([i915#4387]) -> [SKIP][520] ([i915#14544] / [i915#4387])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@i915_pm_sseu@full-enable.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][521] ([i915#7984]) -> [SKIP][522] ([i915#14544] / [i915#7984])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@i915_power@sanity.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][523] ([i915#14544] / [i915#5723]) -> [SKIP][524] ([i915#5723])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][525] ([i915#13550]) -> [DMESG-FAIL][526] ([i915#12964] / [i915#13550])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@i915_selftest@live.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@i915_selftest@live.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][527] ([i915#14544]) -> [SKIP][528] ([i915#5286]) +2 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][529] ([i915#5286]) -> [SKIP][530] ([i915#14544]) +3 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          [SKIP][531] ([i915#14544]) -> [SKIP][532] ([i915#3638]) +1 other test skip
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-rkl:          [SKIP][533] ([i915#3638]) -> [SKIP][534] ([i915#14544])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][535] ([i915#14098] / [i915#6095]) -> [SKIP][536] ([i915#14544]) +12 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][537] ([i915#12805]) -> [SKIP][538] ([i915#14544])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][539] ([i915#12313]) -> [SKIP][540] ([i915#14544])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][541] ([i915#14544]) -> [SKIP][542] ([i915#14098] / [i915#6095]) +8 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          [SKIP][543] ([i915#11151] / [i915#7828]) -> [SKIP][544] ([i915#11151] / [i915#14544] / [i915#7828]) +6 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          [SKIP][545] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][546] ([i915#11151] / [i915#7828]) +5 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@deep-color:
    - shard-rkl:          [SKIP][547] ([i915#12655] / [i915#3555]) -> [SKIP][548] ([i915#12655] / [i915#14544] / [i915#3555])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_color@deep-color.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [FAIL][549] ([i915#7173]) -> [SKIP][550] ([i915#7118] / [i915#9424])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          [SKIP][551] ([i915#14544]) -> [SKIP][552] ([i915#7118] / [i915#9424]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][553] ([i915#3116]) -> [SKIP][554] ([i915#14544])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          [SKIP][555] ([i915#9424]) -> [SKIP][556] ([i915#14544]) +1 other test skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_content_protection@lic-type-0.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][557] ([i915#14544]) -> [SKIP][558] ([i915#9424]) +1 other test skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_content_protection@mei-interface.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][559] ([i915#7118]) -> [SKIP][560] ([i915#14544])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_content_protection@srm.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][561] ([i915#3555]) -> [SKIP][562] ([i915#14544]) +2 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][563] ([i915#13049]) -> [SKIP][564] ([i915#14544]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          [DMESG-FAIL][565] ([i915#12964]) -> [SKIP][566] ([i915#14544])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          [SKIP][567] ([i915#14544]) -> [SKIP][568] ([i915#13049])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-rkl:          [INCOMPLETE][569] ([i915#12358] / [i915#14152]) -> [SKIP][570] ([i915#14544])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-rkl:          [SKIP][571] -> [SKIP][572] ([i915#14544]) +19 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][573] ([i915#14544]) -> [SKIP][574] +12 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [FAIL][575] ([i915#2346]) -> [SKIP][576] ([i915#14544])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][577] ([i915#9723]) -> [SKIP][578] ([i915#14544])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][579] ([i915#14544]) -> [SKIP][580] ([i915#13748])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          [SKIP][581] ([i915#13707]) -> [SKIP][582] ([i915#14544])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][583] ([i915#3555] / [i915#3840]) -> [SKIP][584] ([i915#11190] / [i915#14544])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_dsc@dsc-basic.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          [SKIP][585] ([i915#3840] / [i915#9053]) -> [SKIP][586] ([i915#14544])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][587] ([i915#14544] / [i915#9337]) -> [SKIP][588] ([i915#9337])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          [SKIP][589] ([i915#14544] / [i915#658]) -> [SKIP][590] ([i915#658])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_feature_discovery@psr2.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-rkl:          [SKIP][591] ([i915#9934]) -> [SKIP][592] ([i915#14544] / [i915#9934]) +4 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_flip@2x-flip-vs-fences.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-rkl:          [SKIP][593] ([i915#14544] / [i915#9934]) -> [SKIP][594] ([i915#9934]) +2 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-rkl:          [SKIP][595] ([i915#14544] / [i915#3637]) -> [DMESG-WARN][596] ([i915#12964])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip@dpms-off-confusion.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][597] ([i915#12745] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][598] ([i915#12745] / [i915#4839])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-rkl:          [DMESG-WARN][599] ([i915#12964]) -> [SKIP][600] ([i915#14544] / [i915#3637])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][601] ([i915#14544] / [i915#3555]) -> [SKIP][602] ([i915#2672] / [i915#3555])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][603] ([i915#2672] / [i915#3555]) -> [SKIP][604] ([i915#14544] / [i915#3555]) +1 other test skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][605] -> [SKIP][606] ([i915#14544] / [i915#1849] / [i915#5354])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:
    - shard-rkl:          [SKIP][607] ([i915#14544] / [i915#1849] / [i915#5354]) -> [DMESG-WARN][608] ([i915#12964])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][609] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][610] ([i915#1825]) +18 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][611] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][612] ([i915#3023]) +13 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][613] ([i915#3458]) -> [SKIP][614] ([i915#10433] / [i915#3458]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][615] ([i915#10433] / [i915#3458]) -> [SKIP][616] ([i915#3458]) +5 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][617] ([i915#1825]) -> [SKIP][618] ([i915#14544] / [i915#1849] / [i915#5354]) +32 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          [SKIP][619] ([i915#3023]) -> [SKIP][620] ([i915#14544] / [i915#1849] / [i915#5354]) +20 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-suspend.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][621] ([i915#1187] / [i915#12713]) -> [SKIP][622] ([i915#12713])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][623] ([i915#3555] / [i915#8228]) -> [SKIP][624] ([i915#14544]) +1 other test skip
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_hdr@static-toggle.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          [SKIP][625] ([i915#14544]) -> [SKIP][626] ([i915#3555] / [i915#8228])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          [SKIP][627] ([i915#13688] / [i915#14544]) -> [SKIP][628] ([i915#13688])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][629] ([i915#14544]) -> [SKIP][630] ([i915#6301])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][631] ([i915#6301]) -> [SKIP][632] ([i915#14544])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_panel_fitting@legacy.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-rkl:          [DMESG-WARN][633] ([i915#12964]) -> [SKIP][634] ([i915#14544]) +4 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-rkl:          [SKIP][635] ([i915#14544]) -> [SKIP][636] ([i915#3555]) +1 other test skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          [SKIP][637] ([i915#13958]) -> [SKIP][638] ([i915#14544])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-4.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-rkl:          [SKIP][639] -> [SKIP][640] ([i915#14544] / [i915#8152])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][641] ([i915#12247]) -> [SKIP][642] ([i915#12247] / [i915#14544]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-rkl:          [SKIP][643] ([i915#12247]) -> [SKIP][644] ([i915#12247] / [i915#14544] / [i915#8152]) +3 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-rkl:          [SKIP][645] ([i915#12247] / [i915#14544]) -> [SKIP][646] ([i915#12247]) +1 other test skip
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-rkl:          [SKIP][647] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][648] ([i915#12247]) +3 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][649] ([i915#14544] / [i915#5354]) -> [SKIP][650] ([i915#5354])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          [SKIP][651] ([i915#14544] / [i915#9685]) -> [SKIP][652] ([i915#9685])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          [SKIP][653] ([i915#9685]) -> [SKIP][654] ([i915#14544] / [i915#9685])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_pm_dc@dc6-psr.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][655] ([i915#14544] / [i915#4281]) -> [SKIP][656] ([i915#4281])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][657] ([i915#9519]) -> [SKIP][658] ([i915#14544] / [i915#9519]) +1 other test skip
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][659] ([i915#11520]) -> [SKIP][660] ([i915#11520] / [i915#14544]) +6 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][661] ([i915#11520] / [i915#14544]) -> [SKIP][662] ([i915#11520]) +2 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          [SKIP][663] ([i915#14544] / [i915#9683]) -> [SKIP][664] ([i915#9683])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          [SKIP][665] ([i915#1072] / [i915#9732]) -> [SKIP][666] ([i915#1072] / [i915#14544] / [i915#9732]) +19 other tests skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][667] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][668] ([i915#1072] / [i915#9732]) +14 other tests skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][669] ([i915#5289]) -> [SKIP][670] ([i915#14544]) +2 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][671] ([i915#8623]) -> [SKIP][672] ([i915#14544])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@wait-busy:
    - shard-rkl:          [SKIP][673] ([i915#14544]) -> [DMESG-WARN][674] ([i915#12964])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_vblank@wait-busy.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_vblank@wait-busy.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          [SKIP][675] ([i915#11920]) -> [SKIP][676] ([i915#14544])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_vrr@lobf.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          [SKIP][677] ([i915#14544]) -> [SKIP][678] ([i915#9906])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          [SKIP][679] ([i915#14544] / [i915#2437] / [i915#9412]) -> [SKIP][680] ([i915#2437] / [i915#9412]) +1 other test skip
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          [SKIP][681] ([i915#9917]) -> [SKIP][682] ([i915#14544] / [i915#9917])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13304]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13550
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9581
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8460 -> IGTPW_13478

  CI-20190529: 20190529
  CI_DRM_16871: 394c972916ad8aa294c31fee993bde243b786bac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13478: 4a35e0b6a65bac3473e2da7a7e929387c724579d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8460: 8460

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/index.html

--===============6572989121493360342==
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
<tr><td><b>Series:</b></td><td>Refactor pixel format test handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151672/">https://patchwork.freedesktop.org/series/151672/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8460_full -&gt; IGTPW_13478_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13478_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13478_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/index.html</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): shard-glk10 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13478_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-snb2/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb6/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-a} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-a.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb.html">SKIP</a> +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb.html">SKIP</a> +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-a} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-a.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">WARN</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">WARN</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">WARN</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">WARN</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">CRASH</a> +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">CRASH</a> +3 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c.html">CRASH</a> +1 other test crash</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">CRASH</a> +3 other tests crash</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">CRASH</a> +3 other tests crash</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">CRASH</a> +1 other test crash</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8460_full and IGTPW_13478_full:</p>
<h3>New IGT tests (86)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 4.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-a:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.00, 1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-b:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.00, 2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-packed@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 16.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.00, 8.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.00, 8.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar@pipe-c:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-planar@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 8.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.00, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.00, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-c:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format-rgb@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-packed@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar@pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar@pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 5.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-rgb@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-packed@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar@pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar@pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar@pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-planar@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 6.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.22, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format-rgb@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.22, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-packed@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-planar@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format-rgb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-packed@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar@pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar@pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-planar@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 5.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb@pipe-c:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.20, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format-rgb@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.21, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-packed@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar@pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar@pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar@pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-rgb@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.21, 1.22] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13478_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353">i915#12353</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-16/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-7/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030">i915#10030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-18/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@gem_exec_balancer@sliced.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk11/igt@gem_exec_capture@capture-invisible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-14/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_reloc@basic-gtt-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441">i915#11441</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304">i915#13304</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_exec_whisper@basic-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_exec_whisper@basic-contexts.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +27 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-7/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-5/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@gem_mmap@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_mmap_gtt@big-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_mmap_gtt@flink-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@gem_mmap_gtt@medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_mmap_wc@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_mmap_wc@write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_pxp@create-regular-context-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-on.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-7/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-7/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@i915_drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vecs0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@i915_drm_fdinfo@busy-hang@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-8/igt@i915_module_load@resize-bar.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@i915_module_load@resize-bar.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455">i915#12455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@i915_pm_rpm@gem-mmap-type.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@i915_pm_rpm@gem-mmap-type.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328">i915#13328</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-15/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-10/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991">i915#10991</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808">i915#11808</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-15/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +145 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +137 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +226 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +301 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-6/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_color@ctm-green-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162">i915#7162</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033">i915#14033</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_invalid_mode@zero-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-16/igt@kms_lease@atomic-implicit-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-14/igt@kms_lease@atomic-implicit-crtc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane@planar-pixel-format-settings.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9581">i915#9581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_plane@plane-panning-top-left.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294">i915#7294</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format-planar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format-planar.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104">i915#14104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pm_rpm@fences-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_prime@basic-crc-vgem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_properties@plane-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#11521</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk11/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_psr@fbc-psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-snb6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-9/igt@kms_tv_load_detect@load-detect.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-5/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling@0-rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@perf@polling@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@perf@polling@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-1/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943">i915#11943</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk1/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-9/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-3/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-11/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +8 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_create@hog-create:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@gem_create@hog-create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_create@hog-create.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561">i915#9561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-switch:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-6/igt@gem_ctx_isolation@dirty-switch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@gem_ctx_isolation@dirty-switch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-switch@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-6/igt@gem_ctx_isolation@dirty-switch@bcs0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@gem_ctx_isolation@dirty-switch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-switch@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-6/igt@gem_ctx_isolation@dirty-switch@rcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@gem_ctx_isolation@dirty-switch@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-17/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-19/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@gem_exec_gttfill@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_gttfill@basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304">i915#13304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_pxp@display-protected-crc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@gem_pxp@display-protected-crc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-6/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_color@ctm-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-snb4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-snb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-10/igt@kms_hdr@static-swap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_invalid_mode@clock-too-high.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-17/igt@kms_lease@lease-unleased-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-12/igt@kms_lease@lease-unleased-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_plane@pixel-format-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-14/igt@kms_plane_alpha_blend@alpha-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-18/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294">i915#7294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#11521</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic@edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-7/igt@kms_psr@psr2-basic@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_psr@psr2-basic@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-4/igt@kms_setmode@basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg1-19/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> +3 other tests pass</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-1/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vecs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-1/igt@perf_pmu@semaphore-busy@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-1/igt@perf_pmu@semaphore-busy@vecs0.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-tglu-7/igt@gem_exec_big@single.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-tglu-10/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-2.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13550">i915#13550</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13550">i915#13550</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip@dpms-off-confusion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_flip@dpms-off-confusion.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_vblank@wait-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-5/igt@kms_vblank@wait-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-7/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13478/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8460 -&gt; IGTPW_13478</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16871: 394c972916ad8aa294c31fee993bde243b786bac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13478: 4a35e0b6a65bac3473e2da7a7e929387c724579d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8460: 8460</p>

</body>
</html>

--===============6572989121493360342==--
