Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1044697048813354797=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Fri, 04 Nov 2022 02:55:35 -0000
Message-ID: <166753053504.23020.107076302414986406@emeril.freedesktop.org>
References: <20221102110428.4049549-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20221102110428.4049549-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Fix_SIGABRT_in_dynamic_subtests_=28rev2?=
 =?utf-8?q?=29?=
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

--===============1044697048813354797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Fix SIGABRT in dynamic subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/110407/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12340 -> IGTPW_8044
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html

Participating hosts (16 -> 36)
------------------------------

  Additional (23): fi-rkl-guc fi-bdw-gvtdvm fi-icl-u2 bat-adlp-6 fi-pnv-d510 bat-rpls-1 bat-rpls-2 bat-dg2-8 bat-dg2-9 fi-hsw-g3258 fi-ilk-650 bat-adln-1 fi-elk-e7500 bat-rplp-1 bat-dg2-11 fi-skl-6700k2 fi-tgl-mst fi-kbl-7567u fi-skl-guc fi-cfl-8700k bat-jsl-1 fi-cfl-guc bat-adlp-4 
  Missing    (3): fi-ctg-p8600 fi-bdw-samus fi-hsw-4200u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8044:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@debugfs_test@basic-hwmon}:
    - {bat-rpls-2}:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-rpls-2/igt@debugfs_test@basic-hwmon.html
    - {fi-tgl-mst}:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-tgl-mst/igt@debugfs_test@basic-hwmon.html
    - {bat-adlp-6}:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
    - {bat-rplp-1}:       NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
    - fi-icl-u2:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@debugfs_test@basic-hwmon.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-4:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@debugfs_test@basic-hwmon.html
    - {bat-adln-1}:       NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adln-1/igt@debugfs_test@basic-hwmon.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-rpls-1/igt@debugfs_test@basic-hwmon.html

  
