Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Aug 2020 08:17:41 -0000
Message-ID: <159825706107.20779.4873927973495900694@emeril.freedesktop.org>
References: <20200821163928.1072379-1-michel@daenzer.net>
In-Reply-To: <20200821163928.1072379-1-michel@daenzer.net>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_Turn_off_pipe_as_well_if_all_planes_are_off?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0461151751=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0461151751==
Content-Type: multipart/alternative;
 boundary="===============2595736087817911836=="

--===============2595736087817911836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: Turn off pipe as well if all planes are off
URL   : https://patchwork.freedesktop.org/series/80904/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8913_full -> IGTPW_4902_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/index.html

Known issues
------------

  Here are the changes found in IGTPW_4902_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk5/igt@gem_exec_create@forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk6/igt@gem_exec_create@forked.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-hsw:          [PASS][3] -> [TIMEOUT][4] ([i915#1958]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-snb:          [PASS][5] -> [TIMEOUT][6] ([i915#1958]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb4/igt@gem_exec_reloc@basic-range-active.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-snb4/igt@gem_exec_reloc@basic-range-active.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#1635] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [PASS][9] -> [INCOMPLETE][10] ([i915#1635] / [i915#2278])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@i915_selftest@mock@contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl4/igt@i915_selftest@mock@contexts.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2384])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk6/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1635] / [i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_flip@2x-nonexisting-fb@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw1/igt@kms_flip@2x-nonexisting-fb@ab-vga1-hdmi-a1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw8/igt@kms_flip@2x-nonexisting-fb@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#79])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#2122])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk9/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +6 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html

  * igt@prime_busy@after@vecs0:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#2258]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw8/igt@prime_busy@after@vecs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw1/igt@prime_busy@after@vecs0.html

  
#### Possible fixes ####

  * {igt@feature_discovery@psr2}:
    - shard-iclb:         [SKIP][35] ([i915#658]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb8/igt@feature_discovery@psr2.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_balancer@nop:
    - shard-iclb:         [INCOMPLETE][37] ([i915#2277]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@gem_exec_balancer@nop.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb3/igt@gem_exec_balancer@nop.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-tglb:         [INCOMPLETE][39] ([i915#2270]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb8/igt@gem_exec_endless@dispatch@bcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb5/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_gttfill@engines@rcs0:
    - shard-hsw:          [INCOMPLETE][41] ([i915#2378]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw7/igt@gem_exec_gttfill@engines@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw1/igt@gem_exec_gttfill@engines@rcs0.html

  * {igt@gem_mmap_offset@blt-coherency}:
    - shard-apl:          [FAIL][43] ([i915#1635]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl4/igt@gem_mmap_offset@blt-coherency.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl1/igt@gem_mmap_offset@blt-coherency.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][47] ([i915#1635] / [i915#1982]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-apl:          [FAIL][51] ([i915#1635] / [i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-hsw:          [TIMEOUT][53] ([i915#1958]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-glk:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-kbl:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [SKIP][63] ([i915#1911]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@kms_psr2_su@page_flip.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_sequence@get-forked:
    - shard-hsw:          [INCOMPLETE][67] ([CI#80]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw7/igt@kms_sequence@get-forked.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw7/igt@kms_sequence@get-forked.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][69] ([i915#31]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl2/igt@kms_setmode@basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][71] ([i915#1542]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@perf@polling-parameterized.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb5/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][73] ([i915#1930]) -> [TIMEOUT][74] ([i915#1958])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][75] ([i915#588]) -> [SKIP][76] ([i915#658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][77] ([i915#1319] / [i915#1958]) -> [TIMEOUT][78] ([i915#1319])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl7/igt@kms_content_protection@atomic-dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-128:
    - shard-snb:          [SKIP][79] ([fdo#109271]) -> [TIMEOUT][80] ([i915#1958]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb2/igt@kms_plane_cursor@pipe-c-viewport-size-128.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-snb4/igt@kms_plane_cursor@pipe-c-viewport-size-128.html

  * igt@kms_vblank@pipe-d-accuracy-idle:
    - shard-hsw:          [TIMEOUT][81] ([i915#1958]) -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@kms_vblank@pipe-d-accuracy-idle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw7/igt@kms_vblank@pipe-d-accuracy-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2270]: https://gitlab.freedesktop.org/drm/intel/issues/2270
  [i915#2277]: https://gitlab.freedesktop.org/drm/intel/issues/2277
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2378]: https://gitlab.freedesktop.org/drm/intel/issues/2378
  [i915#2384]: https://gitlab.freedesktop.org/drm/intel/issues/2384
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5770 -> IGTPW_4902
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8913: e18d8e120e73feaf39d84afe14f9a7f58b696785 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/index.html
  IGT_5770: f1d0c240ea2e631dfb9f493f37f8fb61cb2b1cf2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/index.html

--===============2595736087817911836==
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
<tr><td><b>Series:</b></td><td>tests/kms: Turn off pipe as well if all planes are off</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80904/">https://patchwork.freedesktop.org/series/80904/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8913_full -&gt; IGTPW_4902_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4902_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk5/igt@gem_exec_create@forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk6/igt@gem_exec_create@forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb4/igt@gem_exec_reloc@basic-range-active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-snb4/igt@gem_exec_reloc@basic-range-active.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl8/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@i915_selftest@mock@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl4/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2384">i915#2384</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk6/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw1/igt@kms_flip@2x-nonexisting-fb@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw8/igt@kms_flip@2x-nonexisting-fb@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk9/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw8/igt@prime_busy@after@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw1/igt@prime_busy@after@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@feature_discovery@psr2}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@nop:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@gem_exec_balancer@nop.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2277">i915#2277</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb3/igt@gem_exec_balancer@nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb8/igt@gem_exec_endless@dispatch@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2270">i915#2270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb5/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@engines@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw7/igt@gem_exec_gttfill@engines@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2378">i915#2378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw1/igt@gem_exec_gttfill@engines@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_mmap_offset@blt-coherency}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl4/igt@gem_mmap_offset@blt-coherency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl1/igt@gem_mmap_offset@blt-coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x128-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb1/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw7/igt@kms_sequence@get-forked.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw7/igt@kms_sequence@get-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl4/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb5/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl7/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-kbl1/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-c-viewport-size-128:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb2/igt@kms_plane_cursor@pipe-c-viewport-size-128.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-snb4/igt@kms_plane_cursor@pipe-c-viewport-size-128.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-accuracy-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@kms_vblank@pipe-d-accuracy-idle.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-hsw7/igt@kms_vblank@pipe-d-accuracy-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5770 -&gt; IGTPW_4902</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8913: e18d8e120e73feaf39d84afe14f9a7f58b696785 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/index.html<br />
  IGT_5770: f1d0c240ea2e631dfb9f493f37f8fb61cb2b1cf2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2595736087817911836==--

--===============0461151751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0461151751==--
