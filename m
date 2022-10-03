Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7517337897087604981=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 03 Oct 2022 10:11:19 -0000
Message-ID: <166479187935.6046.6067834140586542653@emeril.freedesktop.org>
References: <20221003073641.77220-1-nidhi1.gupta@intel.com>
In-Reply-To: <20221003073641.77220-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fwriteback=3A_Test_Cleanup_=28rev9=29?=
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

--===============7517337897087604981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_writeback: Test Cleanup (rev9)
URL   : https://patchwork.freedesktop.org/series/107764/
State : success

== Summary ==

CI Bug Log - changes from IGT_6671_full -> IGTPW_7904_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/index.html

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_7904_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [PASS][1] -> [FAIL][2] ([i915#5784])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-tglb2/igt@gem_eio@reset-stress.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-tglb2/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#4525])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb1/igt@gem_exec_balancer@parallel.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][5] ([i915#2842]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][6] -> [FAIL][7] ([i915#3989] / [i915#454])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-apl:          NOTRUN -> [SKIP][8] ([fdo#109271]) +65 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl3/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-glk:          NOTRUN -> [SKIP][9] ([fdo#109271]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-glk7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-apl7/igt@i915_suspend@sysfs-reader.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#3886])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl1/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#4103])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4103])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-iclb:         [PASS][16] -> [DMESG-FAIL][17] ([i915#1888]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#2346])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][20] -> [INCOMPLETE][21] ([i915#180] / [i915#4939])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109274])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb6/igt@kms_flip@2x-flip-vs-rmfb.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109274] / [fdo#111825] / [i915#3637])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-tglb2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#2587] / [i915#2672]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#2672]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([i915#3555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#1888] / [i915#2546])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#6497])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][31] ([fdo#109271]) +9 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109280] / [fdo#111825])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109441]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#1888])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-glk7/igt@kms_rotation_crc@primary-rotation-270.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-glk2/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-iclb:         [PASS][38] -> [FAIL][39] ([i915#1888])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb3/igt@kms_rotation_crc@primary-rotation-270.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_vblank@pipe-c-wait-idle-hang:
    - shard-apl:          [PASS][40] -> [SKIP][41] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-apl3/igt@kms_vblank@pipe-c-wait-idle-hang.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl7/igt@kms_vblank@pipe-c-wait-idle-hang.html
    - shard-glk:          [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-glk7/igt@kms_vblank@pipe-c-wait-idle-hang.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-glk7/igt@kms_vblank@pipe-c-wait-idle-hang.html

  * igt@perf_pmu@rc6-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][44] ([i915#180])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl2/igt@perf_pmu@rc6-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][45] ([i915#6268]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-tglb8/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [SKIP][47] ([i915#4525]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][49] ([i915#2842]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [FAIL][51] ([i915#2346]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-iclb:         [SKIP][55] ([i915#3555]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-glk:          [FAIL][57] ([i915#1888] / [i915#5852]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][61] ([i915#5519]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-iclb:         [SKIP][63] ([i915#5519]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-iclb:         [WARN][65] ([i915#2684]) -> [FAIL][66] ([i915#2684])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][67] ([i915#2920]) -> [SKIP][68] ([i915#658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][69] ([i915#2920]) -> [SKIP][70] ([fdo#111068] / [i915#658])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [FAIL][71] ([i915#5939]) -> [SKIP][72] ([fdo#109642] / [fdo#111068] / [i915#658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb1/igt@kms_psr2_su@page_flip-p010.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81]) ([i915#180] / [i915#3002] / [i915#4312])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-apl8/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-apl8/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-apl6/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-apl2/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl8/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl2/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl1/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl3/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl3/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5852]: https://gitlab.freedesktop.org/drm/intel/issues/5852
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6671 -> IGTPW_7904

  CI-20190529: 20190529
  CI_DRM_12204: fd2f9b9a4178e667adad268a662eb8a9c0ddc8f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7904: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/index.html
  IGT_6671: e9244bfd0111902aee2d9c09cddf7c38a6f6d0ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/index.html

--===============7517337897087604981==
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
<tr><td><b>Series:</b></td><td>tests/kms_writeback: Test Cleanup (rev9)</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107764/">https://patchwork.freedesktop.org/series/107764/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7904/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7904/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6671_full -&gt; IGTPW_7904_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/index.=
html</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7904_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-tglb2/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-tglb2/igt@gem=
_eio@reset-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb1/igt@gem_exec_balancer@parallel.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb5/i=
gt@gem_exec_balancer@parallel.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb3/igt@i91=
5_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3989">i915#3989</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-apl3/igt@i915_pm_rpm@modeset-lpsp.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) +65 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-glk7/igt@i915_pm_rpm@modeset-lpsp-stress-no-=
wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-apl7/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl8/igt@=
i915_suspend@sysfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-apl8/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-apl1/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7904/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7904/shard-iclb8/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7904/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1888">i915#1888</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitio=
ns-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@a=
tomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl1/igt@=
kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/4939">i915#4939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7904/shard-iclb6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo=
#109274</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7904/shard-tglb2/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo=
#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3637">i915#3637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) =
+2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yti=
le-downscaling@pipe-a-default-mode.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb2/igt@kms_flip_scaled=
_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">=
i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb=
-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7904/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-pri-indfb-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/6497">i915#6497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7904/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-s=
cndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +9 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7904/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7904/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb1=
/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6671/shard-glk7/igt@kms_rotation_crc@primary-rotation-270.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shar=
d-glk2/igt@kms_rotation_crc@primary-rotation-270.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6671/shard-iclb3/igt@kms_rotation_crc@primary-rotation-270.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/sha=
rd-iclb8/igt@kms_rotation_crc@primary-rotation-270.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle-hang:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6671/shard-apl3/igt@kms_vblank@pipe-c-wait-idle-hang.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl=
7/igt@kms_vblank@pipe-c-wait-idle-hang.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6671/shard-glk7/igt@kms_vblank@pipe-c-wait-idle-hang.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-glk=
7/igt@kms_vblank@pipe-c-wait-idle-hang.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7904/shard-apl2/igt@perf_pmu@rc6-suspend.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i91=
5#180</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/sha=
rd-tglb8/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_790=
4/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904=
/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7904/shard-glk2/igt@kms_cursor_legacy@flip-vs-curs=
or@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7904/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.h=
tml">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-=
ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-iclb3/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default=
-mode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytil=
e-downscaling@pipe-a-valid-mode.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5852">i915#5852</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-glk6/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/s=
hard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6671/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overla=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7904/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidat=
e-overlay.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6671/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overla=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7904/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidat=
e-overlay.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#26=
84</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_790=
4/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7904/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#292=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904=
/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6671/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-i=
clb1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6671/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/shard-apl8/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/=
shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6671/shard-apl2/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4312">i915#4312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7904/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl2/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7904/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/shard-apl3/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7904/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6671 -&gt; IGTPW_7904</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12204: fd2f9b9a4178e667adad268a662eb8a9c0ddc8f8 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7904: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7904/index.htm=
l<br />
  IGT_6671: e9244bfd0111902aee2d9c09cddf7c38a6f6d0ce @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7517337897087604981==--
