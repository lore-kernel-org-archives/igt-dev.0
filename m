Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6922353448787551530=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 08 Feb 2022 23:50:11 -0000
Message-ID: <164436421103.22537.8783603591008693544@emeril.freedesktop.org>
References: <20220208055039.31306-1-swati2.sharma@intel.com>
In-Reply-To: <20220208055039.31306-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkaXRp?=
 =?utf-8?q?on_of_new_plane_scaling_test_cases_=28rev5=29?=
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

--===============6922353448787551530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Addition of new plane scaling test cases (rev5)
URL   : https://patchwork.freedesktop.org/series/98333/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11205_full -> IGTPW_6606_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6606_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6606_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/index.html

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6606_full:

### IGT changes ###

#### Possible regressions ####

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - shard-apl:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-apl7/igt@syncobj_timeline@invalid-transfer-non-existent-point.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11205_full and IGTPW_6606_full:

### New IGT tests (131) ###

  * igt@kms_plane_scaling@invalid-num-scalers:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-dp-1-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-vga-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-dp-1-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-vga-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-1-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@plane-down-down-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-dp-1-plane-down-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.37] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-edp-1-plane-down-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.54] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-hdmi-a-1-plane-down-down-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-hdmi-a-2-plane-down-down-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-vga-1-plane-down-down-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-dp-1-plane-down-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.31] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-edp-1-plane-down-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.53] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-hdmi-a-1-plane-down-down-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-hdmi-a-2-plane-down-down-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-vga-1-plane-down-down-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-c-dp-1-plane-down-down-scaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-c-edp-1-plane-down-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.47] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-c-hdmi-a-1-plane-down-down-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-c-hdmi-a-2-plane-down-down-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-down-down-scaling@pipe-d-edp-1-plane-down-down-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-dp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 1.25] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-edp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.63, 3.77] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-hdmi-a-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.89, 1.92] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-vga-1-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-dp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.73, 1.30] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-edp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.48, 3.88] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-hdmi-a-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-hdmi-a-2-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-vga-1-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-c-dp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.89] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-c-edp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.42, 3.96] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-c-hdmi-a-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.76, 1.78] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-d-edp-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-d-hdmi-a-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_plane_scaling@plane-up-down-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-dp-1-plane-up-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-edp-1-plane-up-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.40, 1.48] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-hdmi-a-1-plane-up-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.39] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-hdmi-a-2-plane-up-down-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-vga-1-plane-up-down-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-dp-1-plane-up-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.27] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-edp-1-plane-up-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.47] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-hdmi-a-1-plane-up-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.35] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-hdmi-a-2-plane-up-down-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-vga-1-plane-up-down-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-c-dp-1-plane-up-down-scaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-c-edp-1-plane-up-down-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.48] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-c-hdmi-a-1-plane-up-down-scaling:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-c-hdmi-a-2-plane-up-down-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-d-edp-1-plane-up-down-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-up-down-scaling@pipe-d-hdmi-a-1-plane-up-down-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@plane-up-up-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-a-dp-1-plane-up-up-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.13] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-a-edp-1-plane-up-up-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.28] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-a-hdmi-a-1-plane-up-up-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-a-vga-1-plane-up-up-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-b-dp-1-plane-up-up-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.23] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-b-edp-1-plane-up-up-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.38] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-b-hdmi-a-2-plane-up-up-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-b-vga-1-plane-up-up-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-c-dp-1-plane-up-up-scaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-c-edp-1-plane-up-up-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.41] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-c-hdmi-a-1-plane-up-up-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-up-up-scaling@pipe-d-edp-1-plane-up-up-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-dp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.57] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-edp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.56, 2.33] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-hdmi-a-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.02, 1.17] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-vga-1-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-dp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.68] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-edp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [2.89, 3.44] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-hdmi-a-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-hdmi-a-2-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-c-dp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.52] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-c-edp-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.32, 3.44] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-c-hdmi-a-1-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.10, 1.22] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-d-edp-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-d-hdmi-a-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [3.95, 10.99] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [30.46, 35.20] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [15.61, 24.65] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [4.08, 11.43] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [32.33, 36.77] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [25.15] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [15.54] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-dp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.69] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [1.76, 2.33] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 1.20] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-edp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-dp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [1.58, 2.48] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-edp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [4.62, 8.66] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [3.49, 4.19] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-vga-1-scaler-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-dp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [1.75, 2.73] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-edp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [5.85, 9.78] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [4.17] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-2-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [5.03] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-vga-1-scaler-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-dp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [1.49, 1.85] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-edp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [5.92, 9.80] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [4.11, 4.72] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-edp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [5.82] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [4.09] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-dp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [6.94] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-hdmi-a-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.21] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-vga-1-scaler-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-dp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [8.10] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-hdmi-a-2-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [5.24] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-vga-1-scaler-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-dp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [8.20] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-hdmi-a-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [5.32] s

  

