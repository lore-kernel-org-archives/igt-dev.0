Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4822028556927678781=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Jan 2022 17:31:47 -0000
Message-ID: <164278630714.19938.10380224704465517022@emeril.freedesktop.org>
References: <20220121134833.28740-1-swati2.sharma@intel.com>
In-Reply-To: <20220121134833.28740-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkaXRp?=
 =?utf-8?q?on_of_new_plane_scaling_test_cases_=28rev2=29?=
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

--===============4822028556927678781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Addition of new plane scaling test cases (rev2)
URL   : https://patchwork.freedesktop.org/series/98333/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11118_full -> IGTPW_6566_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6566_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6566_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/index.html

Participating hosts (10 -> 7)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6566_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_softpin@softpin:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-snb5/igt@gem_softpin@softpin.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-snb4/igt@gem_softpin@softpin.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11118_full and IGTPW_6566_full:

### New IGT tests (88) ###

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-dp-1-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.04, 0.41] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-edp-1-downscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.29] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-hdmi-a-1-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-hdmi-a-2-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-vga-1-downscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-dp-1-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.19, 0.53] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-edp-1-downscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [2.37, 2.50] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-hdmi-a-1-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-hdmi-a-2-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-vga-1-downscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-dp-1-downscale-downscale-plane-scaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-edp-1-downscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [2.37, 2.49] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-hdmi-a-1-downscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-hdmi-a-2-downscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-d-edp-1-downscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_plane_scaling@invalid-num-scalers:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-a-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.14] s

  * igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-b-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.19, 0.24] s

  * igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-c-invalid-num-scalers:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-a-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.13] s

  * igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-b-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [1.25, 1.26] s

  * igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-c-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-d-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-a-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-b-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-c-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-a-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-b-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-c-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@vga-1-pipe-a-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-num-scalers@vga-1-pipe-b-invalid-num-scalers:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-dp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [2.87] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [6.91, 7.21] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [5.36] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-dp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [3.02] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [8.09, 8.49] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-vga-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-dp-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [1.88, 1.93] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-edp-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-dp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [1.58, 2.49] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-edp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [4.61, 8.66] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [4.16] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-vga-1-scaler-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-dp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [1.73, 2.69] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-edp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [6.74, 9.77] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-2-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [4.17] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-vga-1-scaler-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-dp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.83] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-edp-1-scaler-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [7.78, 9.79] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-hdmi-a-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [4.18] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-edp-1-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [7.87] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-a-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.05, 0.20] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-b-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.19, 0.37] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-c-upscale-downscale-plane-scaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-a-upscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-b-upscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.24, 1.27] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-c-upscale-downscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.23, 1.28] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-d-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-a-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-b-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-c-upscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-a-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-b-upscale-downscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-c-upscale-downscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

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
    - Exec time: [0.06, 0.08] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-hdmi-a-1-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-hdmi-a-2-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

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
    - Exec time: [0.32] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-hdmi-a-2-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-vga-1-upscale-upscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-dp-1-upscale-upscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-edp-1-upscale-upscale-plane-scaling:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 1.24] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-1-upscale-upscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-2-upscale-upscale-plane-scaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-d-edp-1-upscale-upscale-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  

