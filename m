Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 13 Jan 2021 06:05:30 -0000
Message-ID: <161051793026.11119.9692339183784421972@emeril.freedesktop.org>
References: <20210112225400.115515-1-sungkim@amd.com>
In-Reply-To: <20210112225400.115515-1-sungkim@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/3=5D_lib=3A_Add_stride_and_size_calculation?=
 =?utf-8?q?_for_amdgpu_+_tiling?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0048466752=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Sung Joon Kim <sungkim@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0048466752==
Content-Type: multipart/alternative;
 boundary="===============3499836748815196526=="

--===============3499836748815196526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] lib: Add stride and size calculation for amdgpu + tiling
URL   : https://patchwork.freedesktop.org/series/85772/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9596_full -> IGTPW_5388_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/index.html

Known issues
------------

  Here are the changes found in IGTPW_5388_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-hsw:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][2] ([fdo#112283])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb2/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-hsw:          NOTRUN -> [FAIL][3] ([i915#2389]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw4/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][4] ([i915#2389])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#284])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb7/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][6] ([i915#2658])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][7] ([i915#2658])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk7/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][8] ([i915#2658])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl8/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][9] ([i915#2658])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb1/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][10] ([i915#2658])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl1/igt@gem_pread@exhaustion.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - shard-kbl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1699]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl7/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#1704]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb5/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#1704]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb4/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][14] -> [DMESG-WARN][15] ([i915#1436] / [i915#716])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#2527])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@gen9_exec_parse@bb-large.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#2527])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb8/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#112306])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb6/igt@gen9_exec_parse@bb-start-far.html
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#112306])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][20] -> [INCOMPLETE][21] ([i915#2880])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-kbl:          NOTRUN -> [SKIP][22] ([fdo#109271]) +36 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl2/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         NOTRUN -> [FAIL][23] ([i915#454])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#110892])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-apl:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl1/igt@i915_pm_rpm@pm-tiling.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl8/igt@i915_pm_rpm@pm-tiling.html
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#579])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb6/igt@i915_pm_rpm@pm-tiling.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([i915#579])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb7/igt@i915_pm_rpm@pm-tiling.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-glk:          [PASS][31] -> [DMESG-FAIL][32] ([i915#2291])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk4/igt@i915_selftest@live@gt_heartbeat.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk5/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#1119])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110723])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111615]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo:
    - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271]) +58 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk2/igt@kms_ccs@pipe-c-ccs-on-another-bo.html

  * igt@kms_color@pipe-b-degamma:
    - shard-iclb:         NOTRUN -> [FAIL][38] ([i915#1149])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-d-legacy-gamma:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271]) +26 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl3/igt@kms_color@pipe-d-legacy-gamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-hsw:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-green-to-red:
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@kms_color_chamelium@pipe-a-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-max.html
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl6/igt@kms_color_chamelium@pipe-c-ctm-max.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-max.html
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@kms_color_chamelium@pipe-c-ctm-max.html

  * igt@kms_concurrent@pipe-c:
    - shard-kbl:          [PASS][46] -> [DMESG-WARN][47] ([i915#180] / [i915#78])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl3/igt@kms_concurrent@pipe-c.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl2/igt@kms_concurrent@pipe-c.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [PASS][49] -> [FAIL][50] ([i915#54]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#54]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
    - shard-kbl:          [PASS][53] -> [FAIL][54] ([i915#54]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109279]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [PASS][57] -> [FAIL][58] ([i915#2346])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111825]) +7 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109280]) +9 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [PASS][61] -> [DMESG-WARN][62] ([i915#1602])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [PASS][63] -> [DMESG-WARN][64] ([i915#1602] / [i915#2635])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-glk:          [PASS][65] -> [DMESG-WARN][66] ([i915#1602] / [i915#2635])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-hsw:          [PASS][67] -> [DMESG-WARN][68] ([i915#2637])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-tglb:         [PASS][69] -> [INCOMPLETE][70] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [PASS][71] -> [DMESG-WARN][72] ([i915#1602])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][73] ([fdo#108145] / [i915#265])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-apl:          NOTRUN -> [FAIL][74] ([fdo#108145] / [i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278]) +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb5/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-hsw:          NOTRUN -> [SKIP][77] ([fdo#109271]) +332 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw6/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][78] -> [SKIP][79] ([fdo#109441]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#2437])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@kms_writeback@writeback-fb-id.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#109291])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb2/igt@prime_nv_api@i915_self_import.html

  * igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109291]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html

  * igt@runner@aborted:
    - shard-snb:          NOTRUN -> [FAIL][83] ([i915#2292] / [i915#2722])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-snb4/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [TIMEOUT][84] -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@gem_ctx_persistence@close-replace-race.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-kbl:          [FAIL][86] ([i915#2846]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [FAIL][88] ([i915#2846]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-none@vcs0}:
    - shard-kbl:          [FAIL][90] ([i915#2842]) -> [PASS][91] +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html

  * {igt@gem_exec_schedule@u-fairslice@vcs0}:
    - shard-iclb:         [DMESG-WARN][92] ([i915#2803]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [DMESG-WARN][94] ([i915#118] / [i915#95]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][96] ([i915#2745]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb2/igt@i915_pm_dc@dc5-psr.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][98] ([i915#2745]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb6/igt@i915_pm_dc@dc5-psr.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb7/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [SKIP][100] ([fdo#109271]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl3/igt@i915_pm_rpm@drm-resources-equal.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl1/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [SKIP][102] ([i915#579]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb1/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-apl:          [SKIP][104] ([fdo#109271]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl1/igt@i915_pm_rpm@drm-resources-equal.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl8/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-tglb:         [SKIP][106] ([i915#579]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb6/igt@i915_pm_rpm@drm-resources-equal.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c:
    - shard-kbl:          [DMESG-WARN][108] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-kbl:          [FAIL][110] ([i915#54]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-apl:          [FAIL][112] ([i915#54]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][114] ([i915#54]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-kbl:          [DMESG-WARN][116] ([i915#180] / [i915#78]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl1/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][118] ([i915#2635]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][120] -> [PASS][121] +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][122] ([i915#2598]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][124] ([i915#180]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][126] ([i915#2295]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-kbl:          [DMESG-WARN][128] ([i915#165] / [i915#180] / [i915#2621] / [i915#78]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl4/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][130] ([fdo#109441]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@syncobj_wait@wait-for-submit-snapshot:
    - shard-kbl:          [DMESG-WARN][132] ([i915#165]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@syncobj_wait@wait-for-submit-snapshot.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl4/igt@syncobj_wait@wait-for-submit-snapshot.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][134] ([i915#2681] / [i915#2684]) -> [WARN][135] ([i915#1804] / [i915#2684])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][136] ([i915#2681] / [i915#2684]) -> [WARN][137] ([i915#2684])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][138], [FAIL][139]) ([i915#2295]) -> ([FAIL][140], [FAIL][141]) ([i915#1814] / [i915#2295] / [i915#2505])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl4/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][142], [FAIL][143]) ([i915#2295] / [i915#2426] / [i915#2724]) -> ([FAIL][144], [FAIL][145]) ([i915#1814] / [i915#2295] / [i915#2724])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb3/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb8/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          [FAIL][146] ([i915#2295]) -> ([FAIL][147], [FAIL][148]) ([i915#1814] / [i915#2295])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl6/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl2/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][149], [FAIL][150]) ([i915#2295] / [k.org#202321]) -> ([FAIL][151], [FAIL][152], [FAIL][153]) ([i915#1814] / [i915#2295] / [k.org#202321])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk9/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk6/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk6/igt@runner@aborted.html
    - shard-tglb:         [FAIL][154] ([i915#2295] / [i915#2667]) -> ([FAIL][155], [FAIL][156], [FAIL][157]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb3/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb5/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/index.html

--===============3499836748815196526==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] lib: Add stride and size calculation for amdgpu + tiling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85772/">https://patchwork.freedesktop.org/series/85772/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9596_full -&gt; IGTPW_5388_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5388_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1099]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb2/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw4/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl8/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@uc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl7/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-mmap-unsync@wb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb5/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb4/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk2/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk6/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb8/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#2880])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl2/igt@i915_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +36 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb5/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl8/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb6/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb7/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk4/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk5/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> ([i915#2291])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> ([i915#1119])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk2/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +58 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-legacy-gamma:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl3/igt@kms_color@pipe-d-legacy-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-green-to-red:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@kms_color_chamelium@pipe-a-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-max:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl6/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id">fdo#109284</a> / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id">fdo#109284</a> / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-c:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl3/igt@kms_concurrent@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl2/igt@kms_concurrent@pipe-c.html">DMESG-WARN</a> ([i915#180] / [i915#78])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">FAIL</a> ([i915#54]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">FAIL</a> ([i915#54]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">FAIL</a> ([i915#54]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#2637])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb5/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw6/igt@kms_plane_lowres@pipe-b-tiling-yf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +332 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb2/igt@prime_nv_api@i915_self_import.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-snb4/igt@runner@aborted.html">FAIL</a> ([i915#2292] / [i915#2722])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-deadline}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@vcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb2/igt@i915_pm_dc@dc5-psr.html">FAIL</a> ([i915#2745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@i915_pm_dc@dc5-psr.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb6/igt@i915_pm_dc@dc5-psr.html">FAIL</a> ([i915#2745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb7/igt@i915_pm_dc@dc5-psr.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl3/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl1/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb1/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl1/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl8/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb6/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb3/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c.html">DMESG-WARN</a> ([i915#165] / [i915#180] / [i915#78]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">DMESG-WARN</a> ([i915#180] / [i915#78]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl1/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-y.html">DMESG-WARN</a> ([i915#165] / [i915#180] / [i915#2621] / [i915#78]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl4/igt@kms_plane_lowres@pipe-a-tiling-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@wait-for-submit-snapshot:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl2/igt@syncobj_wait@wait-for-submit-snapshot.html">DMESG-WARN</a> ([i915#165]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl4/igt@syncobj_wait@wait-for-submit-snapshot.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i915#2295]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2505])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-iclb8/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2426] / [i915#2724]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-iclb2/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2724])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-apl6/igt@runner@aborted.html">FAIL</a> ([i915#2295]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-apl4/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-glk6/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-glk6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9596/shard-tglb3/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2667]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5388/shard-tglb6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============3499836748815196526==--

--===============0048466752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0048466752==--
