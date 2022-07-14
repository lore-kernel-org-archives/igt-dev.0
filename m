Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0036558067811429615=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 14 Jul 2022 08:53:06 -0000
Message-ID: <165778878602.7512.13770411136142277329@emeril.freedesktop.org>
References: <20220714081409.671724-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220714081409.671724-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fcolor=3A_Fix_multi?=
 =?utf-8?q?ple_failures_in_deep-color_tests?=
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

--===============0036558067811429615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_color: Fix multiple failures in deep-color tests
URL   : https://patchwork.freedesktop.org/series/106327/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6581 -> IGTPW_7518
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7518 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7518, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/index.html

Participating hosts (33 -> 41)
------------------------------

  Additional (8): bat-dg1-5 bat-dg2-8 bat-adlm-1 bat-dg2-9 bat-adlp-6 bat-jsl-3 bat-rpls-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7518:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@deep-color:
    - bat-dg1-5:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_color@deep-color.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@basic-flip-after-cursor@atomic:
    - {bat-dg2-9}:        NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - {bat-adlm-1}:       NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
New tests
---------

  New tests have been introduced between IGT_6581 and IGTPW_7518:

### New IGT tests (12) ###

  * igt@kms_color@deep-color@pipe-a-dp-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [47.66] s

  * igt@kms_color@deep-color@pipe-a-dp-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [47.76] s

  * igt@kms_color@deep-color@pipe-a-dp-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [47.77] s

  * igt@kms_color@deep-color@pipe-b-dp-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [47.76] s

  * igt@kms_color@deep-color@pipe-b-dp-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [47.69] s

  * igt@kms_color@deep-color@pipe-b-dp-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [40.39] s

  * igt@kms_color@deep-color@pipe-c-dp-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [47.72] s

  * igt@kms_color@deep-color@pipe-c-dp-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [47.75] s

  * igt@kms_color@deep-color@pipe-c-dp-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [47.83] s

  * igt@kms_color@deep-color@pipe-d-dp-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [47.67] s

  * igt@kms_color@deep-color@pipe-d-dp-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [48.13] s

  * igt@kms_color@deep-color@pipe-d-dp-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [47.67] s

  