Known issues
------------

  Here are the changes found in IGTPW_6566_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-snb5/igt@gem_ctx_persistence@process.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][4] -> [FAIL][5] ([i915#232])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-tglb6/igt@gem_eio@kms.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb1/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([i915#4525]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_endless@dispatch@vcs1:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([i915#3778])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-tglb2/igt@gem_exec_endless@dispatch@vcs1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2846])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk6/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][12] ([i915#2846])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#2842]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#109283])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb2/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#112283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb3/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#118])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#4270])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb2/igt@gem_pxp@reject-modify-context-protection-off-3.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4270])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb7/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#768])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#2856])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb5/igt@gen9_exec_parse@secure-batches.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#2527] / [i915#2856]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb6/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][27] ([i915#454])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109302])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb7/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109302])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb2/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          NOTRUN -> [DMESG-WARN][30] ([i915#180])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl6/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111614]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111615])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3777])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3886]) +7 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3886]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3886]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl3/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109278] / [i915#3886]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb4/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3689])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3689] / [i915#3886]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111615] / [i915#3689]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278] / [i915#1149])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl4/igt@kms_color_chamelium@pipe-c-ctm-max.html
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-max.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb4/igt@kms_color_chamelium@pipe-c-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk7/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb2/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb7/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][50] ([i915#2105])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          NOTRUN -> [FAIL][51] ([i915#2105])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [fdo#109279])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3359]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109279] / [i915#3359]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271]) +103 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109274] / [fdo#109278])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [PASS][57] -> [FAIL][58] ([i915#2346])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278]) +11 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109274] / [fdo#111825]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb3/igt@kms_flip@2x-plain-flip-fb-recreate.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109274]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-glk:          [PASS][62] -> [FAIL][63] ([i915#79])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [PASS][64] -> [DMESG-WARN][65] ([i915#180]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-apl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2587])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([i915#3701]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109280]) +8 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109280] / [fdo#111825]) +13 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][71] -> [DMESG-WARN][72] ([i915#180]) +8 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [72]: https://intel-gfx-ci.01.org/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/index.html

--===============4822028556927678781==
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
<tr><td><b>Series:</b></td><td>Addition of new plane scaling test cases (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98333/">https://patchwork.freedesktop.org/series/98333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11118_full -&gt; IGTPW_6566_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6566_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6566_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/index.html</p>
<h2>Participating hosts (10 -&gt; 7)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6566_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_softpin@softpin:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-snb5/igt@gem_softpin@softpin.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-snb4/igt@gem_softpin@softpin.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11118_full and IGTPW_6566_full:</p>
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
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-edp-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-a-hdmi-a-1-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
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
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.19, 0.53] s</li>
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
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-b-hdmi-a-2-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
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
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-downscale-plane-scaling@pipe-c-hdmi-a-2-downscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-b-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.19, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@dp-1-pipe-c-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-a-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@edp-1-pipe-b-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.25, 1.26] s</li>
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
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-1-pipe-a-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
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
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-a-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-b-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@hdmi-a-2-pipe-c-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.91, 7.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.36] s</li>
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
<li>Exec time: [3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.09, 8.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-2-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
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
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.88, 1.93] s</li>
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
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-dp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.58, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.61, 8.66] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.73, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.74, 9.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-hdmi-a-2-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.17] s</li>
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
<li>Exec time: [1.47, 1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.78, 9.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-hdmi-a-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-edp-1-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.87] s</li>
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
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.05, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-b-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.19, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@dp-1-pipe-c-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-a-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-b-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.24, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-c-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.23, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@edp-1-pipe-d-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-a-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-b-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-1-pipe-c-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-a-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-b-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-downscale-plane-scaling@hdmi-a-2-pipe-c-upscale-downscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-hdmi-a-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-a-hdmi-a-2-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
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
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-b-hdmi-a-2-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
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
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-edp-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-c-hdmi-a-2-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-upscale-plane-scaling@pipe-d-edp-1-upscale-upscale-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6566_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-snb5/igt@gem_ctx_persistence@process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-tglb6/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb1/igt@gem_eio@kms.html">FAIL</a> ([i915#232])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-tglb2/igt@gem_exec_endless@dispatch@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html">INCOMPLETE</a> ([i915#3778])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-glk4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb2/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb3/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb2/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb7/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb5/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb7/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb2/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl6/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl3/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb4/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-max:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl4/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb4/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk7/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb2/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb7/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-kbl1/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +103 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb3/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([fdo#109274]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-apl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#3701]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6566/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11118/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/">DMESG-WARN</a> ([i915#180]) +8 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4822028556927678781==--
