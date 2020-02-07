Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Feb 2020 21:10:21 -0000
Message-ID: <158110982101.8754.14132086573104468391@emeril.freedesktop.org>
References: <20200205115915.1823074-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200205115915.1823074-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fexec=3A_Update_the_list_of_engines_on_the_actual_con?=
 =?utf-8?q?text?=
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

Series: i915/gem_ctx_exec: Update the list of engines on the actual context
URL   : https://patchwork.freedesktop.org/series/73022/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7869_full -> IGTPW_4099_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/index.html

Known issues
------------

  Here are the changes found in IGTPW_4099_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +15 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@gem_exec_schedule@fifo-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb6/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#694])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw7/igt@gem_partial_pwrite_pread@reads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-hsw4/igt@gem_partial_pwrite_pread@reads.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#413]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb7/igt@i915_pm_rps@reset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb3/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][13] -> [DMESG-FAIL][14] ([i915#553] / [i915#725])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw2/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-hsw6/igt@i915_selftest@live_blt.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#247])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-kbl1/igt@kms_plane@plane-position-covered-pipe-b-planes.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#247])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl2/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-apl2/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#899])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#112080]) +13 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb6/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-iclb:         [INCOMPLETE][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@gem_ctx_exec@basic-nohangcheck.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb6/igt@gem_ctx_exec@basic-nohangcheck.html
    - shard-apl:          [INCOMPLETE][39] ([fdo#103927]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl6/igt@gem_ctx_exec@basic-nohangcheck.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-apl1/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_parallel@vcs1:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +12 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb5/igt@gem_exec_parallel@vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb1/igt@gem_exec_parallel@vcs1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44] +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-hsw:          [FAIL][45] ([i915#694]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw7/igt@gem_partial_pwrite_pread@write.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-hsw1/igt@gem_partial_pwrite_pread@write.html

  * igt@i915_pm_rps@reset:
    - shard-apl:          [FAIL][47] ([i915#39]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl1/igt@i915_pm_rps@reset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-apl8/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][49] ([i915#413]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-tglb7/igt@i915_pm_rps@waitboost.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-tglb8/igt@i915_pm_rps@waitboost.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb8/igt@kms_psr@psr2_basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][57] ([i915#61]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw4/igt@perf_pmu@cpu-hotplug.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-hsw2/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +25 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][61] ([IGT#28]) -> [SKIP][62] ([fdo#112080])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][63] ([i915#818]) -> [FAIL][64] ([i915#694])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][65] ([i915#694]) -> [FAIL][66] ([i915#818])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw1/igt@gem_tiled_blits@normal.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][67] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][68] ([fdo#110789] / [fdo#111870] / [i915#478])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][69] ([i915#454]) -> [SKIP][70] ([i915#468])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5419 -> IGTPW_4099
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7869: db0579be255412f38a450c3c577f8d10f1195034 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4099: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/index.html
  IGT_5419: 44913a91e77434b03001bb9ea53216cd03c476e6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4099/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
