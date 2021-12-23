Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6820107428062584446=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Dec 2021 12:46:26 -0000
Message-ID: <164026358692.20442.255561911483791012@emeril.freedesktop.org>
References: <20211223104146.4004-1-swati2.sharma@intel.com>
In-Reply-To: <20211223104146.4004-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkaXRp?=
 =?utf-8?q?on_of_new_plane_scaling_test_cases?=
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

--===============6820107428062584446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Addition of new plane scaling test cases
URL   : https://patchwork.freedesktop.org/series/98333/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6318_full -> IGTPW_6513_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6513_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6513_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6513_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * {igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-a-upscale-downscale-plane-scaling} (NEW):
    - shard-kbl:          NOTRUN -> [CRASH][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-a-upscale-downscale-plane-scaling.html

  * {igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-dp-1-upscale-upscale-plane-scaling} (NEW):
    - shard-apl:          NOTRUN -> [CRASH][4] +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl2/igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-dp-1-upscale-upscale-plane-scaling.html

  * {igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-1-upscale-upscale-plane-scaling} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-1-upscale-upscale-plane-scaling.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling}:
    - shard-tglb:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * {igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling}:
    - shard-iclb:         NOTRUN -> [SKIP][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html

  
New tests
---------

  New tests have been introduced between IGT_6318_full and IGTPW_6513_full:

### New IGT tests (88) ###

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-dp-1-downscale-downscale-plane-scaling:
    - Statuses : 1 crash(s) 1 pass(s)
    - Exec time: [0.07, 0.42] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-edp-1-downscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.25, 1.27] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-hdmi-a-1-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-hdmi-a-2-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-vga-1-downscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-dp-1-downscale-downscale-plane-scaling:
    - Statuses : 1 crash(s) 1 pass(s)
    - Exec time: [0.23, 0.55] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-edp-1-downscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [2.37, 2.50] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-hdmi-a-1-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-hdmi-a-2-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-vga-1-downscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-dp-1-downscale-downscale-plane-scaling:
    - Statuses : 2 crash(s)
    - Exec time: [0.23, 0.35] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-edp-1-downscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [2.37, 2.49] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-hdmi-a-1-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-hdmi-a-2-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-d-edp-1-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_plane_scaling@invalid-num-scalers:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-a-invalid-num-scalers:
    - Statuses : 2 crash(s)
    - Exec time: [0.17, 0.42] s

  * igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-b-invalid-num-scalers:
    - Statuses : 2 crash(s)
    - Exec time: [0.20, 0.29] s

  * igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-c-invalid-num-scalers:
    - Statuses : 2 crash(s)
    - Exec time: [0.21, 0.28] s

  * igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-a-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.21] s

  * igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-b-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 1.22] s

  * igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-c-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-d-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-a-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-b-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-c-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-a-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-b-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-c-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@invalid-num-scalers@vga-1-pipe-a-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@vga-1-pipe-b-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [2.85, 4.56] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [7.20, 10.78] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [5.20] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [3.08, 4.68] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [8.52, 13.25] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [4.91] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-dp-1-scaler-with-clipping-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [1.96, 2.08] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-edp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-dp-1-scaler-with-rotation:
    - Statuses : 2 pass(s)
    - Exec time: [1.32, 2.38] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-edp-1-scaler-with-rotation:
    - Statuses : 2 pass(s)
    - Exec time: [5.54, 6.93] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-hdmi-a-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.12] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-vga-1-scaler-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-dp-1-scaler-with-rotation:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 2.58] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-edp-1-scaler-with-rotation:
    - Statuses : 2 pass(s)
    - Exec time: [8.13] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-hdmi-a-2-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.16] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-vga-1-scaler-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-dp-1-scaler-with-rotation:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 1.75] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-edp-1-scaler-with-rotation:
    - Statuses : 2 pass(s)
    - Exec time: [8.13] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-hdmi-a-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [4.17] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-d-edp-1-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [8.13] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-a-upscale-downscale-plane-scaling:
    - Statuses : 1 crash(s) 1 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-b-upscale-downscale-plane-scaling:
    - Statuses : 1 crash(s) 1 pass(s)
    - Exec time: [0.20, 0.35] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-c-upscale-downscale-plane-scaling:
    - Statuses : 2 crash(s)
    - Exec time: [0.22, 0.36] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-a-upscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-b-upscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.23, 1.29] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-c-upscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 1.28] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-d-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-a-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-b-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-c-upscale-downscale-plane-scaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.46] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-a-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-b-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-c-upscale-downscale-plane-scaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.30] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@vga-1-pipe-a-upscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@vga-1-pipe-b-upscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-dp-1-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-edp-1-upscale-upscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-hdmi-a-1-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-hdmi-a-2-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-vga-1-upscale-upscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-dp-1-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-edp-1-upscale-upscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.24, 1.27] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-hdmi-a-1-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-hdmi-a-2-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-vga-1-upscale-upscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-dp-1-upscale-upscale-plane-scaling:
    - Statuses : 1 crash(s)
    - Exec time: [0.32] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-edp-1-upscale-upscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 1.28] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-1-upscale-upscale-plane-scaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.39] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-2-upscale-upscale-plane-scaling:
    - Statuses : 1 fail(s)
    - Exec time: [0.30] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-d-edp-1-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  

