Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6542346332231582065=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 10 May 2022 09:04:37 -0000
Message-ID: <165217347707.26422.3866172700632416728@emeril.freedesktop.org>
References: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ29udmVy?=
 =?utf-8?q?t_subtests_to_dynamic_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============6542346332231582065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Convert subtests to dynamic (rev4)
URL   : https://patchwork.freedesktop.org/series/103734/
State : success

== Summary ==

CI Bug Log - changes from IGT_6470 -> IGTPW_7074
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/index.html

Participating hosts (42 -> 39)
------------------------------

  Additional (1): bat-adlp-4 
  Missing    (4): fi-bsw-cyan bat-rpls-1 fi-rkl-11600 bat-dg2-9 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7074:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c} (NEW):
    - {bat-dg2-8}:        NOTRUN -> [SKIP][1] +13 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor}:
    - {bat-jsl-1}:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - bat-dg1-6:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {bat-jsl-2}:        NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-jsl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-adl-ddr5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - bat-adlp-4:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {bat-adln-1}:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {bat-adlp-6}:       NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {bat-rpls-2}:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-rpls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * {igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b}:
    - {bat-dg2-8}:        NOTRUN -> [SKIP][15] +26 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b.html

  
New tests
---------

  New tests have been introduced between IGT_6470 and IGTPW_7074:

### New IGT tests (27) ###

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:
    - Statuses : 9 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - Statuses : 9 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.06] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - Statuses : 9 pass(s) 5 skip(s)
    - Exec time: [0.00, 1.03] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:
    - Statuses : 13 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.35] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:
    - Statuses : 13 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
    - Statuses : 13 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@kms_cursor_legacy@basic-flip-after-cursor:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a:
    - Statuses : 33 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.78] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b:
    - Statuses : 33 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.25] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c:
    - Statuses : 1 dmesg-warn(s) 25 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.94] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a:
    - Statuses : 33 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b:
    - Statuses : 33 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.12] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c:
    - Statuses : 1 dmesg-warn(s) 25 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.02] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c:
    - Statuses : 1 dmesg-warn(s) 25 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.97] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a:
    - Statuses : 23 pass(s) 4 skip(s)
    - Exec time: [0.0, 17.44] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b:
    - Statuses : 23 pass(s) 4 skip(s)
    - Exec time: [0.0, 17.97] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c:
    - Statuses : 19 pass(s) 4 skip(s)
    - Exec time: [0.0, 17.96] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 17.99] s

  

