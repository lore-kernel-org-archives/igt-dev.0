Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4071343199526892443=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Thu, 07 Sep 2023 18:38:27 -0000
Message-ID: <169411190782.17902.13046719187076316811@emeril.freedesktop.org>
References: <20230907161155.1828658-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230907161155.1828658-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU2VwYXJh?=
 =?utf-8?q?te_display_PM_tests_from_Core_=28rev3=29?=
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

--===============4071343199526892443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Separate display PM tests from Core (rev3)
URL   : https://patchwork.freedesktop.org/series/122790/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13609 -> IGTPW_9745
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/index.html

Participating hosts (22 -> 38)
------------------------------

  Additional (19): fi-apl-guc fi-pnv-d510 fi-blb-e6850 fi-skl-6600u fi-ilk-650 fi-elk-e7500 fi-bsw-nick fi-kbl-7567u bat-kbl-2 bat-adlp-9 fi-skl-guc fi-cfl-8700k fi-glk-j4005 bat-mtlp-6 bat-adlp-11 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-kbl-8809g 
  Missing    (3): fi-kbl-soraka bat-dg2-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9745:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_pm_backlight@basic-brightness} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
    - bat-rpls-1:         NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-rpls-1/igt@kms_pm_backlight@basic-brightness.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adls-5/igt@kms_pm_rpm@module-reload.html
    - bat-dg1-5:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg1-5/igt@kms_pm_rpm@module-reload.html
    - bat-atsm-1:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-atsm-1/igt@kms_pm_rpm@module-reload.html
    - bat-adlp-9:         NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_pm_rpm@module-reload.html
    - bat-dg2-11:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg2-11/igt@kms_pm_rpm@module-reload.html
    - bat-adlm-1:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlm-1/igt@kms_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-tgl-1115g4/igt@kms_pm_rpm@module-reload.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_pm_rpm@module-reload.html
    - bat-dg2-9:          NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg2-9/igt@kms_pm_rpm@module-reload.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-8/igt@kms_pm_rpm@module-reload.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13609 and IGTPW_9745:

