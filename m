Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0464495579465928183=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Fri, 25 Feb 2022 00:36:45 -0000
Message-ID: <164574940581.6269.5521068556174990354@emeril.freedesktop.org>
References: <20220224101224.12319-1-swati2.sharma@intel.com>
In-Reply-To: <20220224101224.12319-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkaXRp?=
 =?utf-8?q?on_of_new_plane_scaling_test_cases_=28rev8=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0464495579465928183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Addition of new plane scaling test cases (rev8)
URL   : https://patchwork.freedesktop.org/series/98333/
State : success

== Summary ==

CI Bug Log - changes from IGT_6356_full -> IGTPW_6698_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6698_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-edp-1-planes-downscale} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +23 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-iclb6/igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-edp-1-planes-downscale.html

  * {igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-apl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping.html

  * {igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-glk3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping.html

  * {igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-edp-1-upscale-with-rotation} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +23 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-tglb2/igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-edp-1-upscale-with-rotation.html

  * {igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-hdmi-a-1-upscale-with-rotation} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][5] +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-tglu-1/igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-hdmi-a-1-upscale-with-rotation.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - {shard-tglu}:       [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6356/shard-tglu-6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-tglu-8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
New tests
---------

  New tests have been introduced between IGT_6356_full and IGTPW_6698_full:

### New IGT tests (255) ###

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-dp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [4.08, 10.97] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-edp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [30.39, 35.61] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [15.17] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-vga-1-downscale-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-dp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [4.28, 11.29] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-edp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [33.39, 37.51] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-hdmi-a-2-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [15.64] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-vga-1-downscale-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-c-dp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [3.68, 7.67] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-c-edp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [33.77, 37.54] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-c-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [15.82] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-d-edp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [33.87] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-dp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 10.95] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-edp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [30.38, 35.61] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [15.26, 24.59] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-vga-1-downscale-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-dp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [4.28, 11.30] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-edp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [33.75, 37.73] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [25.32] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-hdmi-a-2-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [15.52] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-vga-1-downscale-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-c-dp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [3.64, 7.63] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-c-edp-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [34.07, 37.58] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-c-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [15.28, 25.47] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-d-edp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [33.99] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-d-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [25.34] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-dp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.51, 0.78] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-edp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [1.08] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-hdmi-a-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.82, 1.20] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-vga-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-dp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.68, 0.97] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-edp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [2.14, 2.17] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.83] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-hdmi-a-2-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-vga-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-c-dp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.60, 0.98] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-c-edp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [2.18, 2.19] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-c-hdmi-a-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.82, 1.17] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-d-edp-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-d-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.84] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-dp-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.79] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-edp-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [1.03] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [1.16] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-vga-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-dp-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.96] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-edp-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-hdmi-a-2-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [1.18] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-vga-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-dp-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.99] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-edp-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [1.25] s

  * igt@kms_plane_scaling@invalid-num-scalers:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-dp-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-vga-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-dp-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-vga-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-2:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-a-dp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-a-edp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-a-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-a-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-b-dp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-b-edp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-b-hdmi-a-2-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-b-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-c-dp-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-c-edp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@planes-downscale-factor-2@pipe-c-hdmi-a-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@planes-downscale-factor-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-dp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.14, 0.37] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-edp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.14, 0.21] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-hdmi-a-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.23] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-b-dp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.14] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-b-edp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-b-hdmi-a-2-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-b-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-c-dp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.14] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-c-edp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-c-hdmi-a-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_plane_scaling@planes-downscale-factor-4@pipe-d-edp-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.17] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-a-edp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.14] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-b-edp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.13] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-c-edp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-d-edp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-a-edp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.34] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-b-edp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-c-edp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-d-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-a-edp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.08] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-b-edp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.08] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-c-edp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a-dp-1-planes-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.16] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a-edp-1-planes-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.16] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a-hdmi-a-1-planes-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.34] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a-vga-1-planes-upscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-dp-1-planes-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.28] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-edp-1-planes-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.29] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-hdmi-a-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-hdmi-a-2-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-vga-1-planes-upscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-dp-1-planes-upscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.06] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-edp-1-planes-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 1.28] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-hdmi-a-1-planes-upscale:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.06, 0.10] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-edp-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-hdmi-a-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-upscale-factor-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.14] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-a-edp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.06] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.09] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-b-edp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.05] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.08] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-c-edp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.05] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-d-edp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-upscale-factor-4@pipe-a-edp-1-planes-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_plane_scaling@planes-upscale-factor-4@pipe-a-hdmi-a-1-planes-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.33] s

  * igt@kms_plane_scaling@planes-upscale-factor-4@pipe-a-vga-1-planes-upscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-upscale-factor-4@pipe-b-edp-1-planes-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.24, 1.29] s

  * igt@kms_plane_scaling@planes-upscale-factor-4@pipe-b-hdmi-a-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_plane_scaling@planes-upscale-factor-4@pipe-b-hdmi-a-2-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_plane_scaling@planes-upscale-factor-4@p

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/index.html

--===============0464495579465928183==
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
<tr><td><b>Series:</b></td><td>Addition of new plane scaling test cases (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98333/">https://patchwork.freedesktop.org/series/98333/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6356_full -&gt; IGTPW_6698_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6698_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-edp-1-planes-downscale} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-iclb6/igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-edp-1-planes-downscale.html">SKIP</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-apl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-glk3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-edp-1-upscale-with-rotation} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-tglb2/igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-edp-1-upscale-with-rotation.html">SKIP</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-hdmi-a-1-upscale-with-rotation} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-tglu-1/igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-hdmi-a-1-upscale-with-rotation.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_vblank@pipe-b-ts-continuation-suspend:<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6356/shard-tglu-6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6698/shard-tglu-8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6356_full and IGTPW_6698_full:</p>
<h3>New IGT tests (255)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.08, 10.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [30.39, 35.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-vga-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.28, 11.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [33.39, 37.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-hdmi-a-2-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-vga-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-c-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.68, 7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-c-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [33.77, 37.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-c-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-d-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 10.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [30.38, 35.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [15.26, 24.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-vga-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.28, 11.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [33.75, 37.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [25.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-hdmi-a-2-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-vga-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-c-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.64, 7.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-c-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [34.07, 37.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-c-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [15.28, 25.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-d-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-d-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [25.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.51, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.82, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-vga-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.68, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.14, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-hdmi-a-2-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-vga-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-c-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.60, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-c-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.18, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-c-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.82, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-d-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-d-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-vga-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-hdmi-a-2-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-vga-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
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
<li>Statuses : 1 skip(s)</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
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
<li>Statuses : 1 skip(s)</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
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
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-a-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-a-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-a-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-a-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-b-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-b-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-b-hdmi-a-2-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-b-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-c-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-c-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-2@pipe-c-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.14, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.14, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-a-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-b-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-b-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-b-hdmi-a-2-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-b-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-c-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-c-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-c-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-4@pipe-d-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-2@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-c-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-4@pipe-d-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-c-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-2@pipe-d-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-c-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-4@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a-dp-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a-edp-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a-hdmi-a-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a-vga-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-dp-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-edp-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-hdmi-a-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-hdmi-a-2-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-vga-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-dp-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-edp-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-hdmi-a-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-edp-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-hdmi-a-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-2@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-c-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4-downscale-factor-4@pipe-d-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4@pipe-a-edp-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4@pipe-a-hdmi-a-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4@pipe-a-vga-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4@pipe-b-edp-1-planes-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.24, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4@pipe-b-hdmi-a-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4@pipe-b-hdmi-a-2-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-4@p</p>
</li>
</ul>

</body>
</html>

--===============0464495579465928183==--
