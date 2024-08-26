Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29E1C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 05:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A9210E0D7;
	Mon, 26 Aug 2024 05:35:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C2210E0D7;
 Mon, 26 Aug 2024 05:35:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9128604671456215741=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fplane=5Fscaling?=
 =?utf-8?q?=3A_Update_scaling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Aug 2024 05:35:53 -0000
Message-ID: <172465055314.783181.5779951444303311305@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826045351.1340125-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240826045351.1340125-1-ramanaidu.naladala@intel.com>
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

--===============9128604671456215741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Update scaling
URL   : https://patchwork.freedesktop.org/series/137769/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15289 -> IGTPW_11634
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (2): bat-dg1-7 fi-elk-e7500 
  Missing    (3): bat-dg2-11 fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11634:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a} (NEW):
    - bat-twl-1:          NOTRUN -> [SKIP][1] +28 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-twl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][2] +95 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg1-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a} (NEW):
    - bat-apl-1:          NOTRUN -> [CRASH][3] +17 other tests crash
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-apl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c} (NEW):
    - bat-jsl-1:          NOTRUN -> [CRASH][4] +17 other tests crash
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-jsl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][5] +83 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-tgl-1115g4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d} (NEW):
    - bat-arls-1:         NOTRUN -> [CRASH][6] +23 other tests crash
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c} (NEW):
    - fi-kbl-8809g:       NOTRUN -> [CRASH][7] +17 other tests crash
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-8809g/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
    - fi-ivb-3770:        NOTRUN -> [CRASH][8] +17 other tests crash
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-ivb-3770/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
    - bat-dg2-14:         NOTRUN -> [CRASH][9] +23 other tests crash
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-14/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
    - bat-dg2-8:          NOTRUN -> [CRASH][10] +23 other tests crash
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
    - fi-kbl-guc:         NOTRUN -> [CRASH][11] +17 other tests crash
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-guc/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [CRASH][12] +7 other tests crash
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-tgl-1115g4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b} (NEW):
    - fi-cfl-guc:         NOTRUN -> [CRASH][13] +17 other tests crash
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-guc/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html
    - bat-mtlp-6:         NOTRUN -> [CRASH][14] +23 other tests crash
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-mtlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html

  * {igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a} (NEW):
    - bat-rpls-4:         NOTRUN -> [DMESG-WARN][15] +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
    - bat-jsl-1:          NOTRUN -> [DMESG-WARN][16] +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-jsl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * {igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b} (NEW):
    - fi-rkl-11600:       NOTRUN -> [DMESG-WARN][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b.html

  * {igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a} (NEW):
    - bat-dg2-9:          NOTRUN -> [CRASH][18] +23 other tests crash
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
    - fi-kbl-x1275:       NOTRUN -> [CRASH][19] +17 other tests crash
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-x1275/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
    - bat-adlp-11:        NOTRUN -> [CRASH][20] +23 other tests crash
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
    - bat-arls-2:         NOTRUN -> [CRASH][21] +23 other tests crash
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
    - bat-mtlp-8:         NOTRUN -> [CRASH][22] +23 other tests crash
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-mtlp-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
    - bat-adls-6:         NOTRUN -> [CRASH][23] +23 other tests crash
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adls-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * {igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c} (NEW):
    - bat-kbl-2:          NOTRUN -> [CRASH][24] +17 other tests crash
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-kbl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html
    - bat-arls-5:         NOTRUN -> [CRASH][25] +23 other tests crash
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html
    - bat-adlp-6:         NOTRUN -> [CRASH][26] +23 other tests crash
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html
    - bat-arlh-2:         NOTRUN -> [CRASH][27] +23 other tests crash
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arlh-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * {igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d} (NEW):
    - bat-adlp-9:         NOTRUN -> [CRASH][28] +23 other tests crash
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html

  * {igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a} (NEW):
    - bat-adlm-1:         NOTRUN -> [CRASH][29] +23 other tests crash
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlm-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
    - bat-rplp-1:         NOTRUN -> [CRASH][30] +23 other tests crash
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rplp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
    - fi-ilk-650:         NOTRUN -> [CRASH][31] +11 other tests crash
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-ilk-650/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * {igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b} (NEW):
    - bat-rpls-4:         NOTRUN -> [CRASH][32] +23 other tests crash
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rpls-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
    - fi-cfl-8109u:       NOTRUN -> [CRASH][33] +17 other tests crash
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-8109u/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
    - fi-kbl-7567u:       NOTRUN -> [CRASH][34] +17 other tests crash
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-7567u/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
    - bat-twl-1:          NOTRUN -> [CRASH][35] +17 other tests crash
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-twl-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
    - fi-elk-e7500:       NOTRUN -> [CRASH][36] +11 other tests crash
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-elk-e7500/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html

  * {igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c} (NEW):
    - bat-dg1-7:          NOTRUN -> [CRASH][37] +23 other tests crash
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg1-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * {igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a} (NEW):
    - fi-rkl-11600:       NOTRUN -> [CRASH][38] +17 other tests crash
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-rkl-11600/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html

  * {igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b} (NEW):
    - fi-glk-j4005:       NOTRUN -> [CRASH][39] +17 other tests crash
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-glk-j4005/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html
    - bat-twl-2:          NOTRUN -> [CRASH][40] +17 other tests crash
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-twl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * {igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [CRASH][41] +17 other tests crash
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-8700k/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][42] +35 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
    - bat-dg2-8:          NOTRUN -> [SKIP][43] +71 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d} (NEW):
    - bat-rpls-4:         NOTRUN -> [SKIP][44] +75 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][45] +56 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-rkl-11600/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][46] +85 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][47] +71 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d} (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][48] +85 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][49] +67 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adls-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * {igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][50] +35 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rplp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a.html

  * {igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a} (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][51] +58 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-jsl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * {igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][52] +71 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c.html
    - bat-twl-2:          NOTRUN -> [SKIP][53] +53 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-twl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c.html

  * {igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a} (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][54] +83 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a.html

  * {igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d} (NEW):
    - bat-arls-1:         NOTRUN -> [SKIP][55] +83 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15289 and IGTPW_11634:

