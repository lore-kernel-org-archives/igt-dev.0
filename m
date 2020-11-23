Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Nov 2020 19:11:35 -0000
Message-ID: <160615869523.16919.8177720168480081150@emeril.freedesktop.org>
References: <20201123142035.1426734-1-mika.kahola@intel.com>
In-Reply-To: <20201123142035.1426734-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL3Jl?=
 =?utf-8?q?ndercopy=5Fgen9=3A_Ensure_to_cover_all_destination_area?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0819974421=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0819974421==
Content-Type: multipart/alternative;
 boundary="===============7142643539369319767=="

--===============7142643539369319767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/rendercopy_gen9: Ensure to cover all destination area
URL   : https://patchwork.freedesktop.org/series/84172/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5868_full -> IGTPW_5208_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5208_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5208_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5208_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@nonpriv@vcs0:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl7/igt@gem_ctx_isolation@nonpriv@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl7/igt@gem_ctx_isolation@nonpriv@vcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5208_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk7/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_pm_backlight@fade_with_dpms:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@i915_pm_backlight@fade_with_dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb3/igt@i915_pm_backlight@fade_with_dpms.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl3/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl3/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#2346])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2598])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1635] / [i915#79])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_flip@flip-vs-fences@a-vga1:
    - shard-hsw:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw4/igt@kms_flip@flip-vs-fences@a-vga1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw6/igt@kms_flip@flip-vs-fences@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1635] / [i915#1982]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#433])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#433])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109642] / [fdo#111068])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb7/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#31])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw1/igt@kms_setmode@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-hsw:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109278])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-kbl:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-apl:          [PASS][41] -> [SKIP][42] ([fdo#109271] / [i915#1635])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [INCOMPLETE][43] ([i915#2369] / [i915#2473]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap@big-bo:
    - shard-iclb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@gem_mmap@big-bo.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb1/igt@gem_mmap@big-bo.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][47] ([i915#1373] / [i915#2405]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@gem_softpin@noreloc-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb3/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][49] ([i915#1635] / [i915#2405] / [i915#2635]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl1/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][51] ([i915#2199] / [i915#2405] / [i915#2635]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@gem_softpin@noreloc-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk9/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][53] ([i915#2405] / [i915#2637]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw4/igt@gem_softpin@noreloc-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw6/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][55] ([i915#2405]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [SKIP][57] ([fdo#109271]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl1/igt@i915_pm_rpm@drm-resources-equal.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [SKIP][59] ([i915#579]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@i915_pm_rpm@drm-resources-equal.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb5/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html
    - shard-apl:          [SKIP][63] ([fdo#109271] / [i915#1635]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@i915_pm_rpm@gem-execbuf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl3/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][65] ([fdo#109271]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk8/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-glk:          [DMESG-FAIL][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-hsw:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw2/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-apl:          [DMESG-WARN][71] ([i915#1635] / [i915#1982]) -> [PASS][72] +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +7 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl3/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl2/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [DMESG-WARN][82] ([i915#2411])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@gem_softpin@noreloc-s3.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb7/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_backlight@fade_with_dpms:
    - shard-tglb:         [DMESG-WARN][83] ([i915#2411]) -> [SKIP][84] ([i915#1311] / [i915#579])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb1/igt@i915_pm_backlight@fade_with_dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@i915_pm_backlight@fade_with_dpms.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][85] ([i915#658]) -> [SKIP][86] ([i915#588])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][87] ([i915#2684]) -> [WARN][88] ([i915#1804] / [i915#2684])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-tglb:         [SKIP][89] ([i915#579]) -> [DMESG-WARN][90] ([i915#2411]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@i915_pm_rpm@gem-execbuf.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb5/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [DMESG-WARN][91] ([i915#2411]) -> [INCOMPLETE][92] ([i915#456])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [DMESG-WARN][93] ([i915#2411]) -> [INCOMPLETE][94] ([i915#1602] / [i915#2411] / [i915#456])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb6/igt@kms_fbcon_fbt@fbc-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][95] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][96] ([fdo#108145] / [i915#1635] / [i915#265])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-tglb:         [DMESG-WARN][97] ([i915#2411]) -> [SKIP][98] ([i915#2648])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][99], [FAIL][100]) ([i915#2295] / [i915#2426] / [i915#2505] / [i915#483]) -> [FAIL][101] ([i915#2295] / [i915#483])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl4/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl6/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][102], [FAIL][103]) ([i915#2295] / [i915#483]) -> [FAIL][104] ([i915#2295])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][105], [FAIL][106]) ([i915#2295] / [i915#86] / [k.org#202321]) -> [FAIL][107] ([i915#2295] / [i915#483] / [k.org#202321])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk2/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][108], [FAIL][109]) ([i915#2295]) -> ([FAIL][110], [FAIL][111]) ([i915#1602] / [i915#2295])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb3/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1311]: https://gitlab.freedesktop.org/drm/intel/issues/1311
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2473]: https://gitlab.freedesktop.org/drm/intel/issues/2473
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5868 -> IGTPW_5208

  CI-20190529: 20190529
  CI_DRM_9376: d08ea807a6466f311fe921872bc18cfc384ae281 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5208: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/index.html
  IGT_5868: 36b5fc05c30dbfd9242069fd6e51ebb419b386bc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/index.html

--===============7142643539369319767==
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
<tr><td><b>Series:</b></td><td>lib/rendercopy_gen9: Ensure to cover all destination area</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84172/">https://patchwork.freedesktop.org/series/84172/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5868_full -&gt; IGTPW_5208_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5208_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5208_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5208_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_ctx_isolation@nonpriv@vcs0:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl7/igt@gem_ctx_isolation@nonpriv@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl7/igt@gem_ctx_isolation@nonpriv@vcs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5208_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk7/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@i915_pm_backlight@fade_with_dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb3/igt@i915_pm_backlight@fade_with_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl3/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl3/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw4/igt@kms_flip@flip-vs-fences@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw6/igt@kms_flip@flip-vs-fences@a-vga1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb3/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb7/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2473">i915#2473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@gem_mmap@big-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb1/igt@gem_mmap@big-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb3/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl3/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl1/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk9/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw6/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl1/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl1/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb5/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl3/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk8/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-hsw2/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl3/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl2/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb7/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_dpms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb1/igt@i915_pm_backlight@fade_with_dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@i915_pm_backlight@fade_with_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1311">i915#1311</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb5/igt@i915_pm_rpm@gem-execbuf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb6/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2648">i915#2648</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-kbl6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-iclb2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/86">i915#86</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-glk7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/shard-tglb1/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
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
<li>IGT: IGT_5868 -&gt; IGTPW_5208</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9376: d08ea807a6466f311fe921872bc18cfc384ae281 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5208: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5208/index.html<br />
  IGT_5868: 36b5fc05c30dbfd9242069fd6e51ebb419b386bc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7142643539369319767==--

--===============0819974421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0819974421==--
