Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 08 Feb 2020 01:18:14 -0000
Message-ID: <158112469499.30229.5783737582910322237@emeril.freedesktop.org>
References: <20200205135532.15757-1-ramalingam.c@intel.com>
In-Reply-To: <20200205135532.15757-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?dumb=5Fbuffer=3A_page=5Fsize_for_create=5Fclear?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/dumb_buffer: page_size for create_clear
URL   : https://patchwork.freedesktop.org/series/73030/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7869_full -> IGTPW_4102_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/index.html

Known issues
------------

  Here are the changes found in IGTPW_4102_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2] ([fdo#103665])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl7/igt@gem_ctx_exec@basic-nohangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-kbl6/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-apl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#694])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-hsw4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([fdo#110789] / [i915#478])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-snb1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-snb5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][13] -> [DMESG-FAIL][14] ([i915#725])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw2/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#472])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-tglb5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-tglb6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-snb:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#407])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk9/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-glk5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#112080]) +15 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb3/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109276]) +10 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-apl:          [INCOMPLETE][37] ([fdo#103927]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl6/igt@gem_ctx_exec@basic-nohangcheck.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-apl3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][39] ([i915#677]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][41] ([fdo#109276]) -> [PASS][42] +25 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44] +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-hsw:          [FAIL][45] ([i915#694]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw7/igt@gem_partial_pwrite_pread@write.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-hsw4/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][47] ([i915#644]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][49] ([fdo#111870] / [i915#478]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-snb5/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rps@reset:
    - shard-apl:          [FAIL][51] ([i915#39]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl1/igt@i915_pm_rps@reset.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-apl2/igt@i915_pm_rps@reset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][53] ([i915#79]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][61] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-tglb8/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][63] ([fdo#112080]) -> [PASS][64] +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][65] ([i915#694]) -> [FAIL][66] ([i915#818])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw1/igt@gem_tiled_blits@normal.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][67] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][68] ([fdo#110789] / [fdo#111870] / [i915#478])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5419 -> IGTPW_4102
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7869: db0579be255412f38a450c3c577f8d10f1195034 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4102: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/index.html
  IGT_5419: 44913a91e77434b03001bb9ea53216cd03c476e6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4102/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