### New IGT tests (180) ###

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 4.25] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:
    - Statuses : 10 pass(s) 23 skip(s)
    - Exec time: [0.0, 4.27] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - Statuses : 5 pass(s) 13 skip(s)
    - Exec time: [0.0, 1.93] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 2.43] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 4.26] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - Statuses : 10 pass(s) 23 skip(s)
    - Exec time: [0.0, 4.28] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - Statuses : 5 pass(s) 13 skip(s)
    - Exec time: [0.0, 2.02] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - Statuses : 34 crash(s) 1 skip(s)
    - Exec time: [0.00, 0.88] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b:
    - Statuses : 34 crash(s) 1 skip(s)
    - Exec time: [0.07, 4.40] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - Statuses : 32 crash(s) 1 skip(s)
    - Exec time: [0.07, 4.48] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - Statuses : 17 crash(s) 1 skip(s)
    - Exec time: [0.14, 2.03] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:
    - Statuses : 24 pass(s) 11 skip(s)
    - Exec time: [0.0, 1.69] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:
    - Statuses : 24 pass(s) 11 skip(s)
    - Exec time: [0.0, 1.68] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c:
    - Statuses : 22 pass(s) 11 skip(s)
    - Exec time: [0.0, 1.66] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:
    - Statuses : 10 pass(s) 8 skip(s)
    - Exec time: [0.0, 1.66] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - Statuses : 20 pass(s) 15 skip(s)
    - Exec time: [0.0, 3.86] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b:
    - Statuses : 20 pass(s) 15 skip(s)
    - Exec time: [0.0, 4.01] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - Statuses : 22 pass(s) 11 skip(s)
    - Exec time: [0.0, 1.30] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d:
    - Statuses : 10 pass(s) 8 skip(s)
    - Exec time: [0.0, 1.34] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - Statuses : 35 crash(s)
    - Exec time: [0.00, 0.03] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - Statuses : 35 crash(s)
    - Exec time: [0.07, 4.80] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - Statuses : 33 crash(s)
    - Exec time: [0.07, 4.21] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - Statuses : 18 crash(s)
    - Exec time: [0.13, 1.45] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 2.67] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 2.58] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 2.61] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.66] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 4.78] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 4.67] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 1.47] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.35] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - Statuses : 35 crash(s)
    - Exec time: [0.00, 2.52] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:
    - Statuses : 35 crash(s)
    - Exec time: [0.07, 4.67] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:
    - Statuses : 33 crash(s)
    - Exec time: [0.07, 4.44] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:
    - Statuses : 18 crash(s)
    - Exec time: [0.14, 1.45] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 1.49] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 2.57] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 2.57] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.68] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - Statuses : 2 dmesg-warn(s) 33 pass(s)
    - Exec time: [0.0, 4.04] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b:
    - Statuses : 3 dmesg-warn(s) 32 pass(s)
    - Exec time: [0.0, 4.58] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 1.41] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.34] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - Statuses : 34 crash(s) 1 skip(s)
    - Exec time: [0.00, 0.44] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - Statuses : 34 crash(s) 1 skip(s)
    - Exec time: [0.07, 4.59] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - Statuses : 32 crash(s) 1 skip(s)
    - Exec time: [0.07, 4.41] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:
    - Statuses : 17 crash(s) 1 skip(s)
    - Exec time: [0.13, 1.62] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-a:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 1.40] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 2.60] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 2.57] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.68] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - Statuses : 31 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.93] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - Statuses : 31 pass(s) 4 skip(s)
    - Exec time: [0.0, 4.05] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 1.48] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.34] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
    - Statuses : 23 pass(s) 12 skip(s)
    - Exec time: [0.0, 1.27] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - Statuses : 23 pass(s) 12 skip(s)
    - Exec time: [0.0, 1.69] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - Statuses : 21 pass(s) 12 skip(s)
    - Exec time: [0.0, 1.66] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:
    - Statuses : 14 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.52] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 1.13] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 2.12] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.66] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 3.50] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 3.60] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 1.42] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.34] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - Statuses : 34 crash(s) 1 skip(s)
    - Exec time: [0.00, 0.52] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
    - Statuses : 34 crash(s) 1 skip(s)
    - Exec time: [0.07, 4.33] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - Statuses : 32 crash(s) 1 skip(s)
    - Exec time: [0.07, 4.33] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - Statuses : 17 crash(s) 1 skip(s)
    - Exec time: [0.13, 1.49] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 1.14] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 2.18] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.66] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 3.35] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b:
    - Statuses : 35 pass(s)
    - Exec time: [0.0, 3.62] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-c:
    - Statuses : 33 pass(s)
    - Exec time: [0.0, 1.48] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 1.34] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
    - Statuses : 34 crash(s) 1 skip(s)
    - Exec time: [0.00, 0.43] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - Statuses : 34 crash(s) 1 skip(s)
    - Exec time: [0.08, 4.92] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - Statuses : 32 crash(s) 1 skip(s)
    - Exec time: [0.07, 4.46] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - Statuses : 17 crash(s) 1 skip(s)
    - Exec time: [0.13, 1.68] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - Statuses : 10 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - Statuses : 5 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c:
    - Statuses : 10 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - Statuses : 5 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - Statuses : 10 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - Statuses : 5 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c:
    - Statuses : 10 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - Statuses : 5 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.93] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.20] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:
    - Statuses : 14 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.04] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
    - Statuses : 7 pass(s) 11 skip(s)
    - Exec time: [0.0, 8.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.89] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.21] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:
    - Statuses : 14 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.23] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - Statuses : 7 pass(s) 11 skip(s)
    - Exec time: [0.0, 8.20] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.90] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.23] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:
    - Statuses : 14 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.23] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d:
    - Statuses : 7 pass(s) 11 skip(s)
    - Exec time: [0.0, 8.10] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.94] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.25] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - Statuses : 14 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d:
    - Statuses : 7 pass(s) 11 skip(s)
    - Exec time: [0.0, 8.25] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0, 15.81] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0, 14.57] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-c:
    - Statuses : 28 pass(s) 5 skip(s)
    - Exec time: [0.0, 14.75] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 14.72] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a:
    - Statuses : 29 pass(s) 6 skip(s)
    - Exec time: [0.0, 15.28] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-b:
    - Statuses : 29 pass(s) 6 skip(s)
    - Exec time: [0.0, 14.55] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-c:
    - Statuses : 27 pass(s) 6 skip(s)
    - Exec time: [0.0, 14.46] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:
    - Statuses : 17 pass(s) 1 skip(s)
    - Exec time: [0.0, 14.21] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:
    - Statuses : 29 pass(s) 6 skip(s)
    - Exec time: [0.0, 15.55] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
    - Statuses : 29 pass(s) 6 skip(s)
    - Exec time: [0.0, 14.50] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c:
    - Statuses : 27 pass(s) 6 skip(s)
    - Exec time: [0.0, 14.74] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - Statuses : 17 pass(s) 1 skip(s)
    - Exec time: [0.0, 14.49] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - Statuses : 25 pass(s) 10 skip(s)
    - Exec time: [0.0, 15.55] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - Statuses : 25 pass(s) 10 skip(s)
    - Exec time: [0.0, 14.44] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c:
    - Statuses : 23 pass(s) 10 skip(s)
    - Exec time: [0.0, 14.68] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d:
    - Statuses : 13 pass(s) 5 skip(s)
    - Exec time: [0.0, 15.04] s

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0, 15.89] s

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0, 14.60] s

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-c:
    - Statuses : 28 pass(s) 5 skip(s)
    - Exec time: [0.0, 14.54] s

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 14.60] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - Statuses : 10 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - Statuses : 5 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.94] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.11] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:
    - Statuses : 14 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.23] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:
    - Statuses : 7 pass(s) 11 skip(s)
    - Exec time: [0.0, 8.13] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0, 16.02] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0, 14.62] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:
    - Statuses : 28 pass(s) 5 skip(s)
    - Exec time: [0.0, 14.40] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:
    - Statuses : 18 pass(s)
    - Exec time: [0.0, 14.54] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:
    - Statuses : 10 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - Statuses : 5 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 9.06] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.15] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c:
    - Statuses : 14 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.22] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:
    - Statuses : 7 pass(s) 11 skip(s)
    - Exec time: [0.0, 8.08] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - Statuses : 25 pass(s) 10 skip(s)
    - Exec time: [0.0, 16.06] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
    - Statuses : 25 pass(s) 10 skip(s)
    - Exec time: [0.0, 14.38] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c:
    - Statuses : 23 pass(s) 10 skip(s)
    - Exec time: [0.0, 14.92] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - Statuses : 13 pass(s) 5 skip(s)
    - Exec time: [0.0, 14.60] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - Statuses : 29 pass(s) 6 skip(s)
    - Exec time: [0.0, 14.30] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:
    - Statuses : 29 pass(s) 6 skip(s)
    - Exec time: [0.0, 13.04] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-c:
    - Statuses : 27 pass(s) 6 skip(s)
    - Exec time: [0.0, 13.26] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:
    - Statuses : 17 pass(s) 1 skip(s)
    - Exec time: [0.0, 13.30] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - Statuses : 12 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - Statuses : 10 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - Statuses : 5 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.63] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:
    - Statuses : 16 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.25] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - Statuses : 14 pass(s) 19 skip(s)
    - Exec time: [0.0, 8.14] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d:
    - Statuses : 7 pass(s) 11 skip(s)
    - Exec time: [0.0, 8.22] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - Statuses : 25 pass(s) 10 skip(s)
    - Exec time: [0.0, 15.92] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - Statuses : 25 pass(s) 10 skip(s)
    - Exec time: [0.0, 14.71] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - Statuses : 23 pass(s) 10 skip(s)
    - Exec time: [0.0, 14.68] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:
    - Statuses : 13 pass(s) 5 skip(s)
    - Exec time: [0.0, 14.51] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:
    - Statuses : 29 pass(s) 6 skip(s)
    - Exec time: [0.0, 14.34] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:
    - Statuses : 29 pass(s) 6 skip(s)
    - Exec time: [0.0, 13.71] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-c:
    - Statuses : 27 pass(s) 6 skip(s)
    - Exec time: [0.0, 14.37] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - Statuses : 17 pass(s) 1 skip(s)
    - Exec time: [0.0, 14.52] s

  

