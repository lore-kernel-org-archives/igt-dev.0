Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5958946576661534526=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Thu, 01 Dec 2022 18:44:13 -0000
Message-ID: <166992025391.14635.16297147659170705928@emeril.freedesktop.org>
References: <20221130204526.3182975-1-markyacoub@chromium.org>
In-Reply-To: <20221130204526.3182975-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium=3A_Split_kms=5Fchamelium_into_multiple_kms=5Fchamelium_test?=
 =?utf-8?q?s_=28rev2=29?=
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

--===============5958946576661534526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Chamelium: Split kms_chamelium into multiple kms_chamelium tests (rev2)
URL   : https://patchwork.freedesktop.org/series/111501/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12460 -> IGTPW_8182
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/index.html

Participating hosts (43 -> 34)
------------------------------

  Additional (2): fi-tgl-dsi bat-dg1-6 
  Missing    (11): fi-kbl-soraka fi-ilk-m540 bat-kbl-2 fi-bsw-n3050 bat-dg1-5 bat-dg2-8 bat-dg2-9 bat-atsm-1 bat-jsl-3 bat-dg2-11 fi-bsw-nick 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8182:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
    - {bat-jsl-1}:        NOTRUN -> [SKIP][1] +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][2] +8 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html

  * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
    - fi-adl-ddr5:        NOTRUN -> [SKIP][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][4] +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html

  * {igt@kms_chamelium_frames@dp-crc-fast} (NEW):
    - {bat-adlm-1}:       NOTRUN -> [SKIP][5] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlm-1/igt@kms_chamelium_frames@dp-crc-fast.html
    - {bat-rplp-1}:       NOTRUN -> [SKIP][6] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-rplp-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
    - bat-adlp-4:         NOTRUN -> [SKIP][7] +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlp-4/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - {bat-adln-1}:       NOTRUN -> [SKIP][8] +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
    - {bat-rpls-2}:       NOTRUN -> [SKIP][9] +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][10] +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-rkl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - bat-dg1-6:          NOTRUN -> [SKIP][11] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * {igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):
    - {bat-adlp-6}:       NOTRUN -> [SKIP][12] +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlp-6/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-rkl-11600/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][14] +7 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-tgl-dsi/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
    - fi-icl-u2:          NOTRUN -> [SKIP][15] +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-icl-u2/igt@kms_chamelium_hpd@vga-hpd-fast.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12460 and IGTPW_8182:

