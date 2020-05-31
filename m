Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 31 May 2020 22:59:39 -0000
Message-ID: <159096597946.12061.10415686722113364808@emeril.freedesktop.org>
References: <20200531191307.180023-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200531191307.180023-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbalancer=3A_Disable_pre-parser_for_rewritten_batche?=
 =?utf-8?q?s_=28rev2=29?=
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

Series: i915/gem_exec_balancer: Disable pre-parser for rewritten batches (rev2)
URL   : https://patchwork.freedesktop.org/series/77841/
State : success

== Summary ==

CI Bug Log - changes from IGT_5686_full -> IGTPW_4628_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/index.html

Known issues
------------

  Here are the changes found in IGTPW_4628_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-iclb:         [PASS][1] -> [FAIL][2] ([i915#1622])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb1/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-iclb3/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_gpgpu_fill:
    - shard-glk:          [PASS][3] -> [TIMEOUT][4] ([i915#1958]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk4/igt@gem_gpgpu_fill.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-glk7/igt@gem_gpgpu_fill.html
    - shard-apl:          [PASS][5] -> [TIMEOUT][6] ([i915#1635]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl2/igt@gem_gpgpu_fill.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl6/igt@gem_gpgpu_fill.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#1899])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb7/igt@i915_pm_dc@dc5-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-iclb4/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#1899])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb3/igt@i915_pm_dc@dc5-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-tglb7/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-apl:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl6/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-glk:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk7/igt@i915_pm_rpm@modeset-non-lpsp.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-glk7/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#1119] / [i915#118] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([fdo#108145] / [i915#71])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl2/igt@kms_color@pipe-a-legacy-gamma.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl2/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([fdo#108145] / [i915#71])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl3/igt@kms_color@pipe-a-legacy-gamma.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl1/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#70] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#70] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [PASS][33] -> [DMESG-FAIL][34] ([i915#1925] / [i915#1926])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-glk5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-snb:          [PASS][35] -> [DMESG-WARN][36] ([i915#128])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-snb6/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-snb1/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109349])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#1525])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#64])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][43] -> [INCOMPLETE][44] ([i915#155])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#83])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb2/igt@kms_panel_fitting@atomic-fastset.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-tglb1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#83])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb5/igt@kms_panel_fitting@atomic-fastset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][51] -> [INCOMPLETE][52] ([i915#1602] / [i915#456])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][53] ([i915#1899]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [INCOMPLETE][55] ([i915#151] / [i915#155]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl6/igt@i915_pm_rpm@system-suspend-modeset.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl3/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [FAIL][57] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][59] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][63] ([i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-kbl:          [FAIL][65] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * {igt@kms_prime@basic-crc@second-to-first}:
    - shard-apl:          [FAIL][73] ([i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl8/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [FAIL][75] ([i915#93] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl3/igt@kms_prime@basic-crc@second-to-first.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl3/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][77] ([i915#1911]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb8/igt@kms_psr2_su@frontbuffer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-tglb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][83] ([i915#1542]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-hsw6/igt@perf@blocking-parameterized.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-hsw1/igt@perf@blocking-parameterized.html
    - shard-tglb:         [FAIL][85] ([i915#1542]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb3/igt@perf@blocking-parameterized.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-tglb6/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-dpms:
    - shard-snb:          [SKIP][87] ([fdo#109271]) -> [INCOMPLETE][88] ([i915#82])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-snb2/igt@i915_pm_dc@dc5-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-snb6/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][89] ([i915#1899]) -> [FAIL][90] ([i915#454])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color@pipe-d-ctm-negative:
    - shard-apl:          [TIMEOUT][91] ([i915#1635]) -> [SKIP][92] ([fdo#109271])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl7/igt@kms_color@pipe-d-ctm-negative.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl4/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][93] ([i915#1319] / [i915#1635]) -> [FAIL][94] ([fdo#110321] / [fdo#110336])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl8/igt@kms_content_protection@atomic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][95] ([fdo#110321] / [fdo#110336]) -> [FAIL][96] ([fdo#110321] / [fdo#110336] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][97] ([i915#1319] / [i915#1635]) -> [TIMEOUT][98] ([i915#1319])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl2/igt@kms_content_protection@lic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl4/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][99] ([fdo#110321]) -> [FAIL][100] ([fdo#110321] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl4/igt@kms_content_protection@srm.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-glk:          [SKIP][101] ([fdo#109271]) -> [TIMEOUT][102] ([i915#1958])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-glk4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-glk7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          [FAIL][103] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][104] ([fdo#108145] / [i915#265]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
    - shard-apl:          [FAIL][105] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][106] ([fdo#108145] / [i915#265]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_psr@sprite_plane_onoff:
    - shard-apl:          [SKIP][107] ([fdo#109271]) -> [TIMEOUT][108] ([i915#1635]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5686/shard-apl8/igt@kms_psr@sprite_plane_onoff.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/shard-apl6/igt@kms_psr@sprite_plane_onoff.html

  
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
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5686 -> IGTPW_4628

  CI-20190529: 20190529
  CI_DRM_8557: cd02c2938ef1c5e2ca72b8240918151060dfbf92 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4628: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/index.html
  IGT_5686: fceead55c93b81c2c076a087d9200b93bfcf407d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4628/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