Known issues
------------

  Here are the changes found in IGTPW_6513_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-glk:          NOTRUN -> [DMESG-WARN][8] ([i915#3002])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#4525])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#2846])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2842]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][21] ([i915#2842]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#2849])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109283])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109283])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#118])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][28] -> [SKIP][29] ([i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk3/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@random:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#4613]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@gem_lmem_swapping@random.html
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@gem_lmem_swapping@random.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][33] ([i915#2658])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][34] ([i915#2658])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#4270]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb7/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#4270])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#768]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb1/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271]) +54 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3297]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#2856])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb2/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271]) +93 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109506] / [i915#2411])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109293] / [fdo#109506])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111614])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#110725] / [fdo#111614])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3777]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3777]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#110723])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3777]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [i915#3886]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3886]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3886]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl3/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3689] / [i915#3886]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb5/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111615] / [i915#3689]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb8/igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3689]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk6/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl8/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278] / [i915#1149])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-b-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl6/igt@kms_color_chamelium@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-snb2/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3116])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111828])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb5/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][67] ([i915#1319])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@kms_content_protection@srm.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109300] / [fdo#111066])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb2/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][69] ([i915#1319])
   [69]: h

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/index.html

--===============6820107428062584446==
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
<tr><td><b>Series:</b></td><td>Addition of new plane scaling test cases</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98333/">https://patchwork.freedesktop.org/series/98333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6318_full -&gt; IGTPW_6513_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6513_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6513_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6513_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-a-upscale-downscale-plane-scaling} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-a-upscale-downscale-plane-scaling.html">CRASH</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-dp-1-upscale-upscale-plane-scaling} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl2/igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-dp-1-upscale-upscale-plane-scaling.html">CRASH</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-1-upscale-upscale-plane-scaling} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-1-upscale-upscale-plane-scaling.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling}:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6318_full and IGTPW_6513_full:</p>
<h3>New IGT tests (88)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-dp-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 crash(s) 1 pass(s)</li>
<li>Exec time: [0.07, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-edp-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.25, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-hdmi-a-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-hdmi-a-2-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-vga-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-dp-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 crash(s) 1 pass(s)</li>
<li>Exec time: [0.23, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-edp-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.37, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-hdmi-a-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-hdmi-a-2-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-vga-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-dp-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.23, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-edp-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.37, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-hdmi-a-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-hdmi-a-2-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-d-edp-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
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
<p>igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-a-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.17, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-b-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.20, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-c-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.21, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-a-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-b-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-c-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-d-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-a-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-b-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-c-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-a-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-b-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-c-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@vga-1-pipe-a-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@vga-1-pipe-b-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.85, 4.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.20, 10.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.20] s</li>
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
<li>Exec time: [3.08, 4.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.52, 13.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.91] s</li>
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
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.96, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-a-dp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.32, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-a-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.54, 6.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-a-hdmi-a-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.12] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-hdmi-a-2-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.16] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-hdmi-a-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-d-edp-1-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-a-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 crash(s) 1 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-b-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 crash(s) 1 pass(s)</li>
<li>Exec time: [0.20, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-c-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.22, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-a-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-b-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.23, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-c-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-d-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-a-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-b-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-c-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-a-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-b-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-c-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@vga-1-pipe-a-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@vga-1-pipe-b-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-dp-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-edp-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-hdmi-a-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-hdmi-a-2-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-vga-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-dp-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-edp-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.24, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-hdmi-a-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-hdmi-a-2-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-vga-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-dp-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-edp-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-2-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-d-edp-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6513_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6318/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk3/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@gem_lmem_swapping@random.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@gem_lmem_swapping@random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb7/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb1/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([fdo#109271]) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb2/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109271]) +93 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb1/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl3/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb5/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb8/igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-glk6/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-apl8/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@kms_chamelium@vga-hpd-after-suspend.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl6/igt@kms_color_chamelium@pipe-b-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-snb2/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-tglb5/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-kbl1/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6513/shard-iclb2/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="h">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6820107428062584446==--
