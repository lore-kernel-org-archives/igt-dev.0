Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Nov 2020 19:34:27 -0000
Message-ID: <160624646714.10859.1332118422638736914@emeril.freedesktop.org>
References: <20201124141924.108689-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201124141924.108689-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbHMv?=
 =?utf-8?q?intel=5Fgpu=5Ftop=3A_Include_total_package_power_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1811095143=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1811095143==
Content-Type: multipart/alternative;
 boundary="===============2055058776981479091=="

--===============2055058776981479091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_gpu_top: Include total package power (rev2)
URL   : https://patchwork.freedesktop.org/series/77463/
State : success

== Summary ==

CI Bug Log - changes from IGT_5870_full -> IGTPW_5219_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/index.html

Known issues
------------

  Here are the changes found in IGTPW_5219_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#2389])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_mmap_wc@pf-nonblock:
    - shard-hsw:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-hsw2/igt@gem_mmap_wc@pf-nonblock.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-hsw8/igt@gem_mmap_wc@pf-nonblock.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#644])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1436] / [i915#716])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-iclb:         [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb5/igt@i915_module_load@reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb3/igt@i915_module_load@reload.html

  * igt@kms_color@pipe-c-legacy-gamma:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#71])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl4/igt@kms_color@pipe-c-legacy-gamma.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1635] / [i915#71])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-apl1/igt@kms_color@pipe-c-legacy-gamma.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-apl1/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#71])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk2/igt@kms_color@pipe-c-legacy-gamma.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk9/igt@kms_color@pipe-c-legacy-gamma.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#2637])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl7/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl1/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1635] / [i915#1982]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-apl6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-apl4/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [INCOMPLETE][33] ([i915#2283] / [i915#2405]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk6/igt@device_reset@unbind-reset-rebind.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk1/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [INCOMPLETE][35] ([i915#1635] / [i915#2283] / [i915#2405]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-apl3/igt@device_reset@unbind-reset-rebind.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-apl6/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [INCOMPLETE][37] ([i915#2283] / [i915#2405]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl2/igt@device_reset@unbind-reset-rebind.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl3/igt@device_reset@unbind-reset-rebind.html
    - shard-tglb:         [INCOMPLETE][39] ([i915#1602] / [i915#750]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-tglb3/igt@device_reset@unbind-reset-rebind.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-tglb7/igt@device_reset@unbind-reset-rebind.html
    - shard-iclb:         [INCOMPLETE][41] ([i915#2283] / [i915#2405]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb8/igt@device_reset@unbind-reset-rebind.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb8/igt@device_reset@unbind-reset-rebind.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-iclb:         [INCOMPLETE][43] ([i915#1185] / [i915#2369]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb5/igt@i915_pm_backlight@fade_with_suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb5/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][45] ([i915#454]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [SKIP][49] ([fdo#109271] / [i915#1635]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [SKIP][51] ([fdo#109271]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl4/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-hsw5/igt@i915_pm_rpm@gem-execbuf-stress.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-apl:          [DMESG-WARN][55] ([i915#1635] / [i915#1982]) -> [PASS][56] +7 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-apl8/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk1/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk1/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][59] ([i915#2598]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-kbl:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
    - shard-apl:          [FAIL][65] ([i915#1635] / [i915#49]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-apl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-apl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-kbl:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +8 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl7/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl7/igt@kms_vblank@pipe-b-wait-forked-busy.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-hsw:          [INCOMPLETE][71] ([i915#2283] / [i915#2405]) -> [WARN][72] ([i915#2283])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-hsw1/igt@device_reset@unbind-reset-rebind.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-hsw5/igt@device_reset@unbind-reset-rebind.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [DMESG-WARN][73] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [DMESG-WARN][74] ([i915#2411])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-tglb2/igt@i915_pm_backlight@fade_with_suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-tglb2/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][75] ([i915#1804]) -> [WARN][76] ([i915#2681])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][77] ([i915#1319] / [i915#1635]) -> [FAIL][78] ([fdo#110321] / [fdo#110336] / [i915#1635])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-apl3/igt@kms_content_protection@legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-apl3/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [DMESG-WARN][79] ([i915#2411]) -> [DMESG-WARN][80] ([i915#1982] / [i915#2411])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-tglb3/igt@kms_frontbuffer_tracking@psr-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][81] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][82] ([fdo#108145] / [i915#1635] / [i915#1982]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-glk:          [FAIL][83] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][84] ([fdo#108145] / [i915#1982])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][85] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][86] ([fdo#108145] / [i915#1982])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][87] ([i915#2283] / [i915#2295] / [i915#483]) -> [FAIL][88] ([i915#2295])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-hsw1/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-hsw5/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][89], [FAIL][90]) ([i915#2295] / [i915#483]) -> ([FAIL][91], [FAIL][92]) ([fdo#109271] / [i915#1436] / [i915#2295] / [i915#483] / [i915#716])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl2/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl7/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl3/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][93], [FAIL][94], [FAIL][95]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#483]) -> [FAIL][96] ([i915#2295] / [i915#483])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb4/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb5/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb8/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb8/igt@runner@aborted.html
    - shard-glk:          ([FAIL][97], [FAIL][98]) ([i915#2295] / [i915#483] / [k.org#202321]) -> [FAIL][99] ([i915#2295] / [k.org#202321])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk3/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk6/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5870 -> IGTPW_5219

  CI-20190529: 20190529
  CI_DRM_9382: ac60f3f3090115d21f028bffa2dcfb67f695c4f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5219: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/index.html
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/index.html

--===============2055058776981479091==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tools/intel_gpu_top: Include total package p=
ower (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/77463/">https://patchwork.freedesktop.org/series/77463/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5219/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5219/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5870_full -&gt; IGTPW_5219_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5219_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/sha=
rd-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/sh=
ard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@pf-nonblock:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-hsw2/igt@gem_mmap_wc@pf-nonblock.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-hsw8/igt@ge=
m_mmap_wc@pf-nonblock.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-=
glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl3/ig=
t@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-iclb5/igt@i915_module_load@reload.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb3/igt@=
i915_module_load@reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-legacy-gamma:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-kbl4/igt@kms_color@pipe-c-legacy-gamma.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl1/i=
gt@kms_color@pipe-c-legacy-gamma.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-apl1/igt@kms_color@pipe-c-legacy-gamma.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-apl1/i=
gt@kms_color@pipe-c-legacy-gamma.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-glk2/igt@kms_color@pipe-c-legacy-gamma.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-glk9/i=
gt@kms_color@pipe-c-legacy-gamma.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5219/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-=
hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5219/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend-interruptible@a=
b-vga1-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2637">i915#2637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-kbl7/igt@kms_flip@blocking-absolute-wf_vblank-interruptible=
@a-dp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5219/shard-kbl1/igt@kms_flip@blocking-absolute-wf_vblank-interru=
ptible@a-dp1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219=
/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-i=
ndfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5219/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-icl=
b8/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-apl6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5219/shard-apl4/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-glk6/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2=
283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">=
i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5219/shard-glk1/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-apl3/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1=
635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">=
i915#2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2405">i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5219/shard-apl6/igt@device_reset@unbind-reset-rebind.html">PASS</=
a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-kbl2/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2=
283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">=
i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5219/shard-kbl3/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-tglb3/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#=
1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/750">=
i915#750</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5219/shard-tglb7/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-iclb8/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#=
2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405"=
>i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5219/shard-iclb8/igt@device_reset@unbind-reset-rebind.html">PASS</a></=
p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-iclb5/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i=
915#1185</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
369">i915#2369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5219/shard-iclb5/igt@i915_pm_backlight@fade_with_suspend.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb8/igt@i=
915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-glk3/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/sha=
rd-glk9/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1=
635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
19/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/sha=
rd-kbl4/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-hsw5/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/sha=
rd-hsw2/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5219/shard-apl8/igt@kms_cursor_edge_walk@pipe-c-256x256-l=
eft-edge.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-glk1/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a=
1-hdmi-a2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5219/shard-glk1/igt@kms_flip@2x-flip-vs-fences-in=
terruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915=
#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5219/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-ms=
flip-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5219/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-msflip-blt.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/49=
">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5219/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.ht=
ml">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-apl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
35">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5219/shard-apl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprim=
ary.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/s=
hard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-kbl7/igt@kms_vblank@pipe-b-wait-forked-busy.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i91=
5#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5219/shard-kbl7/igt@kms_vblank@pipe-b-wait-forked-busy.html">PASS</a> +8 s=
imilar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-hsw1/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#=
2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405"=
>i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5219/shard-hsw5/igt@device_reset@unbind-reset-rebind.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-tglb2/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i=
915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5219/shard-tglb2/igt@i915_pm_backlight@fade_with_suspe=
nd.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/sha=
rd-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-apl3/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#=
1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
219/shard-apl3/igt@kms_content_protection@legacy.html">FAIL</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D110321">fdo#110321</a> / <a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110336">fdo#110336<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915=
#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-tglb3/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">=
i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5219/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i=
915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">fdo=
#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
35">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5219/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">fdo=
#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
5">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5219/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">DM=
ESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108=
145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">fdo=
#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
5">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5219/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">DME=
SG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1081=
45">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5870/shard-hsw1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-hsw5=
/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5219/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-kbl3/igt@runner@a=
borted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-iclb5/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5870=
/shard-iclb8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/shard-iclb=
8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5870/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5870/shard-glk6/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/483">i915#483</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi=
?id=3D202321">k.org#202321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5219/shard-glk1/igt@runner@aborted.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>=
 / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#2=
02321</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5870 -&gt; IGTPW_5219</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9382: ac60f3f3090115d21f028bffa2dcfb67f695c4f2 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5219: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5219/index.htm=
l<br />
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============2055058776981479091==--

--===============1811095143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1811095143==--
