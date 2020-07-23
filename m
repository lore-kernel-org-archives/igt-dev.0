Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jul 2020 17:38:47 -0000
Message-ID: <159552592784.23571.9900106834755902925@emeril.freedesktop.org>
References: <20200723111615.1933636-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200723111615.1933636-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fatomic=5Ftransitio?=
 =?utf-8?q?n=3A_Add_explicit_curly_brackets?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1278803842=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1278803842==
Content-Type: multipart/alternative;
 boundary="===============1941904677396003301=="

--===============1941904677396003301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_atomic_transition: Add explicit curly brackets
URL   : https://patchwork.freedesktop.org/series/79800/
State : success

== Summary ==

CI Bug Log - changes from IGT_5746_full -> IGTPW_4792_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4792_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4792_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4792_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_chamelium@dp-edid-read:
    - shard-hsw:          [SKIP][1] ([fdo#109271] / [fdo#111827]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw1/igt@kms_chamelium@dp-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw1/igt@kms_chamelium@dp-edid-read.html

  
Known issues
------------

  Here are the changes found in IGTPW_4792_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk5/igt@gem_exec_create@forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk7/igt@gem_exec_create@forked.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw6/igt@gen7_exec_parse@cmd-crossing-page.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw1/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [PASS][7] -> [WARN][8] ([i915#1515])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1119])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk4/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk2/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk2/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#79])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#49])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#402]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109642] / [fdo#111068])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +9 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][29] ([i915#1930]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [DMESG-WARN][31] ([i915#118] / [i915#95]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-hsw:          [TIMEOUT][33] ([i915#1958] / [i915#2119]) -> [PASS][34] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw4/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw6/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-snb:          [TIMEOUT][35] ([i915#1958] / [i915#2119]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb5/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb1/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * {igt@gem_huc_copy@huc-copy}:
    - shard-tglb:         [SKIP][37] ([i915#2190]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][39] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-apl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][41] ([i915#402]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb1/igt@i915_module_load@reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb3/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][43] ([i915#1899]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb7/igt@i915_pm_dc@dc5-psr.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][45] ([i915#1899]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb8/igt@i915_pm_dc@dc5-psr.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb3/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][47] ([i915#454]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][49] ([i915#1519]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][51] ([i915#1635] / [i915#1982]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [FAIL][53] ([i915#1119]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-glk:          [FAIL][55] ([i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-apl:          [FAIL][57] ([i915#1635] / [i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-kbl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][67] ([i915#433]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-glk:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl7/igt@kms_vblank@pipe-c-wait-idle.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl7/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-apl:          [FAIL][75] ([i915#1635]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-apl3/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-apl7/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@engines-hang:
    - shard-hsw:          [TIMEOUT][77] ([i915#1958] / [i915#2119]) -> [SKIP][78] ([fdo#109271] / [i915#1099])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw4/igt@gem_ctx_persistence@engines-hang.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw4/igt@gem_ctx_persistence@engines-hang.html
    - shard-snb:          [TIMEOUT][79] ([i915#1958] / [i915#2119]) -> [SKIP][80] ([fdo#109271] / [i915#1099])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb5/igt@gem_ctx_persistence@engines-hang.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb5/igt@gem_ctx_persistence@engines-hang.html

  * igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing:
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [TIMEOUT][82] ([i915#1958] / [i915#2119]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb2/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb6/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_chamelium@dp-edid-read:
    - shard-snb:          [SKIP][83] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][84] ([i915#1958] / [i915#2119])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb4/igt@kms_chamelium@dp-edid-read.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb6/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge:
    - shard-snb:          [SKIP][85] ([fdo#109271]) -> [INCOMPLETE][86] ([i915#82])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         [FAIL][87] ([i915#2122]) -> [DMESG-FAIL][88] ([i915#1982])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-hsw:          [TIMEOUT][89] ([i915#1958] / [i915#2119]) -> [SKIP][90] ([fdo#109271])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-hsw:          [SKIP][91] ([fdo#109271]) -> [TIMEOUT][92] ([i915#1958] / [i915#2119]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-snb:          [TIMEOUT][93] ([i915#1958] / [i915#2119]) -> [SKIP][94] ([fdo#109271]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb5/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5746 -> IGTPW_4792

  CI-20190529: 20190529
  CI_DRM_8778: 5ead5989a42079951e6f0b7b6a072a690df0b985 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4792: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/index.html
  IGT_5746: d818f0c54e5e781ba3fb372aab8f270cf153776c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/index.html

--===============1941904677396003301==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_atomic_transition: Add explicit curly brackets</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79800/">https://patchwork.freedesktop.org/series/79800/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5746_full -&gt; IGTPW_4792_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_4792_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4792_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4792_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_chamelium@dp-edid-read:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw1/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw1/igt@kms_chamelium@dp-edid-read.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4792_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk5/igt@gem_exec_create@forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk7/igt@gem_exec_create@forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw6/igt@gen7_exec_parse@cmd-crossing-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw1/igt@gen7_exec_parse@cmd-crossing-page.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk4/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk2/igt@kms_big_fb@linear-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk2/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/52">i915#52</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb1/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +9 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw4/igt@gem_fenced_exec_thrash@2-spare-fences.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw6/igt@gem_fenced_exec_thrash@2-spare-fences.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb5/igt@gem_fenced_exec_thrash@2-spare-fences.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb1/igt@gem_fenced_exec_thrash@2-spare-fences.html">PASS</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_huc_copy@huc-copy}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-apl4/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-apl4/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb3/igt@i915_module_load@reload.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb7/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb6/igt@i915_pm_dc@dc5-psr.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb8/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb3/igt@i915_pm_dc@dc5-psr.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-dpms:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-iclb7/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-kbl7/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-kbl7/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-apl3/igt@sysfs_preempt_timeout@timeout@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-apl7/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw4/igt@gem_ctx_persistence@engines-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw4/igt@gem_ctx_persistence@engines-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb5/igt@gem_ctx_persistence@engines-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb5/igt@gem_ctx_persistence@engines-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb2/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb6/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb4/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb6/igt@kms_chamelium@dp-edid-read.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-c-functional:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5746/shard-snb5/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/shard-snb1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
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
<li>IGT: IGT_5746 -&gt; IGTPW_4792</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8778: 5ead5989a42079951e6f0b7b6a072a690df0b985 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4792: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4792/index.html<br />
  IGT_5746: d818f0c54e5e781ba3fb372aab8f270cf153776c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============1941904677396003301==--

--===============1278803842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1278803842==--