Known issues
------------

  Here are the changes found in IGTPW_8044 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        NOTRUN -> [FAIL][11] ([i915#7229])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#2190])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#2190])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html
    - fi-icl-u2:          NOTRUN -> [SKIP][14] ([i915#2190])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@gem_huc_copy@huc-copy.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#2190])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][17] ([i915#4613]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@gem_lmem_swapping@basic.html
    - fi-skl-guc:         NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-guc/igt@gem_lmem_swapping@basic.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4613]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-6700k2/igt@gem_lmem_swapping@basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][22] ([fdo#109271]) +9 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-g3258/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][23] ([i915#4613]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-guc:         NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html
    - bat-adlp-4:         NOTRUN -> [SKIP][25] ([i915#4613]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-guc:         NOTRUN -> [SKIP][26] ([i915#3282])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@gem_tiled_pread_basic.html
    - bat-adlp-4:         NOTRUN -> [SKIP][27] ([i915#3282])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#3012])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][29] ([i915#3012])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-elk-e7500:       NOTRUN -> [SKIP][30] ([fdo#109271]) +20 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-elk-e7500/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-ilk-650:         NOTRUN -> [SKIP][31] ([fdo#109271]) +19 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-ilk-650/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rps@basic-api:
    - fi-rkl-guc:         NOTRUN -> [SKIP][32] ([i915#6621])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@i915_pm_rps@basic-api.html
    - bat-adlp-4:         NOTRUN -> [SKIP][33] ([i915#6621])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][34] -> [INCOMPLETE][35] ([i915#4785])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][36] ([i915#146])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cfl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-guc/igt@kms_chamelium@dp-crc-fast.html
    - bat-adlp-4:         NOTRUN -> [SKIP][38] ([fdo#111827]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-apl-guc:         NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][42] ([fdo#111827]) +8 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-skl-guc:         NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-elk-e7500:       NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html
    - fi-ilk-650:         NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-ilk-650/igt@kms_chamelium@hdmi-edid-read.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-g3258/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][47] ([fdo#111827]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-bdw-gvtdvm/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][49] ([fdo#109271]) +10 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - bat-adlp-4:         NOTRUN -> [SKIP][50] ([i915#4103])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-icl-u2:          NOTRUN -> [SKIP][51] ([i915#4103])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][52] ([i915#4103])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_flip@basic-plain-flip:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][53] ([fdo#109271]) +37 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-bdw-gvtdvm/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-apl-guc:         NOTRUN -> [SKIP][54] ([fdo#109271]) +11 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-apl-guc/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][55] ([fdo#109271]) +15 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-6700k2/igt@kms_force_connector_basic@force-load-detect.html
    - fi-icl-u2:          NOTRUN -> [SKIP][56] ([fdo#109285])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][57] ([fdo#109285])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-adlp-4:         NOTRUN -> [SKIP][58] ([i915#4093]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adlp-4:         NOTRUN -> [SKIP][59] ([i915#3546])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_psr@cursor_plane_move:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][60] ([fdo#109271]) +31 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-kbl-7567u/igt@kms_psr@cursor_plane_move.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#1072]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-g3258/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-rkl-guc:         NOTRUN -> [SKIP][62] ([i915#1072]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][63] ([fdo#109271]) +43 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-guc:         NOTRUN -> [SKIP][64] ([i915#3555] / [i915#4098])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-skl-guc:         NOTRUN -> [SKIP][65] ([fdo#109271]) +10 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-icl-u2:          NOTRUN -> [SKIP][66] ([i915#3555])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adlp-4:         NOTRUN -> [SKIP][67] ([i915#3555] / [i915#4579])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - fi-rkl-guc:         NOTRUN -> [SKIP][68] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-userptr:
    - fi-cfl-guc:         NOTRUN -> [SKIP][69] ([fdo#109271]) +10 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-guc/igt@prime_vgem@basic-userptr.html
    - bat-adlp-4:         NOTRUN -> [SKIP][70] ([fdo#109295] / [i915#3301] / [i915#3708])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@prime_vgem@basic-userptr.html
    - fi-icl-u2:          NOTRUN -> [SKIP][71] ([fdo#109295] / [i915#3301])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@prime_vgem@basic-userptr.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][72] ([fdo#109295] / [i915#3301] / [i915#3708])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@basic-write:
    - bat-adlp-4:         NOTRUN -> [SKIP][73] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@prime_vgem@basic-write.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][74] ([fdo#109271] / [i915#4312] / [i915#5594])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_render_tiled_blits@basic:
    - fi-apl-guc:         [INCOMPLETE][75] ([i915#7056]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-apl-guc/igt@gem_render_tiled_blits@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7056]: https://gitlab.freedesktop.org/drm/intel/issues/7056
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7043 -> IGTPW_8044

  CI-20190529: 20190529
  CI_DRM_12340: d34d4266c5ad4a28019a76b6a19602370b070268 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8044: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html
  IGT_7043: eef0a0c904846509f8185330ccd210a578ba55ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html

--===============1044697048813354797==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Fix SIGABRT in dynamic subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110407/">https://patchwork.freedesktop.org/series/110407/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12340 -&gt; IGTPW_8044</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html</p>
<h2>Participating hosts (16 -&gt; 36)</h2>
<p>Additional (23): fi-rkl-guc fi-bdw-gvtdvm fi-icl-u2 bat-adlp-6 fi-pnv-d510 bat-rpls-1 bat-rpls-2 bat-dg2-8 bat-dg2-9 fi-hsw-g3258 fi-ilk-650 bat-adln-1 fi-elk-e7500 bat-rplp-1 bat-dg2-11 fi-skl-6700k2 fi-tgl-mst fi-kbl-7567u fi-skl-guc fi-cfl-8700k bat-jsl-1 fi-cfl-guc bat-adlp-4 <br />
  Missing    (3): fi-ctg-p8600 fi-bdw-samus fi-hsw-4200u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8044:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@debugfs_test@basic-hwmon}:</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-mst}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-tgl-mst/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-rpls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8044 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-6700k2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-g3258/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-elk-e7500/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +20 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-ilk-650/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-guc/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-ilk-650/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-g3258/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-bdw-gvtdvm/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-bdw-gvtdvm/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-apl-guc/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-6700k2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-kbl-7567u/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-g3258/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-cfl-guc/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-rkl-guc/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/bat-adlp-4/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_render_tiled_blits@basic:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7056">i915#7056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7043 -&gt; IGTPW_8044</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12340: d34d4266c5ad4a28019a76b6a19602370b070268 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8044: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html<br />
  IGT_7043: eef0a0c904846509f8185330ccd210a578ba55ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1044697048813354797==--
