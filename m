Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3288383300264711532=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Feb 2022 21:59:21 -0000
Message-ID: <164496236102.15374.4101126348629008584@emeril.freedesktop.org>
References: <20220215122344.11168-1-swati2.sharma@intel.com>
In-Reply-To: <20220215122344.11168-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkaXRp?=
 =?utf-8?q?on_of_new_plane_scaling_test_cases_=28rev6=29?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3288383300264711532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Addition of new plane scaling test cases (rev6)
URL   : https://patchwork.freedesktop.org/series/98333/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11229_full -> IGTPW_6623_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6623_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6623_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6623_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-suspend:
    - shard-iclb:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-iclb6/igt@gem_eio@in-flight-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb4/igt@gem_eio@in-flight-suspend.html

  * {igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-snb6/igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling.html

  * {igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-dp-1-planes-downscaling-downscaling} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl7/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-dp-1-planes-downscaling-downscaling.html

  * {igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-edp-1-planes-downscaling-downscaling} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb8/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-edp-1-planes-downscaling-downscaling.html

  * {igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-1-planes-downscaling-downscaling} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][6] +5 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk3/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-1-planes-downscaling-downscaling.html

  * {igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-dp-1-planes-downscaling-downscaling} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl4/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-dp-1-planes-downscaling-downscaling.html

  * {igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-edp-1-planes-downscaling-downscaling} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][8] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb3/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-edp-1-planes-downscaling-downscaling.html

  * {igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-1-planes-downscaling-downscaling} (NEW):
    - {shard-tglu}:       NOTRUN -> [FAIL][9] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglu-1/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-1-planes-downscaling-downscaling.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11229_full and IGTPW_6623_full:

### New IGT tests (104) ###

  * igt@kms_plane_scaling@invalid-num-scalers:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-dp-1-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.13] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-vga-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-dp-1-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-vga-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-1-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.09] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@plane-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-dp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.88, 1.47] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-edp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.64, 3.93] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-hdmi-a-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-vga-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-dp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.75, 1.23] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-edp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.46, 3.73] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-hdmi-a-2-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-vga-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-c-dp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.88] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-c-edp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.72, 4.12] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-c-hdmi-a-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-d-edp-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [4.20] s

  * igt@kms_plane_scaling@plane-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-dp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.59] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-edp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.56, 2.34] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-hdmi-a-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-vga-1-upscaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.34] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-dp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.75] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-edp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [2.68, 3.47] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-hdmi-a-2-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-c-dp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.57] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-c-edp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [2.68, 3.45] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-c-hdmi-a-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-d-edp-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-dp-1-planes-downscaling-downscaling:
    - Statuses : 2 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-edp-1-planes-downscaling-downscaling:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-1-planes-downscaling-downscaling:
    - Statuses : 2 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-2-planes-downscaling-downscaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-vga-1-planes-downscaling-downscaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-dp-1-planes-downscaling-downscaling:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-edp-1-planes-downscaling-downscaling:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-1-planes-downscaling-downscaling:
    - Statuses : 2 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-2-planes-downscaling-downscaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-vga-1-planes-downscaling-downscaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-dp-1-planes-downscaling-downscaling:
    - Statuses : 2 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-edp-1-planes-downscaling-downscaling:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-hdmi-a-1-planes-downscaling-downscaling:
    - Statuses : 2 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-hdmi-a-2-planes-downscaling-downscaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-d-edp-1-planes-downscaling-downscaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-d-hdmi-a-1-planes-downscaling-downscaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-dp-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-hdmi-a-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-vga-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-dp-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-hdmi-a-2-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-vga-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-dp-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-hdmi-a-1-planes-upscaling-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [30.23, 35.12] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [15.45] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [4.23] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [36.64, 39.07] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [15.07] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-dp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [1.91, 2.32] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-edp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-dp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-edp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [8.66] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [4.16] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-vga-1-scaler-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-dp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [2.68] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-edp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [9.78] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-2-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [4.80] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-vga-1-scaler-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-dp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-edp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [9.81] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-dp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [7.83] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-hdmi-a-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.21] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-vga-1-scaler-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-dp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [8.35] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-hdmi-a-2-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-vga-1-scaler-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-dp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [8.21] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-hdmi-a-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  

