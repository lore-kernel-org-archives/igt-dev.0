Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4894764288801514441=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 15 Jul 2022 14:16:02 -0000
Message-ID: <165789456228.10566.2383790408261946701@emeril.freedesktop.org>
References: <20220715111937.1245586-1-matthew.auld@intel.com>
In-Reply-To: <20220715111937.1245586-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fcreate=3A_use_48b_addressing?=
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

--===============4894764288801514441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_create: use 48b addressing
URL   : https://patchwork.freedesktop.org/series/106384/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11900_full -> IGTPW_7525_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/index.html

Participating hosts (12 -> 10)
------------------------------

  Additional (1): shard-dg1 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7525_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_softpin@noreloc-s3:
    - {shard-tglu}:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-tglu-6/igt@gem_softpin@noreloc-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglu-2/igt@gem_softpin@noreloc-s3.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11900_full and IGTPW_7525_full:

### New IGT tests (55) ###

  * igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_async_flips@test-time-stamp@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_async_flips@test-time-stamp@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.16] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [3.81] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.89] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.22] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_flip@nonexisting-fb@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_flip@nonexisting-fb@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip@nonexisting-fb@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_flip@nonexisting-fb@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.15] s

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.09] s

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.09] s

  * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.10] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-4-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-4-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.08] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_7525_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([fdo#111827])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb7/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][4] ([fdo#111827])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb5/igt@feature_discovery@chamelium.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][5] ([i915#4991])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl6/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][6] ([i915#180]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#4525])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][10] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2852])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb6/igt@gem_exec_fair@basic-pace@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb8/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2842]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-tglb2/igt@gem_huc_copy@huc-copy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-glk:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk7/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4613])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb8/igt@gem_lmem_swapping@smem-oom.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#4613])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb6/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl8/igt@gem_lmem_swapping@verify.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][26] ([i915#2658])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl2/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4270])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb8/igt@gem_pxp@display-protected-crc.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#4270])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb6/igt@gem_pxp@display-protected-crc.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl2/igt@gem_workarounds@suspend-resume-context.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl7/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#5566] / [i915#716])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#5566] / [i915#716])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl8/igt@gen9_exec_parse@allowed-single.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][35] ([i915#454])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][36] -> [FAIL][37] ([i915#454])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-glk:          [PASS][38] -> [WARN][39] ([i915#6405])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk9/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180]) +6 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#5286])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#5286])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278]) +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3689] / [i915#6095]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3886]) +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk5/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689] / [i915#3886])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [i915#3886])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl6/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#6095]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3689]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb8/igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk3/igt@kms_chamelium@dp-edid-change-during-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb5/igt@kms_chamelium@dp-edid-change-during-suspend.html
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl6/igt@kms_chamelium@dp-edid-change-during-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-snb7/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-negative.html

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x32:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#4462]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb3/igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x10:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#4462]) +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x170:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#3359]) +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb3/igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x512:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3359]) +7 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][63] -> [FAIL][64] ([i915#2346])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpp:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3828])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb6/igt@kms_dsc@dsc-with-bpp.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#3828])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb1/igt@kms_dsc@dsc-with-bpp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [FAIL][67] ([i915#4767])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][68] ([i915#180] / [i915#4939])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#79])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb8/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb7/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1:
    - shard-apl:          [PASS][73] -> [FAIL][74] ([i915#2122])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#2672]) +9 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109280] / [fdo#111825]) +7 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [FAIL][77] ([i915#160]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109280]) +7 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][79] ([i915#265])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][80] ([fdo#108145] / [i915#265])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271]) +234 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl7/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#111615]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#5176]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#5176]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][85] -> [SKIP][86] ([i915#5176]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html

  * {igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][87] ([i915#5176]) +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#658]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][91] -> [SKIP][92] ([fdo#109441]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-tglb:         NOTRUN -> [FAIL][93] ([i915#132] / [i915#3467])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb8/igt@kms_psr@psr2_primary_page_flip.html
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109441])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-b-wait-busy-hang:
    - shard-kbl:          [PASS][95] -> [SKIP][96] ([fdo#109271])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-kbl1/igt@kms_vblank@pipe-b-wait-busy-hang.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl1/igt@kms_vblank@pipe-b-wait-busy-hang.html
    - shard-apl:          [PASS][97] -> [SKIP][98] ([fdo#109271])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl7/igt@kms_vblank@pipe-b-wait-busy-hang.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl1/igt@kms_vblank@pipe-b-wait-busy-hang.html
    - shard-glk:          [PASS][99] -> [SKIP][100] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk3/igt@kms_vblank@pipe-b-wait-busy-hang.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk2/igt@kms_vblank@pipe-b-wait-busy-hang.html

  * igt@kms_vrr@flip-basic:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#3555])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb1/igt@kms_vrr@flip-basic.html
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#3555])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb5/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#2437]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl7/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#2530])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#2530])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb5/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109289])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb5/igt@perf@per-context-mode-unprivileged.html
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109289])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb8/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_nv_api@nv_self_import:
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271]) +85 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk1/igt@prime_nv_api@nv_self_import.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][109] ([fdo#109271]) +73 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl1/igt@prime_nv_pcopy@test2.html

  * igt@prime_nv_test@i915_nv_sharing:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#109291])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@prime_nv_test@i915_nv_sharing.html
    - shard-iclb:         NOTRUN -> [SKIP][111] ([fdo#109291])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb5/igt@prime_nv_test@i915_nv_sharing.html

  * igt@sysfs_clients@busy:
    - shard-apl:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#2994]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl7/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@sema-50:
    - shard-snb:          NOTRUN -> [SKIP][113] ([fdo#109271]) +74 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-snb5/igt@sysfs_clients@sema-50.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2994])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@sysfs_clients@sema-50.html
    - shard-glk:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2994]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk9/igt@sysfs_clients@sema-50.html
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#2994])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb8/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-nonblock:
    - {shard-rkl}:        [SKIP][117] ([i915#4098]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@drm_read@short-buffer-nonblock.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-6/igt@drm_read@short-buffer-nonblock.html

  * igt@fbdev@info:
    - {shard-rkl}:        [SKIP][119] ([i915#2582]) -> [PASS][120] +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-1/igt@fbdev@info.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@fbdev@info.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-rkl}:        [FAIL][121] ([i915#6268]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][123] ([i915#180]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-kbl7/igt@gem_eio@in-flight-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - {shard-rkl}:        [TIMEOUT][125] ([i915#3063]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@gem_eio@unwedge-stress.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][127] ([i915#4525]) -> [PASS][128] +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-tglb:         [INCOMPLETE][129] ([i915#3778]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-tglb5/igt@gem_exec_endless@dispatch@bcs0.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb2/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][131] ([i915#2842]) -> [PASS][132] +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][133] ([i915#2842]) -> [PASS][134] +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - {shard-tglu}:       [FAIL][135] ([i915#2842]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - {shard-rkl}:        [SKIP][137] ([fdo#109313]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-write-read:
    - {shard-rkl}:        [SKIP][139] ([i915#3281]) -> [PASS][140] +9 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][141] ([fdo#110254]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_set_tiling_vs_pwrite:
    - {shard-rkl}:        [SKIP][143] ([i915#3282]) -> [PASS][144] +3 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [DMESG-WARN][145] ([i915#5566] / [i915#716]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@shadow-peek:
    - {shard-rkl}:        [SKIP][147] ([i915#2527]) -> [PASS][148] +2 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@gen9_exec_parse@shadow-peek.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][149] ([i915#6258]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-4/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_pm_rps@waitboost:
    - {shard-rkl}:        [FAIL][151] ([i915#4016]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-1/igt@i915_pm_rps@waitboost.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][153] ([i915#180]) -> [PASS][154] +6 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl3/igt@i915_suspend@debugfs-reader.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_atomic@crtc-invalid-params-fence:
    - {shard-rkl}:        [SKIP][155] ([i915#1845] / [i915#4098]) -> [PASS][156] +21 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@kms_atomic@crtc-invalid-params-fence.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-6/igt@kms_atomic@crtc-invalid-params-fence.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][157] ([i915#72]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [FAIL][159] ([i915#2346]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - {shard-rkl}:        [SKIP][161] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][162] +6 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-glk:          [FAIL][163] ([i915#79]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:
    - shard-glk:          [FAIL][165] ([i915#2122]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-glk1/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk7/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - {shard-rkl}:        [SKIP][167] ([i915#1849] / [i915#4098]) -> [PASS][168] +8 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@pixel-format@pipe-a-planes:
    - {shard-rkl}:        [SKIP][169] ([i915#3558]) -> [PASS][170] +1 similar issue
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-1/igt@kms_plane@pixel-format@pipe-a-planes.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-6/igt@kms_plane@pixel-format@pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][171] ([fdo#109441]) -> [PASS][172] +2 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@sprite_mmap_cpu:
    - {shard-rkl}:        [SKIP][173] ([i915#1072]) -> [PASS][174] +1 similar issue
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@kms_psr@sprite_mmap_cpu.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-6/igt@kms_psr@sprite_mmap_cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [SKIP][175] ([i915#5519]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - {shard-rkl}:        [SKIP][177] ([i915#5461]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][179] ([i915#1722]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-2/igt@perf@polling-small-buf.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@perf@polling-small-buf.html

  * igt@prime_vgem@basic-read:
    - {shard-rkl}:        [SKIP][181] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-rkl-1/igt@prime_vgem@basic-read.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@prime_vgem@basic-read.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][183] ([i915#6117]) -> [SKIP][184] ([i915#4525])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][185] ([i915#2842]) -> [FAIL][186] ([i915#2849])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][187] ([i915#658]) -> [SKIP][188] ([i915#2920])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][189], [FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][197], [FAIL][198], [FAIL][199], [FAIL][200], [FAIL][201], [FAIL][202], [FAIL][203], [FAIL][204]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl2/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl1/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl1/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl7/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl3/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl6/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl3/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl8/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl4/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl6/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl7/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl1/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl7/igt@runner@aborted.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl6/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl8/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl3/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][205], [FAIL][206], [FAIL][207]) ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][208], [FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-kbl1/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-kbl6/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-kbl7/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl4/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl4/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl4/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl6/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl6/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl7/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#160]: https://gitlab.freedesktop.org/drm/intel/issues/160
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#6405]: https://gitlab.freedesktop.org/drm/intel/issues/6405
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6585 -> IGTPW_7525
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11900: 5218ea24682b8edb1d629323dce5c88a44e225b0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7525: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/index.html
  IGT_6585: 1b15ce5ec4cb6693daa9dff042e32f675ba8af76 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/index.html

--===============4894764288801514441==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/i915/gem_create: use 48b addressing</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106384/">https://patchwork.freedesktop.org/series/106384/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7525/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11900_full -&gt; IGTPW_7525_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/index.=
html</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Additional (1): shard-dg1 <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7525=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_softpin@noreloc-s3:<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-tglu-6/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglu-2=
/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11900_full and IGTPW_7525_=
full:</p>
<h3>New IGT tests (55)</h3>
<ul>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@hdmi-a-4-pipe-a:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-=
a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-=
a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-4-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-4-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-c-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-d-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7525_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb7/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb5/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl6/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl3/igt@gem_ctx_isolation@preservation-s3@b=
cs0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-snb6/igt@gem_ctx_persistence@legacy-engines-=
queued.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/=
shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2852">i915#2852</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb3/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-=
iclb8/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-=
kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-tglb6/ig=
t@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-glk7/igt@gem_lmem_swapping@basic.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-kbl4/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb8/igt@gem_lmem_swapping@smem-oom.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i9=
15#4613</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb6/igt@gem_lmem_swapping@smem-oom.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i9=
15#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl8/igt@gem_lmem_swapping@verify.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/46=
13">i915#4613</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl2/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb8/igt@gem_pxp@display-protected-crc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270"=
>i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb6/igt@gem_pxp@display-protected-crc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270"=
>i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-apl2/igt@gem_workarounds@suspend-resume-context.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_752=
5/shard-apl7/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-glk9/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk=
7/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-apl8/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-=
apl7/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb4/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/s=
hard-glk9/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/6405">i915#6405</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/sh=
ard-kbl4/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb7/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-glk5/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb1/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-kbl6/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-tglb8/igt@kms_ccs@pipe-d-bad-rotation-90-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-glk3/igt@kms_chamelium@dp-edid-change-during-=
suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb5/igt@kms_chamelium@dp-edid-change-during=
-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-kbl6/igt@kms_chamelium@dp-edid-change-during-=
suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-snb7/igt@kms_chamelium@dp-edid-change-during-=
suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-negative:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x32:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-iclb3/igt@kms_cursor_crc@cursor-offscreen@pi=
pe-b-edp-1-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4462">i915#4462</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x10:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen@pi=
pe-c-edp-1-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4462">i915#4462</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x170:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-iclb3/igt@kms_cursor_crc@cursor-offscreen@pi=
pe-c-edp-1-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3359">i915#3359</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x512:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen@pi=
pe-c-edp-1-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3359">i915#3359</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7525/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-trans=
itions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb6/igt@kms_dsc@dsc-with-bpp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3828">i915#382=
8</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb1/igt@kms_dsc@dsc-with-bpp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3828">i915#382=
8</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915=
#4767</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4939">i915#4939</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7525/shard-glk7/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb8/igt@kms_flip@2x-flip-vs-modeset.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3637">i915#3637</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb7/igt@kms_flip@2x-flip-vs-modeset.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-apl3/igt@kms_flip@plain-flip-fb-recreate-interruptible@=
a-dp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7525/shard-apl6/igt@kms_flip@plain-flip-fb-recreate-interruptible=
@a-dp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +9=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-offscren-pri-indfb-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/160">i915#160</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl7/igt@kms_plane_alpha_blend@pipe-d-alpha-=
transparent-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +234 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-b-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe=
-c-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-iclb5/igt@kms_plane_scaling@plane-downscale-=
with-pixel-format-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe=
-d-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-tglb3/igt@kms_plane_scaling@plane-downscale-=
with-pixel-format-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-=
format-factor-0-5@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-iclb2/igt@kms_plane_scaling@p=
lane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe=
-c-hdmi-a-4} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-rotation@pipe-c-hdmi-a-4.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-kbl6/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-co=
ntinuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard=
-iclb8/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb8/igt@kms_psr@psr2_primary_page_flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132"=
>i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3467">i915#3467</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10944=
1">fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-busy-hang:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11900/shard-kbl1/igt@kms_vblank@pipe-b-wait-busy-hang.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard=
-kbl1/igt@kms_vblank@pipe-b-wait-busy-hang.html">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11900/shard-apl7/igt@kms_vblank@pipe-b-wait-busy-hang.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard=
-apl1/igt@kms_vblank@pipe-b-wait-busy-hang.html">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11900/shard-glk3/igt@kms_vblank@pipe-b-wait-busy-hang.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard=
-glk2/igt@kms_vblank@pipe-b-wait-busy-hang.html">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb1/igt@kms_vrr@flip-basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555<=
/a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb5/igt@kms_vrr@flip-basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555<=
/a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl7/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb3/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb5/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb5/igt@perf@per-context-mode-unprivileged.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb8/igt@perf@per-context-mode-unprivileged.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-glk1/igt@prime_nv_api@nv_self_import.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +85 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-kbl1/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb3/igt@prime_nv_test@i915_nv_sharing.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb5/igt@prime_nv_test@i915_nv_sharing.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-apl7/igt@sysfs_clients@busy.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i9=
15#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-snb5/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) +74 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-tglb3/igt@sysfs_clients@sema-50.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-glk9/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7525/shard-iclb8/igt@sysfs_clients@sema-50.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@drm_read@short-buffer-nonblock.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#409=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525=
/shard-rkl-6/igt@drm_read@short-buffer-nonblock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-1/igt@fbdev@info.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-5/igt@fbd=
ev@info.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#626=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525=
/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-kbl7/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/s=
hard-kbl6/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shar=
d-rkl-1/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7525/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a> =
+2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-tglb5/igt@gem_exec_endless@dispatch@bcs0.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3778">i9=
15#3778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7525/shard-tglb2/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/s=
hard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11900/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
525/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 si=
milar issue</p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11900/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7525/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></=
p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109313">fdo#109313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7525/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default=
-cmd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#32=
81</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_752=
5/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">PASS</a> +9 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110254">fdo#=
110254</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7525/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard=
-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-glk9/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7525/shard-glk1/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/sh=
ard-rkl-5/igt@gen9_exec_parse@shadow-peek.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6258">i=
915#6258</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7525/shard-rkl-4/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-1/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016">i915#4016</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rk=
l-5/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-apl3/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#18=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525=
/shard-apl6/igt@i915_suspend@debugfs-reader.html">PASS</a> +6 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@kms_atomic@crtc-invalid-params-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i9=
15#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/40=
98">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7525/shard-rkl-6/igt@kms_atomic@crtc-invalid-params-fence.html">PAS=
S</a> +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legac=
y.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/72">i915#72</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7525/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7525/shard-glk7/igt@kms_cursor_legacy@flip-vs-=
cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtil=
ed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-6/igt@kms_draw_crc@draw-method-r=
gb565-mmap-gtt-xtiled.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">=
i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7525/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-glk1/igt@kms_flip@plain-flip-fb-recreate-interruptible@=
c-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7525/shard-glk7/igt@kms_flip@plain-flip-fb-recreate-int=
erruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-rkl-6/igt@kms_frontbuffer_tra=
cking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +8 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-1/igt@kms_plane@pixel-format@pipe-a-planes.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3558">i9=
15#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7525/shard-rkl-6/igt@kms_plane@pixel-format@pipe-a-planes.html">PASS</a> =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
25/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@kms_psr@sprite_mmap_cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-=
rkl-6/igt@kms_psr@sprite_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11900/shard-iclb4/igt@kms_psr_stress_test@invalidate-primary-flip-ov=
erlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7525/shard-iclb3/igt@kms_psr_stress_test@invalidate-primary=
-flip-overlay.html">PASS</a></p>
</li>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11900/shard-rkl-5/igt@kms_psr_stress_test@invalidate-primary-flip-ov=
erlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5461">i915#5461</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7525/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary=
-flip-overlay.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-2/igt@perf@polling-small-buf.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-r=
kl-5/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-rkl-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo#109295</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708">i91=
5#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7525/shard-rkl-5/igt@prime_vgem@basic-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7525/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
525/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7525/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous=
-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11900/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11900/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl6/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1900/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-apl8/igt@runner@aborted.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7525/shard-apl4/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl6/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7525/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl1/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7525/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl6/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7525/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-apl3/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11900/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11900/shard-kbl6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11900/shard-kbl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard=
-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7525/shard-kbl4/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7525/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl6/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7525/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/shard-kbl7/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/92">i915#92</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6585 -&gt; IGTPW_7525</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11900: 5218ea24682b8edb1d629323dce5c88a44e225b0 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7525: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7525/index.htm=
l<br />
  IGT_6585: 1b15ce5ec4cb6693daa9dff042e32f675ba8af76 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============4894764288801514441==--
