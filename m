Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Jul 2020 15:45:06 -0000
Message-ID: <159422310665.3838.12870488037058924308@emeril.freedesktop.org>
References: <20200708115933.5662-1-adam.miszczak@intel.com>
In-Reply-To: <20200708115933.5662-1-adam.miszczak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fpartial=5Fpwrite=5Fpread=3A_Remove_libdrm_dependency?=
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
To: "Miszczak, Adam" <adam.miszczak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_partial_pwrite_pread: Remove libdrm dependency
URL   : https://patchwork.freedesktop.org/series/79244/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8715_full -> IGTPW_4747_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4747_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4747_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4747_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@contexts@vcs1:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-iclb2/igt@gem_exec_parallel@contexts@vcs1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4747_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@hang:
    - shard-tglb:         [PASS][2] -> [DMESG-WARN][3] ([i915#402]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb5/igt@gem_ctx_persistence@hang.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-tglb5/igt@gem_ctx_persistence@hang.html

  * igt@gem_eio@unwedge-stress:
    - shard-hsw:          [PASS][4] -> [TIMEOUT][5] ([i915#1958] / [i915#2119]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw7/igt@gem_eio@unwedge-stress.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-hsw2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_params@invalid-bsd1-flag-on-render:
    - shard-hsw:          [PASS][6] -> [DMESG-WARN][7] ([i915#1982])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw8/igt@gem_exec_params@invalid-bsd1-flag-on-render.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-hsw6/igt@gem_exec_params@invalid-bsd1-flag-on-render.html

  * igt@gem_workarounds@reset-fd:
    - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#1635] / [i915#95]) +39 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@gem_workarounds@reset-fd.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl4/igt@gem_workarounds@reset-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#1436] / [i915#716])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live@gt_pm:
    - shard-apl:          [PASS][12] -> [DMESG-FAIL][13] ([i915#1751])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl6/igt@i915_selftest@live@gt_pm.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl7/igt@i915_selftest@live@gt_pm.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - shard-snb:          [PASS][14] -> [TIMEOUT][15] ([i915#1958] / [i915#2119]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb6/igt@kms_addfb_basic@bad-pitch-63.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-snb4/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#1982])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl2/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl6/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][18] -> [DMESG-FAIL][19] ([i915#118] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#71])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_color@pipe-c-degamma.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl7/igt@kms_color@pipe-c-degamma.html
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#71])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk2/igt@kms_color@pipe-c-degamma.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-glk7/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#71])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_color@pipe-c-degamma.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl2/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][26] -> [DMESG-FAIL][27] ([i915#54] / [i915#95]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#54])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled:
    - shard-apl:          [PASS][32] -> [DMESG-FAIL][33] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][36] -> [DMESG-FAIL][37] ([i915#95]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#93] / [i915#95]) +44 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][40] -> [DMESG-WARN][41] ([i915#1982]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][42] -> [DMESG-FAIL][43] ([i915#1635] / [i915#95]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][44] -> [DMESG-WARN][45] ([i915#1982])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb4/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@enable-disable:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([i915#405])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb3/igt@perf@enable-disable.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-iclb8/igt@perf@enable-disable.html
    - shard-hsw:          [PASS][50] -> [SKIP][51] ([fdo#109271])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw1/igt@perf@enable-disable.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-hsw6/igt@perf@enable-disable.html
    - shard-kbl:          [PASS][52] -> [SKIP][53] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl4/igt@perf@enable-disable.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl2/igt@perf@enable-disable.html
    - shard-apl:          [PASS][54] -> [SKIP][55] ([fdo#109271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl6/igt@perf@enable-disable.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl8/igt@perf@enable-disable.html
    - shard-tglb:         [PASS][56] -> [SKIP][57] ([i915#405])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb7/igt@perf@enable-disable.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-tglb6/igt@perf@enable-disable.html
    - shard-glk:          [PASS][58] -> [SKIP][59] ([fdo#109271])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk3/igt@perf@enable-disable.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-glk6/igt@perf@enable-disable.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][60] -> [FAIL][61] ([i915#1542])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb5/igt@perf@polling-parameterized.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-iclb8/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-iclb:         [FAIL][62] ([i915#926]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb1/igt@gem_exec_balancer@bonded-early.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-iclb1/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][64] ([i915#1930]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [DMESG-WARN][66] ([i915#118] / [i915#95]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk9/igt@gem_exec_whisper@basic-normal.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-glk6/igt@gem_exec_whisper@basic-normal.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [DMESG-WARN][68] ([i915#402]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_addfb_basic@unused-pitches:
    - shard-kbl:          [DMESG-WARN][70] ([i915#93] / [i915#95]) -> [PASS][71] +39 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl1/igt@kms_addfb_basic@unused-pitches.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl7/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [DMESG-FAIL][72] ([i915#54] / [i915#95]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [DMESG-WARN][74] ([i915#1635] / [i915#95]) -> [PASS][75] +33 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-hsw:          [TIMEOUT][76] ([i915#1958] / [i915#2119]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw8/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][78] ([i915#1525]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][80] ([i915#64]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][82] ([i915#2055]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-kbl:          [DMESG-WARN][84] ([i915#180]) -> [PASS][85] +6 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl2/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl2/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][86] ([i915#49]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [FAIL][88] ([i915#49]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][90] ([i915#1982]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-glk2/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-tglb:         [DMESG-WARN][92] ([i915#1982]) -> [PASS][93] +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][94] ([i915#95]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [DMESG-FAIL][96] ([i915#1635] / [i915#95]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-b-primary-size-128:
    - shard-hsw:          [INCOMPLETE][98] -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw7/igt@kms_plane_cursor@pipe-b-primary-size-128.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-hsw2/igt@kms_plane_cursor@pipe-b-primary-size-128.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][100] ([fdo#109441]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][102] ([i915#1820]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][104] ([i915#1930]) -> [TIMEOUT][105] ([i915#1958] / [i915#2119])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][106] ([i915#2036]) -> [WARN][107] ([i915#2021])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb1/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@gem_vm_create@execbuf:
    - shard-hsw:          [TIMEOUT][108] ([i915#1958] / [i915#2119]) -> [SKIP][109] ([fdo#109271]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw8/igt@gem_vm_create@execbuf.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-hsw2/igt@gem_vm_create@execbuf.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - shard-apl:          [SKIP][110] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][111] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl1/igt@kms_chamelium@hdmi-crc-fast.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl1/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-apl:          [SKIP][112] ([fdo#109271] / [fdo#111827]) -> [SKIP][113] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [DMESG-FAIL][114] ([fdo#110321] / [i915#1635] / [i915#95]) -> [FAIL][115] ([fdo#110321] / [fdo#110336])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-apl:          [SKIP][116] ([fdo#109271] / [i915#1635]) -> [SKIP][117] ([fdo#109271]) +8 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][118] ([i915#93] / [i915#95]) -> [INCOMPLETE][119] ([i915#155])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
    - shard-apl:          [SKIP][120] ([fdo#109271]) -> [SKIP][121] ([fdo#109271] / [i915#1635]) +15 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [DMESG-FAIL][122] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][123] ([fdo#108145] / [i915#265])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [FAIL][124] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][125] ([fdo#108145] / [i915#1635] / [i915#95])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [FAIL][126] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][127] ([fdo#108145] / [i915#95])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-256:
    - shard-snb:          [SKIP][128] ([fdo#109271]) -> [TIMEOUT][129] ([i915#1958] / [i915#2119]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb2/igt@kms_plane_cursor@pipe-c-viewport-size-256.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-snb4/igt@kms_plane_cursor@pipe-c-viewport-size-256.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          [FAIL][130] ([IGT#2]) -> [DMESG-FAIL][131] ([IGT#2] / [i915#95])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl2/igt@kms_sysfs_edid_timing.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl3/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][132] ([i915#93] / [i915#95]) -> [DMESG-WARN][133] ([i915#180])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-query-forked:
    - shard-hsw:          [SKIP][134] ([fdo#109271]) -> [TIMEOUT][135] ([i915#1958] / [i915#2119])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw1/igt@kms_vblank@pipe-d-query-forked.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-hsw2/igt@kms_vblank@pipe-d-query-forked.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][136] ([i915#1436] / [i915#1784] / [i915#2110]) -> ([FAIL][137], [FAIL][138]) ([fdo#109271] / [i915#1436] / [i915#1784] / [i915#2110] / [i915#716])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl2/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][139], [FAIL][140], [FAIL][141]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][142] ([i915#1635] / [i915#2110])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl1/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl3/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-apl1/igt@runner@aborted.html
    - shard-tglb:         [FAIL][143] ([i915#2110]) -> [FAIL][144] ([i915#1764] / [i915#2110])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb7/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/shard-tglb3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1751]: https://gitlab.freedesktop.org/drm/intel/issues/1751
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#926]: https://gitlab.freedesktop.org/drm/intel/issues/926
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5728 -> IGTPW_4747
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8715: 76c2d43437601608d75f61a9eb6cf3a7aae5e02b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4747: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/index.html
  IGT_5728: 6988eebf78e9ce9746b8c2b7d21cb4174d6623a9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
