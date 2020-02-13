Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Feb 2020 11:19:15 -0000
Message-ID: <158159275527.17961.14127976756200613827@emeril.freedesktop.org>
References: <20200211111634.10802-1-jani.nikula@intel.com>
In-Reply-To: <20200211111634.10802-1-jani.nikula@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?m=5Fbacklight=3A_ensure_driver_is_loaded_before_checking_backli?=
 =?utf-8?q?ght_=28rev2=29?=
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
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/pm_backlight: ensure driver is loaded before checking backlight (rev2)
URL   : https://patchwork.freedesktop.org/series/73287/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7914_full -> IGTPW_4130_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/index.html

Known issues
------------

  Here are the changes found in IGTPW_4130_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#110841])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#232])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-glk1/igt@gem_eio@unwedge-stress.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-glk1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#694]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-hsw5/igt@gen7_exec_parse@basic-offset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-hsw5/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#413])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb2/igt@i915_pm_rps@reset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#1172])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb6/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-tglb:         [PASS][15] -> [DMESG-FAIL][16] ([i915#402])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([fdo#111703])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#559])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#488])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-glk4/igt@kms_flip@flip-vs-expired-vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-glk8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#1183])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb7/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#668]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb6/igt@kms_psr@psr2_cursor_plane_onoff.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb5/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb1/igt@kms_psr@psr2_suspend.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#112080]) +10 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +22 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][39] ([fdo#112080]) -> [PASS][40] +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb5/igt@gem_ctx_isolation@vcs1-clean.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb2/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb4/igt@gem_exec_schedule@deep-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb3/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-hsw:          [FAIL][43] ([i915#694]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-hsw1/igt@gem_partial_pwrite_pread@reads-display.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-hsw7/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][45] ([i915#644]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][47] ([fdo#111870] / [i915#478]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [DMESG-WARN][49] ([i915#716]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-glk5/igt@gen9_exec_parse@allowed-single.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-glk3/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][51] ([i915#454]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][53] ([i915#413]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb3/igt@i915_pm_rps@waitboost.html

  * igt@kms_color@pipe-a-ctm-negative:
    - shard-tglb:         [FAIL][55] ([i915#1149]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb2/igt@kms_color@pipe-a-ctm-negative.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb1/igt@kms_color@pipe-a-ctm-negative.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [FAIL][57] ([i915#168]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-kbl6/igt@kms_color@pipe-c-ctm-max.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-kbl4/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [FAIL][59] ([i915#168]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-apl7/igt@kms_color@pipe-c-ctm-max.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-apl2/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-tglb:         [FAIL][61] ([fdo#111703]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-tglb:         [DMESG-FAIL][65] ([i915#402]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-tglb:         [FAIL][67] ([i915#559]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-snb:          [DMESG-WARN][69] ([i915#478]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-tglb:         [SKIP][71] ([i915#668]) -> [PASS][72] +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * {igt@kms_hdr@bpc-switch-suspend}:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-apl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-apl:          [FAIL][77] ([i915#899]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-apl8/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-apl6/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][79] ([fdo#109642] / [fdo#111068]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb6/igt@kms_psr2_su@page_flip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [SKIP][83] ([i915#405]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb7/igt@perf@rc6-disable.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb6/igt@perf@rc6-disable.html
    - shard-hsw:          [SKIP][85] ([fdo#109271]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-hsw2/igt@perf@rc6-disable.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-hsw2/igt@perf@rc6-disable.html
    - shard-kbl:          [SKIP][87] ([fdo#109271]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-kbl3/igt@perf@rc6-disable.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-kbl2/igt@perf@rc6-disable.html
    - shard-apl:          [SKIP][89] ([fdo#109271]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-apl1/igt@perf@rc6-disable.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-apl2/igt@perf@rc6-disable.html
    - shard-tglb:         [SKIP][91] ([fdo#111719] / [i915#405]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb2/igt@perf@rc6-disable.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb3/igt@perf@rc6-disable.html
    - shard-glk:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-glk9/igt@perf@rc6-disable.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-glk2/igt@perf@rc6-disable.html

  * igt@perf@short-reads:
    - shard-apl:          [TIMEOUT][95] ([fdo#112271] / [i915#51]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-apl2/igt@perf@short-reads.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-apl2/igt@perf@short-reads.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][97] ([fdo#109276]) -> [PASS][98] +14 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb2/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][99] ([i915#831]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][101] ([fdo#112080]) -> [FAIL][102] ([IGT#28])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][103] ([i915#694]) -> [FAIL][104] ([i915#818])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][105] ([i915#454]) -> [SKIP][106] ([i915#468]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-snb:          [SKIP][107] ([fdo#109271]) -> [INCOMPLETE][108] ([i915#82])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb4/igt@i915_pm_rpm@sysfs-read.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb5/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_pm_rpm@universal-planes:
    - shard-snb:          [INCOMPLETE][109] ([i915#82]) -> [SKIP][110] ([fdo#109271])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb2/igt@i915_pm_rpm@universal-planes.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb2/igt@i915_pm_rpm@universal-planes.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126]) ([fdo#111870] / [i915#1077])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb2/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb5/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb2/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb4/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb2/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7914/shard-snb5/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb2/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb2/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb6/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/shard-snb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1183]: https://gitlab.freedesktop.org/drm/intel/issues/1183
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#488]: https://gitlab.freedesktop.org/drm/intel/issues/488
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5435 -> IGTPW_4130
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7914: e674658d367fffb7611ef546b3cd5ec1a372ad34 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4130: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/index.html
  IGT_5435: 2b6d4476dde53c363b8808ed9f0dd5547ac78641 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4130/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
