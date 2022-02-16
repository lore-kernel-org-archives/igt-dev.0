Return-path: <SRS0=u8tb=S7=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============2636295524528559616=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Wed, 16 Feb 2022 21:43:31 -0000
Message-ID: <164504781138.16093.13795125244773594366@emeril.freedesktop.org>
References: <20220216122217.16507-1-swati2.sharma@intel.com>
In-Reply-To: <20220216122217.16507-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkaXRp?=
 =?utf-8?q?on_of_new_plane_scaling_test_cases_=28rev7=29?=
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

--===============2636295524528559616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Addition of new plane scaling test cases (rev7)
URL   : https://patchwork.freedesktop.org/series/98333/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11235_full -> IGTPW_6636_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6636_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6636_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/index.html

Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-dg1 pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6636_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          NOTRUN -> [TIMEOUT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_flip@flip-vs-fences-interruptible@a-vga1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-snb2/igt@kms_flip@flip-vs-fences-interruptible@a-vga1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - {shard-tglu}:       [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11235_full and IGTPW_6636_full:

### New IGT tests (113) ###

  * igt@kms_plane_scaling@invalid-num-scalers:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-vga-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-vga-1-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-1-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@plane-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-dp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.70, 1.25] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-edp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.56, 3.69] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-hdmi-a-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-a-vga-1-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-dp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.73, 1.29] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-edp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.46, 4.07] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-hdmi-a-2-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-b-vga-1-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-c-dp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.91] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-c-edp-1-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [3.46, 3.98] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-c-hdmi-a-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_plane_scaling@plane-downscaling@pipe-d-edp-1-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [3.71] s

  * igt@kms_plane_scaling@plane-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-dp-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-edp-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-hdmi-a-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-a-vga-1-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-dp-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-edp-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [3.45] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-hdmi-a-2-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-c-dp-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-c-edp-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [3.45] s

  * igt@kms_plane_scaling@plane-upscaling@pipe-c-hdmi-a-1-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-dp-1-planes-downscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.38] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-edp-1-planes-downscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.36] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-1-planes-downscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.35] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-2-planes-downscaling-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-vga-1-planes-downscaling-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-dp-1-planes-downscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.30] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-edp-1-planes-downscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.33] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-1-planes-downscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.34] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-2-planes-downscaling-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-vga-1-planes-downscaling-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-dp-1-planes-downscaling-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.16, 0.44] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-edp-1-planes-downscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-hdmi-a-1-planes-downscaling-downscaling:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.15, 0.39] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-hdmi-a-2-planes-downscaling-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.63] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-d-edp-1-planes-downscaling-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-d-hdmi-a-1-planes-downscaling-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-dp-1-planes-upscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.63] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-edp-1-planes-upscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.50] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-hdmi-a-1-planes-upscaling-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-hdmi-a-2-planes-upscaling-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-vga-1-planes-upscaling-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-dp-1-planes-upscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.28] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-edp-1-planes-upscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.35] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-hdmi-a-1-planes-upscaling-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-hdmi-a-2-planes-upscaling-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-vga-1-planes-upscaling-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-c-dp-1-planes-upscaling-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.20, 0.37] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-c-edp-1-planes-upscaling-downscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.33] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-c-hdmi-a-1-planes-upscaling-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-c-hdmi-a-2-planes-upscaling-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.28] s

  * igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-d-edp-1-planes-upscaling-downscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-dp-1-planes-upscaling-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.15] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-edp-1-planes-upscaling-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.17] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-hdmi-a-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-vga-1-planes-upscaling-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-dp-1-planes-upscaling-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.25] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-edp-1-planes-upscaling-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.23, 1.29] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-hdmi-a-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-vga-1-planes-upscaling-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-dp-1-planes-upscaling-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-edp-1-planes-upscaling-upscaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 1.28] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-hdmi-a-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-d-edp-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-d-hdmi-a-1-planes-upscaling-upscaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [11.02] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [30.24, 55.91] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [14.90] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [11.39] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [33.26, 58.06] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [15.36] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-dp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [1.82, 2.33] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-edp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-dp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [4.20] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-vga-1-scaler-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-dp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-2-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [4.96] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-vga-1-scaler-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-dp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [5.20] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [6.95] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-hdmi-a-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.21] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-vga-1-scaler-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [8.12] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-hdmi-a-2-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-vga-1-scaler-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [8.16] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-hdmi-a-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.44] s

  

