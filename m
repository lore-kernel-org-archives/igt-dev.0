Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64CEEE01EF
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 23:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6685710E934;
	Tue, 10 Sep 2024 23:03:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E6A10E933;
 Tue, 10 Sep 2024 23:03:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5615272962270938559=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/kms=5Fplane=5Fscaling=3A?=
 =?utf-8?q?_Update_scaling_functions_to_retry_on_valid_outputs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Sep 2024 23:03:43 -0000
Message-ID: <172600942366.982707.7370447845612067730@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905145038.1569226-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240905145038.1569226-1-ramanaidu.naladala@intel.com>
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

--===============5615272962270938559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Update scaling functions to retry on valid outputs (rev3)
URL   : https://patchwork.freedesktop.org/series/137770/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8012_BAT -> XEIGTPW_11714_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11714_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11714_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11714_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] +59 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d (NEW):
    - bat-bmg-1:          NOTRUN -> [SKIP][2] +114 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][3] +29 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][4] +134 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d (NEW):
    - {bat-bmg-2}:        NOTRUN -> [SKIP][5] +179 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a (NEW):
    - bat-lnl-1:          NOTRUN -> [SKIP][6] +93 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  
New tests
---------

  New tests have been introduced between XEIGT_8012_BAT and XEIGTPW_11714_BAT:

### New IGT tests (180) ###

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.39] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.18] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.63] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.35] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.34] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.37] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.39] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.48] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.46] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.42] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.52] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.94] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.88] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 5.22] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.21] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.47] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.50] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.57] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.72] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.49] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.69] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.82] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.91] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.41] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.42] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.51] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.33] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.71] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.50] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.77] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.76] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.56] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.19] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.37] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.44] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.39] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.73] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.13] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.46] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.93] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.90] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.77] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.95] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.38] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.39] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.67] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.34] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.50] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.25] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.78] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - Statuses : 1 dmesg-warn(s) 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.66] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.89] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.40] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.38] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.31] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.46] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.65] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.67] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.78] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.67] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.69] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.74] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.79] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.73] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.82] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.62] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.66] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.89] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 7.00] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.95] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.00] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.79] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 7.00] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.90] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.99] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.86] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.97] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.99] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.91] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.46] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.32] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.30] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.25] s

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.89] s

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.93] s

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.96] s

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.97] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.86] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.67] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.66] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.96] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 7.02] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 7.05] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.96] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.79] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.82] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.69] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.64] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.50] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.30] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.27] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.32] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.80] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.83] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.98] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.94] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.87] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.64] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.61] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.43] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.31] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.33] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.33] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.76] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 7.00] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-c:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.93] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.03] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11714_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] ([Intel XE#455]) +39 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - bat-adlp-vf:        NOTRUN -> [SKIP][8] ([Intel XE#2463]) +44 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-adlp-vf/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - bat-atsm-2:         NOTRUN -> [SKIP][9] ([Intel XE#1024]) +44 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - bat-bmg-1:          NOTRUN -> [DMESG-WARN][10] ([Intel XE#877]) +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - bat-lnl-2:          NOTRUN -> [SKIP][11] ([Intel XE#2381]) +44 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][12] ([Intel XE#455]) +19 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2381
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8012 -> IGTPW_11714
  * Linux: xe-1922-32d724d6d6e82bb808ee6a1c5df1225b83c5ac1c -> xe-1923-316c4e099d22c5fee11e0c141c885cc890ae99a5

  IGTPW_11714: 4eabdb360a2620df213b3a652a2a59e593f60ee5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8012: 8012
  xe-1922-32d724d6d6e82bb808ee6a1c5df1225b83c5ac1c: 32d724d6d6e82bb808ee6a1c5df1225b83c5ac1c
  xe-1923-316c4e099d22c5fee11e0c141c885cc890ae99a5: 316c4e099d22c5fee11e0c141c885cc890ae99a5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/index.html

--===============5615272962270938559==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Update scaling functions to retry on valid outputs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137770/">https://patchwork.freedesktop.org/series/137770/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8012_BAT -&gt; XEIGTPW_11714_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11714_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11714_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11714_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d (NEW):</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">SKIP</a> +134 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d (NEW):</p>
<ul>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">SKIP</a> +179 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a (NEW):</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> +93 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8012_BAT and XEIGTPW_11714_BAT:</p>
<h3>New IGT tests (180)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 7.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 7.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 7.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 7.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 7.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11714_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-adlp-vf/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2381">Intel XE#2381</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11714/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8012 -&gt; IGTPW_11714</li>
<li>Linux: xe-1922-32d724d6d6e82bb808ee6a1c5df1225b83c5ac1c -&gt; xe-1923-316c4e099d22c5fee11e0c141c885cc890ae99a5</li>
</ul>
<p>IGTPW_11714: 4eabdb360a2620df213b3a652a2a59e593f60ee5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8012: 8012<br />
  xe-1922-32d724d6d6e82bb808ee6a1c5df1225b83c5ac1c: 32d724d6d6e82bb808ee6a1c5df1225b83c5ac1c<br />
  xe-1923-316c4e099d22c5fee11e0c141c885cc890ae99a5: 316c4e099d22c5fee11e0c141c885cc890ae99a5</p>

</body>
</html>

--===============5615272962270938559==--