Known issues
------------

  Here are the changes found in IGTPW_11634 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][56] +82 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-7567u/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][57] +82 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-8700k/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - fi-pnv-d510:        NOTRUN -> [SKIP][58] +44 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-pnv-d510/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * {igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][59] +82 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-guc/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][60] +31 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-8109u/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][61] +80 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-glk-j4005/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * {igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a} (NEW):
    - bat-apl-1:          NOTRUN -> [SKIP][62] +80 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-apl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7990 -> IGTPW_11634

  CI-20190529: 20190529
  CI_DRM_15289: f83dc30335e989657706c73484b78dd755f909b4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11634: 2d64d7a0063417b596e3e3d2d52ecffd875f7413 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/index.html

--===============9128604671456215741==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Update scaling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137769/">https://patchwork.freedesktop.org/series/137769/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15289 -&gt; IGTPW_11634</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (2): bat-dg1-7 fi-elk-e7500 <br />
  Missing    (3): bat-dg2-11 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11634:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a} (NEW):</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-twl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg1-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> +95 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a} (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-apl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html">CRASH</a> +17 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c} (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-jsl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">CRASH</a> +17 other tests crash</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-tgl-1115g4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> +83 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d} (NEW):</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html">CRASH</a> +23 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c} (NEW):</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-8809g/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">CRASH</a> +17 other tests crash</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-ivb-3770/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">CRASH</a> +17 other tests crash</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-14/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">CRASH</a> +23 other tests crash</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">CRASH</a> +23 other tests crash</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-guc/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">CRASH</a> +17 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-tgl-1115g4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">CRASH</a> +7 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-guc/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html">CRASH</a> +17 other tests crash</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-mtlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html">CRASH</a> +23 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a} (NEW):</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rpls-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-jsl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-rkl-11600/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">CRASH</a> +23 other tests crash</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-x1275/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">CRASH</a> +17 other tests crash</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">CRASH</a> +23 other tests crash</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">CRASH</a> +23 other tests crash</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-mtlp-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">CRASH</a> +23 other tests crash</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adls-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">CRASH</a> +23 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c} (NEW):</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-kbl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">CRASH</a> +17 other tests crash</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">CRASH</a> +23 other tests crash</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">CRASH</a> +23 other tests crash</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arlh-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">CRASH</a> +23 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html">CRASH</a> +23 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a} (NEW):</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlm-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">CRASH</a> +23 other tests crash</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rplp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">CRASH</a> +23 other tests crash</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-ilk-650/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">CRASH</a> +11 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b} (NEW):</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rpls-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">CRASH</a> +23 other tests crash</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-8109u/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">CRASH</a> +17 other tests crash</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-7567u/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">CRASH</a> +17 other tests crash</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-twl-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">CRASH</a> +17 other tests crash</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-elk-e7500/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">CRASH</a> +11 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg1-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html">CRASH</a> +23 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-rkl-11600/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html">CRASH</a> +17 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-glk-j4005/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html">CRASH</a> +17 other tests crash</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-twl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html">CRASH</a> +17 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-8700k/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">CRASH</a> +17 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> +35 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d} (NEW):</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rpls-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> +75 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-rkl-11600/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> +56 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">SKIP</a> +85 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d} (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html">SKIP</a> +85 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adls-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">SKIP</a> +67 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-rplp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a} (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-jsl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> +58 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c.html">SKIP</a> +71 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-twl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a} (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a.html">SKIP</a> +83 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d} (NEW):</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-arls-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> +83 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15289 and IGTPW_11634:</p>
