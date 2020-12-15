Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Dec 2020 09:27:14 -0000
Message-ID: <160802443431.24781.18362403586279742677@emeril.freedesktop.org>
References: <20201215151924.15143-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20201215151924.15143-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvrr=3A_Update_condition_checks_for_flipline_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0513966512=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0513966512==
Content-Type: multipart/alternative;
 boundary="===============8635538684303462440=="

--===============8635538684303462440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Update condition checks for flipline test
URL   : https://patchwork.freedesktop.org/series/84932/
State : success

== Summary ==

CI Bug Log - changes from IGT_5897_full -> IGTPW_5291_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/index.html

Known issues
------------

  Here are the changes found in IGTPW_5291_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - shard-tglb:         NOTRUN -> [SKIP][1] ([i915#1704]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb5/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
    - shard-iclb:         NOTRUN -> [SKIP][2] ([i915#1704]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb2/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-iclb:         NOTRUN -> [SKIP][3] ([fdo#109289])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb1/igt@gen7_exec_parse@chained-batch.html
    - shard-tglb:         NOTRUN -> [SKIP][4] ([fdo#109289])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb7/igt@gen7_exec_parse@chained-batch.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][5] -> [FAIL][6] ([i915#454])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1937])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2597])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb5/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#1119])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-glk7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-glk3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([fdo#109284] / [fdo#111827])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb8/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-hsw:          NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-hsw2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [fdo#111827])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-apl4/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-glk:          NOTRUN -> [SKIP][15] ([fdo#109271] / [fdo#111827])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-glk8/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@pipe-a-ctm-0-75:
    - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#1149] / [i915#315])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb3/igt@kms_color@pipe-a-ctm-0-75.html
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#1149] / [i915#315])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb3/igt@kms_color@pipe-a-ctm-0-75.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][19] ([i915#1319])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
    - shard-hsw:          NOTRUN -> [SKIP][20] ([fdo#109271]) +17 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109279])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109278] / [fdo#109279])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][23] -> [FAIL][24] ([i915#96])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109280]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271]) +18 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271]) +51 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#111825]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#533])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][30] ([fdo#108145] / [i915#265])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
    - shard-kbl:          NOTRUN -> [FAIL][31] ([fdo#108145] / [i915#265])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-d-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109278]) +4 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb7/igt@kms_plane_lowres@pipe-d-tiling-x.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109274]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [PASS][34] -> [DMESG-WARN][35] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-tglb3/igt@kms_psr@psr2_suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb5/igt@kms_psr@psr2_suspend.html

  * igt@nouveau_crc@pipe-a-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#2530])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb2/igt@nouveau_crc@pipe-a-source-outp-inactive.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#2530])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb6/igt@nouveau_crc@pipe-a-source-outp-inactive.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][38] -> [FAIL][39] ([i915#1542])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb5/igt@perf@polling-parameterized.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb7/igt@perf@polling-parameterized.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271]) +14 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-glk5/igt@prime_nv_pcopy@test1_macro.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109291])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb5/igt@prime_nv_pcopy@test1_macro.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109291])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb6/igt@prime_nv_pcopy@test1_macro.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][43] ([i915#2389]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - shard-apl:          [FAIL][45] ([i915#129]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-apl7/igt@kms_color@pipe-b-ctm-green-to-red.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-apl1/igt@kms_color@pipe-b-ctm-green-to-red.html
    - shard-kbl:          [FAIL][47] ([i915#129]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-kbl6/igt@kms_color@pipe-b-ctm-green-to-red.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl2/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][49] ([i915#1602]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-iclb:         [DMESG-WARN][51] ([i915#1602]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-apl:          [DMESG-WARN][53] ([i915#1602] / [i915#2635]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-glk:          [DMESG-WARN][55] ([i915#1602] / [i915#2635]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-glk:          [FAIL][57] ([i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-apl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][63] ([i915#2122]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-iclb:         [FAIL][65] ([i915#49]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [INCOMPLETE][67] ([i915#1185] / [i915#250]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [DMESG-WARN][69] ([i915#2635]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-glk:          [DMESG-WARN][71] ([i915#2635]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-hsw:          [DMESG-WARN][73] ([i915#2637]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-hsw1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-hsw7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-tglb:         [INCOMPLETE][75] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [INCOMPLETE][77] ([i915#155]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb6/igt@kms_psr@psr2_dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb2/igt@kms_psr@psr2_dpms.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][81] ([i915#2684]) -> [WARN][82] ([i915#2681] / [i915#2684])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][83], [FAIL][84]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483]) -> [FAIL][85] ([i915#2295] / [i915#2722] / [i915#483])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-kbl7/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-kbl1/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-kbl6/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][86], [FAIL][87], [FAIL][88]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483]) -> [FAIL][89] ([i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb2/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb6/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb7/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][90], [FAIL][91], [FAIL][92]) ([i915#1814] / [i915#2295] / [i915#2722]) -> [FAIL][93] ([i915#2295] / [i915#2722])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-apl4/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-apl6/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-apl3/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-apl2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][94], [FAIL][95], [FAIL][96]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -> [FAIL][97] ([i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-glk3/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-glk3/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-glk5/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][98], [FAIL][99]) ([i915#1814] / [i915#2295] / [i915#2722]) -> ([FAIL][100], [FAIL][101]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2722])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-tglb6/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-tglb6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb5/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1704]: https://gitlab.freedesktop.org/drm/intel/issues/1704
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2795]: https://gitlab.freedesktop.org/drm/intel/issues/2795
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5897 -> IGTPW_5291

  CI-20190529: 20190529
  CI_DRM_9482: 279e4ca8a7117e617c498833deaa287b797e7d09 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5291: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/index.html
  IGT_5897: c88c4cc74620285079b7f0ae74a85076aeede760 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/index.html

--===============8635538684303462440==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Update condition checks for f=
lipline test</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84932/">https://patchwork.freedesktop.org/series/84932/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5291/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5897_full -&gt; IGTPW_5291_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5291_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_userptr_blits@readonly-mmap-unsync@wb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-tglb5/igt@gem_userptr_blits@readonly-mmap-uns=
ync@wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1704">i915#1704</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-iclb2/igt@gem_userptr_blits@readonly-mmap-uns=
ync@wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1704">i915#1704</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-iclb1/igt@gen7_exec_parse@chained-batch.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-tglb7/igt@gen7_exec_parse@chained-batch.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb5/igt@i91=
5_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tg=
lb5/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2597">i915#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-glk7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-g=
lk3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-iclb8/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-hsw2/igt@kms_chamelium@hdmi-hpd-enable-disabl=
e-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-apl4/igt@kms_chamelium@hdmi-hpd-enable-disabl=
e-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-glk8/igt@kms_chamelium@hdmi-hpd-enable-disabl=
e-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-75:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-iclb3/igt@kms_color@pipe-a-ctm-0-75.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i91=
5#1149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/315=
">i915#315</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-tglb3/igt@kms_color@pipe-a-ctm-0-75.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i91=
5#1149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/315=
">i915#315</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-kbl1/igt@kms_content_protection@srm.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-512x170=
-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +17 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x17=
0-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x17=
0-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5291/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/96">i=
915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-off=
scren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-kbl4/igt@kms_frontbuffer_tracking@psr-1p-off=
scren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-kbl4/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-7=
efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7=
efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-iclb7/igt@kms_plane_lowres@pipe-d-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5291/shard-iclb8/igt@kms_plane_scaling@2x-scaler-multi-=
pipe.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-tglb3/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb5/igt@kms=
_psr@psr2_suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-inactive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-iclb2/igt@nouveau_crc@pipe-a-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-tglb6/igt@nouveau_crc@pipe-a-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-iclb5/igt@perf@polling-parameterized.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb7/i=
gt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-glk5/igt@prime_nv_pcopy@test1_macro.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a>) +14 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-tglb5/igt@prime_nv_pcopy@test1_macro.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">f=
do#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5291/shard-iclb6/igt@prime_nv_pcopy@test1_macro.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">f=
do#109291</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2=
389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
91/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-apl7/igt@kms_color@pipe-b-ctm-green-to-red.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shar=
d-apl1/igt@kms_color@pipe-b-ctm-green-to-red.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-kbl6/igt@kms_color@pipe-b-ctm-green-to-red.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shar=
d-kbl2/igt@kms_color@pipe-b-ctm-green-to-red.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i9=
15#1602</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5291/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a></=
p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i=
915#1602</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5291/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a>=
</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i9=
15#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
35">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5291/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS=
</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i9=
15#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
35">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5291/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS=
</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915=
#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
91/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a>=
</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915=
#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
91/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a>=
</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915=
#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
91/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a>=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible=
@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5291/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank-=
interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidr=
aw.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5291/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-mul=
tidraw.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-=
b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1185">i915#1185</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/250">i915#250</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb1/igt@kms_plane@plane-panning-b=
ottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b=
-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5291/shard-apl6/igt@kms_plane@plane-panning-bottom-=
right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b=
-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5291/shard-glk3/igt@kms_plane@plane-panning-bottom-=
right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-hsw1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b=
-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5291/shard-hsw7/igt@kms_plane@plane-panning-bottom-=
right-suspend-pipe-b-planes.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-=
b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb8/igt@kms_plane@pla=
ne-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5897/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b=
-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5291/shard-kbl7/igt@kms_plane@plane-panning-bottom-ri=
ght-suspend-pipe-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-iclb6/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-iclb2/ig=
t@kms_psr@psr2_dpms.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/sh=
ard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-kbl1/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
14">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5291/shard-kbl6/igt@runner@aborted.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915=
#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483"=
>i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-iclb6/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897=
/shard-iclb7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shar=
d-iclb6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-apl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/s=
hard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-apl2/igt@run=
ner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-glk3/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/s=
hard-glk5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=
=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard=
-glk7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https:/=
/bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5897/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_5897/shard-tglb6/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5291/shard-tglb5/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/shard-tglb3/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
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
<li>IGT: IGT_5897 -&gt; IGTPW_5291</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9482: 279e4ca8a7117e617c498833deaa287b797e7d09 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5291: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5291/index.htm=
l<br />
  IGT_5897: c88c4cc74620285079b7f0ae74a85076aeede760 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8635538684303462440==--

--===============0513966512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0513966512==--
