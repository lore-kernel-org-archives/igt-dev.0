Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3734953969264628127=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ramalingam C" <ramalingam.c@intel.com>
Date: Tue, 01 Mar 2022 05:37:18 -0000
Message-ID: <164611303856.8599.3284050867357238013@emeril.freedesktop.org>
References: <20220228195130.18127-1-ramalingam.c@intel.com>
In-Reply-To: <20220228195130.18127-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3A_ccs_subtests_for_gem=5Flmem=5Fswapping_=28rev2=29?=
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

--===============3734953969264628127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915: ccs subtests for gem_lmem_swapping (rev2)
URL   : https://patchwork.freedesktop.org/series/100816/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11300_full -> IGTPW_6717_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6717_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_lmem_swapping@heavy-verify-multi-ccs} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * {igt@gem_lmem_swapping@verify-ccs} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@gem_lmem_swapping@verify-ccs.html

  * {igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][3] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglu-8/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format}:
    - shard-iclb:         [PASS][4] -> [SKIP][5] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-iclb3/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html

  * {igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1-downscale-with-rotation}:
    - {shard-tglu}:       NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglu-8/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1-downscale-with-rotation.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11300_full and IGTPW_6717_full:

### New IGT tests (31) ###

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@verify-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@verify-random-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-edp-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-edp-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-dp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.24] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-dp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-dp-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d-edp-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-b-hdmi-a-1-upscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-d-hdmi-a-1-upscale-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  

Known issues
------------

  Here are the changes found in IGTPW_6717_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#1839])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@feature_discovery@display-2x.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([fdo#109314])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][10] ([i915#5076])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][11] ([i915#5076])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl4/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#2842]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#2190])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-kbl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4613])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl1/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#4613])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#4270]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#4270]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb2/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#768])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#110542])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#3297]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-apl7/igt@gem_workarounds@suspend-resume-context.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109289]) +5 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109289]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb3/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#2527] / [i915#2856]) +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#2856]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb5/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][32] ([i915#454])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#1937])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109289] / [fdo#111719])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][35] -> [WARN][36] ([i915#2681] / [i915#2684])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][37] ([i915#2681] / [i915#2684])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-iclb:         NOTRUN -> [WARN][38] ([i915#1804] / [i915#2684])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109506] / [i915#2411])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-tglb:         [PASS][40] -> [DMESG-WARN][41] ([i915#2411] / [i915#2867])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-tglb6/igt@i915_pm_rpm@system-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][42] -> [DMESG-WARN][43] ([i915#118]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111614]) +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglb:         [PASS][46] -> [FAIL][47] ([i915#3743])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-tglb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3777]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3777]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111615]) +10 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271]) +171 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#110723]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#2705])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#2705])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#3886]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk9/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278] / [i915#3886]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3886]) +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3886]) +12 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3689]) +12 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][60] ([fdo#109271]) +164 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-snb6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3689] / [i915#3886]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111615] / [i915#3689]) +10 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl4/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@hdmi-hpd:
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk5/igt@kms_chamelium@hdmi-hpd.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb8/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl3/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278] / [i915#1149])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb8/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109284] / [fdo#111827]) +23 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3116] / [i915#3299])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109300] / [fdo#111066])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb5/igt@kms_content_protection@legacy.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][73] ([i915#1319]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl7/igt@kms_content_protection@legacy.html
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#1063]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][75] ([i915#1319])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3359]) +7 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#3319]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109279] / [i915#3359]) +10 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#4103]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#109274] / [fdo#111825]) +11 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109274] / [fdo#109278])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#533]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl7/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278]) +35 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#533]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][86] -> [INCOMPLETE][87] ([i915#180])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109274]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][89] -> [DMESG-WARN][90] ([i915#180]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#2587])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#2587])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-iclb:         [PASS][93] -> [SKIP][94] ([i915#3701])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109285])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb3/igt@kms_force_connector_basic@force-load-detect.html
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109285])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][97] ([fdo#109271]) +237 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][98] ([fdo#109271]) +87 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109280] / [fdo#111825]) +54 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109280]) +31 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#1187])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_hdr@static-swap.html
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#1187])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@kms_hdr@static-swap.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#4278])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#1839]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/index.html

--===============3734953969264628127==
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
<tr><td><b>Series:</b></td><td>tests/i915: ccs subtests for gem_lmem_swapping (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100816/">https://patchwork.freedesktop.org/series/100816/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11300_full -&gt; IGTPW_6717_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6717_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_lmem_swapping@heavy-verify-multi-ccs} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_lmem_swapping@verify-ccs} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglu-8/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-iclb3/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1-downscale-with-rotation}:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglu-8/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1-downscale-with-rotation.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11300_full and IGTPW_6717_full:</p>
<h3>New IGT tests (31)</h3>
<ul>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
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
<li>Exec time: [0.12] s</li>
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
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
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
<li>Exec time: [0.13] s</li>
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
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-dp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d-edp-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-b-hdmi-a-1-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-d-hdmi-a-1-upscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6717_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@gem_exec_balancer@parallel-bb-first.html">DMESG-WARN</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl4/igt@gem_exec_balancer@parallel-keep-submit-fence.html">DMESG-WARN</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl1/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@gem_pxp@create-regular-buffer.html">SKIP</a> ([i915#4270]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb2/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-apl7/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl4/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb3/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527] / [i915#2856]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb5/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289] / [fdo#111719])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-tglb6/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@i915_pm_rpm@system-suspend.html">DMESG-WARN</a> ([i915#2411] / [i915#2867])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk3/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-tglb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +171 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#110723]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk9/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +8 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-snb6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([fdo#109271]) +164 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl4/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk5/igt@kms_chamelium@hdmi-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb8/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl3/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb8/igt@kms_color@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-green-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb5/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl7/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#1063]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl6/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">SKIP</a> ([i915#3359]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl7/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278]) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11300/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +237 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +87 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb5/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-iclb7/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6717/shard-tglb6/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> ([i915#4278])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3734953969264628127==--