<h3>New IGT tests (180)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 10 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 5 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 10 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 5 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 34 crash(s) 1 skip(s)</li>
<li>Exec time: [0.00, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 34 crash(s) 1 skip(s)</li>
<li>Exec time: [0.07, 4.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 32 crash(s) 1 skip(s)</li>
<li>Exec time: [0.07, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 17 crash(s) 1 skip(s)</li>
<li>Exec time: [0.14, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 24 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 24 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 22 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 10 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 20 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 20 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 22 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 10 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 35 crash(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 35 crash(s)</li>
<li>Exec time: [0.07, 4.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 33 crash(s)</li>
<li>Exec time: [0.07, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 18 crash(s)</li>
<li>Exec time: [0.13, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 4.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 35 crash(s)</li>
<li>Exec time: [0.00, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 35 crash(s)</li>
<li>Exec time: [0.07, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 33 crash(s)</li>
<li>Exec time: [0.07, 4.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 18 crash(s)</li>
<li>Exec time: [0.14, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 33 pass(s)</li>
<li>Exec time: [0.0, 4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 3 dmesg-warn(s) 32 pass(s)</li>
<li>Exec time: [0.0, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 34 crash(s) 1 skip(s)</li>
<li>Exec time: [0.00, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 34 crash(s) 1 skip(s)</li>
<li>Exec time: [0.07, 4.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 32 crash(s) 1 skip(s)</li>
<li>Exec time: [0.07, 4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 17 crash(s) 1 skip(s)</li>
<li>Exec time: [0.13, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:</p>
<ul>
<li>Statuses : 31 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:</p>
<ul>
<li>Statuses : 31 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:</p>
<ul>
<li>Statuses : 23 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>Statuses : 23 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:</p>
<ul>
<li>Statuses : 21 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:</p>
<ul>
<li>Statuses : 14 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 34 crash(s) 1 skip(s)</li>
<li>Exec time: [0.00, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 34 crash(s) 1 skip(s)</li>
<li>Exec time: [0.07, 4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 32 crash(s) 1 skip(s)</li>
<li>Exec time: [0.07, 4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 17 crash(s) 1 skip(s)</li>
<li>Exec time: [0.13, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0, 3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 34 crash(s) 1 skip(s)</li>
<li>Exec time: [0.00, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 34 crash(s) 1 skip(s)</li>
<li>Exec time: [0.08, 4.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 32 crash(s) 1 skip(s)</li>
<li>Exec time: [0.07, 4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 17 crash(s) 1 skip(s)</li>
<li>Exec time: [0.13, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:</p>
<ul>
<li>Statuses : 10 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>Statuses : 5 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c:</p>
<ul>
<li>Statuses : 10 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>Statuses : 5 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 10 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 5 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 10 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 5 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:</p>
<ul>
<li>Statuses : 14 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 8.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:</p>
<ul>
<li>Statuses : 14 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 8.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 14 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>Statuses : 14 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 8.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a:</p>
<ul>
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 15.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:</p>
<ul>
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 14.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-c:</p>
<ul>
<li>Statuses : 28 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 14.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 14.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a:</p>
<ul>
<li>Statuses : 29 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 15.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-b:</p>
<ul>
<li>Statuses : 29 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 14.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-c:</p>
<ul>
<li>Statuses : 27 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 14.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:</p>
<ul>
<li>Statuses : 17 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 14.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 29 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 15.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 29 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 14.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 27 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 14.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 17 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 14.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>Statuses : 25 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 15.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>Statuses : 25 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 14.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>Statuses : 23 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 14.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>Statuses : 13 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 15.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:</p>
<ul>
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 15.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 14.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-c:</p>
<ul>
<li>Statuses : 28 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 14.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 14.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 10 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 5 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>Statuses : 14 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 8.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 16.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 14.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>Statuses : 28 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 14.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0, 14.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 10 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 5 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 9.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>Statuses : 14 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 8.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>Statuses : 25 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 16.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>Statuses : 25 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 14.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>Statuses : 23 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 14.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>Statuses : 13 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 14.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>Statuses : 29 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 14.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:</p>
<ul>
<li>Statuses : 29 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 13.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-c:</p>
<ul>
<li>Statuses : 27 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 13.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:</p>
<ul>
<li>Statuses : 17 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 13.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 12 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 10 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 5 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>Statuses : 16 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>Statuses : 14 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 8.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 8.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>Statuses : 25 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 15.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>Statuses : 25 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 14.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>Statuses : 23 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 14.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>Statuses : 13 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 14.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 29 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 14.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 29 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 13.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 27 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 14.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 17 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 14.52] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11634 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-kbl-7567u/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> +82 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-8700k/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> +82 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-pnv-d510/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-guc/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html">SKIP</a> +82 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-cfl-8109u/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/fi-glk-j4005/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> +80 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a} (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11634/bat-apl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html">SKIP</a> +80 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7990 -&gt; IGTPW_11634</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15289: f83dc30335e989657706c73484b78dd755f909b4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11634: 2d64d7a0063417b596e3e3d2d52ecffd875f7413 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============9128604671456215741==--