Known issues
------------

  Here are the changes found in IGTPW_6606_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([fdo#109314])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb8/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-snb6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [FAIL][4] ([i915#232])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb1/igt@gem_eio@unwedge-stress.html
    - shard-snb:          NOTRUN -> [FAIL][5] ([i915#3354])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-snb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([i915#4525])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][8] ([i915#5076])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-kbl1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#2842]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2842]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#2842]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-apl8/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-kbl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4613]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk2/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#4613]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#4613]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4270]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb3/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#4270]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#768]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#109312]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#3297])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#3297]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          NOTRUN -> [DMESG-WARN][29] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-apl1/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#2856]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb7/igt@gen9_exec_parse@allowed-all.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#2527] / [i915#2856]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb6/igt@gen9_exec_parse@allowed-all.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][32] ([i915#1436] / [i915#716])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#1902])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb2/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109293] / [fdo#109506])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb3/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109506] / [i915#2411])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb2/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#404])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#1769])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#1769])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111614]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][40] -> [DMESG-WARN][41] ([i915#118])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3777])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3777]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615]) +11 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3777]) +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#110723]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689] / [i915#3886]) +7 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/index.html

--===============6922353448787551530==
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
<tr><td><b>Series:</b></td><td>Addition of new plane scaling test cases (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98333/">https://patchwork.freedesktop.org/series/98333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11205_full -&gt; IGTPW_6606_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6606_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6606_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/index.html</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6606_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@syncobj_timeline@invalid-transfer-non-existent-point:<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-apl7/igt@syncobj_timeline@invalid-transfer-non-existent-point.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11205_full and IGTPW_6606_full:</p>
<h3>New IGT tests (131)</h3>
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
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
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
<li>Exec time: [0.0, 0.00] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
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
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
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
<p>igt@kms_plane_scaling@plane-down-down-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-dp-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-edp-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-hdmi-a-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-hdmi-a-2-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-a-vga-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-dp-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-edp-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-hdmi-a-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-hdmi-a-2-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-b-vga-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-c-dp-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-c-edp-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-c-hdmi-a-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-c-hdmi-a-2-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-down-down-scaling@pipe-d-edp-1-plane-down-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
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
<li>Exec time: [0.64, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-edp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.63, 3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-hdmi-a-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.89, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-vga-1-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-dp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.73, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-edp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.48, 3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-hdmi-a-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-hdmi-a-2-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-vga-1-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-c-dp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-c-edp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.42, 3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-c-hdmi-a-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.76, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-d-edp-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-d-hdmi-a-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-dp-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-edp-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.40, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-hdmi-a-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-hdmi-a-2-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-a-vga-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-dp-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-edp-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-hdmi-a-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-hdmi-a-2-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-b-vga-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-c-dp-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-c-edp-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-c-hdmi-a-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-c-hdmi-a-2-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-d-edp-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-down-scaling@pipe-d-hdmi-a-1-plane-up-down-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-a-dp-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-a-edp-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-a-hdmi-a-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-a-vga-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-b-dp-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-b-edp-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-b-hdmi-a-2-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-b-vga-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-c-dp-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-c-edp-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-c-hdmi-a-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-up-up-scaling@pipe-d-edp-1-plane-up-up-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
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
<li>Exec time: [0.42, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-edp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.56, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-hdmi-a-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.02, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-vga-1-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-dp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-edp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.89, 3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-hdmi-a-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-hdmi-a-2-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-c-dp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-c-edp-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.32, 3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-c-hdmi-a-1-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.10, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-d-edp-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-d-hdmi-a-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.95, 10.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [30.46, 35.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [15.61, 24.65] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.08, 11.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [32.33, 36.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [25.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.54] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.76, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-dp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.58, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.62, 8.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-hdmi-a-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.49, 4.19] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.75, 2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.85, 9.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-2-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.03] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.49, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.92, 9.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-hdmi-a-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.11, 4.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-hdmi-a-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.09] s</li>
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
<li>Exec time: [6.94] s</li>
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
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-hdmi-a-2-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.24] s</li>
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
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-hdmi-a-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.32] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6606_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb8/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-snb6/igt@gem_ctx_persistence@hostile.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb1/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#232])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-snb4/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-kbl1/igt@gem_exec_balancer@parallel-keep-in-fence.html">DMESG-WARN</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-apl8/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk2/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb3/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb5/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb1/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-apl1/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb7/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527] / [i915#2856]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk4/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb2/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb3/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb2/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11205/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-glk3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#110723]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6606/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:</p>
</li>
</ul>

</body>
</html>

--===============6922353448787551530==--
