Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3086587529493401407=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Tue, 03 Jan 2023 18:45:11 -0000
Message-ID: <167277151110.26873.17993733561760931900@emeril.freedesktop.org>
References: <20230103171515.740994-1-markyacoub@chromium.org>
In-Reply-To: <20230103171515.740994-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium=3A_Split_kms=5Fchamelium_into_multiple_kms=5Fchamelium_test?=
 =?utf-8?q?s_=28rev5=29?=
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

--===============3086587529493401407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Chamelium: Split kms_chamelium into multiple kms_chamelium tests (rev5)
URL   : https://patchwork.freedesktop.org/series/111501/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12541 -> IGTPW_8293
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8293 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8293, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (1): fi-rkl-11600 
  Missing    (1): fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8293:

### IGT changes ###

#### Possible regressions ####

  * igt@debugfs_test@read_all_entries:
    - fi-icl-u2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/fi-icl-u2/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-icl-u2/igt@debugfs_test@read_all_entries.html

  * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][4] +7 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-rpls-1/igt@kms_chamelium_edid@dp-edid-read.html

  * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
    - fi-adl-ddr5:        NOTRUN -> [SKIP][5] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][6] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html
    - {bat-rpls-2}:       NOTRUN -> [SKIP][7] +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html
    - bat-dg1-6:          NOTRUN -> [SKIP][8] +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-read.html

  * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
    - {bat-adln-1}:       NOTRUN -> [SKIP][9] +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
    - {bat-adlp-9}:       NOTRUN -> [SKIP][10] +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - {bat-dg2-oem1}:     NOTRUN -> [SKIP][11] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg2-oem1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * {igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][12] +7 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - bat-dg1-5:          NOTRUN -> [SKIP][13] +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg1-5/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - {bat-dg1-7}:        NOTRUN -> [SKIP][14] +8 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg1-7/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][15] +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg2-9/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
    - {bat-adlp-6}:       NOTRUN -> [SKIP][16] +8 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
    - {bat-jsl-3}:        NOTRUN -> [SKIP][17] +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-jsl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][18] +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - {bat-dg2-11}:       NOTRUN -> [SKIP][19] +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - bat-adlp-4:         NOTRUN -> [SKIP][20] +8 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - {bat-dg2-8}:        NOTRUN -> [SKIP][21] +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg2-8/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - {bat-adlm-1}:       NOTRUN -> [SKIP][22] +8 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12541 and IGTPW_8293:

