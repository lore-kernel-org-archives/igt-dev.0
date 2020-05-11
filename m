Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 11 May 2020 08:45:02 -0000
Message-ID: <158918670214.13119.1989825701067231595@emeril.freedesktop.org>
References: <20200511062647.9514-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200511062647.9514-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgTmV3IHN1?=
 =?utf-8?q?btest_for_VRR_Flipline_mode?=
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
To: bhanuprakash.modem@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: New subtest for VRR Flipline mode
URL   : https://patchwork.freedesktop.org/series/77128/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8461_full -> IGTPW_4553_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4553_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_vrr@flipline} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-tglb2/igt@kms_vrr@flipline.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-iclb7/igt@kms_vrr@flipline.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8461_full and IGTPW_4553_full:

### New IGT tests (1) ###

  * igt@kms_vrr@flipline:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4553_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl8/igt@i915_suspend@forcewake.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl1/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#1119] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_fence_pin_leak:
    - shard-snb:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-snb1/igt@kms_fence_pin_leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-snb6/igt@kms_fence_pin_leak.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109642] / [fdo#111068])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@whitelisted-registers-userspace-config:
    - shard-kbl:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl2/igt@perf@whitelisted-registers-userspace-config.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl2/igt@perf@whitelisted-registers-userspace-config.html
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#405])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-tglb6/igt@perf@whitelisted-registers-userspace-config.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-tglb5/igt@perf@whitelisted-registers-userspace-config.html
    - shard-hsw:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-hsw4/igt@perf@whitelisted-registers-userspace-config.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-hsw2/igt@perf@whitelisted-registers-userspace-config.html
    - shard-glk:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-glk4/igt@perf@whitelisted-registers-userspace-config.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-glk8/igt@perf@whitelisted-registers-userspace-config.html
    - shard-apl:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl7/igt@perf@whitelisted-registers-userspace-config.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl8/igt@perf@whitelisted-registers-userspace-config.html
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([i915#405])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb4/igt@perf@whitelisted-registers-userspace-config.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-iclb1/igt@perf@whitelisted-registers-userspace-config.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [INCOMPLETE][39] ([i915#155]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][41] ([i915#1436] / [i915#716]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][45] ([i915#57]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][47] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][49] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][51] ([i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl2/igt@kms_draw_crc@fill-fb.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl1/igt@kms_draw_crc@fill-fb.html

  * {igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][53] ([i915#61]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-hsw8/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][57] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][59] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb6/igt@kms_psr@psr2_basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-iclb2/igt@kms_psr@psr2_basic.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][63] ([i915#468]) -> [FAIL][64] ([i915#454])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][65] ([i915#1319]) -> [FAIL][66] ([fdo#110321] / [fdo#110336] / [i915#93] / [i915#95])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl1/igt@kms_content_protection@atomic-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][67] ([fdo#110321]) -> [TIMEOUT][68] ([i915#1319])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl4/igt@kms_content_protection@lic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][69] ([i915#1319]) -> [DMESG-FAIL][70] ([fdo#110321])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl1/igt@kms_content_protection@srm.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][71] ([i915#1121] / [i915#93] / [i915#95]) -> [FAIL][72] ([i915#64])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][73] ([i915#1121] / [i915#95]) -> [FAIL][74] ([i915#1525])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl8/igt@kms_fbcon_fbt@fbc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][75] ([fdo#108145] / [i915#265]) -> [FAIL][76] ([fdo#108145] / [i915#265] / [i915#95])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
    - shard-kbl:          [FAIL][77] ([fdo#108145] / [i915#265]) -> [FAIL][78] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][79] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][80] ([fdo#108145] / [i915#265])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][81] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][82] ([fdo#108145] / [i915#265])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][83] ([i915#31]) -> [FAIL][84] ([i915#31] / [i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl8/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-apl7/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][85] ([i915#31]) -> [FAIL][86] ([i915#31] / [i915#93] / [i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl7/igt@kms_setmode@basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/shard-kbl3/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5644 -> IGTPW_4553
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8461: c0be14b9502e54c9ece4f4fc25872d665c6a6553 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4553: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/index.html
  IGT_5644: 16f067ae42a6a93b8f0c5835210e2575a883001b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4553/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
