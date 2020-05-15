Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 15 May 2020 13:19:08 -0000
Message-ID: <158954874857.26212.14495941834306443987@emeril.freedesktop.org>
References: <20200515074150.475142-1-harish.chegondi@intel.com>
In-Reply-To: <20200515074150.475142-1-harish.chegondi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?/resultgen=3A_Fix_dmesg_whitelist_entry=27s_regular_expression?=
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
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner/resultgen: Fix dmesg whitelist entry's regular expression
URL   : https://patchwork.freedesktop.org/series/77299/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8486_full -> IGTPW_4573_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/index.html

Known issues
------------

  Here are the changes found in IGTPW_4573_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl6/igt@gem_eio@in-flight-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180] / [i915#93] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@i915_selftest@live@execlists:
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6] ([CI#80] / [i915#656])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl1/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl1/igt@i915_selftest@live@execlists.html

  * igt@kms_atomic@plane-invalid-params:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#165] / [i915#62] / [i915#92]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl1/igt@kms_atomic@plane-invalid-params.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl3/igt@kms_atomic@plane-invalid-params.html

  * igt@kms_color@pipe-a-degamma:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([fdo#108145] / [i915#71])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl6/igt@kms_color@pipe-a-degamma.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl4/igt@kms_color@pipe-a-degamma.html
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([fdo#108145] / [i915#71])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl3/igt@kms_color@pipe-a-degamma.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl1/igt@kms_color@pipe-a-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([fdo#108145] / [i915#265] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1559] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#1559] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl3/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         [PASS][37] -> [INCOMPLETE][38] ([i915#1602])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  
#### Possible fixes ####

  * {igt@gem_exec_parallel@fds@bcs0}:
    - shard-iclb:         [INCOMPLETE][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb2/igt@gem_exec_parallel@fds@bcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-iclb1/igt@gem_exec_parallel@fds@bcs0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][41] ([i915#1602] / [i915#456]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-tglb3/igt@gem_exec_suspend@basic-s0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-tglb2/igt@gem_exec_suspend@basic-s0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][43] ([i915#1436] / [i915#716]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-glk6/igt@gen9_exec_parse@allowed-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][45] ([i915#1119] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][47] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [FAIL][49] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][51] ([fdo#109349]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][53] ([i915#79]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [INCOMPLETE][55] ([i915#155]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@b-dp1}:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][63] ([i915#433]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][65] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][67] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][69] ([i915#173]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb1/igt@kms_psr@no_drrs.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-iclb6/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][73] ([i915#1542]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb6/igt@perf@blocking-parameterized.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-iclb4/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][75] ([i915#1542]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-tglb7/igt@perf@polling-parameterized.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-tglb7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-snb:          [INCOMPLETE][77] ([i915#82]) -> [SKIP][78] ([fdo#109271])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-snb5/igt@i915_pm_dc@dc5-psr.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-snb2/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][79] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][80] ([i915#1319]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl4/igt@kms_content_protection@atomic-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][81] ([i915#357] / [i915#93] / [i915#95]) -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl1/igt@kms_content_protection@uevent.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/shard-kbl3/igt@kms_content_protection@uevent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5654 -> IGTPW_4573
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8486: f43bb5d8b1ed34a349ce5721ce5c064935a6cf6f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4573: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/index.html
  IGT_5654: 5637a466a0b09535517751608f5525a8b468a76b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