### New IGT tests (9) ###

  * igt@kms_chamelium_edid@dp-edid-read:
    - Statuses : 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - Statuses : 1 pass(s) 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_edid@vga-edid-read:
    - Statuses : 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_frames@dp-crc-fast:
    - Statuses : 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - Statuses : 1 pass(s) 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - Statuses : 1 pass(s) 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - Statuses : 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - Statuses : 1 pass(s) 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - Statuses : 41 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8293 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-rkl-11600:       NOTRUN -> [SKIP][23] ([i915#7456])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][24] ([i915#2190])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][25] ([i915#4613]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@gem_lmem_swapping@basic.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][26] ([i915#3282])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-rkl-11600:       NOTRUN -> [SKIP][27] ([i915#7561])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][28] ([i915#4817])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][29] ([fdo#109271]) +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bsw-n3050/igt@kms_chamelium_edid@dp-edid-read.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][30] ([fdo#109271]) +8 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bwr-2160/igt@kms_chamelium_edid@dp-edid-read.html

  * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][31] ([fdo#109271]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][32] ([fdo#109271]) +8 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-skl-6600u/igt@kms_chamelium_edid@hdmi-edid-read.html

  * {igt@kms_chamelium_frames@dp-crc-fast} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][33] ([fdo#109271]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-ilk-650/igt@kms_chamelium_frames@dp-crc-fast.html

  * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +8 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][35] ([fdo#109271]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][36] ([fdo#109271]) +7 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][37] ([fdo#109271]) +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-snb-2600:        NOTRUN -> [SKIP][38] ([fdo#109271]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * {igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):
    - fi-skl-6700k2:      NOTRUN -> [SKIP][39] ([fdo#109271]) +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-skl-6700k2/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][40] ([fdo#109271]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-cfl-8700k/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][41] ([fdo#109271]) +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-blb-e6850/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][42] ([fdo#109271]) +8 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-kbl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][43] ([fdo#109271]) +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][44] ([fdo#109271]) +8 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bsw-kefka/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - {bat-atsm-1}:       NOTRUN -> [SKIP][45] ([i915#6078]) +7 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-atsm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-skl-guc:         NOTRUN -> [SKIP][46] ([fdo#109271]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-skl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][47] ([fdo#109271]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-ivb-3770/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][48] ([fdo#109271]) +8 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-elk-e7500/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][49] ([fdo#109271]) +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bsw-nick/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-rkl-11600:       NOTRUN -> [SKIP][50] ([i915#4103])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [PASS][51] -> [FAIL][52] ([i915#6298])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-rkl-11600:       NOTRUN -> [SKIP][53] ([fdo#109285] / [i915#4098])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@primary_page_flip:
    - fi-rkl-11600:       NOTRUN -> [SKIP][54] ([i915#1072]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_psr@primary_page_flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-11600:       NOTRUN -> [SKIP][55] ([i915#3555] / [i915#4098])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-read:
    - fi-rkl-11600:       NOTRUN -> [SKIP][56] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-userptr:
    - fi-rkl-11600:       NOTRUN -> [SKIP][57] ([fdo#109295] / [i915#3301] / [i915#3708])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-icl-u2:          NOTRUN -> [FAIL][58] ([i915#4312])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-icl-u2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [INCOMPLETE][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@slpc:
    - bat-adlp-4:         [DMESG-FAIL][61] ([i915#6367]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-adlp-4/igt@i915_selftest@live@slpc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-4/igt@i915_selftest@live@slpc.html
    - {bat-rpls-1}:       [DMESG-FAIL][63] ([i915#6367]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - {bat-adlp-9}:       [DMESG-WARN][65] ([i915#2867]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4137]: https://gitlab.freedesktop.org/drm/intel/issues/4137
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7106 -> IGTPW_8293

  CI-20190529: 20190529
  CI_DRM_12541: b832866fa6063614b3637598aca19aee3bc3039f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8293: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/index.html
  IGT_7106: 8cce332bdc50d2b20d553d7a0221737f4399d031 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 71 lines
--- 71 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/index.html

--===============3086587529493401407==
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
<tr><td><b>Series:</b></td><td>Chamelium: Split kms_chamelium into multiple kms_chamelium tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111501/">https://patchwork.freedesktop.org/series/111501/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12541 -&gt; IGTPW_8293</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8293 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8293, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (1): fi-rkl-11600 <br />
  Missing    (1): fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8293:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/fi-icl-u2/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-icl-u2/igt@debugfs_test@read_all_entries.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-rpls-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>
<p>{bat-adlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-oem1}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg2-oem1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg1-5/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg1-7}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg1-7/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg2-9/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):</p>
<ul>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-jsl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg2-8/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12541 and IGTPW_8293:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>Statuses : 1 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>Statuses : 1 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>Statuses : 1 pass(s) 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>Statuses : 1 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8293 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bsw-n3050/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bwr-2160/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-skl-6600u/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@dp-crc-fast} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-ilk-650/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-skl-6700k2/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-cfl-8700k/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-blb-e6850/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-kbl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bsw-kefka/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-atsm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +7 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-skl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-ivb-3770/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-elk-e7500/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bsw-nick/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-adlp-4/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-4/igt@i915_selftest@live@slpc.html">PASS</a></p>
</li>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>{bat-adlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7106 -&gt; IGTPW_8293</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12541: b832866fa6063614b3637598aca19aee3bc3039f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8293: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8293/index.html<br />
  IGT_7106: 8cce332bdc50d2b20d553d7a0221737f4399d031 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 71 lines<br />
--- 71 lines</p>

</body>
</html>

--===============3086587529493401407==--
