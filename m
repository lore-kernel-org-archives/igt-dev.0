Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 14 Feb 2020 20:23:17 -0000
Message-ID: <158171179739.9929.9187586111975031954@emeril.freedesktop.org>
References: <20200212171732.2187-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200212171732.2187-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYmVuY2ht?=
 =?utf-8?q?arks/gem=5Fwsim=3A_Avoid_labs=28unsigned_long=29?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: benchmarks/gem_wsim: Avoid labs(unsigned long)
URL   : https://patchwork.freedesktop.org/series/73375/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7924_full -> IGTPW_4138_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4138_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4138_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4138_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb7/igt@kms_color@pipe-a-legacy-gamma.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb6/igt@kms_color@pipe-a-legacy-gamma.html

  
Known issues
------------

  Here are the changes found in IGTPW_4138_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +16 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_gtt@basic-copy:
    - shard-snb:          [PASS][9] -> [DMESG-WARN][10] ([i915#478])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-snb6/igt@gem_mmap_gtt@basic-copy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-snb5/igt@gem_mmap_gtt@basic-copy.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([i915#42])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-snb5/igt@gem_softpin@noreloc-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-snb2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#447])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([fdo#111703])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-offscreen:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-offscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#559]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-hsw:          [PASS][29] -> [INCOMPLETE][30] ([CI#80] / [i915#61])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-hsw7/igt@kms_flip@basic-flip-vs-dpms.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-hsw5/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#668]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#1184])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#331])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-glk7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-glk3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#331])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#331])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][43] -> [INCOMPLETE][44] ([fdo#103665])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][45] -> [TIMEOUT][46] ([fdo#112271] / [i915#1085])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb1/igt@perf@gen12-mi-rpc.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109276]) +13 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * {igt@gem_ctx_persistence@legacy-engines-mixed-process@blt}:
    - shard-apl:          [FAIL][49] ([i915#679]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-apl4/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-apl2/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * {igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox}:
    - shard-apl:          [INCOMPLETE][51] ([fdo#103927]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-apl4/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-apl2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-kbl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_schedule@pi-shared-iova-blt:
    - shard-kbl:          [INCOMPLETE][55] ([fdo#103665]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-kbl3/igt@gem_exec_schedule@pi-shared-iova-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-kbl1/igt@gem_exec_schedule@pi-shared-iova-blt.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +13 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60] +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_mmap_gtt@basic-small-copy-xy:
    - shard-snb:          [DMESG-WARN][61] ([i915#478]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-snb4/igt@gem_mmap_gtt@basic-small-copy-xy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-snb6/igt@gem_mmap_gtt@basic-small-copy-xy.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-hsw:          [FAIL][63] ([i915#694]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-hsw6/igt@gem_partial_pwrite_pread@reads-uncached.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-hsw6/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-hsw5/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-hsw2/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][67] ([fdo#111870] / [i915#478]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-snb5/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][69] ([fdo#112080]) -> [PASS][70] +7 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb8/igt@i915_hangman@error-state-capture-vcs1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb2/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-tglb:         [FAIL][71] ([i915#1172]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb3/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-glk:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-tglb:         [FAIL][77] ([i915#1184]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb5/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb5/igt@kms_psr@psr2_suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-tglb:         [FAIL][81] ([i915#199]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-tglb2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-tglb5/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][83] ([i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-apl6/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-apl6/igt@kms_setmode@basic.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][85] ([i915#831]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][87] ([i915#818]) -> [FAIL][88] ([i915#694])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-hsw1/igt@gem_tiled_blits@interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][89] ([i915#1226]) -> [SKIP][90] ([fdo#109349])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7924/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#199]: https://gitlab.freedesktop.org/drm/intel/issues/199
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5436 -> IGTPW_4138
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7924: d4ea682de87f4e4378f34f0a196e8fa8983bd306 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4138: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/index.html
  IGT_5436: 00a64098aaae2ac3154841d76c7b034165380282 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4138/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