Known issues
------------

  Here are the changes found in IGTPW_7074 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-cfl-8109u:       [PASS][16] -> [DMESG-WARN][17] ([i915#62])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_lmem_swapping@basic:
    - bat-adlp-4:         NOTRUN -> [SKIP][18] ([i915#4613]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@gem_lmem_swapping@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-4:         NOTRUN -> [SKIP][19] ([i915#3282])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@gem_tiled_pread_basic.html

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [PASS][20] -> [DMESG-WARN][21] ([i915#5904] / [i915#62])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@i915_module_load@reload.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@gem:
    - fi-pnv-d510:        NOTRUN -> [DMESG-FAIL][22] ([i915#4528])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-pnv-d510/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@gt_engines:
    - fi-cfl-8109u:       [PASS][23] -> [DMESG-WARN][24] ([i915#5904]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@i915_selftest@live@gt_engines.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][25] -> [INCOMPLETE][26] ([i915#4785])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][27] -> [DMESG-FAIL][28] ([i915#4528])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-4:         NOTRUN -> [DMESG-WARN][29] ([i915#3576]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_busy@basic@modeset.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][30] ([fdo#109271] / [fdo#111827])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - bat-adlp-4:         NOTRUN -> [SKIP][31] ([fdo#111827]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][32] ([fdo#109271]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-elk-e7500/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][33] ([fdo#109271]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][34] ([fdo#109271]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-pnv-d510/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][35] ([fdo#109271]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-cfl-8109u:       [PASS][36] -> [DMESG-WARN][37] ([i915#165]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@kms_force_connector_basic@force-connector-state.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-cfl-8109u:       [PASS][38] -> [DMESG-WARN][39] ([i915#165] / [i915#62])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@kms_force_connector_basic@force-edid.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-adlp-4:         NOTRUN -> [SKIP][40] ([i915#4093]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * {igt@kms_pipe_crc_basic@hang-read-crc@pipe-a} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][41] ([fdo#109271]) +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-kbl-7567u/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a.html

  * {igt@kms_pipe_crc_basic@hang-read-crc@pipe-b} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][42] ([fdo#109271]) +12 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b.html

  * {igt@kms_pipe_crc_basic@hang-read-crc@pipe-c} (NEW):
    - fi-kbl-8809g:       NOTRUN -> [SKIP][43] ([fdo#109271]) +9 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-kbl-8809g/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c.html

  * {igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [DMESG-WARN][44] ([i915#165] / [i915#62]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][45] ([fdo#109271]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c.html

  * {igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][46] ([fdo#109271]) +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adlp-4:         NOTRUN -> [SKIP][47] ([i915#3555] / [i915#4579])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adlp-4:         NOTRUN -> [SKIP][48] ([i915#3291] / [i915#3708]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-userptr:
    - bat-adlp-4:         NOTRUN -> [SKIP][49] ([i915#3301] / [i915#3708])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-1115g4:      [DMESG-FAIL][50] ([i915#3987]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@gtt:
    - fi-bdw-5557u:       [DMESG-FAIL][52] ([i915#3674]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-bdw-5557u/igt@i915_selftest@live@gtt.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bdw-5557u/igt@i915_selftest@live@gtt.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [INCOMPLETE][54] ([i915#4785]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][56] ([i915#4528]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][58] ([i915#3576]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-cfl-8109u:       [DMESG-WARN][60] ([i915#62]) -> [DMESG-WARN][61] ([i915#165] / [i915#62]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [DMESG-FAIL][62] ([i915#62]) -> [DMESG-WARN][63] ([i915#62])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3674]: https://gitlab.freedesktop.org/drm/intel/issues/3674
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5879]: https://gitlab.freedesktop.org/drm/intel/issues/5879
  [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
  [i915#5950]: https://gitlab.freedesktop.org/drm/intel/issues/5950
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6470 -> IGTPW_7074

  CI-20190529: 20190529
  CI_DRM_11627: b90a46b7cf238262635312ddb0f150f08c9b9417 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7074: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/index.html
  IGT_6470: 93fa4422bd91c47fbc5699efa3725287a7754699 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 56 lines
--- 672 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/index.html

--===============6542346332231582065==
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
<tr><td><b>Series:</b></td><td>Convert subtests to dynamic (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/103734/">https://patchwork.freedesktop.org/series/103734/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6470 -&gt; IGTPW_7074</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Additional (1): bat-adlp-4 <br />
  Missing    (4): fi-bsw-cyan bat-rpls-1 fi-rkl-11600 bat-dg2-9 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7074:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c} (NEW):<ul>
<li>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c.html">SKIP</a> +13 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor}:</p>
<ul>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-jsl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-adl-ddr5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-rpls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b}:</p>
<ul>
<li>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b.html">SKIP</a> +26 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6470 and IGTPW_7074:</p>
<h3>New IGT tests (27)</h3>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:</p>
<ul>
<li>Statuses : 9 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>Statuses : 9 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 9 pass(s) 5 skip(s)</li>
<li>Exec time: [0.00, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:</p>
<ul>
<li>Statuses : 13 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:</p>
<ul>
<li>Statuses : 13 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:</p>
<ul>
<li>Statuses : 13 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a:</p>
<ul>
<li>Statuses : 33 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b:</p>
<ul>
<li>Statuses : 33 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 25 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a:</p>
<ul>
<li>Statuses : 33 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b:</p>
<ul>
<li>Statuses : 33 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 25 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 25 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a:</p>
<ul>
<li>Statuses : 23 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 17.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b:</p>
<ul>
<li>Statuses : 23 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 17.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c:</p>
<ul>
<li>Statuses : 19 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 17.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 17.99] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7074 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-pnv-d510/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@i915_selftest@live@gt_engines.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-elk-e7500/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-pnv-d510/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions} (NEW):</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@hang-read-crc@pipe-a} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-kbl-7567u/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@hang-read-crc@pipe-b} (NEW):</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@hang-read-crc@pipe-c} (NEW):</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-kbl-8809g/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#3987</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3674">i915#3674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6470/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6470 -&gt; IGTPW_7074</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11627: b90a46b7cf238262635312ddb0f150f08c9b9417 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7074: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7074/index.html<br />
  IGT_6470: 93fa4422bd91c47fbc5699efa3725287a7754699 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 56 lines<br />
--- 672 lines</p>

</body>
</html>

--===============6542346332231582065==--
