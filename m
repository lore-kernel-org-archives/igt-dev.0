Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 25 Jun 2020 16:11:05 -0000
Message-ID: <159310146526.3271.12532682693511287246@emeril.freedesktop.org>
References: <cover.1592840756.git.melissa.srw@gmail.com>
In-Reply-To: <cover.1592840756.git.melissa.srw@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9r?=
 =?utf-8?q?ms=5Fcursor=5Fcrc=3A_tie_some_loose_ends_in_prepare=5Fcrtc?=
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
To: Melissa Wen <melissa.srw@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/kms_cursor_crc: tie some loose ends in prepare_crtc
URL   : https://patchwork.freedesktop.org/series/78813/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8664_full -> IGTPW_4704_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4704_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4704_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4704_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk7/igt@gem_mmap_gtt@fault-concurrent.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-glk7/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-apl4/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_cursor_legacy@all-pipes-forked-move:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw2/igt@kms_cursor_legacy@all-pipes-forked-move.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-hsw2/igt@kms_cursor_legacy@all-pipes-forked-move.html

  
Known issues
------------

  Here are the changes found in IGTPW_4704_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2079])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb5/igt@gem_exec_balancer@bonded-early.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-tglb2/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1185])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb2/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-iclb3/igt@gem_exec_suspend@basic-s3.html
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#118] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk7/igt@gem_exec_whisper@basic-fds-forked-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-glk5/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_mmap_wc@copy:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#93] / [i915#95]) +40 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl2/igt@gem_mmap_wc@copy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl6/igt@gem_mmap_wc@copy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][17] -> [INCOMPLETE][18] ([i915#1436] / [i915#58] / [k.org#198133])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk6/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#402]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb7/igt@i915_module_load@reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-tglb6/igt@i915_module_load@reload.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#54] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1635] / [i915#95]) +37 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982] / [i915#402])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl3/igt@kms_mmap_write_crc@main.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl4/igt@kms_mmap_write_crc@main.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][37] -> [FAIL][38] ([i915#1542])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb5/igt@perf@blocking-parameterized.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-iclb7/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-hsw:          [PASS][39] -> [TIMEOUT][40] ([i915#1958]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw6/igt@perf_pmu@all-busy-idle-check-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-hsw7/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-snb:          [PASS][41] -> [TIMEOUT][42] ([i915#1958])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-snb5/igt@perf_pmu@all-busy-idle-check-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-snb2/igt@perf_pmu@all-busy-idle-check-all.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][43] ([i915#1930]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk5/igt@gem_exec_whisper@basic-queues-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-glk6/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw2/igt@gem_shrink@reclaim.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-hsw8/igt@gem_shrink@reclaim.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][49] ([i915#1958]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw8/igt@gem_userptr_blits@create-destroy-sync.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][51] ([i915#1904]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][53] ([i915#151] / [i915#155]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][55] ([i915#54] / [i915#95]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@busy-flip@a-hdmi-a2:
    - shard-glk:          [FAIL][59] ([i915#275]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk7/igt@kms_flip@busy-flip@a-hdmi-a2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-glk9/igt@kms_flip@busy-flip@a-hdmi-a2.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][61] ([i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [DMESG-FAIL][63] ([i915#1635] / [i915#95]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-iclb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [TIMEOUT][69] ([i915#1958]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-snb6/igt@kms_invalid_dotclock.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-snb1/igt@kms_invalid_dotclock.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][71] ([fdo#108145] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][73] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][75] ([fdo#109642] / [fdo#111068]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb6/igt@kms_psr@psr2_suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-apl:          [DMESG-WARN][79] ([i915#1635] / [i915#95]) -> [PASS][80] +27 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][81] ([i915#1820]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@prime_vgem@basic-blt:
    - shard-tglb:         [DMESG-WARN][83] ([i915#402]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb8/igt@prime_vgem@basic-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-tglb7/igt@prime_vgem@basic-blt.html

  * igt@syncobj_wait@multi-wait-submitted-signaled:
    - shard-kbl:          [DMESG-WARN][85] ([i915#93] / [i915#95]) -> [PASS][86] +38 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl2/igt@syncobj_wait@multi-wait-submitted-signaled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl1/igt@syncobj_wait@multi-wait-submitted-signaled.html

  
#### Warnings ####

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          [SKIP][87] ([fdo#109271]) -> [SKIP][88] ([fdo#109271] / [i915#1635]) +19 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-apl4/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-snb:          [SKIP][89] ([fdo#109271]) -> [TIMEOUT][90] ([i915#1958]) +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-snb1/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-snb2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][91] ([i915#1958]) -> [SKIP][92] ([fdo#109271]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-hsw8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][93] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][94] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [fdo#111827]) -> [SKIP][96] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl3/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-apl6/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-snb:          [TIMEOUT][97] ([i915#1958]) -> [SKIP][98] ([fdo#109271]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-hsw:          [SKIP][99] ([fdo#109271]) -> [TIMEOUT][100] ([i915#1958]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [i915#1635]) -> [SKIP][102] ([fdo#109271]) +12 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-apl7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][103] ([i915#180]) -> [DMESG-WARN][104] ([i915#93] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#275]: https://gitlab.freedesktop.org/drm/intel/issues/275
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4704
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8664: a15b3619fc33a841f92f3939c6bfaffefba28fbf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4704: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4704/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
