Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 02 Jan 2021 14:21:53 -0000
Message-ID: <160959731399.23896.1087596508195149025@emeril.freedesktop.org>
References: <20210102004755.3187052-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210102004755.3187052-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fproperties=3AAdd_subtest_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1011429364=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1011429364==
Content-Type: multipart/alternative;
 boundary="===============6601901953474138987=="

--===============6601901953474138987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_properties:Add subtest description
URL   : https://patchwork.freedesktop.org/series/85391/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9538_full -> IGTPW_5344_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5344_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5344_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5344_full:

### IGT changes ###

#### Possible regressions ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-snb7/igt@device_reset@unbind-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-snb5/igt@device_reset@unbind-reset-rebind.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  
Known issues
------------

  Here are the changes found in IGTPW_5344_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#2283])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk6/igt@device_reset@unbind-reset-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk8/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#2283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-apl3/igt@device_reset@unbind-reset-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl4/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#2283])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl7/igt@device_reset@unbind-reset-rebind.html
    - shard-hsw:          [PASS][13] -> [DMESG-WARN][14] ([i915#2283])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-hsw4/igt@device_reset@unbind-reset-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-hsw6/igt@device_reset@unbind-reset-rebind.html
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#1602] / [i915#750])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-tglb1/igt@device_reset@unbind-reset-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb2/igt@device_reset@unbind-reset-rebind.html
    - shard-iclb:         [PASS][17] -> [DMESG-WARN][18] ([i915#2283])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb2/igt@device_reset@unbind-reset-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb7/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-hsw:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#1099]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#118] / [i915#95]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk5/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-hsw:          NOTRUN -> [WARN][22] ([i915#2658])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-hsw6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#112306])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb6/igt@gen9_exec_parse@batch-without-end.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#112306])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb6/igt@gen9_exec_parse@batch-without-end.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#110725] / [fdo#111614])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb7/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#111614])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [fdo#111827])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-0-75.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109284] / [fdo#111827])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb8/igt@kms_color_chamelium@pipe-a-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109284] / [fdo#111827])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [fdo#111827])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk7/igt@kms_color_chamelium@pipe-a-ctm-0-75.html
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [fdo#111827])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - shard-hsw:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-hsw6/igt@kms_color_chamelium@pipe-a-ctm-max.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - shard-glk:          [PASS][33] -> [DMESG-FAIL][34] ([i915#118] / [i915#70] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_cursor_legacy@pipe-d-torture-move:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109278])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb8/igt@kms_cursor_legacy@pipe-d-torture-move.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][36] ([i915#2122])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111825]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271]) +11 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109280]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271]) +14 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271]) +11 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-glk:          [PASS][42] -> [DMESG-WARN][43] ([i915#2635])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-apl:          [PASS][44] -> [DMESG-WARN][45] ([i915#2635])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-hsw:          NOTRUN -> [DMESG-WARN][46] ([i915#2637])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-tglb:         [PASS][47] -> [INCOMPLETE][48] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#2828] / [i915#456])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [PASS][49] -> [INCOMPLETE][50] ([i915#1185] / [i915#250])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-hsw:          NOTRUN -> [SKIP][51] ([fdo#109271]) +283 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-hsw4/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109441]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][54] -> [DMESG-WARN][55] ([i915#1602] / [i915#2635])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-iclb:         [PASS][56] -> [DMESG-WARN][57] ([i915#1602])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-glk:          [PASS][58] -> [DMESG-WARN][59] ([i915#1602] / [i915#2635])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-kbl:          [PASS][60] -> [DMESG-WARN][61] ([i915#1602])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-tglb:         [PASS][62] -> [INCOMPLETE][63] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][64] -> [FAIL][65] ([i915#1542])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk4/igt@perf@polling-parameterized.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk9/igt@perf@polling-parameterized.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109289]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb7/igt@perf@unprivileged-single-ctx-counters.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109289]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb3/igt@perf@unprivileged-single-ctx-counters.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][68], [FAIL][69]) ([fdo#109271] / [i915#2283] / [i915#2295])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-hsw4/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-hsw6/igt@runner@aborted.html
    - shard-snb:          NOTRUN -> ([FAIL][70], [FAIL][71]) ([i915#2292] / [i915#2426] / [i915#698])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-snb7/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-snb5/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][72] ([i915#658]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb1/igt@feature_discovery@psr2.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb2/igt@feature_discovery@psr2.html

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-kbl:          [FAIL][74] ([i915#2846]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-iclb:         [FAIL][76] ([i915#2842]) -> [PASS][77] +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-none-solo@rcs0}:
    - shard-glk:          [FAIL][78] ([i915#2842]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk9/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * {igt@gem_exec_fair@basic-pace-share@rcs0}:
    - shard-tglb:         [FAIL][80] ([i915#2842]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * {igt@gem_exec_fair@basic-pace@vcs0}:
    - shard-kbl:          [FAIL][82] ([i915#2842]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html

  * {igt@gem_exec_fair@basic-pace@vecs0}:
    - shard-kbl:          [SKIP][84] ([fdo#109271]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][86] ([i915#2389]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][88] ([i915#1436] / [i915#716]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk6/igt@gen9_exec_parse@allowed-all.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [SKIP][90] ([fdo#109271]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk7/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-apl:          [SKIP][92] ([fdo#109271]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-apl4/igt@i915_pm_rpm@basic-pci-d3-state.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl2/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-iclb:         [SKIP][94] ([i915#579]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb4/igt@i915_pm_rpm@basic-pci-d3-state.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb1/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-tglb:         [SKIP][96] ([i915#579]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-tglb2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb8/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][98] ([i915#2574]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-tglb5/igt@kms_async_flips@test-time-stamp.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb3/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
    - shard-glk:          [FAIL][100] ([i915#54]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-apl:          [FAIL][102] ([i915#54]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-kbl:          [FAIL][104] ([i915#54]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [FAIL][106] ([i915#79]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-glk:          [FAIL][108] ([i915#49]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][110] ([fdo#109441]) -> [PASS][111] +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][112] ([i915#2295] / [i915#483]) -> ([FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#483] / [i915#602])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-kbl3/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl7/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl2/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         [FAIL][118] ([i915#2295] / [i915#2724] / [i915#483]) -> ([FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#2724] / [i915#483])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-iclb5/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb4/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb7/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb7/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          [FAIL][123] ([i915#2295]) -> ([FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127]) ([fdo#109271] / [i915#1814] / [i915#2295])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-apl1/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl7/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl4/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl3/igt@runner@aborted.html
    - shard-glk:          ([FAIL][128], [FAIL][129]) ([i915#2295] / [k.org#202321]) -> ([FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133]) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk6/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk8/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk9/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk3/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         [FAIL][134] ([i915#2295] / [i915#2667]) -> ([FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1602] / [i915#2295] / [i915#2667])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-tglb2/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb1/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb8/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2292]: https://gitlab.freedesktop.org/drm/intel/issues/2292
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#2574]: https://gitlab.freedesktop.org/drm/intel/issues/2574
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2802]: https://gitlab.freedesktop.org/drm/intel/issues/2802
  [i915#2828]: https://gitlab.freedesktop.org/drm/intel/issues/2828
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5936 -> IGTPW_5344
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9538: 42c0ccd207c442585af326689e6ad2920ef3805c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5344: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/index.html
  IGT_5936: 9c18278e1e12a48bf983aa82d6d79ae3377e0a56 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/index.html

--===============6601901953474138987==
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
<tr><td><b>Series:</b></td><td>tests/kms_properties:Add subtest description=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85391/">https://patchwork.freedesktop.org/series/85391/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5344/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9538_full -&gt; IGTPW_5344_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5344_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5344_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5344=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-snb7/igt@device_reset@unbind-reset-rebind.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard=
-snb5/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-iclb4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5344/shard-iclb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG=
-WARN</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
344/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-W=
ARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5344_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-glk6/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-=
glk8/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-apl3/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-=
apl4/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-=
kbl7/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-hsw4/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-=
hsw6/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-tglb1/igt@device_reset@unbind-reset-rebind.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard=
-tglb2/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/750">i915#750</a>=
)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-iclb2/igt@device_reset@unbind-reset-rebind.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard=
-iclb7/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1099">i915#1099</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/sh=
ard-glk5/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-hsw6/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i=
915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-iclb6/igt@gen9_exec_parse@batch-without-end.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2306">fdo#112306</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-tglb6/igt@gen9_exec_parse@batch-without-end.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2306">fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-iclb7/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-0-75.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-tglb8/igt@kms_color_chamelium@pipe-a-ctm-0-75=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-0-75=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-glk7/igt@kms_color_chamelium@pipe-a-ctm-0-75.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-0-75.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-max:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-hsw6/igt@kms_color_chamelium@pipe-a-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5344/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118"=
>i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
70">i915#70</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-iclb8/igt@kms_cursor_legacy@pipe-d-torture-m=
ove.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblan=
k-interruptible@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-p=
rimscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +11 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-2p-p=
rimscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +14 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-kbl6/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
344/shard-glk4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
344/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-=
pipe-c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5344/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436"=
>i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2828">i915#2828</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/456">i915#456</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-p=
ipe-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5344/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-=
suspend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1185">i915#1185</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/250">i915#250</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-hsw4/igt@kms_plane_lowres@pipe-b-tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +283 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-=
iclb4/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
44/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i91=
5#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
344/shard-iclb4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i=
915#1602</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
44/shard-glk3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i91=
5#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
44/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i91=
5#1602</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
344/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i=
915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/456">i915#456</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-glk4/igt@perf@polling-parameterized.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk9/=
igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-iclb7/igt@perf@unprivileged-single-ctx-counte=
rs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109289">fdo#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-tglb3/igt@perf@unprivileged-single-ctx-counte=
rs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-hsw4/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-hsw6/igt@r=
unner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-snb7/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-snb5/igt@r=
unner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2292">i915#2292</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/698">i915#698</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-iclb1/igt@feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb=
2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-deadline}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/sha=
rd-kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5344/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +3 =
similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-solo@rcs0}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-glk6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
44/shard-glk9/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +2 simi=
lar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-share@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5344/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vcs0}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/sh=
ard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vecs0}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344=
/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5344/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-glk6/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#14=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i9=
15#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5344/shard-glk8/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-glk2/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/=
shard-glk7/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-apl4/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/=
shard-apl2/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-iclb4/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/sha=
rd-iclb1/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-tglb2/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/sha=
rd-tglb8/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2574">i915#257=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344=
/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x85-random:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5344/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html">PASS<=
/a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5344/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html">PASS<=
/a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5344/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html">PASS<=
/a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i=
915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5344/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-in=
dfb-move.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5344/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn=
-cur-indfb-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344=
/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar is=
sue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-kbl3/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5344/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl2/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5344/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-kbl7/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/602">i915#602</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-iclb5/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-=
iclb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5344/shard-iclb7/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-iclb7=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5344/shard-iclb8/igt@runner@aborted.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#22=
83</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i=
915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
724">i915#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-apl1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5344/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-apl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5344/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)=
</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9538/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9538/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.c=
gi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5344/shard-glk9/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk3/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5344/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-glk8/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.ker=
nel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9538/shard-tglb2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb=
1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5344/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/shard-tglb2/igt=
@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2667">i915#2667</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5936 -&gt; IGTPW_5344</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9538: 42c0ccd207c442585af326689e6ad2920ef3805c @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5344: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5344/index.htm=
l<br />
  IGT_5936: 9c18278e1e12a48bf983aa82d6d79ae3377e0a56 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6601901953474138987==--

--===============1011429364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1011429364==--