Known issues
------------

  Here are the changes found in IGTPW_7518 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - bat-dg1-5:          NOTRUN -> [SKIP][4] ([i915#2582]) +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@fbdev@nullptr.html

  * igt@gem_mmap@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][5] ([i915#4083])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@gem_mmap@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][6] ([i915#4077]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][7] ([i915#4079]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-dg1-5:          NOTRUN -> [SKIP][8] ([i915#1155])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][9] -> [DMESG-FAIL][10] ([i915#62])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-bdw-5557u:       [PASS][11] -> [INCOMPLETE][12] ([i915#5502])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][13] -> [INCOMPLETE][14] ([i915#4785])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-5:          NOTRUN -> [DMESG-FAIL][15] ([i915#4494] / [i915#4957])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [PASS][16] -> [DMESG-WARN][17] ([i915#5904]) +28 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-cfl-8109u:       [PASS][18] -> [DMESG-WARN][19] ([i915#5904] / [i915#62])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-dg1-5:          NOTRUN -> [INCOMPLETE][20] ([i915#6011])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-icl-u2:          NOTRUN -> [SKIP][21] ([i915#5903])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-icl-u2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][22] ([i915#4212]) +7 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][23] ([i915#4215])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_busy@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][24] ([i915#1845] / [i915#4303])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_busy@basic.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][25] ([fdo#109271] / [fdo#111827])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-icl-u2:          NOTRUN -> [SKIP][26] ([fdo#111827])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - bat-dg1-5:          NOTRUN -> [SKIP][27] ([fdo#111827]) +7 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_color@deep-color:
    - fi-glk-j4005:       NOTRUN -> [SKIP][28] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-glk-j4005/igt@kms_color@deep-color.html
    - fi-snb-2600:        NOTRUN -> [SKIP][29] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-snb-2600/igt@kms_color@deep-color.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-skl-6700k2/igt@kms_color@deep-color.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][31] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@kms_color@deep-color.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][32] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-kbl-7567u/igt@kms_color@deep-color.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][33] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-kbl-8809g/igt@kms_color@deep-color.html
    - fi-ilk-650:         NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-ilk-650/igt@kms_color@deep-color.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][35] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-guc/igt@kms_color@deep-color.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][36] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-skl-6600u/igt@kms_color@deep-color.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][37] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bdw-5557u/igt@kms_color@deep-color.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][38] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-snb-2520m/igt@kms_color@deep-color.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][39] ([i915#3555])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-rkl-guc/igt@kms_color@deep-color.html
    - fi-skl-guc:         NOTRUN -> [SKIP][40] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-skl-guc/igt@kms_color@deep-color.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][41] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8700k/igt@kms_color@deep-color.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][42] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-blb-e6850/igt@kms_color@deep-color.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][43] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-nick/igt@kms_color@deep-color.html
    - fi-icl-u2:          NOTRUN -> [SKIP][44] ([i915#3555])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-icl-u2/igt@kms_color@deep-color.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][45] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bdw-gvtdvm/igt@kms_color@deep-color.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][46] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-kefka/igt@kms_color@deep-color.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][47] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-hsw-4770/igt@kms_color@deep-color.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][48] ([fdo#109271])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-ivb-3770/igt@kms_color@deep-color.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][49] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-elk-e7500/igt@kms_color@deep-color.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][50] ([fdo#109271])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-kbl-guc/igt@kms_color@deep-color.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][51] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-hsw-g3258/igt@kms_color@deep-color.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][52] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bxt-dsi/igt@kms_color@deep-color.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][53] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-n3050/igt@kms_color@deep-color.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][54] ([fdo#109271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-glk-dsi/igt@kms_color@deep-color.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][55] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-pnv-d510/igt@kms_color@deep-color.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg1-5:          NOTRUN -> [SKIP][56] ([fdo#109285])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [PASS][57] -> [DMESG-WARN][58] ([i915#62]) +12 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg1-5:          NOTRUN -> [SKIP][59] ([i915#4078]) +13 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg1-5:          NOTRUN -> [SKIP][60] ([i915#1072] / [i915#4078]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_psr@primary_page_flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg1-5:          NOTRUN -> [SKIP][61] ([i915#3555])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg1-5:          NOTRUN -> [SKIP][62] ([i915#1845] / [i915#3708])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-dg1-5:          NOTRUN -> [SKIP][63] ([i915#3708]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg1-5:          NOTRUN -> [SKIP][64] ([i915#3708] / [i915#4077]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-userptr:
    - bat-dg1-5:          NOTRUN -> [SKIP][65] ([i915#3708] / [i915#4873])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - bat-dg1-5:          NOTRUN -> [FAIL][66] ([i915#4312] / [i915#5257])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@runner@aborted.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][67] ([fdo#109271] / [i915#4312] / [i915#6246])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [INCOMPLETE][68] ([i915#2940]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-u2:          [INCOMPLETE][70] ([i915#4890]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-icl-u2/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4303]: https://gitlab.freedesktop.org/drm/intel/issues/4303
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4890]: https://gitlab.freedesktop.org/drm/intel/issues/4890
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5270]: https://gitlab.freedesktop.org/drm/intel/issues/5270
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5502]: https://gitlab.freedesktop.org/drm/intel/issues/5502
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
  [i915#5950]: https://gitlab.freedesktop.org/drm/intel/issues/5950
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6581 -> IGTPW_7518

  CI-20190529: 20190529
  CI_DRM_11877: e55cefc370de5a38ee848aa96082d9d9f4cacdb9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7518: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/index.html
  IGT_6581: 3c3a4cc75cfa7f6f34f2803ba68b0e8c5d1956e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/index.html

--===============0036558067811429615==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_color: Fix multiple failures in deep-color tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106327/">https://patchwork.freedesktop.org/series/106327/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6581 -&gt; IGTPW_7518</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7518 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7518, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/index.html</p>
<h2>Participating hosts (33 -&gt; 41)</h2>
<p>Additional (8): bat-dg1-5 bat-dg2-8 bat-adlm-1 bat-dg2-9 bat-adlp-6 bat-jsl-3 bat-rpls-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7518:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_color@deep-color:<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_color@deep-color.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor@atomic:</p>
<ul>
<li>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6581 and IGTPW_7518:</p>
<h3>New IGT tests (12)</h3>
<ul>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-3-ctm:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-3-degamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-3-gamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-b-dp-3-ctm:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-b-dp-3-degamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-b-dp-3-gamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [40.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-c-dp-3-ctm:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-c-dp-3-degamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-c-dp-3-gamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-d-dp-3-ctm:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-d-dp-3-degamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [48.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-d-dp-3-gamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [47.67] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7518 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5502">i915#5502</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6011">i915#6011</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-icl-u2/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5903">i915#5903</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4303">i915#4303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-glk-j4005/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-snb-2600/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-skl-6700k2/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-kbl-7567u/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-kbl-8809g/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-ilk-650/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-guc/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-skl-6600u/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bdw-5557u/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-snb-2520m/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-rkl-guc/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-skl-guc/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8700k/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-blb-e6850/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-nick/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-icl-u2/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bdw-gvtdvm/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-kefka/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-hsw-4770/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-ivb-3770/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-elk-e7500/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-kbl-guc/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-hsw-g3258/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bxt-dsi/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-n3050/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-glk-dsi/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-pnv-d510/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/bat-dg1-5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4890">i915#4890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6581 -&gt; IGTPW_7518</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11877: e55cefc370de5a38ee848aa96082d9d9f4cacdb9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7518: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7518/index.html<br />
  IGT_6581: 3c3a4cc75cfa7f6f34f2803ba68b0e8c5d1956e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0036558067811429615==--
