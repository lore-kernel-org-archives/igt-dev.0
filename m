Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Aug 2020 01:16:29 -0000
Message-ID: <159797258948.16199.11554563994530113446@emeril.freedesktop.org>
References: <20200820145215.13238-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200820145215.13238-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Fixes_and_enhancements_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1129466227=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1129466227==
Content-Type: multipart/alternative;
 boundary="===============7955115637224171812=="

--===============7955115637224171812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_hotunplug: Fixes and enhancements (rev3)
URL   : https://patchwork.freedesktop.org/series/79671/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8910_full -> IGTPW_4899_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4899_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4899_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4899_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_hotunplug@hotrebind-lateclose} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-snb5/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-iclb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb4/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-kbl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@core_hotunplug@hotrebind-lateclose.html

  * {igt@core_hotunplug@hotunbind-lateclose} (NEW):
    - shard-hsw:          NOTRUN -> [INCOMPLETE][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw4/igt@core_hotunplug@hotunbind-lateclose.html

  * igt@gem_exec_reloc@basic-cpu-read-active:
    - shard-snb:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-snb2/igt@gem_exec_reloc@basic-cpu-read-active.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-snb5/igt@gem_exec_reloc@basic-cpu-read-active.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-tglb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-tglb8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-tglb3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
    - shard-glk:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-glk2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
    - shard-kbl:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
    - shard-iclb:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-snb:          [SKIP][15] ([fdo#109271]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-snb5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][17], [FAIL][18]) ([i915#1958] / [i915#2283]) -> ([FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23]) ([i915#2283])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw8/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw2/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw8/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw7/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw6/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw4/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw7/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8910_full and IGTPW_4899_full:

### New IGT tests (4) ###

  * igt@core_hotunplug@hotrebind-lateclose:
    - Statuses : 4 fail(s) 1 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 17.24] s

  * igt@core_hotunplug@hotunbind-lateclose:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 0.53] s

  * igt@core_hotunplug@hotunbind-rebind:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 1.92] s

  * igt@core_hotunplug@unbind-rebind:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 1.90] s

  

