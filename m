Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 31 May 2020 18:43:03 -0000
Message-ID: <159095058307.12061.12439074203476104645@emeril.freedesktop.org>
References: <20200531163246.123451-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200531163246.123451-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbalancer=3A_Disable_pre-parser_for_rewritten_batche?=
 =?utf-8?q?s?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_balancer: Disable pre-parser for rewritten batches
URL   : https://patchwork.freedesktop.org/series/77841/
State : success

== Summary ==

CI Bug Log - changes from IGT_5686_full -> IGTPW_4627_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/index.html

Known issues
------------

  Here are the changes found in IGTPW_4627_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#1436] / [i915#716])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl4/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#1119] / [i915#93] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#1119] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#72])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [PASS][9] -> [DMESG-FAIL][10] ([i915#1925] / [i915#1926]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109349])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#433])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#173])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb2/igt@kms_psr@no_drrs.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-iclb6/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@missing-sample-flags:
    - shard-apl:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl1/igt@perf@missing-sample-flags.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl7/igt@perf@missing-sample-flags.html
    - shard-glk:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk6/igt@perf@missing-sample-flags.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-glk8/igt@perf@missing-sample-flags.html
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([i915#405])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb2/igt@perf@missing-sample-flags.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-iclb6/igt@perf@missing-sample-flags.html
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-hsw2/igt@perf@missing-sample-flags.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-hsw2/igt@perf@missing-sample-flags.html
    - shard-kbl:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl4/igt@perf@missing-sample-flags.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl4/igt@perf@missing-sample-flags.html
    - shard-tglb:         [PASS][37] -> [SKIP][38] ([i915#405])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb7/igt@perf@missing-sample-flags.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-tglb7/igt@perf@missing-sample-flags.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][39] ([i915#1899]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [INCOMPLETE][41] ([i915#151] / [i915#155]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl6/igt@i915_pm_rpm@system-suspend-modeset.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl3/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [FAIL][43] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][45] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-apl:          [FAIL][47] ([i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][51] ([i915#61]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-kbl:          [FAIL][53] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][55] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [FAIL][57] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * {igt@kms_prime@basic-crc@second-to-first}:
    - shard-apl:          [FAIL][59] ([i915#95]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl4/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [FAIL][61] ([i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl3/igt@kms_prime@basic-crc@second-to-first.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl2/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][63] ([i915#1911]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb8/igt@kms_psr2_su@frontbuffer.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-tglb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][67] ([i915#1542]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-hsw6/igt@perf@blocking-parameterized.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-hsw2/igt@perf@blocking-parameterized.html
    - shard-tglb:         [FAIL][69] ([i915#1542]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb3/igt@perf@blocking-parameterized.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-tglb1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][71] ([i915#454]) -> [SKIP][72] ([i915#468])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][73] ([i915#1899]) -> [FAIL][74] ([i915#454])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color@pipe-d-ctm-negative:
    - shard-apl:          [TIMEOUT][75] ([i915#1635]) -> [SKIP][76] ([fdo#109271])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl7/igt@kms_color@pipe-d-ctm-negative.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl7/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][77] ([i915#1319] / [i915#1635]) -> [FAIL][78] ([fdo#110321] / [fdo#110336])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl8/igt@kms_content_protection@atomic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][79] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][80] ([i915#1319] / [i915#1635])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][81] ([i915#1319] / [i915#1635]) -> [FAIL][82] ([fdo#110321])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl2/igt@kms_content_protection@lic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl4/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          [FAIL][83] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][84] ([fdo#108145] / [i915#265]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
    - shard-apl:          [FAIL][85] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][86] ([fdo#108145] / [i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5686 -> IGTPW_4627

  CI-20190529: 20190529
  CI_DRM_8557: cd02c2938ef1c5e2ca72b8240918151060dfbf92 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4627: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/index.html
  IGT_5686: fceead55c93b81c2c076a087d9200b93bfcf407d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4627/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