### New IGT tests (5) ###

  * igt@kms_pm_backlight@basic-brightness:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_backlight@basic-brightness@edp-1:
    - Statuses : 2 abort(s) 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - Statuses : 1 abort(s) 27 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@basic-rte:
    - Statuses : 27 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@module-reload:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9745 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][13] ([i915#8298])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html

  * igt@debugfs_test@basic-hwmon:
    - bat-adlp-9:         NOTRUN -> [SKIP][14] ([i915#7456])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-11:        NOTRUN -> [SKIP][15] ([i915#7456])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][16] ([i915#7456])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-7567u:       NOTRUN -> [ABORT][17] ([i915#8913])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html

  * igt@fbdev@info:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#1849])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-x1275/igt@fbdev@info.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#1849])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@fbdev@info.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#1849])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@fbdev@info.html
    - bat-kbl-2:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#1849])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-kbl-2/igt@fbdev@info.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][22] ([i915#1849] / [i915#2582])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@fbdev@info.html

  * igt@fbdev@write:
    - bat-mtlp-6:         NOTRUN -> [SKIP][23] ([i915#2582]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@fbdev@write.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#2190])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-glk-j4005/igt@gem_lmem_swapping@basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][31] ([i915#4613]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@gem_lmem_swapping@basic.html
    - fi-skl-guc:         NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-guc/igt@gem_lmem_swapping@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][35] ([fdo#109271]) +19 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-kbl-2:          NOTRUN -> [SKIP][36] ([fdo#109271]) +40 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-skl-6600u:       NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][39] ([i915#4613]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-mtlp-6:         NOTRUN -> [SKIP][42] ([i915#4083])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@gem_mmap@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-mtlp-6:         NOTRUN -> [SKIP][43] ([i915#4077]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-9:         NOTRUN -> [SKIP][44] ([i915#3282])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@gem_tiled_pread_basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][45] ([i915#4079]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@gem_tiled_pread_basic.html
    - bat-adlp-11:        NOTRUN -> [SKIP][46] ([i915#3282])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-adlp-9:         NOTRUN -> [SKIP][47] ([i915#6621])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][48] ([i915#6621])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_engines:
    - bat-mtlp-6:         NOTRUN -> [FAIL][49] ([i915#9278])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       NOTRUN -> [DMESG-FAIL][50] ([i915#5334])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - bat-mtlp-6:         NOTRUN -> [DMESG-FAIL][51] ([i915#9270])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-adlp-9:         NOTRUN -> [INCOMPLETE][52] ([i915#7443])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][53] ([i915#6645])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-mtlp-6:         NOTRUN -> [SKIP][54] ([i915#4212]) +8 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-6:         NOTRUN -> [SKIP][55] ([i915#5190])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@too-high:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][56] ([i915#8296]) +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][57] ([fdo#109271]) +10 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][58] ([i915#4103]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-cfl-guc:         NOTRUN -> [SKIP][59] ([fdo#109271]) +11 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adlp-11:        NOTRUN -> [SKIP][60] ([i915#4103]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-mtlp-6:         NOTRUN -> [SKIP][61] ([i915#1845]) +11 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-kbl-guc:         NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#1845]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-mtlp-6:         NOTRUN -> [SKIP][63] ([i915#3637]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - fi-bsw-n3050:       [PASS][64] -> [FAIL][65] ([i915#2122])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-FAIL][66] ([i915#8299])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-8809g:       NOTRUN -> [CRASH][67] ([i915#8299])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][68] ([fdo#109271]) +11 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][69] ([fdo#109285])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-9:         NOTRUN -> [SKIP][70] ([fdo#109285])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-adlp-11:        NOTRUN -> [SKIP][71] ([i915#4093]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][72] ([i915#5274])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-mtlp-6:         NOTRUN -> [SKIP][73] ([i915#4342])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][74] ([i915#9276])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][75] ([fdo#109271]) +17 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html
    - fi-skl-guc:         NOTRUN -> [FAIL][76] ([IGT#3])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-guc/igt@kms_hdmi_inject@inject-audio.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][77] ([IGT#3])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-nick/igt@kms_hdmi_inject@inject-audio.html
    - bat-adlp-11:        NOTRUN -> [SKIP][78] ([i915#4369])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][79] ([IGT#3] / [i915#6121])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2:
    - fi-skl-guc:         NOTRUN -> [SKIP][80] ([fdo#109271]) +13 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - fi-skl-6600u:       NOTRUN -> [SKIP][81] ([fdo#109271]) +8 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][82] ([fdo#109271]) +37 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:
    - bat-adlp-11:        NOTRUN -> [ABORT][83] ([i915#8668])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - fi-kbl-guc:         NOTRUN -> [SKIP][84] ([fdo#109271]) +26 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@kms_pipe_crc_basic@suspend-read-crc.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][85] ([i915#1845] / [i915#4078]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * {igt@kms_pm_backlight@basic-brightness} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][86] ([fdo#109271]) +31 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html
    - bat-atsm-1:         NOTRUN -> [SKIP][87] ([i915#6078])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-atsm-1/igt@kms_pm_backlight@basic-brightness.html

  * {igt@kms_pm_backlight@basic-brightness@edp-1} (NEW):
    - bat-adlp-6:         NOTRUN -> [ABORT][88] ([i915#8668])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-6/igt@kms_pm_backlight@basic-brightness@edp-1.html
    - bat-rplp-1:         NOTRUN -> [ABORT][89] ([i915#8668])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html

  * {igt@kms_pm_rpm@basic-pci-d3-state} (NEW):
    - bat-adln-1:         NOTRUN -> [ABORT][90] ([i915#8668])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][91] ([fdo#109271]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][92] ([fdo#109271]) +23 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ilk-650:         NOTRUN -> [SKIP][93] ([fdo#109271]) +21 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][94] ([fdo#112080])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-jsl-3/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][95] ([fdo#109271]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-8109u/igt@kms_pm_rpm@module-reload.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][96] ([fdo#109271]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-n3050/igt@kms_pm_rpm@module-reload.html
    - bat-jsl-1:          NOTRUN -> [SKIP][97] ([fdo#112080])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-jsl-1/igt@kms_pm_rpm@module-reload.html

  * igt@kms_psr@cursor_plane_move:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][98] ([fdo#109271]) +57 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@kms_psr@cursor_plane_move.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][99] ([i915#1072]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][100] ([fdo#109271]) +31 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-adlp-9:         NOTRUN -> [SKIP][101] ([i915#1072]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adlp-9:         NOTRUN -> [SKIP][102] ([i915#3555])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][103] ([i915#3555] / [i915#8809])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-mtlp-6:         NOTRUN -> [SKIP][104] ([i915#1845] / [i915#3708])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-mtlp-6:         NOTRUN -> [SKIP][105] ([i915#3708] / [i915#4077]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adlp-9:         NOTRUN -> [SKIP][106] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-6:         NOTRUN -> [SKIP][107] ([i915#3708]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-jsl-3:          [INCOMPLETE][108] ([i915#9275]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
    - bat-dg2-9:          [INCOMPLETE][110] ([i915#9275]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-jsl-3:          [FAIL][112] ([fdo#103375]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][114] ([i915#7952]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8296]: https://gitlab.freedesktop.org/drm/intel/issues/8296
  [i915#8298]: https://gitlab.freedesktop.org/drm/intel/issues/8298
  [i915#8299]: https://gitlab.freedesktop.org/drm/intel/issues/8299
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#8913]: https://gitlab.freedesktop.org/drm/intel/issues/8913
  [i915#9270]: https://gitlab.freedesktop.org/drm/intel/issues/9270
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276
  [i915#9278]: https://gitlab.freedesktop.org/drm/intel/issues/9278


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7474 -> IGTPW_9745

  CI-20190529: 20190529
  CI_DRM_13609: 1b25a43002e4409156a9b3aa1cb8c08eb4dd343d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9745: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/index.html
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_pm_backlight@bad-brightness
+igt@kms_pm_backlight@basic-brightness
+igt@kms_pm_backlight@fade
+igt@kms_pm_backlight@fade-with-dpms
+igt@kms_pm_backlight@fade-with-suspend
+igt@kms_pm_dc@dc3co-vpb-simulation
+igt@kms_pm_dc@dc5-dpms
+igt@kms_pm_dc@dc5-dpms-negative
+igt@kms_pm_dc@dc5-psr
+igt@kms_pm_dc@dc6-dpms
+igt@kms_pm_dc@dc6-psr
+igt@kms_pm_dc@dc9-dpms
+igt@kms_pm_lpsp@kms-lpsp
+igt@kms_pm_lpsp@screens-disabled
+igt@kms_pm_rpm@basic-pci-d3-state
+igt@kms_pm_rpm@basic-rte
+igt@kms_pm_rpm@cursor
+igt@kms_pm_rpm@cursor-dpms
+igt@kms_pm_rpm@dpms-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp
+igt@kms_pm_rpm@dpms-non-lpsp
+igt@kms_pm_rpm@drm-resources-equal
+igt@kms_pm_rpm@fences
+igt@kms_pm_rpm@fences-dpms
+igt@kms_pm_rpm@i2c
+igt@kms_pm_rpm@legacy-planes
+igt@kms_pm_rpm@legacy-planes-dpms
+igt@kms_pm_rpm@modeset-lpsp
+igt@kms_pm_rpm@modeset-lpsp-stress
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-non-lpsp
+igt@kms_pm_rpm@modeset-non-lpsp-stress
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-pc8-residency-stress
+igt@kms_pm_rpm@modeset-stress-extra-wait
+igt@kms_pm_rpm@pc8-residency
+igt@kms_pm_rpm@pm-caching
+igt@kms_pm_rpm@pm-tiling
+igt@kms_pm_rpm@system-suspend-modeset
+igt@kms_pm_rpm@universal-planes
+igt@kms_pm_rpm@universal-planes-dpms
-igt@i915_pm_backlight@bad-brightness
-igt@i915_pm_backlight@basic-brightness
-igt@i915_pm_backlight@fade
-igt@i915_pm_backlight@fade-with-dpms
-igt@i915_pm_backlight@fade-with-suspend
-igt@i915_pm_dc@dc3co-vpb-simulation
-igt@i915_pm_dc@dc5-dpms
-igt@i915_pm_dc@dc5-dpms-negative
-igt@i915_pm_dc@dc5-psr
-igt@i915_pm_dc@dc6-dpms
-igt@i915_pm_dc@dc6-psr
-igt@i915_pm_dc@dc9-dpms
-igt@i915_pm_lpsp@kms-lpsp
-igt@i915_pm_lpsp@screens-disabled
-igt@i915_pm_rpm@basic-pci-d3-state
-igt@i915_pm_rpm@basic-rte
-igt@i915_pm_rpm@cursor
-igt@i915_pm_rpm@cursor-dpms
-igt@i915_pm_rpm@dpms-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp
-igt@i915_pm_rpm@dpms-non-lpsp
-igt@i915_pm_rpm@drm-resources-equal
-igt@i915_pm_rpm@fences
-igt@i915_pm_rpm@fences-dpms
-igt@i915_pm_rpm@i2c
-igt@i915_pm_rpm@legacy-planes
-igt@i915_pm_rpm@legacy-planes-dpms
-igt@i915_pm_rpm@modeset-lpsp
-igt@i915_pm_rpm@modeset-lpsp-stress
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-non-lpsp
-igt@i915_pm_rpm@modeset-non-lpsp-stress
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-pc8-residency-stress
-igt@i915_pm_rpm@modeset-stress-extra-wait
-igt@i915_pm_rpm@pc8-residency
-igt@i915_pm_rpm@pm-caching
-igt@i915_pm_rpm@pm-tiling
-igt@i915_pm_rpm@system-suspend-modeset
-igt@i915_pm_rpm@universal-planes
-igt@i915_pm_rpm@universal-planes-dpms
-igt@kms_writeback@writeback-check-output-xrgb2101010
-igt@kms_writeback@writeback-fb-id-xrgb2101010

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/index.html

--===============4071343199526892443==
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
<tr><td><b>Series:</b></td><td>Separate display PM tests from Core (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122790/">https://patchwork.freedesktop.org/series/122790/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13609 -&gt; IGTPW_9745</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/index.html</p>
<h2>Participating hosts (22 -&gt; 38)</h2>
<p>Additional (19): fi-apl-guc fi-pnv-d510 fi-blb-e6850 fi-skl-6600u fi-ilk-650 fi-elk-e7500 fi-bsw-nick fi-kbl-7567u bat-kbl-2 bat-adlp-9 fi-skl-guc fi-cfl-8700k fi-glk-j4005 bat-mtlp-6 bat-adlp-11 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-kbl-8809g <br />
  Missing    (3): fi-kbl-soraka bat-dg2-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9745:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_pm_backlight@basic-brightness} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-rpls-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adls-5/igt@kms_pm_rpm@module-reload.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg1-5/igt@kms_pm_rpm@module-reload.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-atsm-1/igt@kms_pm_rpm@module-reload.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_pm_rpm@module-reload.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg2-11/igt@kms_pm_rpm@module-reload.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlm-1/igt@kms_pm_rpm@module-reload.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-tgl-1115g4/igt@kms_pm_rpm@module-reload.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_pm_rpm@module-reload.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg2-9/igt@kms_pm_rpm@module-reload.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-8/igt@kms_pm_rpm@module-reload.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13609 and IGTPW_9745:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>Statuses : 2 abort(s) 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>Statuses : 1 abort(s) 27 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>Statuses : 27 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@module-reload:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9745 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8298">i915#8298</a>)</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8913">i915#8913</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-x1275/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-glk-j4005/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 other tests skip</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +40 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@i915_selftest@live@gt_engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9278">i915#9278</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9270">i915#9270</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443">i915#7443</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8296">i915#8296</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 other tests skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 other tests skip</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@kms_force_connector_basic@force-connector-state.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8299">i915#8299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8299">i915#8299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 other tests skip</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-nick/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4369">i915#4369</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2:</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-guc/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +4 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_backlight@basic-brightness} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 other tests skip</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-atsm-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_backlight@basic-brightness@edp-1} (NEW):</p>
<ul>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-6/igt@kms_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-pci-d3-state} (NEW):</p>
<ul>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +23 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-jsl-3/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-cfl-8109u/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-bsw-n3050/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-jsl-1/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-kbl-8809g/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-adlp-9/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-mtlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7474 -&gt; IGTPW_9745</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13609: 1b25a43002e4409156a9b3aa1cb8c08eb4dd343d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9745: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9745/index.html<br />
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_pm_backlight@bad-brightness<br />
+igt@kms_pm_backlight@basic-brightness<br />
+igt@kms_pm_backlight@fade<br />
+igt@kms_pm_backlight@fade-with-dpms<br />
+igt@kms_pm_backlight@fade-with-suspend<br />
+igt@kms_pm_dc@dc3co-vpb-simulation<br />
+igt@kms_pm_dc@dc5-dpms<br />
+igt@kms_pm_dc@dc5-dpms-negative<br />
+igt@kms_pm_dc@dc5-psr<br />
+igt@kms_pm_dc@dc6-dpms<br />
+igt@kms_pm_dc@dc6-psr<br />
+igt@kms_pm_dc@dc9-dpms<br />
+igt@kms_pm_lpsp@kms-lpsp<br />
+igt@kms_pm_lpsp@screens-disabled<br />
+igt@kms_pm_rpm@basic-pci-d3-state<br />
+igt@kms_pm_rpm@basic-rte<br />
+igt@kms_pm_rpm@cursor<br />
+igt@kms_pm_rpm@cursor-dpms<br />
+igt@kms_pm_rpm@dpms-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp<br />
+igt@kms_pm_rpm@dpms-non-lpsp<br />
+igt@kms_pm_rpm@drm-resources-equal<br />
+igt@kms_pm_rpm@fences<br />
+igt@kms_pm_rpm@fences-dpms<br />
+igt@kms_pm_rpm@i2c<br />
+igt@kms_pm_rpm@legacy-planes<br />
+igt@kms_pm_rpm@legacy-planes-dpms<br />
+igt@kms_pm_rpm@modeset-lpsp<br />
+igt@kms_pm_rpm@modeset-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-non-lpsp<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-pc8-residency-stress<br />
+igt@kms_pm_rpm@modeset-stress-extra-wait<br />
+igt@kms_pm_rpm@pc8-residency<br />
+igt@kms_pm_rpm@pm-caching<br />
+igt@kms_pm_rpm@pm-tiling<br />
+igt@kms_pm_rpm@system-suspend-modeset<br />
+igt@kms_pm_rpm@universal-planes<br />
+igt@kms_pm_rpm@universal-planes-dpms<br />
-igt@i915_pm_backlight@bad-brightness<br />
-igt@i915_pm_backlight@basic-brightness<br />
-igt@i915_pm_backlight@fade<br />
-igt@i915_pm_backlight@fade-with-dpms<br />
-igt@i915_pm_backlight@fade-with-suspend<br />
-igt@i915_pm_dc@dc3co-vpb-simulation<br />
-igt@i915_pm_dc@dc5-dpms<br />
-igt@i915_pm_dc@dc5-dpms-negative<br />
-igt@i915_pm_dc@dc5-psr<br />
-igt@i915_pm_dc@dc6-dpms<br />
-igt@i915_pm_dc@dc6-psr<br />
-igt@i915_pm_dc@dc9-dpms<br />
-igt@i915_pm_lpsp@kms-lpsp<br />
-igt@i915_pm_lpsp@screens-disabled<br />
-igt@i915_pm_rpm@basic-pci-d3-state<br />
-igt@i915_pm_rpm@basic-rte<br />
-igt@i915_pm_rpm@cursor<br />
-igt@i915_pm_rpm@cursor-dpms<br />
-igt@i915_pm_rpm@dpms-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp<br />
-igt@i915_pm_rpm@dpms-non-lpsp<br />
-igt@i915_pm_rpm@drm-resources-equal<br />
-igt@i915_pm_rpm@fences<br />
-igt@i915_pm_rpm@fences-dpms<br />
-igt@i915_pm_rpm@i2c<br />
-igt@i915_pm_rpm@legacy-planes<br />
-igt@i915_pm_rpm@legacy-planes-dpms<br />
-igt@i915_pm_rpm@modeset-lpsp<br />
-igt@i915_pm_rpm@modeset-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-non-lpsp<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-pc8-residency-stress<br />
-igt@i915_pm_rpm@modeset-stress-extra-wait<br />
-igt@i915_pm_rpm@pc8-residency<br />
-igt@i915_pm_rpm@pm-caching<br />
-igt@i915_pm_rpm@pm-tiling<br />
-igt@i915_pm_rpm@system-suspend-modeset<br />
-igt@i915_pm_rpm@universal-planes<br />
-igt@i915_pm_rpm@universal-planes-dpms<br />
-igt@kms_writeback@writeback-check-output-xrgb2101010<br />
-igt@kms_writeback@writeback-fb-id-xrgb2101010</p>

</body>
</html>

--===============4071343199526892443==--
