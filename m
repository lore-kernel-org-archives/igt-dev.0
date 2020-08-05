Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 05 Aug 2020 19:24:39 -0000
Message-ID: <159665547937.4769.16574774247609808769@emeril.freedesktop.org>
References: <20200805140501.485699-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200805140501.485699-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdDog?=
 =?utf-8?q?fix_missing_syncobj=5Ftimeline_tests_for_Autotools?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1375569780=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1375569780==
Content-Type: multipart/alternative;
 boundary="===============8698967378631237424=="

--===============8698967378631237424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test: fix missing syncobj_timeline tests for Autotools
URL   : https://patchwork.freedesktop.org/series/80298/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5759_full -> IGTPW_4854_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4854_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4854_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4854_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][3] ([i915#1852]) -> ([FAIL][4], [FAIL][5]) ([i915#1602])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb6/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb6/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4854_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][6] -> [INCOMPLETE][7] ([i915#155])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@hang:
    - shard-glk:          [PASS][8] -> [DMESG-WARN][9] ([i915#118] / [i915#95])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_mmap_gtt@hang.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk8/igt@gem_mmap_gtt@hang.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@gem_workarounds@suspend-resume.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl1/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#1899])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-kbl:          [PASS][14] -> [DMESG-WARN][15] ([i915#1982]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:
    - shard-apl:          [PASS][16] -> [DMESG-WARN][17] ([i915#1635] / [i915#1982])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl1/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][18] -> [DMESG-WARN][19] ([i915#1982])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#49])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-tglb:         [PASS][22] -> [DMESG-WARN][23] ([i915#1982]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][24] -> [DMESG-WARN][25] ([i915#1982])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109441]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@kms_psr@psr2_basic.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb1/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [PASS][28] -> [INCOMPLETE][29] ([i915#1798] / [i915#456])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#1542])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@perf@blocking-parameterized.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb4/igt@perf@blocking-parameterized.html

  * igt@perf@create-destroy-userspace-config:
    - shard-glk:          [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@perf@create-destroy-userspace-config.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk9/igt@perf@create-destroy-userspace-config.html
    - shard-apl:          [PASS][34] -> [SKIP][35] ([fdo#109271] / [i915#1635])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl7/igt@perf@create-destroy-userspace-config.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl4/igt@perf@create-destroy-userspace-config.html
    - shard-tglb:         [PASS][36] -> [SKIP][37] ([i915#405])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb5/igt@perf@create-destroy-userspace-config.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb2/igt@perf@create-destroy-userspace-config.html
    - shard-kbl:          [PASS][38] -> [SKIP][39] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl7/igt@perf@create-destroy-userspace-config.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl7/igt@perf@create-destroy-userspace-config.html
    - shard-hsw:          [PASS][40] -> [SKIP][41] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@perf@create-destroy-userspace-config.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw1/igt@perf@create-destroy-userspace-config.html
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([i915#405])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@perf@create-destroy-userspace-config.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb4/igt@perf@create-destroy-userspace-config.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [PASS][44] -> [FAIL][45] ([i915#2258]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html

  * igt@syncobj_basic@bad-create-flags:
    - shard-hsw:          [PASS][46] -> [TIMEOUT][47] ([i915#1958]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@syncobj_basic@bad-create-flags.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw1/igt@syncobj_basic@bad-create-flags.html
    - shard-snb:          [PASS][48] -> [TIMEOUT][49] ([i915#1958]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb6/igt@syncobj_basic@bad-create-flags.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb6/igt@syncobj_basic@bad-create-flags.html
    - shard-apl:          [PASS][50] -> [TIMEOUT][51] ([i915#1635] / [i915#1958]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl6/igt@syncobj_basic@bad-create-flags.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl3/igt@syncobj_basic@bad-create-flags.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][52] ([i915#118] / [i915#95]) -> [PASS][53] +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-snb:          [TIMEOUT][54] ([i915#1958]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [INCOMPLETE][56] ([i915#82]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@i915_module_load@reload-no-display.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb5/igt@i915_module_load@reload-no-display.html
    - shard-iclb:         [INCOMPLETE][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@i915_module_load@reload-no-display.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb5/igt@i915_module_load@reload-no-display.html
    - shard-apl:          [INCOMPLETE][60] ([i915#1635]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@i915_module_load@reload-no-display.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl6/igt@i915_module_load@reload-no-display.html
    - shard-glk:          [INCOMPLETE][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@i915_module_load@reload-no-display.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk2/igt@i915_module_load@reload-no-display.html
    - shard-tglb:         [INCOMPLETE][64] -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@i915_module_load@reload-no-display.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb6/igt@i915_module_load@reload-no-display.html
    - shard-hsw:          [INCOMPLETE][66] -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@i915_module_load@reload-no-display.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw4/igt@i915_module_load@reload-no-display.html
    - shard-kbl:          [INCOMPLETE][68] -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@i915_module_load@reload-no-display.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl6/igt@i915_module_load@reload-no-display.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:
    - shard-apl:          [DMESG-WARN][70] ([i915#1635] / [i915#1982]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73] +7 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][74] ([i915#2055]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-kbl:          [DMESG-WARN][76] ([i915#1982]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][78] ([i915#1982]) -> [PASS][79] +4 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-256:
    - shard-hsw:          [TIMEOUT][80] ([i915#1958]) -> [PASS][81] +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_plane_cursor@pipe-c-viewport-size-256.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw7/igt@kms_plane_cursor@pipe-c-viewport-size-256.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][82] ([fdo#109441]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@kms_psr@psr2_suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb2/igt@kms_psr@psr2_suspend.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-apl:          [INCOMPLETE][84] ([i915#1635] / [i915#1958]) -> [TIMEOUT][85] ([i915#1635] / [i915#1958])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl3/igt@gem_exec_reloc@basic-concurrent16.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl3/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][86] ([i915#588]) -> [SKIP][87] ([i915#658])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-hsw:          [TIMEOUT][88] ([i915#1958]) -> [SKIP][89] ([fdo#109271]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-snb:          [SKIP][90] ([fdo#109271]) -> [TIMEOUT][91] ([i915#1958]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
    - shard-hsw:          [SKIP][92] ([fdo#109271]) -> [TIMEOUT][93] ([i915#1958])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
    - shard-apl:          [SKIP][94] ([fdo#109271] / [i915#1635]) -> [TIMEOUT][95] ([i915#1635] / [i915#1958]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-snb:          [TIMEOUT][96] ([i915#1958]) -> [SKIP][97] ([fdo#109271]) +4 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][98] ([i915#155]) -> [DMESG-WARN][99] ([i915#180])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1852]: https://gitlab.freedesktop.org/drm/intel/issues/1852
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5759 -> IGTPW_4854

  CI-20190529: 20190529
  CI_DRM_8845: a486392fed875e0b9154eaeb4bf6a4193484e0b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4854: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/index.html
  IGT_5759: 917b8990f87afa8a04beff8b491450f8bc9201de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/index.html

--===============8698967378631237424==
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
<tr><td><b>Series:</b></td><td>test: fix missing syncobj_timeline tests for Autotools</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80298/">https://patchwork.freedesktop.org/series/80298/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5759_full -&gt; IGTPW_4854_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4854_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4854_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4854_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1852">i915#1852</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4854_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl1/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_mmap_gtt@hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk8/igt@gem_mmap_gtt@hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl1/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl1/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb1/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb4/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@create-destroy-userspace-config:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk9/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl7/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl4/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb5/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb2/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl7/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl7/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw1/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb4/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@syncobj_basic@bad-create-flags:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@syncobj_basic@bad-create-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw1/igt@syncobj_basic@bad-create-flags.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb6/igt@syncobj_basic@bad-create-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb6/igt@syncobj_basic@bad-create-flags.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl6/igt@syncobj_basic@bad-create-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl3/igt@syncobj_basic@bad-create-flags.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb5/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb5/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl6/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-glk2/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb6/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw4/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl6/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-c-viewport-size-256:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_plane_cursor@pipe-c-viewport-size-256.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw7/igt@kms_plane_cursor@pipe-c-viewport-size-256.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl3/igt@gem_exec_reloc@basic-concurrent16.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl3/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-hsw1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-apl3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5759 -&gt; IGTPW_4854</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8845: a486392fed875e0b9154eaeb4bf6a4193484e0b3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4854: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4854/index.html<br />
  IGT_5759: 917b8990f87afa8a04beff8b491450f8bc9201de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8698967378631237424==--

--===============1375569780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1375569780==--
