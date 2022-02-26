Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7835188360642095210=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Sat, 26 Feb 2022 12:21:07 -0000
Message-ID: <164587806780.9642.762436440358076543@emeril.freedesktop.org>
References: <20220225144436.17718-1-swati2.sharma@intel.com>
In-Reply-To: <20220225144436.17718-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkaXRp?=
 =?utf-8?q?on_of_new_plane_scaling_test_cases_=28rev9=29?=
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

--===============7835188360642095210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Addition of new plane scaling test cases (rev9)
URL   : https://patchwork.freedesktop.org/series/98333/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11286_full -> IGTPW_6709_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6709_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6709_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/index.html

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6709_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-rapid-movement:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-256x256-rapid-movement.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +23 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-iclb8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html

  * {igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1-planes-upscale-downscale} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][3] +19 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1-planes-upscale-downscale.html

  * {igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +27 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglb1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html

  * {igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-kbl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping.html

  * {igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping} (NEW):
    - {shard-tglu}:       NOTRUN -> [FAIL][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglu-3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping.html

  * {igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-apl7/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping.html

  * {igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][8] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglb1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html

  * {igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][9] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-glk3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping.html

  * {igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][10] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-iclb1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - {shard-tglu}:       NOTRUN -> [DMESG-WARN][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglu-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11286_full and IGTPW_6709_full:

### New IGT tests (351) ###

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-dp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [10.97] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-edp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [35.47] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [15.18] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-vga-1-downscale-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-dp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [11.33] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-edp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [37.50] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-2-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [15.26] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-vga-1-downscale-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-c-dp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [7.60] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-c-edp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [37.55] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [15.20] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-a-dp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [10.92] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-a-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [14.92] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-a-vga-1-downscale-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-dp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [11.31] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-2-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [15.12] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-vga-1-downscale-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-dp-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [7.57] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-hdmi-a-1-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [15.08] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-dp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.51, 0.78] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [1.03, 1.05] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [1.19] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-vga-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-dp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.65, 0.97] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-edp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [2.17, 2.19] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-2-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [1.19] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-vga-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-dp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.58, 0.95] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-edp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [2.16, 2.20] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [1.12] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-edp-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.51, 0.78] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-edp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [1.05, 1.06] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.82, 1.17] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-vga-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-dp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.65, 0.98] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [2.15] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.83] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [1.20] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-vga-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-dp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.59, 0.99] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-edp-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [2.13, 2.15] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-hdmi-a-1-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.85, 1.63] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-d-edp-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-d-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.82] s

  * igt@kms_plane_scaling@invalid-num-scalers:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-dp-1-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

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
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-vga-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-dp-1-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-dp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.17] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.16] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-dp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.13] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.05] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-2-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.13] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-edp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.15] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-dp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.35] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-hdmi-a-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.39] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-dp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.33] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-hdmi-a-2-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-dp-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-edp-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.11, 0.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-dp-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.22] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.19] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.37] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-dp-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.35] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-edp-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.24, 1.34] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-2-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-vga-1-planes-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-dp-1-planes-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-edp-1-planes-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-a-dp-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-a-edp-1-planes-unity-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.19] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-a-hdmi-a-1-planes-unity-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.36] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-a-vga-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-dp-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-edp-1-planes-unity-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.25, 1.27] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-hdmi-a-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-hdmi-a-2-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-vga-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-c-dp-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-c-edp-1-planes-unity-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.28] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-c-hdmi-a-1-planes-unity-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.31] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-edp-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-hdmi-a-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.17] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.13] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.13] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-edp-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.11] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.38] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.35] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.33] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.33] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.32] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.24] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a-edp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.19] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.37] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.33] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-edp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.28] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.30] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c-edp-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.35] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - Statuses :

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/index.html

--===============7835188360642095210==
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
<tr><td><b>Series:</b></td><td>Addition of new plane scaling test cases (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98333/">https://patchwork.freedesktop.org/series/98333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11286_full -&gt; IGTPW_6709_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6709_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6709_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/index.html</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6709_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-256x256-rapid-movement.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-iclb8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html">SKIP</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1-planes-upscale-downscale} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1-planes-upscale-downscale.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglb1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html">SKIP</a> +27 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-kbl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglu-3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-apl7/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglb1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-glk3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-iclb1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6709/shard-tglu-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11286_full and IGTPW_6709_full:</p>
<h3>New IGT tests (351)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [35.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-vga-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [37.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-2-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-vga-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-c-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-c-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [37.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-a-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-a-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-a-vga-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-2-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-vga-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-dp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-hdmi-a-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.51, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.03, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-vga-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.65, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.17, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-2-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-vga-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.58, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.16, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.51, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.05, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.82, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-vga-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.65, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-vga-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-dp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.59, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.13, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.85, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-d-edp-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-d-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.82] s</li>
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
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
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
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
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
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-2-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-hdmi-a-2-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.24, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-2-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-vga-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-dp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
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
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-a-dp-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-a-edp-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-a-hdmi-a-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-a-vga-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-dp-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-edp-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.25, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-hdmi-a-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-hdmi-a-2-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-vga-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-c-dp-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-c-edp-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-c-hdmi-a-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-edp-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-hdmi-a-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>Statuses :</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7835188360642095210==--
