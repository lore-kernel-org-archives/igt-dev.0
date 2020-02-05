Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 05 Feb 2020 22:58:46 -0000
Message-ID: <158094352605.17319.17622768957834369628@emeril.freedesktop.org>
References: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBL?=
 =?utf-8?q?ill_residual_children_at_the_end_of_a_subtest_=28rev3=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Kill residual children at the end of a subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/72885/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5414_full -> IGTPW_4079_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4079_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4079_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4079_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-hsw4/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4079_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#112080]) +13 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb8/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#112146]) +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([i915#677]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276]) +16 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#644])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_pwrite@big-cpu-fbr:
    - shard-hsw:          [PASS][12] -> [INCOMPLETE][13] ([CI#80] / [i915#61])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-hsw2/igt@gem_pwrite@big-cpu-fbr.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-hsw7/igt@gem_pwrite@big-cpu-fbr.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][14] -> [DMESG-WARN][15] ([fdo#111870] / [i915#478])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-snb2/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#413])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb2/igt@i915_pm_rps@reset.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb2/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([i915#1140]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@pipe-a-forked-bo:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#118] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-glk3/igt@kms_cursor_legacy@pipe-a-forked-bo.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-glk6/igt@kms_cursor_legacy@pipe-a-forked-bo.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#46])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#79])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180]) +4 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][30] -> [FAIL][31] ([i915#31])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-hsw7/igt@kms_setmode@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-hsw8/igt@kms_setmode@basic.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][32] -> [INCOMPLETE][33] ([i915#61])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-hsw8/igt@perf_pmu@cpu-hotplug.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-hsw4/igt@perf_pmu@cpu-hotplug.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@fifo-bsd:
    - shard-iclb:         [SKIP][34] ([fdo#112146]) -> [PASS][35] +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb2/igt@gem_exec_schedule@fifo-bsd.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb6/igt@gem_exec_schedule@fifo-bsd.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [SKIP][36] ([fdo#109276]) -> [PASS][37] +13 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb7/igt@gem_exec_schedule@fifo-bsd1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb4/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][38] ([i915#677]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_store@pages-vcs1:
    - shard-iclb:         [SKIP][40] ([fdo#112080]) -> [PASS][41] +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb7/igt@gem_exec_store@pages-vcs1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb2/igt@gem_exec_store@pages-vcs1.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-hsw:          [FAIL][42] ([i915#694]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-hsw7/igt@gem_partial_pwrite_pread@reads-snoop.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-hsw5/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][44] ([i915#180]) -> [PASS][45] +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-kbl1/igt@i915_suspend@forcewake.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-kbl3/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [SKIP][46] ([i915#1140]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen:
    - shard-apl:          [FAIL][48] ([i915#54]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][50] ([i915#72]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-snb:          [DMESG-WARN][52] ([i915#478]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][54] ([i915#79]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][56] ([i915#180]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-iclb:         [INCOMPLETE][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][60] ([fdo#109642] / [fdo#111068]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][62] ([fdo#109441]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][64] ([i915#31]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-apl2/igt@kms_setmode@basic.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][66] ([fdo#103665]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][68] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-tglb7/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][70] ([fdo#112080]) -> [FAIL][71] ([IGT#28])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][72] ([i915#818]) -> [FAIL][73] ([i915#694])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][74] ([i915#454]) -> [SKIP][75] ([i915#468])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][76] ([fdo#109349]) -> [DMESG-WARN][77] ([fdo#107724])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5414/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5414 -> IGTPW_4079

  CI-20190529: 20190529
  CI_DRM_7859: b7b84e9f2d009d833774aa851d2dd3f78ba6a8c5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4079: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/index.html
  IGT_5414: afd48dacf43b2a4f93337af3dcab5228ffd3acad @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4079/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