Known issues
------------

  Here are the changes found in IGTPW_6636_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][7] ([fdo#111827])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb7/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][8] ([i915#1839]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb1/igt@feature_discovery@display-3x.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][9] ([i915#180]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-snb2/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][11] ([i915#280])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb3/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][12] -> [TIMEOUT][13] ([i915#3063])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-tglb1/igt@gem_eio@in-flight-contexts-10ms.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-kbl6/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][17] ([i915#2842]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#2842]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][19] ([i915#2842]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb6/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-apl:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109283])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb5/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109283] / [i915#4877])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb6/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#112283])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#4613]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#4613]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-apl6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#4270]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb6/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#4270]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#768]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb8/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109312])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb2/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3323])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3323])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3297]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb3/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#3297])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb8/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109289]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb6/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#2856]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb5/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#2527] / [i915#2856]) +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#1904])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#588])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][43] ([i915#454])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][44] ([i915#454]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][45] ([i915#2681] / [i915#2684])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         NOTRUN -> [WARN][46] ([i915#2684])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111644] / [i915#1397] / [i915#2411])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#110892])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109302])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3826])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#3826])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [PASS][52] -> [DMESG-WARN][53] ([i915#118]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          NOTRUN -> [DMESG-WARN][54] ([i915#118])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111614]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3777]) +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-apl2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3777]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3777]) +7 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#110723]) +1 similar issue
   [60]: http

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/index.html

--===============2636295524528559616==
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
<tr><td><b>Series:</b></td><td>Addition of new plane scaling test cases (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98333/">https://patchwork.freedesktop.org/series/98333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11235_full -&gt; IGTPW_6636_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6636_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6636_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/index.html</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-dg1 pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6636_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">TIMEOUT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-snb2/igt@kms_flip@flip-vs-fences-interruptible@a-vga1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-suspend:<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11235_full and IGTPW_6636_full:</p>
<h3>New IGT tests (113)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Exec time: [0.08] s</li>
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
<li>Exec time: [0.07] s</li>
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
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
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
<li>Exec time: [0.70, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-edp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.56, 3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-hdmi-a-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-a-vga-1-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-dp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.73, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-edp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.46, 4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-hdmi-a-2-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-b-vga-1-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-c-dp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-c-edp-1-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.46, 3.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-c-hdmi-a-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscaling@pipe-d-edp-1-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.71] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-edp-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-hdmi-a-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-a-vga-1-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-dp-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-edp-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-hdmi-a-2-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-b-vga-1-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-c-dp-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-c-edp-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscaling@pipe-c-hdmi-a-1-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-edp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-hdmi-a-2-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-a-vga-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-dp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-edp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-hdmi-a-2-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-b-vga-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-dp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.16, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-edp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-hdmi-a-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.15, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-c-hdmi-a-2-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-d-edp-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscaling-downscaling@pipe-d-hdmi-a-1-planes-downscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
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
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-dp-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-edp-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-hdmi-a-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-hdmi-a-2-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-a-vga-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-dp-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-edp-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-hdmi-a-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-hdmi-a-2-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-b-vga-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-c-dp-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.20, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-c-edp-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-c-hdmi-a-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-c-hdmi-a-2-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-downscaling@pipe-d-edp-1-planes-upscaling-downscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-edp-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-hdmi-a-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-a-vga-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-dp-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-edp-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.23, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-hdmi-a-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-b-vga-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-dp-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-edp-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-c-hdmi-a-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-d-edp-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscaling-upscaling@pipe-d-hdmi-a-1-planes-upscaling-upscaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [30.24, 55.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.90] s</li>
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
<li>Exec time: [11.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [33.26, 58.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.36] s</li>
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
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.82, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
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
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-hdmi-a-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.20] s</li>
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
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-2-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.96] s</li>
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
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-hdmi-a-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-a-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.95] s</li>
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
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-hdmi-a-2-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
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
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-hdmi-a-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.44] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6636_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb7/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb1/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-snb2/igt@gem_ctx_persistence@legacy-engines-cleanup.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb3/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-tglb1/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-kbl6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb6/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb5/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb6/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283] / [i915#4877])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-apl6/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb6/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb6/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb8/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb3/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb8/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb6/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb5/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527] / [i915#2856]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#1904])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb8/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11235/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-iclb2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-apl2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +6 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-glk9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6636/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="http">SKIP</a> ([fdo#110723]) +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2636295524528559616==--
