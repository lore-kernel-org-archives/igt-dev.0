Return-path: <SRS0=itlh=TC=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============6078654702097184763=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Petri Latvala" <petri.latvala@intel.com>
Date: Sat, 19 Feb 2022 20:27:32 -0000
Message-ID: <164530245242.29219.10999532746112762324@emeril.freedesktop.org>
References: <20220219025909.174-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220219025909.174-1-quic_jesszhan@quicinc.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Iga21zX3Bs?=
 =?utf-8?q?ane=5Fscaling=3A_Add_more_scale_factor_tests_to_cover_more_driv?=
 =?utf-8?q?ers_=28rev5=29?=
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

--===============6078654702097184763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_plane_scaling: Add more scale factor tests to cover more drivers (rev5)
URL   : https://patchwork.freedesktop.org/series/99364/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11254_full -> IGTPW_6658_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6658_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-downscale-with-rotation} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb6/igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-downscale-with-rotation.html

  * {igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-d-upscale-with-rotation} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-d-upscale-with-rotation.html
    - {shard-tglu}:       NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglu-6/igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-d-upscale-with-rotation.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11254_full and IGTPW_6658_full:

### New IGT tests (49) ###

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-downscale-with-pixel-format:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 35.89] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-downscale-with-pixel-format:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 37.67] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-c-downscale-with-pixel-format:
    - Statuses : 6 pass(s)
    - Exec time: [3.71, 37.63] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-d-downscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [25.13, 34.08] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-downscale-with-pixel-format:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 35.85] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-downscale-with-pixel-format:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 37.59] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-c-downscale-with-pixel-format:
    - Statuses : 4 pass(s)
    - Exec time: [7.57, 37.65] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-d-downscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [34.55] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-downscale-with-rotation:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 13.96] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-downscale-with-rotation:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 19.80] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-c-downscale-with-rotation:
    - Statuses : 6 pass(s)
    - Exec time: [2.83, 19.78] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-d-downscale-with-rotation:
    - Statuses : 2 pass(s)
    - Exec time: [10.22, 19.70] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-downscale-with-rotation:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 3.24] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-downscale-with-rotation:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 3.25] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-downscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [3.12, 3.24] s

  * igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-a-scaler-with-pixel-format:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 35.84] s

  * igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-scaler-with-pixel-format:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 37.54] s

  * igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-c-scaler-with-pixel-format:
    - Statuses : 5 pass(s)
    - Exec time: [3.78, 37.47] s

  * igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-d-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [25.44] s

  * igt@kms_plane_scaling@scaler-with-rotation-unity-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-a-scaler-with-rotation:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 20.06] s

  * igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-b-scaler-with-rotation:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 52.18] s

  * igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-c-scaler-with-rotation:
    - Statuses : 6 pass(s)
    - Exec time: [2.97, 52.10] s

  * igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-d-scaler-with-rotation:
    - Statuses : 2 pass(s)
    - Exec time: [10.13, 19.91] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-20x20:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-a-upscale-with-pixel-format:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.66] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-b-upscale-with-pixel-format:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.78] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-c-upscale-with-pixel-format:
    - Statuses : 5 pass(s)
    - Exec time: [1.47, 9.94] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-d-upscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [7.98] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-factor-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-factor-4@pipe-a-upscale-with-pixel-format:
    - Statuses : 6 pass(s)
    - Exec time: [1.69, 16.0] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-factor-4@pipe-b-upscale-with-pixel-format:
    - Statuses : 6 pass(s)
    - Exec time: [1.80, 17.31] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-factor-4@pipe-c-upscale-with-pixel-format:
    - Statuses : 6 pass(s)
    - Exec time: [1.55, 17.26] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-factor-4@pipe-d-upscale-with-pixel-format:
    - Statuses : 2 pass(s)
    - Exec time: [8.71, 9.71] s

  * igt@kms_plane_scaling@upscale-with-rotation-20x20:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-a-upscale-with-rotation:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.93] s

  * igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-upscale-with-rotation:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.14] s

  * igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-upscale-with-rotation:
    - Statuses : 4 pass(s)
    - Exec time: [1.75, 8.43] s

  * igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-d-upscale-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [8.13] s

  * igt@kms_plane_scaling@upscale-with-rotation-factor-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-a-upscale-with-rotation:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 2.49] s

  * igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-b-upscale-with-rotation:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 3.19] s

  * igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-c-upscale-with-rotation:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.76, 2.14] s

  * igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-d-upscale-with-rotation:
    - Statuses : 2 skip(s)
    - Exec time: [0.77, 2.06] s

  

