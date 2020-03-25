Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Mar 2020 00:23:06 -0000
Message-ID: <158509578646.29633.16790780844617674467@emeril.freedesktop.org>
References: <20200324202930.30231-1-jose.souza@intel.com>
In-Reply-To: <20200324202930.30231-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv6=2C1/7=5D_tests/kms=5Ffrontbuffer?=
 =?utf-8?q?=5Ftracking=3A_Add_tiling_to_test=5Fmode?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v6,1/7] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/75036/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5536_full -> IGTPW_4348_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4348_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4348_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4348_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_capture@capture-blt:
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-snb4/igt@gem_exec_capture@capture-blt.html

  * {igt@kms_frontbuffer_tracking@fbc-tiling-linear} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-glk2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
    - shard-tglb:         NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * {igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  
New tests
---------

  New tests have been introduced between IGT_5536_full and IGTPW_4348_full:

### New IGT tests (4) ###

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - Statuses : 3 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.04] s

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.43] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 3.04] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 4.93] s

  

Known issues
------------

  Here are the changes found in IGTPW_4348_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +14 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#110841])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_parallel@vecs0-fds:
    - shard-glk:          [PASS][13] -> [INCOMPLETE][14] ([i915#529] / [i915#58] / [k.org#198133])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-glk2/igt@gem_exec_parallel@vecs0-fds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-glk4/igt@gem_exec_parallel@vecs0-fds.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#454])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-glk:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-glk6/igt@i915_pm_rpm@dpms-non-lpsp.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-glk3/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([i915#151] / [i915#155])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-kbl6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-kbl2/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][29] -> [FAIL][30] ([i915#57])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([IGT#5] / [i915#697])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#52] / [i915#54]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +19 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][39] ([fdo#112080]) -> [PASS][40] +10 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb3/igt@gem_ctx_isolation@vcs1-clean.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][41] ([fdo#109276] / [i915#677]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][43] ([i915#677]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][47] ([fdo#111870]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw8/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [DMESG-WARN][49] ([fdo#111870] / [i915#478]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [INCOMPLETE][51] ([i915#58] / [k.org#198133]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][55] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][57] ([i915#52] / [i915#54]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][59] ([i915#64]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-apl2/igt@kms_fbcon_fbt@fbc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-apl3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][69] ([fdo#109276]) -> [PASS][70] +13 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][71] ([i915#478]) -> [DMESG-WARN][72] ([fdo#110789] / [i915#478])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
    - shard-snb:          [DMESG-WARN][73] ([i915#478]) -> [DMESG-WARN][74] ([fdo#110789] / [i915#478])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][75] ([i915#454]) -> [SKIP][76] ([i915#468])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][77] ([fdo#111644] / [i915#1397]) -> [SKIP][78] ([i915#1316])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][79] ([fdo#110892]) -> [SKIP][80] ([i915#1316])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-iclb3/igt@i915_pm_rpm@dpms-non-lpsp.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-iclb2/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88]) ([fdo#111870] / [i915#1400] / [i915#1485]) -> ([FAIL][89], [FAIL][90], [FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95]) ([fdo#111870] / [i915#1485] / [i915#478])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw1/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw1/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw1/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw4/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw7/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw2/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw4/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-hsw5/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw5/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw8/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw4/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw2/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw1/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw8/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-hsw6/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][96], [FAIL][97]) ([i915#1485] / [i915#656] / [i915#92]) -> [FAIL][98] ([i915#92])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-kbl7/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-kbl4/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][99], [FAIL][100]) ([fdo#103927] / [i915#1485] / [i915#529]) -> ([FAIL][101], [FAIL][102]) ([fdo#103927] / [i915#529])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-apl6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/shard-apl1/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-apl7/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1400]: https://gitlab.freedesktop.org/drm/intel/issues/1400
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#697]: https://gitlab.freedesktop.org/drm/intel/issues/697
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5536 -> IGTPW_4348

  CI-20190529: 20190529
  CI_DRM_8184: 1a72c9d9d3140e92190485d766b9d165932c5b86 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4348: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/index.html
  IGT_5536: bf17da7fdd7f1d3b4b2f21bccd2a4d17813e5ba7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