Known issues
------------

  Here are the changes found in IGTPW_4899_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][24] -> [INCOMPLETE][25] ([i915#794])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#118] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#1635])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-apl8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-apl3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [PASS][30] -> [WARN][31] ([i915#1515])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#165])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-snb:          [PASS][34] -> [TIMEOUT][35] ([i915#1958])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-snb4/igt@kms_addfb_basic@bad-pitch-999.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-snb5/igt@kms_addfb_basic@bad-pitch-999.html
    - shard-hsw:          [PASS][36] -> [TIMEOUT][37] ([i915#1958])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw4/igt@kms_addfb_basic@bad-pitch-999.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw6/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +9 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-c-single-bo:
    - shard-hsw:          [PASS][40] -> [INCOMPLETE][41] ([CI#80])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw2/igt@kms_cursor_legacy@pipe-c-single-bo.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw4/igt@kms_cursor_legacy@pipe-c-single-bo.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][42] -> [DMESG-WARN][43] ([i915#1982])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw7/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw1/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-kbl:          [PASS][44] -> [FAIL][45] ([i915#79]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_flip_tiling@flip-yf-tiled:
    - shard-kbl:          [PASS][46] -> [DMESG-WARN][47] ([i915#1982])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl7/igt@kms_flip_tiling@flip-yf-tiled.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@kms_flip_tiling@flip-yf-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         [PASS][48] -> [DMESG-WARN][49] ([i915#1982])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][50] -> [DMESG-WARN][51] ([i915#1982]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109441]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][54] -> [FAIL][55] ([i915#31])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl1/igt@kms_setmode@basic.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [PASS][56] -> [SKIP][57] ([fdo#109271] / [i915#1354])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-glk7/igt@perf@disabled-read-error.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-glk7/igt@perf@disabled-read-error.html
    - shard-apl:          [PASS][58] -> [SKIP][59] ([fdo#109271] / [i915#1354] / [i915#1635])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-apl1/igt@perf@disabled-read-error.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-apl3/igt@perf@disabled-read-error.html
    - shard-kbl:          [PASS][60] -> [SKIP][61] ([fdo#109271] / [i915#1354])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl1/igt@perf@disabled-read-error.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@perf@disabled-read-error.html
    - shard-tglb:         [PASS][62] -> [SKIP][63] ([i915#1354])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-tglb7/igt@perf@disabled-read-error.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-tglb3/igt@perf@disabled-read-error.html
    - shard-iclb:         [PASS][64] -> [SKIP][65] ([i915#1354])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb7/igt@perf@disabled-read-error.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb4/igt@perf@disabled-read-error.html

  * igt@perf@polling-parameterized:
    - shard-kbl:          [PASS][66] -> [FAIL][67] ([i915#1542])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl1/igt@perf@polling-parameterized.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl7/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@all:
    - shard-glk:          [DMESG-WARN][68] ([i915#118] / [i915#95]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-glk5/igt@gem_exec_gttfill@all.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-glk7/igt@gem_exec_gttfill@all.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-snb:          [TIMEOUT][70] ([i915#1958]) -> [PASS][71] +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-snb5/igt@gem_exec_suspend@basic-s3.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-snb2/igt@gem_exec_suspend@basic-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][72] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@debugfs-reader:
    - shard-iclb:         [INCOMPLETE][74] ([i915#1185]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb3/igt@i915_suspend@debugfs-reader.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][76] ([i915#118] / [i915#95]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge:
    - shard-hsw:          [DMESG-WARN][78] ([i915#1982]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw6/igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw7/igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-tglb:         [DMESG-WARN][80] ([i915#1982]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-tglb5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-tglb1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-kbl:          [DMESG-WARN][82] ([i915#1982]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-iclb:         [DMESG-WARN][84] ([i915#1982]) -> [PASS][85] +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87] +5 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-glk:          [DMESG-WARN][88] ([i915#1982]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-glk6/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-glk3/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][90] ([fdo#109441]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][92] ([i915#31]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw2/igt@kms_setmode@basic.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw7/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][94] ([i915#1542]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb4/igt@perf@blocking-parameterized.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb1/igt@perf@blocking-parameterized.html

  * igt@perf@oa-exponents:
    - shard-hsw:          [INCOMPLETE][96] ([i915#1958]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw2/igt@perf@oa-exponents.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw8/igt@perf@oa-exponents.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [FAIL][98] ([i915#2258]) -> [PASS][99] +7 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html

  
#### Warnings ####

  * igt@gem_exec_schedule@preemptive-hang:
    - shard-snb:          [TIMEOUT][100] ([i915#1958]) -> [SKIP][101] ([fdo#109271]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-snb5/igt@gem_exec_schedule@preemptive-hang.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-snb4/igt@gem_exec_schedule@preemptive-hang.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][102] ([i915#658]) -> [SKIP][103] ([i915#588])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][104] ([i915#1515]) -> [WARN][105] ([i915#1515])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-snb:          [SKIP][106] ([fdo#109271]) -> [TIMEOUT][107] ([i915#1958]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-snb4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-snb5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_chamelium@dp-audio-edid:
    - shard-snb:          [SKIP][108] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][109] ([i915#1958]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-snb2/igt@kms_chamelium@dp-audio-edid.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-snb5/igt@kms_chamelium@dp-audio-edid.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-hsw:          [SKIP][110] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][111] ([i915#1958]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw1/igt@kms_chamelium@dp-crc-multiple.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw6/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][112] ([fdo#109349]) -> [DMESG-WARN][113] ([i915#1226])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-hsw:          [SKIP][114] ([fdo#109271]) -> [TIMEOUT][115] ([i915#1958]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5769 -> IGTPW_4899
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8910: a300e6a7af948f4a89a1e4ca42e8d2ae0d580f4e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4899: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/index.html
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/index.html

--===============7955115637224171812==
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
<tr><td><b>Series:</b></td><td>tests/core_hotunplug: Fixes and enhancements=
 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/79671/">https://patchwork.freedesktop.org/series/79671/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4899/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4899/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8910_full -&gt; IGTPW_4899_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4899_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_4899_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4899=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind-lateclose} (NEW):</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4899/shard-snb5/igt@core_hotunplug@hotrebind-lateclose.h=
tml">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4899/shard-iclb4/igt@core_hotunplug@hotrebind-lateclose.=
html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4899/shard-kbl4/igt@core_hotunplug@hotrebind-lateclose.h=
tml">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@core_hotunplug@hotunbind-lateclose} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4899/shard-hsw4/igt@core_hotunplug@hotunbind-lateclose.=
html">INCOMPLETE</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-active:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-snb2/igt@gem_exec_reloc@basic-cpu-read-active.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/s=
hard-snb5/igt@gem_exec_reloc@basic-cpu-read-active.html">FAIL</a> +1 simila=
r issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-tglb8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4899/shard-tglb3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html">FAI=
L</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-glk2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4899/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html">FAIL<=
/a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-kbl7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4899/shard-kbl4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html">FAIL<=
/a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-iclb5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4899/shard-iclb4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html">FAI=
L</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_4899/shard-snb5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.ht=
ml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_8910/shard-hsw8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8910/shard-hsw2/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2283">i915#2283</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_4899/shard-hsw8/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw7/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_4899/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw4/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4899/shard-hsw7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8910_full and IGTPW_4899_f=
ull:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>Statuses : 4 fail(s) 1 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 17.24] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-lateclose:</p>
<ul>
<li>Statuses : 1 incomplete(s) 6 pass(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>Statuses : 1 incomplete(s) 6 pass(s)</li>
<li>Exec time: [0.0, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>Statuses : 1 incomplete(s) 6 pass(s)</li>
<li>Exec time: [0.0, 1.90] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4899_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899=
/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4899/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95=
">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-apl8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4899/shard-apl3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915=
#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard=
-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_48=
99/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i915#=
165</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-snb4/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-snb=
5/igt@kms_addfb_basic@bad-pitch-999.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-hsw4/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw=
6/igt@kms_addfb_basic@bad-pitch-999.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/s=
hard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-single-bo:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-hsw2/igt@kms_cursor_legacy@pipe-c-single-bo.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/sha=
rd-hsw4/igt@kms_cursor_legacy@pipe-c-single-bo.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-hsw7/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4899/shard-hsw1/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/=
shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-kbl7/igt@kms_flip_tiling@flip-yf-tiled.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kb=
l4/igt@kms_flip_tiling@flip-yf-tiled.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4899/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-shrfb-plflip-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4899/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-=
iclb8/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-kbl1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@kms_=
setmode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-glk7/igt@perf@disabled-read-error.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-glk7/igt=
@perf@disabled-read-error.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-apl1/igt@perf@disabled-read-error.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-apl3/igt=
@perf@disabled-read-error.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-kbl1/igt@perf@disabled-read-error.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt=
@perf@disabled-read-error.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-tglb7/igt@perf@disabled-read-error.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-tglb3/i=
gt@perf@disabled-read-error.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8910/shard-iclb7/igt@perf@disabled-read-error.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-iclb4/i=
gt@perf@disabled-read-error.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-kbl1/igt@perf@polling-parameterized.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl7/=
igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-glk5/igt@gem_exec_gttfill@all.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard=
-glk7/igt@gem_exec_gttfill@all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-snb5/igt@gem_exec_suspend@basic-s3.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/sha=
rd-snb2/igt@gem_exec_suspend@basic-s3.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-apl6/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#14=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i=
915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7=
16">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4899/shard-apl2/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb3/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1=
185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_48=
99/shard-iclb6/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i91=
5#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">=
i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4899/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-hsw6/igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_4899/shard-hsw7/igt@kms_cursor_edge_walk@pipe-b-256x256-bo=
ttom-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-tglb5/igt@kms_cursor_legacy@basic-flip-after-cursor-vary=
ing-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_4899/shard-tglb1/igt@kms_cursor_legacy@basic-flip-=
after-cursor-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_4899/shard-kbl4/igt@kms_frontbuffer_tracking@f=
bc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb=
-msflip-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_4899/shard-iclb2/igt@kms_frontbuffer_tracking@f=
bc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4899/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.ht=
ml">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-primary-size-128:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-glk6/igt@kms_plane_cursor@pipe-a-primary-size-128.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4899/shard-glk3/igt@kms_plane_cursor@pipe-a-primary-size-128.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_48=
99/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> +1 simila=
r issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-hsw2/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw7/igt@kms=
_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb4/igt@perf@blocking-parameterized.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/sha=
rd-iclb1/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-hsw2/igt@perf@oa-exponents.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hs=
w8/igt@perf@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-=
hsw4/igt@prime_busy@hang-wait@bcs0.html">PASS</a> +7 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@preemptive-hang:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-snb5/igt@gem_exec_schedule@preemptive-hang.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915=
#1958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4899/shard-snb4/igt@gem_exec_schedule@preemptive-hang.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/s=
hard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/=
shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-snb4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4899/shard-snb5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958=
</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-audio-edid:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-snb2/igt@kms_chamelium@dp-audio-edid.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#=
111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4899/shard-snb5/igt@kms_chamelium@dp-audio-edid.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-hsw1/igt@kms_chamelium@dp-crc-multiple.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fd=
o#111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4899/shard-hsw6/igt@kms_chamelium@dp-crc-multiple.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_48=
99/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8910/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri=
-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_4899/shard-hsw6/igt@kms_frontbuffer_tracki=
ng@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">TIMEOUT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 si=
milar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5769 -&gt; IGTPW_4899</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8910: a300e6a7af948f4a89a1e4ca42e8d2ae0d580f4e @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_4899: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4899/index.htm=
l<br />
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7955115637224171812==--

--===============1129466227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1129466227==--