Known issues
------------

  Here are the changes found in IGTPW_6658_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#1839]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb4/igt@feature_discovery@display-3x.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][5] ([i915#4991]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl3/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-snb4/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#280])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#4525])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-iclb1/igt@gem_exec_balancer@parallel-balancer.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][10] ([i915#5076])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-iclb:         [PASS][11] -> [INCOMPLETE][12] ([i915#3371])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-iclb5/igt@gem_exec_capture@pi@vcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2842]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][19] ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][20] ([i915#2842]) +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#2842]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#2849])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@basic:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#4613]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#4613]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#4613]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb5/igt@gem_lmem_swapping@random-engines.html
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl7/igt@gem_lmem_swapping@random-engines.html
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk5/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#4270]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#4270]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#768]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109312])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb4/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109312])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][38] ([i915#180])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl6/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3297]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3323])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][41] ([i915#4991])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb5/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#3297])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb8/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-kbl4/igt@gem_workarounds@suspend-resume.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl6/igt@gem_workarounds@suspend-resume.html

  * igt@gen3_mixed_blits:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109289]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb8/igt@gen3_mixed_blits.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109289])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb1/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#2527] / [i915#2856]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#2856]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([i915#4281])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#1902])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@i915_pm_lpsp@screens-disabled.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#1902])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb4/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109293] / [fdo#109506]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109506] / [i915#2411])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111644] / [i915#1397] / [i915#2411])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110892])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][57] ([i915#2373])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][58] ([i915#1759])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][59] ([i915#3921])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-snb2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271]) +112 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl2/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#110725] / [fdo#111614]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][62] -> [DMESG-WARN][63] ([i915#118]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111614]) +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3777]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#3777])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#110723])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111615]) +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#3777]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#3886]) +8 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#3886]) +20 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +5 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#3886]) +8 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#3689] / [i915#3886]) +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3689]) +7 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb2/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111615] / [i915#3689]) +5 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl4/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109284] / [fdo#111827]) +15 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb2/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb8/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278] / [i915#1149]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb6/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb1/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb1/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#3116])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb1/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#3116] / [i915#3299])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][88] ([i915#1319])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][89] ([i915#1319])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#1063]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3359]) +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#3319]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109279] / [i915#3359]) +5 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#4103])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109274] / [fdo#109278])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109278]) +33 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109274]) +7 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/s

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/index.html

--===============6078654702097184763==
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
<tr><td><b>Series:</b></td><td>kms_plane_scaling: Add more scale factor tests to cover more drivers (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99364/">https://patchwork.freedesktop.org/series/99364/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11254_full -&gt; IGTPW_6658_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6658_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-downscale-with-rotation} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb6/igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-downscale-with-rotation.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-d-upscale-with-rotation} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-d-upscale-with-rotation.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglu-6/igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-d-upscale-with-rotation.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11254_full and IGTPW_6658_full:</p>
<h3>New IGT tests (49)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-a-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 35.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-b-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 37.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-c-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.71, 37.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-2@pipe-d-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [25.13, 34.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-a-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 35.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-b-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 37.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-c-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [7.57, 37.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-4@pipe-d-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [34.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-a-downscale-with-rotation:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 13.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-b-downscale-with-rotation:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 19.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-c-downscale-with-rotation:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.83, 19.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-2@pipe-d-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.22, 19.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-a-downscale-with-rotation:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-b-downscale-with-rotation:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-downscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [3.12, 3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-a-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 35.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 37.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-c-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.78, 37.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-d-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [25.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation-unity-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-a-scaler-with-rotation:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 20.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-b-scaler-with-rotation:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 52.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-c-scaler-with-rotation:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.97, 52.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-d-scaler-with-rotation:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.13, 19.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-20x20:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-a-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-b-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-c-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.47, 9.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-d-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-factor-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-factor-4@pipe-a-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.69, 16.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-factor-4@pipe-b-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.80, 17.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-factor-4@pipe-c-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.55, 17.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-factor-4@pipe-d-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.71, 9.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-20x20:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-a-upscale-with-rotation:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-upscale-with-rotation:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-upscale-with-rotation:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.75, 8.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-d-upscale-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-factor-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-a-upscale-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-b-upscale-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-c-upscale-with-rotation:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.76, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-factor-4@pipe-d-upscale-with-rotation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.77, 2.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6658_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb4/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-snb4/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-iclb1/igt@gem_exec_balancer@parallel-balancer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html">DMESG-WARN</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-iclb5/igt@gem_exec_capture@pi@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@gem_exec_capture@pi@vcs0.html">INCOMPLETE</a> ([i915#3371])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@gem_lmem_swapping@basic.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb5/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl7/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk5/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb4/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl6/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb5/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb8/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-kbl4/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl6/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb8/igt@gen3_mixed_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb1/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb4/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb1/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-snb2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#3921])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +112 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11254/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk3/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb2/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl4/igt@kms_chamelium@dp-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb2/igt@kms_chamelium@vga-hpd-after-suspend.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb8/igt@kms_chamelium@vga-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb6/igt@kms_color@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-glk6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb1/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb1/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-kbl7/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-apl2/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#1063]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html">SKIP</a> ([i915#3359]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6658/s">SKIP</a> ([fdo#109274]) +7 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6078654702097184763==--
