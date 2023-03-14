Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4174123225301657686=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Petri Latvala" <adrinael@adrinael.net>
Date: Tue, 14 Mar 2023 08:52:33 -0000
Message-ID: <167878395365.26413.15170223110912580747@emeril.freedesktop.org>
References: <20230313094051.2395229-1-adrinael@adrinael.net>
In-Reply-To: <20230313094051.2395229-1-adrinael@adrinael.net>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZ2l0bGFi?=
 =?utf-8?q?-ci=3A_Remove_senseless_runner_restriction?=
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

--===============4174123225301657686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gitlab-ci: Remove senseless runner restriction
URL   : https://patchwork.freedesktop.org/series/115047/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7191_full -> IGTPW_8594_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8594_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8594_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html

Participating hosts (8 -> 10)
------------------------------

  Additional (2): shard-rkl0 shard-tglu-9 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8594_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_hwmon@hwmon-read:
    - shard-glk:          NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@i915_hwmon@hwmon-read.html

  * igt@syncobj_timeline@wait-for-submit-snapshot:
    - shard-glk:          [PASS][2] -> [TIMEOUT][3] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk4/igt@syncobj_timeline@wait-for-submit-snapshot.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@syncobj_timeline@wait-for-submit-snapshot.html

  
#### Warnings ####

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-glk:          [SKIP][4] ([fdo#109271]) -> [TIMEOUT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s0@smem:
    - {shard-tglu}:       [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-4/igt@gem_exec_suspend@basic-s0@smem.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-3/igt@gem_exec_suspend@basic-s0@smem.html

  
Known issues
------------

  Here are the changes found in IGTPW_8594_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu-9:       NOTRUN -> [SKIP][8] ([i915#7456])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@eof:
    - shard-tglu-9:       NOTRUN -> [SKIP][9] ([i915#2582])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@fbdev@eof.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu-9:       NOTRUN -> [SKIP][10] ([i915#280])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu-9:       NOTRUN -> [SKIP][14] ([i915#4613]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][15] ([i915#2658])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl3/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-tglu-9:       NOTRUN -> [SKIP][16] ([i915#4270]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu-9:       NOTRUN -> [SKIP][17] ([i915#3297])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-tglu-9:       NOTRUN -> [SKIP][18] ([fdo#109289])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu-9:       NOTRUN -> [SKIP][19] ([i915#2527] / [i915#2856]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglu-9:       NOTRUN -> [SKIP][22] ([i915#1397]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglu-9:       NOTRUN -> [SKIP][23] ([i915#3547])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@i915_pm_rpm@i2c.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs:
    - shard-tglu-9:       NOTRUN -> [SKIP][24] ([fdo#111615] / [i915#1845] / [i915#7651]) +7 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#3886]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl1/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-9:       NOTRUN -> [SKIP][26] ([i915#3742])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-tglu-9:       NOTRUN -> [SKIP][27] ([fdo#111827])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-9:       NOTRUN -> [SKIP][28] ([i915#7828]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@ctm-0-50:
    - shard-tglu-9:       NOTRUN -> [SKIP][29] ([i915#3546])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_color@ctm-0-50.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-tglu-9:       NOTRUN -> [SKIP][30] ([i915#1845]) +11 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-tglu-9:       NOTRUN -> [SKIP][31] ([i915#1845] / [i915#7651]) +50 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#2346])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_fence_pin_leak:
    - shard-tglu-9:       NOTRUN -> [SKIP][34] ([fdo#109274] / [i915#1845]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu-9:       NOTRUN -> [SKIP][35] ([fdo#109274] / [i915#3637]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-tglu-9:       NOTRUN -> [SKIP][36] ([i915#3637]) +5 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-tglu-9:       NOTRUN -> [SKIP][37] ([i915#3555]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-tglu-9:       NOTRUN -> [SKIP][38] ([i915#1849]) +30 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-planes:
    - shard-tglu-9:       NOTRUN -> [SKIP][39] ([i915#1849] / [i915#3558]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-tglu-9:       NOTRUN -> [SKIP][40] ([i915#3555] / [i915#6953])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-tglu-9:       NOTRUN -> [SKIP][41] ([fdo#111068] / [i915#658])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@cursor_blt:
    - shard-tglu-9:       NOTRUN -> [SKIP][42] ([fdo#110189]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_psr@cursor_blt.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c:
    - shard-tglu-9:       NOTRUN -> [SKIP][43] ([fdo#109274]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu-9:       NOTRUN -> [SKIP][44] ([i915#2437])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_writeback@writeback-check-output.html

  * igt@perf@enable-disable:
    - shard-glk:          [PASS][45] -> [TIMEOUT][46] ([i915#6943])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk1/igt@perf@enable-disable.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@perf@enable-disable.html

  * igt@v3d/v3d_perfmon@create-two-perfmon:
    - shard-tglu-9:       NOTRUN -> [SKIP][47] ([fdo#109315] / [i915#2575]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@v3d/v3d_perfmon@create-two-perfmon.html

  * igt@vc4/vc4_label_bo@set-kernel-name:
    - shard-tglu-9:       NOTRUN -> [SKIP][48] ([i915#2575]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@vc4/vc4_label_bo@set-kernel-name.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271]) +27 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl2/igt@vc4/vc4_perfmon@create-single-perfmon.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@idle@rcs0:
    - {shard-rkl}:        [FAIL][50] ([i915#7742]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html

  * igt@fbdev@info:
    - {shard-rkl}:        [SKIP][52] ([i915#2582]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-1/igt@fbdev@info.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@fbdev@info.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-rkl}:        [FAIL][54] ([i915#6268]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - {shard-rkl}:        [SKIP][56] ([i915#6252]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-3/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_eio@in-flight-suspend:
    - {shard-rkl}:        [FAIL][58] ([fdo#103375]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - {shard-rkl}:        [SKIP][60] ([i915#6247]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-4/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - {shard-rkl}:        [FAIL][62] ([i915#2842]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][64] ([i915#2842]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - {shard-rkl}:        [SKIP][66] ([i915#3281]) -> [PASS][67] +8 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_mmap_wc@set-cache-level:
    - {shard-tglu}:       [SKIP][68] ([i915#1850]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-6/igt@gem_mmap_wc@set-cache-level.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-8/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_set_tiling_vs_pwrite:
    - {shard-rkl}:        [SKIP][70] ([i915#3282]) -> [PASS][71] +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@gem_set_tiling_vs_pwrite.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [ABORT][72] ([i915#5566]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@shadow-peek:
    - {shard-rkl}:        [SKIP][74] ([i915#2527]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-rkl}:        [SKIP][76] ([i915#4281]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-rkl}:        [SKIP][78] ([i915#1397]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_atomic@plane-overlay-legacy:
    - {shard-rkl}:        [SKIP][80] ([i915#1845] / [i915#4098]) -> [PASS][81] +15 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-4/igt@kms_atomic@plane-overlay-legacy.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_atomic@plane-overlay-legacy.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - {shard-tglu}:       [SKIP][82] ([i915#1845] / [i915#7651]) -> [PASS][83] +16 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-6/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-1/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][84] ([i915#2346]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - {shard-rkl}:        [SKIP][86] ([i915#1257]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-4/igt@kms_dp_aux_dev.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_dp_aux_dev.html

  * igt@kms_fbcon_fbt@fbc:
    - {shard-rkl}:        [SKIP][88] ([i915#4098]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-4/igt@kms_fbcon_fbt@fbc.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - {shard-rkl}:        [SKIP][90] ([i915#1849] / [i915#4098]) -> [PASS][91] +7 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_plane@plane-position-hole@pipe-b-planes:
    - {shard-rkl}:        [SKIP][92] ([i915#1849]) -> [PASS][93] +4 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - {shard-tglu}:       [INCOMPLETE][94] -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-7/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-5/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_properties@plane-properties-legacy:
    - {shard-tglu}:       [SKIP][96] ([i915#1849]) -> [PASS][97] +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-6/igt@kms_properties@plane-properties-legacy.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-8/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr@cursor_render:
    - {shard-rkl}:        [SKIP][98] ([i915#1072]) -> [PASS][99] +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-3/igt@kms_psr@cursor_render.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_psr@cursor_render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - {shard-rkl}:        [SKIP][100] ([i915#5461]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:
    - {shard-rkl}:        [SKIP][102] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b:
    - {shard-tglu}:       [SKIP][104] ([fdo#109274]) -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-2/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html

  * igt@kms_vblank@pipe-a-accuracy-idle:
    - shard-glk:          [FAIL][106] ([i915#43]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk5/igt@kms_vblank@pipe-a-accuracy-idle.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@kms_vblank@pipe-a-accuracy-idle.html

  * igt@perf@mi-rpc:
    - {shard-rkl}:        [SKIP][108] ([i915#2434]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-3/igt@perf@mi-rpc.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@perf@mi-rpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6943]: https://gitlab.freedesktop.org/drm/intel/issues/6943
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8154]: https://gitlab.freedesktop.org/drm/intel/issues/8154
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8282]: https://gitlab.freedesktop.org/drm/intel/issues/8282


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7191 -> IGTPW_8594

  CI-20190529: 20190529
  CI_DRM_12842: a8c602a36e7019429967251dd72737795ee130aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8594: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html
  IGT_7191: a6766ee8a971366299671b06af8febc8192c0f74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html

--===============4174123225301657686==
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
<tr><td><b>Series:</b></td><td>gitlab-ci: Remove senseless runner restriction</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115047/">https://patchwork.freedesktop.org/series/115047/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7191_full -&gt; IGTPW_8594_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8594_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8594_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html</p>
<h2>Participating hosts (8 -&gt; 10)</h2>
<p>Additional (2): shard-rkl0 shard-tglu-9 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8594_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@i915_hwmon@hwmon-read.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-for-submit-snapshot:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk4/igt@syncobj_timeline@wait-for-submit-snapshot.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@syncobj_timeline@wait-for-submit-snapshot.html">TIMEOUT</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_suspend@basic-s0@smem:<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-4/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-3/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8594_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl3/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@i915_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3547">i915#3547</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl1/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-planes:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3558">i915#3558</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_blt:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_psr@cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk1/igt@perf@enable-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@perf@enable-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6943">i915#6943</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-two-perfmon:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@v3d/v3d_perfmon@create-two-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-kernel-name:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-9/igt@vc4/vc4_label_bo@set-kernel-name.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl2/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@fbdev@info.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-3/igt@gem_ctx_persistence@engines-hang@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_eio@in-flight-suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6247">i915#6247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-4/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-6/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1850">i915#1850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-8/igt@gem_mmap_wc@set-cache-level.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-apl7/igt@gen9_exec_parse@allowed-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl2/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-overlay-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-4/igt@kms_atomic@plane-overlay-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_atomic@plane-overlay-legacy.html">PASS</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-6/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-1/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">PASS</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1257">i915#1257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-4/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-7/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-5/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-6/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-8/igt@kms_properties@plane-properties-legacy.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_render:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-3/igt@kms_psr@cursor_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_psr@cursor_render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5461">i915#5461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-tglu-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-tglu-2/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-glk5/igt@kms_vblank@pipe-a-accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-glk5/igt@kms_vblank@pipe-a-accuracy-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7191/shard-rkl-3/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/shard-rkl-5/igt@perf@mi-rpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7191 -&gt; IGTPW_8594</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12842: a8c602a36e7019429967251dd72737795ee130aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8594: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8594/index.html<br />
  IGT_7191: a6766ee8a971366299671b06af8febc8192c0f74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4174123225301657686==--
