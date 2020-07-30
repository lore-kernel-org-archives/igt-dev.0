Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jul 2020 06:43:31 -0000
Message-ID: <159609141115.11114.12809005126000460686@emeril.freedesktop.org>
References: <20200730051931.9927-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200730051931.9927-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fclose=3A_Added_test_description_for_test_case?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1818950536=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1818950536==
Content-Type: multipart/alternative;
 boundary="===============4642488825120285778=="

--===============4642488825120285778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_close: Added test description for test case
URL   : https://patchwork.freedesktop.org/series/80063/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5751_full -> IGTPW_4823_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4823_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4823_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4823_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  
Known issues
------------

  Here are the changes found in IGTPW_4823_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_create@basic:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk9/igt@gem_exec_create@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk9/igt@gem_exec_create@basic.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1930])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk3/igt@gem_exec_reloc@basic-concurrent0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([i915#1958] / [i915#2119]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw6/igt@kms_big_fb@x-tiled-addfb.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw1/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#129])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#129] / [i915#1635])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl4/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl1/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2122])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-y-tiled:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl2/igt@kms_flip_tiling@flip-y-tiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl1/igt@kms_flip_tiling@flip-y-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +9 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#173])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb7/igt@kms_psr@no_drrs.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk7/igt@kms_vblank@pipe-c-accuracy-idle.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk5/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#1542])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb8/igt@perf@blocking-parameterized.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb1/igt@perf@blocking-parameterized.html

  * igt@syncobj_wait@wait-all-interrupted:
    - shard-snb:          [PASS][31] -> [TIMEOUT][32] ([i915#1958] / [i915#2119]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-snb2/igt@syncobj_wait@wait-all-interrupted.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-snb2/igt@syncobj_wait@wait-all-interrupted.html

  
#### Possible fixes ####

  * igt@drm_read@fault-buffer:
    - shard-snb:          [SKIP][33] ([fdo#109271]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-snb4/igt@drm_read@fault-buffer.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-snb2/igt@drm_read@fault-buffer.html

  * igt@gem_exec_whisper@basic-contexts:
    - shard-apl:          [DMESG-WARN][35] ([i915#1635] / [i915#1982]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl2/igt@gem_exec_whisper@basic-contexts.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl3/igt@gem_exec_whisper@basic-contexts.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][37] ([i915#1899]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-kbl:          [DMESG-WARN][39] ([i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][41] ([i915#118] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-green-to-red:
    - shard-kbl:          [FAIL][43] ([i915#129]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl2/igt@kms_color@pipe-a-ctm-green-to-red.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl6/igt@kms_color@pipe-a-ctm-green-to-red.html
    - shard-apl:          [FAIL][45] ([i915#129] / [i915#1635]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl1/igt@kms_color@pipe-a-ctm-green-to-red.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl3/igt@kms_color@pipe-a-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
    - shard-hsw:          [INCOMPLETE][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-glk:          [DMESG-WARN][49] ([i915#118] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:
    - shard-glk:          [FAIL][51] ([i915#52] / [i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:
    - shard-tglb:         [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb3/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb2/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [FAIL][55] ([i915#79]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [FAIL][59] ([i915#49]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#180]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-glk:          [FAIL][63] ([i915#899]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk3/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk5/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [FAIL][67] ([i915#331]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-apl:          [FAIL][69] ([i915#1635] / [i915#331]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][71] ([i915#1602] / [i915#1887] / [i915#456]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-wait-busy:
    - shard-tglb:         [INCOMPLETE][73] -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb8/igt@kms_vblank@pipe-b-wait-busy.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb6/igt@kms_vblank@pipe-b-wait-busy.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-hsw:          [TIMEOUT][75] ([i915#1958] / [i915#2119]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw6/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw1/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@perf@blocking-parameterized:
    - shard-tglb:         [FAIL][77] ([i915#1542]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb2/igt@perf@blocking-parameterized.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-hsw:          [TIMEOUT][79] ([i915#1958] / [i915#2119]) -> [SKIP][80] ([fdo#109271]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw6/igt@gem_ctx_persistence@close-replace-race.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][81] ([i915#1930]) -> [TIMEOUT][82] ([i915#1958] / [i915#2119])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][83] ([i915#588]) -> [SKIP][84] ([i915#658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][85] ([i915#1899]) -> [FAIL][86] ([i915#454])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][87] ([i915#1515]) -> [WARN][88] ([i915#1515])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-snb:          [SKIP][89] ([fdo#109271]) -> [TIMEOUT][90] ([i915#1958] / [i915#2119]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-hsw:          [SKIP][91] ([fdo#109271]) -> [TIMEOUT][92] ([i915#1958] / [i915#2119])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw8/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5751 -> IGTPW_4823

  CI-20190529: 20190529
  CI_DRM_8814: c3d46022808ab0325db29918a829ac7fa02a4314 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4823: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/index.html
  IGT_5751: d47bb767757b2e64ced4a5bb95de6397e8dc709c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/index.html

--===============4642488825120285778==
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
<tr><td><b>Series:</b></td><td>i915/gem_close: Added test description for test case</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80063/">https://patchwork.freedesktop.org/series/80063/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5751_full -&gt; IGTPW_4823_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4823_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4823_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4823_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4823_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk9/igt@gem_exec_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk9/igt@gem_exec_create@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk3/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw6/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw1/igt@kms_big_fb@x-tiled-addfb.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl4/igt@kms_color@pipe-a-ctm-blue-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl1/igt@kms_color@pipe-a-ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl2/igt@kms_flip_tiling@flip-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl1/igt@kms_flip_tiling@flip-y-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb7/igt@kms_psr@no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb1/igt@kms_psr@no_drrs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/173">i915#173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk7/igt@kms_vblank@pipe-c-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk5/igt@kms_vblank@pipe-c-accuracy-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb8/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb1/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@wait-all-interrupted:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-snb2/igt@syncobj_wait@wait-all-interrupted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-snb2/igt@syncobj_wait@wait-all-interrupted.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@fault-buffer:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-snb4/igt@drm_read@fault-buffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-snb2/igt@drm_read@fault-buffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl2/igt@gem_exec_whisper@basic-contexts.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl3/igt@gem_exec_whisper@basic-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/93">i915#93</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl2/igt@kms_color@pipe-a-ctm-green-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl6/igt@kms_color@pipe-a-ctm-green-to-red.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl1/igt@kms_color@pipe-a-ctm-green-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl3/igt@kms_color@pipe-a-ctm-green-to-red.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/52">i915#52</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb3/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb2/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-glk3/igt@kms_plane_lowres@pipe-b-tiling-yf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/899">i915#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-glk5/igt@kms_plane_lowres@pipe-b-tiling-yf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-functional:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-busy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb8/igt@kms_vblank@pipe-b-wait-busy.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb6/igt@kms_vblank@pipe-b-wait-busy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw6/igt@kms_vblank@pipe-b-wait-forked-busy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw1/igt@kms_vblank@pipe-b-wait-forked-busy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb2/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb1/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw6/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw2/igt@gem_ctx_persistence@close-replace-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-tglb7/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-tglb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/shard-hsw8/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/shard-hsw1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5751 -&gt; IGTPW_4823</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8814: c3d46022808ab0325db29918a829ac7fa02a4314 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4823: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4823/index.html<br />
  IGT_5751: d47bb767757b2e64ced4a5bb95de6397e8dc709c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4642488825120285778==--

--===============1818950536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1818950536==--
