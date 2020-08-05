Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 05 Aug 2020 15:39:40 -0000
Message-ID: <159664198089.4769.15477225624121775074@emeril.freedesktop.org>
References: <20200511062647.9514-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200511062647.9514-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgTmV3IHN1?=
 =?utf-8?q?btest_for_VRR_Flipline_mode_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1324723034=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1324723034==
Content-Type: multipart/alternative;
 boundary="===============4787412074238538648=="

--===============4787412074238538648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New subtest for VRR Flipline mode (rev3)
URL   : https://patchwork.freedesktop.org/series/77128/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5759_full -> IGTPW_4852_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4852_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4852_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4852_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  * {igt@kms_vrr@flipline} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@kms_vrr@flipline.html
    - shard-iclb:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb2/igt@kms_vrr@flipline.html

  
New tests
---------

  New tests have been introduced between IGT_5759_full and IGTPW_4852_full:

### New IGT tests (1) ###

  * igt@kms_vrr@flipline:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4852_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_exec_whisper@basic-contexts-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_tiled_pread_pwrite:
    - shard-iclb:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb5/igt@gem_tiled_pread_pwrite.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb2/igt@gem_tiled_pread_pwrite.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1602] / [i915#1887])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb3/igt@gem_workarounds@suspend-resume-context.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#1373])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-apl:          [PASS][19] -> [INCOMPLETE][20] ([i915#1373] / [i915#1635])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl8/igt@i915_module_load@reload-with-fault-injection.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [PASS][21] -> [INCOMPLETE][22] ([i915#82])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#926])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@i915_module_load@reload-with-fault-injection.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-kbl:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl6/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-tglb:         [PASS][27] -> [INCOMPLETE][28] ([i915#1602] / [i915#1887] / [i915#456])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb2/igt@i915_suspend@fence-restore-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([IGT#5])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([i915#2055])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_lease@setcrtc_implicit_plane:
    - shard-hsw:          [PASS][37] -> [TIMEOUT][38] ([i915#1958])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_lease@setcrtc_implicit_plane.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@kms_lease@setcrtc_implicit_plane.html
    - shard-snb:          [PASS][39] -> [TIMEOUT][40] ([i915#1958])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_lease@setcrtc_implicit_plane.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb5/igt@kms_lease@setcrtc_implicit_plane.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#83])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb5/igt@kms_panel_fitting@atomic-fastset.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#173])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb8/igt@kms_psr@no_drrs.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-d-wait-busy:
    - shard-tglb:         [PASS][47] -> [DMESG-WARN][48] ([i915#1982]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb5/igt@kms_vblank@pipe-d-wait-busy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@kms_vblank@pipe-d-wait-busy.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#1542])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@perf@blocking-parameterized.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb3/igt@perf@blocking-parameterized.html

  * igt@perf@polling-small-buf:
    - shard-iclb:         [PASS][51] -> [FAIL][52] ([i915#1722])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb8/igt@perf@polling-small-buf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb3/igt@perf@polling-small-buf.html

  * igt@prime_busy@before-wait@rcs0:
    - shard-hsw:          [PASS][53] -> [FAIL][54] ([i915#2258])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@prime_busy@before-wait@rcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@prime_busy@before-wait@rcs0.html

  
#### Possible fixes ####

  * {igt@feature_discovery@psr2}:
    - shard-iclb:         [SKIP][55] ([i915#658]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@feature_discovery@psr2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][57] ([i915#118] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-snb:          [TIMEOUT][59] ([i915#1958]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [INCOMPLETE][61] ([i915#82]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@i915_module_load@reload-no-display.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb4/igt@i915_module_load@reload-no-display.html
    - shard-iclb:         [INCOMPLETE][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@i915_module_load@reload-no-display.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb6/igt@i915_module_load@reload-no-display.html
    - shard-apl:          [INCOMPLETE][65] ([i915#1635]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@i915_module_load@reload-no-display.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl8/igt@i915_module_load@reload-no-display.html
    - shard-glk:          [INCOMPLETE][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@i915_module_load@reload-no-display.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk8/igt@i915_module_load@reload-no-display.html
    - shard-tglb:         [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@i915_module_load@reload-no-display.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb7/igt@i915_module_load@reload-no-display.html
    - shard-hsw:          [INCOMPLETE][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@i915_module_load@reload-no-display.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@i915_module_load@reload-no-display.html
    - shard-kbl:          [INCOMPLETE][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@i915_module_load@reload-no-display.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl2/igt@i915_module_load@reload-no-display.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:
    - shard-apl:          [DMESG-WARN][75] ([i915#1635] / [i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +7 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][79] ([i915#2055]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-kbl:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-256:
    - shard-hsw:          [TIMEOUT][85] ([i915#1958]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_plane_cursor@pipe-c-viewport-size-256.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@kms_plane_cursor@pipe-c-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][89] ([i915#31]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl6/igt@kms_setmode@basic.html

  * igt@prime_busy@after-wait@vcs0:
    - shard-hsw:          [FAIL][91] ([i915#2258]) -> [PASS][92] +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@prime_busy@after-wait@vcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@prime_busy@after-wait@vcs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][93] ([i915#588]) -> [SKIP][94] ([i915#658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][95] ([i915#454]) -> [FAIL][96] ([i915#1665])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-hsw:          [TIMEOUT][97] ([i915#1958]) -> [SKIP][98] ([fdo#109271]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-hsw:          [SKIP][99] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][100] ([i915#1958]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_color_chamelium@pipe-c-ctm-0-25.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@kms_color_chamelium@pipe-c-ctm-0-25.html
    - shard-snb:          [SKIP][101] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][102] ([i915#1958]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-0-25.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-hsw:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-snb:          [TIMEOUT][105] ([i915#1958]) -> [SKIP][106] ([fdo#109271]) +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][107] ([i915#155]) -> [DMESG-WARN][108] ([i915#180])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-snb:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb5/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][111], [FAIL][112]) ([i915#2283]) -> ([FAIL][113], [FAIL][114]) ([i915#142] / [i915#2283])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw8/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@runner@aborted.html
    - shard-kbl:          [FAIL][115] ([i915#1784]) -> [FAIL][116] ([i915#1423] / [i915#1784] / [i915#92])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][117], [FAIL][118]) ([i915#1635] / [i915#2110]) -> ([FAIL][119], [FAIL][120]) ([i915#1423] / [i915#1635] / [i915#2110])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl1/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl4/igt@runner@aborted.html
    - shard-glk:          [FAIL][121] ([k.org#202321]) -> [FAIL][122] ([i915#1423] / [k.org#202321])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk6/igt@runner@aborted.html
    - shard-tglb:         [FAIL][123] ([i915#1852]) -> ([FAIL][124], [FAIL][125], [FAIL][126]) ([i915#1602] / [i915#1852])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb1/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1665]: https://gitlab.freedesktop.org/drm/intel/issues/1665
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1852]: https://gitlab.freedesktop.org/drm/intel/issues/1852
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#926]: https://gitlab.freedesktop.org/drm/intel/issues/926
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5759 -> IGTPW_4852

  CI-20190529: 20190529
  CI_DRM_8845: a486392fed875e0b9154eaeb4bf6a4193484e0b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4852: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/index.html
  IGT_5759: 917b8990f87afa8a04beff8b491450f8bc9201de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/index.html

--===============4787412074238538648==
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
<tr><td><b>Series:</b></td><td>New subtest for VRR Flipline mode (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/77128/">https://patchwork.freedesktop.org/series/77128/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5759_full -&gt; IGTPW_4852_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4852_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4852_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4852_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk6/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@flipline} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@kms_vrr@flipline.html">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb2/igt@kms_vrr@flipline.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5759_full and IGTPW_4852_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_vrr@flipline:<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4852_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_exec_whisper@basic-contexts-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb5/igt@gem_tiled_pread_pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb2/igt@gem_tiled_pread_pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb3/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl1/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl4/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb7/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/926">i915#926</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-forcewake-user:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl6/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb2/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb1/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5">IGT#5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc_implicit_plane:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_lease@setcrtc_implicit_plane.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@kms_lease@setcrtc_implicit_plane.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_lease@setcrtc_implicit_plane.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb5/igt@kms_lease@setcrtc_implicit_plane.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb5/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb5/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb8/igt@kms_psr@no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb1/igt@kms_psr@no_drrs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/173">i915#173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-busy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb5/igt@kms_vblank@pipe-d-wait-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@kms_vblank@pipe-d-wait-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb3/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb8/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb3/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@before-wait@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@prime_busy@before-wait@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@prime_busy@before-wait@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@feature_discovery@psr2}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb4/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb6/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl8/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk8/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb7/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl2/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-c-viewport-size-256:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_plane_cursor@pipe-c-viewport-size-256.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@kms_plane_cursor@pipe-c-viewport-size-256.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl6/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@after-wait@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@prime_busy@after-wait@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw2/igt@prime_busy@after-wait@vcs0.html">PASS</a> +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1665">i915#1665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-snb5/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-hsw7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/142">i915#142</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-kbl1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1423">i915#1423</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1423">i915#1423</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@runner@aborted.html">FAIL</a> (<a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-glk6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1423">i915#1423</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1852">i915#1852</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/shard-tglb6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1852">i915#1852</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5759 -&gt; IGTPW_4852</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8845: a486392fed875e0b9154eaeb4bf6a4193484e0b3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4852: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4852/index.html<br />
  IGT_5759: 917b8990f87afa8a04beff8b491450f8bc9201de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4787412074238538648==--

--===============1324723034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1324723034==--