### New IGT tests (9) ###

  * igt@kms_chamelium_edid@dp-edid-read:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - Statuses : 1 pass(s) 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_edid@vga-edid-read:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_frames@dp-crc-fast:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - Statuses : 1 pass(s) 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - Statuses : 1 pass(s) 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - Statuses : 1 pass(s) 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8182 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       [PASS][16] -> [INCOMPLETE][17] ([i915#6179])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_mmap@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][18] ([i915#4083])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][19] ([i915#4079]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][20] ([i915#4077]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-dg1-6:          NOTRUN -> [SKIP][21] ([i915#7561])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-6:          NOTRUN -> [SKIP][22] ([i915#6621])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [PASS][23] -> [INCOMPLETE][24] ([i915#7308] / [i915#7348])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlp-4/igt@i915_selftest@live@migrate.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][25] -> [FAIL][26] ([fdo#103375])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-6:          NOTRUN -> [SKIP][27] ([i915#4215])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg1-6:          NOTRUN -> [SKIP][28] ([i915#4212]) +7 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][29] ([fdo#109271]) +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-ilk-650/igt@kms_chamelium_edid@dp-edid-read.html

  * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][30] ([fdo#109271]) +8 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][31] ([fdo#109271]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-glk-dsi/igt@kms_chamelium_edid@hdmi-edid-read.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][32] ([fdo#109271]) +8 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-pnv-d510/igt@kms_chamelium_edid@hdmi-edid-read.html

  * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][33] ([fdo#109271]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-hsw-4770/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +8 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][35] ([fdo#109271]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][36] ([fdo#109271]) +7 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][37] ([fdo#109271]) +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-ivb-3770/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][38] ([fdo#109271]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-elk-e7500/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][39] ([fdo#109271]) +8 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-snb-2600:        NOTRUN -> [SKIP][40] ([fdo#109271]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-skl-guc:         NOTRUN -> [SKIP][41] ([fdo#109271]) +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-skl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][42] ([fdo#109271]) +8 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-cfl-8700k/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][43] ([fdo#109271]) +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-blb-e6850/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][44] ([fdo#109271]) +8 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][45] ([fdo#109271]) +7 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-bdw-gvtdvm/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][46] ([fdo#109271]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-bsw-kefka/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][47] ([fdo#109271]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-skl-6700k2/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - bat-dg1-6:          NOTRUN -> [SKIP][48] ([i915#4103] / [i915#4213])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg1-6:          NOTRUN -> [SKIP][49] ([fdo#109285])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-dg1-6:          NOTRUN -> [SKIP][50] ([i915#1072] / [i915#4078]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg1-6:          NOTRUN -> [SKIP][51] ([i915#3555])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg1-6:          NOTRUN -> [SKIP][52] ([i915#3708] / [i915#4077]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - bat-dg1-6:          NOTRUN -> [SKIP][53] ([i915#3708]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-userptr:
    - bat-dg1-6:          NOTRUN -> [SKIP][54] ([i915#3708] / [i915#4873])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - bat-adlp-4:         NOTRUN -> [FAIL][55] ([i915#4312])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlp-4/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - {bat-rpls-2}:       [DMESG-FAIL][56] ([i915#4258]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][58] ([i915#4983]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/bat-rpls-2/igt@i915_selftest@live@reset.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][60] ([i915#6298]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
    - fi-bsw-kefka:       [FAIL][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6179]: https://gitlab.freedesktop.org/drm/intel/issues/6179
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6949]: https://gitlab.freedesktop.org/drm/intel/issues/6949
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7058]: https://gitlab.freedesktop.org/drm/intel/issues/7058
  [i915#7308]: https://gitlab.freedesktop.org/drm/intel/issues/7308
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7433]: https://gitlab.freedesktop.org/drm/intel/issues/7433
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7078 -> IGTPW_8182

  CI-20190529: 20190529
  CI_DRM_12460: 0b96883d5e7a2baa9f75d50656e722c61d96c08f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8182: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/index.html
  IGT_7078: 71bce31c26998d5d53cff3138049261fd6c4fbaf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 71 lines
--- 71 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/index.html

--===============5958946576661534526==
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
<tr><td><b>Series:</b></td><td>Chamelium: Split kms_chamelium into multiple kms_chamelium tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111501/">https://patchwork.freedesktop.org/series/111501/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12460 -&gt; IGTPW_8182</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/index.html</p>
<h2>Participating hosts (43 -&gt; 34)</h2>
<p>Additional (2): fi-tgl-dsi bat-dg1-6 <br />
  Missing    (11): fi-kbl-soraka fi-ilk-m540 bat-kbl-2 fi-bsw-n3050 bat-dg1-5 bat-dg2-8 bat-dg2-9 bat-atsm-1 bat-jsl-3 bat-dg2-11 fi-bsw-nick </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8182:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@dp-crc-fast} (NEW):</p>
<ul>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlm-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-rplp-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlp-4/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-rkl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):</p>
<ul>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlp-6/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-rkl-11600/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-tgl-dsi/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-icl-u2/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12460 and IGTPW_8182:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>Statuses : 1 pass(s) 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>Statuses : 1 pass(s) 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>Statuses : 1 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>Statuses : 1 pass(s) 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8182 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6179">i915#6179</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7308">i915#7308</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-ilk-650/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-glk-dsi/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-pnv-d510/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-hsw-4770/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-ivb-3770/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-elk-e7500/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-skl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-cfl-8700k/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-blb-e6850/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-bdw-gvtdvm/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-bsw-kefka/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-skl-6700k2/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-dg1-6/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-adlp-4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12460/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7078 -&gt; IGTPW_8182</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12460: 0b96883d5e7a2baa9f75d50656e722c61d96c08f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8182: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8182/index.html<br />
  IGT_7078: 71bce31c26998d5d53cff3138049261fd6c4fbaf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 71 lines<br />
--- 71 lines</p>

</body>
</html>

--===============5958946576661534526==--
