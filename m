Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 02 Feb 2020 08:45:25 -0000
Message-ID: <158063312500.17035.11213284414603167486@emeril.freedesktop.org>
References: <20200130183101.20930-1-imre.deak@intel.com>
In-Reply-To: <20200130183101.20930-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv2=2C1/7=5D_lib/igt=5Ffb=3A_Fix_creating_FBs_?=
 =?utf-8?q?on_platforms_w/o_HW_detiling?=
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

Series: series starting with [v2,1/7] lib/igt_fb: Fix creating FBs on platforms w/o HW detiling
URL   : https://patchwork.freedesktop.org/series/72790/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7844_full -> IGTPW_4045_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/index.html

Known issues
------------

  Here are the changes found in IGTPW_4045_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +14 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][3] -> [TIMEOUT][4] ([fdo#112271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@gem_exec_balancer@hang.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb4/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#694]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][11] -> [TIMEOUT][12] ([i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl6/igt@i915_suspend@forcewake.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-apl4/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#79])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-hsw1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#79])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl7/igt@kms_flip@flip-vs-expired-vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-apl8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_psr@cursor_plane_move:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#668])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-tglb8/igt@kms_psr@cursor_plane_move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-tglb3/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl1/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-apl7/igt@kms_setmode@basic.html
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#31])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw5/igt@kms_setmode@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-hsw5/igt@kms_setmode@basic.html

  * igt@prime_vgem@wait-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +13 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb1/igt@prime_vgem@wait-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb7/igt@prime_vgem@wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][35] ([fdo#112080]) -> [PASS][36] +15 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][37] ([i915#694]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@gem_caching@reads.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-hsw1/igt@gem_caching@reads.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * {igt@gem_ctx_persistence@vcs1-hang}:
    - shard-iclb:         [SKIP][41] ([IGT#68]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb8/igt@gem_ctx_persistence@vcs1-hang.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb4/igt@gem_ctx_persistence@vcs1-hang.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44] +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][45] ([i915#644]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][47] ([fdo#111870] / [i915#478]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl4/igt@gem_workarounds@suspend-resume-fd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-apl8/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][51] ([i915#454]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][53] ([i915#413]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [FAIL][55] ([i915#129]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-kbl3/igt@kms_color@pipe-c-ctm-green-to-red.html
    - shard-apl:          [FAIL][57] ([i915#129]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl7/igt@kms_color@pipe-c-ctm-green-to-red.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-apl2/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-hsw:          [INCOMPLETE][59] ([CI#80] / [i915#61]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-hsw6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][61] ([i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][63] ([i915#173]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb1/igt@kms_psr@no_drrs.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb6/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][67] ([fdo#109276]) -> [PASS][68] +17 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb8/igt@prime_busy@hang-bsd2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][69] ([IGT#28]) -> [SKIP][70] ([fdo#112080])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          [SKIP][71] ([fdo#109271]) -> [SKIP][72] ([fdo#109271] / [i915#1099]) +10 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb1/igt@gem_ctx_persistence@clone.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb5/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@rcs0-persistence:
    - shard-hsw:          [SKIP][73] ([fdo#109271]) -> [SKIP][74] ([fdo#109271] / [i915#1099]) +33 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@gem_ctx_persistence@rcs0-persistence.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-hsw1/igt@gem_ctx_persistence@rcs0-persistence.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-glk:          [TIMEOUT][75] ([fdo#112271]) -> [INCOMPLETE][76] ([CI#80] / [i915#1098] / [i915#58] / [k.org#198133])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk3/igt@gem_eio@in-flight-contexts-immediate.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-glk3/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@in-flight-immediate:
    - shard-glk:          [INCOMPLETE][77] ([CI#80] / [i915#58] / [k.org#198133]) -> [TIMEOUT][78] ([fdo#112271])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk2/igt@gem_eio@in-flight-immediate.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-glk3/igt@gem_eio@in-flight-immediate.html

  * igt@gem_eio@unwedge-stress:
    - shard-apl:          [TIMEOUT][79] ([fdo#112271]) -> [INCOMPLETE][80] ([CI#80] / [fdo#103927]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl4/igt@gem_eio@unwedge-stress.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-apl8/igt@gem_eio@unwedge-stress.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][81] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][82] ([fdo#111870] / [i915#478])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-snb:          [INCOMPLETE][83] ([i915#82]) -> [SKIP][84] ([fdo#109271])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb2/igt@i915_pm_rpm@pm-tiling.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb6/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][85] ([i915#725]) -> [DMESG-FAIL][86] ([i915#553] / [i915#725])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@i915_selftest@live_blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-hsw6/igt@i915_selftest@live_blt.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][87] ([fdo#107724]) -> [SKIP][88] ([fdo#109349])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][89], [FAIL][90], [FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95]) ([i915#1077]) -> ([FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103]) ([i915#1077] / [i915#698])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb5/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb2/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb5/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb4/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb1/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb1/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb4/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb6/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb2/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb2/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb5/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb6/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/shard-snb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#68]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/68
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1098]: https://gitlab.freedesktop.org/drm/intel/issues/1098
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4045
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7844: 47faa2a989ef89a15089190a5f942a2d2a34fda5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4045: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