Known issues
------------

  Here are the changes found in IGTPW_6623_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][10] -> [TIMEOUT][11] ([i915#3063])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb6/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-iclb:         [PASS][12] -> [TIMEOUT][13] ([i915#3070])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-iclb5/igt@gem_eio@in-flight-contexts-immediate.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb3/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][14] ([i915#5076])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][15] ([i915#2846])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][19] ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#2842]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_parallel@engines@fds:
    - shard-iclb:         [PASS][26] -> [INCOMPLETE][27] ([i915#1895])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-iclb6/igt@gem_exec_parallel@engines@fds.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb4/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109283])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@gem_exec_params@no-blt.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl6/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk4/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl8/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#4613])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#4613])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-glk:          [PASS][34] -> [DMESG-WARN][35] ([i915#118])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-glk1/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk7/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#4270])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@input-checking:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][39] ([i915#4990])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb7/igt@gem_userptr_blits@input-checking.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][40] ([i915#4990])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl1/igt@gem_userptr_blits@input-checking.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][41] ([i915#4990])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk5/igt@gem_userptr_blits@input-checking.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][42] ([i915#4990])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb2/igt@gem_userptr_blits@input-checking.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][43] ([i915#4990])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl4/igt@gem_userptr_blits@input-checking.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][44] ([i915#4990])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-snb4/igt@gem_userptr_blits@input-checking.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#2856])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#2527] / [i915#2856]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb6/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][47] ([i915#454])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#4281])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109506] / [i915#2411])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271]) +47 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-snb6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111614]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3777]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3777]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#3777]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110723])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3689] / [i915#3886]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3886]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3886]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [i915#3886]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#3689]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3886]) +10 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111615] / [i915#3689]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl4/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/index.html

--===============3288383300264711532==
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
<tr><td><b>Series:</b></td><td>Addition of new plane scaling test cases (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98333/">https://patchwork.freedesktop.org/series/98333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11229_full -&gt; IGTPW_6623_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6623_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6623_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6623_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-iclb6/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb4/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-snb6/igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-dp-1-planes-downscaling-downscaling} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl7/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-dp-1-planes-downscaling-downscaling.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-edp-1-planes-downscaling-downscaling} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb8/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-edp-1-planes-downscaling-downscaling.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-1-planes-downscaling-downscaling} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk3/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-1-planes-downscaling-downscaling.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-dp-1-planes-downscaling-downscaling} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl4/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-dp-1-planes-downscaling-downscaling.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-edp-1-planes-downscaling-downscaling} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb3/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-edp-1-planes-downscaling-downscaling.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-1-planes-downscaling-downscaling} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglu-1/igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-1-planes-downscaling-downscaling.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11229_full and IGTPW_6623_full:</p>
<h3>New IGT tests (104)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-dp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-vga-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-dp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-vga-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-dp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.88, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-edp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.64, 3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-hdmi-a-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-vga-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-dp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.75, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-edp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.46, 3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-hdmi-a-2-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-vga-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-c-dp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-c-edp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.72, 4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-c-hdmi-a-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-d-edp-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-dp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-edp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.56, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-hdmi-a-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-vga-1-upscaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-dp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-edp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.68, 3.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-hdmi-a-2-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-c-dp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-c-edp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.68, 3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-c-hdmi-a-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-d-edp-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-dp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-edp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-2-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-vga-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-dp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-edp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-2-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-vga-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-dp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-edp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-hdmi-a-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-hdmi-a-2-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-d-edp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-d-hdmi-a-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-dp-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-hdmi-a-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-vga-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-dp-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-hdmi-a-2-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-vga-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-dp-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-hdmi-a-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [30.23, 35.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-vga-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [36.64, 39.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-vga-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-dp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.91, 2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-dp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-hdmi-a-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-vga-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-dp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-2-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-vga-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-dp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-hdmi-a-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-a-dp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-a-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-a-hdmi-a-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-a-vga-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-dp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-hdmi-a-2-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-vga-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-dp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-hdmi-a-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6623_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb6/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-iclb5/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb3/igt@gem_eio@in-flight-contexts-immediate.html">TIMEOUT</a> ([i915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-iclb6/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb4/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl6/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl8/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> ([i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-glk1/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk7/igt@gem_partial_pwrite_pread@writes-after-reads.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11229/shard-apl6/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl3/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb7/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4990])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4990])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk5/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4990])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb2/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4990])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl4/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4990])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-snb4/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4990])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb1/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb3/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-snb6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +47 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-glk5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-iclb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6623/shard-apl4/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-</p>
</li>
</ul>

</body>
</html>

--===============3288383300264711532==--
