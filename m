Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 20:54:11 -0000
Message-ID: <158594725173.13349.7937186388539090335@emeril.freedesktop.org>
References: <20200402122943.6583-1-imre.deak@intel.com>
In-Reply-To: <20200402122943.6583-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Skip_detiler_fences_subtest_on_platforms_w/o_aper?=
 =?utf-8?q?ture_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_flip: Skip detiler fences subtest on platforms w/o aperture (rev2)
URL   : https://patchwork.freedesktop.org/series/75416/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5562_full -> IGTPW_4402_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4402_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4402_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4402_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb1/igt@gem_tiled_swapping@non-threaded.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb1/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-tglb:         [PASS][3] -> [SKIP][4] +41 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb2/igt@kms_flip@basic-flip-vs-modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-tglb1/igt@kms_flip@basic-flip-vs-modeset.html

  
#### Warnings ####

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         [SKIP][5] ([fdo#111825]) -> [SKIP][6] +44 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-tglb8/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglb:         [FAIL][7] ([i915#488]) -> [SKIP][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-tglb1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  
New tests
---------

  New tests have been introduced between IGT_5562_full and IGTPW_4402_full:

### New IGT tests (9) ###

  * igt@perf_pmu@faulting-read:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@after:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@after-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@before:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@hang:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@hang-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@fence-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@sync:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4402_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb5/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl7/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][13] -> [WARN][14] ([i915#1519])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-tglb:         [PASS][15] -> [SKIP][16] ([i915#1316] / [i915#579]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb7/igt@i915_pm_rpm@cursor-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-tglb3/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#151])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          [PASS][19] -> [TIMEOUT][20] ([i915#1288])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1316] / [i915#579]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb5/igt@i915_pm_rpm@system-suspend-modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#1119] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1119] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#52] / [i915#54]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-hsw:          [PASS][37] -> [SKIP][38] ([fdo#109271]) +91 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-hsw2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-hsw2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-snb:          [PASS][39] -> [SKIP][40] ([fdo#109271]) +44 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-snb1/igt@kms_flip@bo-too-big-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-snb1/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#1615]) +44 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb3/igt@kms_flip@dpms-off-confusion.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb3/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271]) +91 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk3/igt@kms_flip@dpms-off-confusion-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-glk9/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-apl:          [PASS][45] -> [SKIP][46] ([fdo#109271]) +41 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-kbl:          [PASS][47] -> [SKIP][48] ([fdo#109271]) +40 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl4/igt@kms_flip@plain-flip-ts-check.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#699] / [i915#93] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][51] -> [FAIL][52] ([i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][53] -> [FAIL][54] ([i915#53] / [i915#93] / [i915#95])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][55] -> [DMESG-WARN][56] ([i915#180]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][57] -> [DMESG-WARN][58] ([i915#165])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@primary_blt:
    - shard-tglb:         [PASS][59] -> [SKIP][60] ([i915#668]) +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb1/igt@kms_psr@primary_blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-tglb6/igt@kms_psr@primary_blt.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb3/igt@kms_psr@psr2_primary_render.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][65] ([fdo#110854]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-tglb:         [FAIL][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb8/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-tglb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-snb6/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [FAIL][73] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [FAIL][75] ([i915#52] / [i915#54]) -> [PASS][76] +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][77] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][79] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][83] ([i915#173]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb1/igt@kms_psr@no_drrs.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb3/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-glk:          [FAIL][87] ([i915#331]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-glk9/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-apl:          [FAIL][89] ([i915#331]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][91] ([i915#658]) -> [SKIP][92] ([i915#588])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][93] ([i915#468]) -> [SKIP][94] ([i915#668])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         [SKIP][95] ([fdo#109274]) -> [SKIP][96] ([i915#1615]) +44 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-iclb6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][97] ([i915#180]) -> [SKIP][98] ([fdo#109271])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl1/igt@kms_flip@flip-vs-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/shard-apl2/igt@kms_flip@flip-vs-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1288]: https://gitlab.freedesktop.org/drm/intel/issues/1288
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1615]: https://gitlab.freedesktop.org/drm/intel/issues/1615
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#488]: https://gitlab.freedesktop.org/drm/intel/issues/488
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5562 -> IGTPW_4402

  CI-20190529: 20190529
  CI_DRM_8244: 55348aac86bd6f0c4ce4d3d8a0e227f6a20a72f9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4402: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/index.html
  IGT_5562: 4770480c8c1f105ff9225e8eb07b652ca954e06a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
