Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3563047336758218274=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 30 May 2022 16:06:28 -0000
Message-ID: <165392678824.17902.11664822823812798417@emeril.freedesktop.org>
References: <20220530133927.3864033-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220530133927.3864033-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgU2tpcCBp?=
 =?utf-8?q?f_current_=26_requested_BPC_doesn=27t_match_=28rev2=29?=
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

--===============3563047336758218274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Skip if current & requested BPC doesn't match (rev2)
URL   : https://patchwork.freedesktop.org/series/104275/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6499 -> IGTPW_7188
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7188 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7188, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/index.html

Participating hosts (47 -> 45)
------------------------------

  Missing    (2): bat-atsm-1 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7188:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle:
    - bat-dg1-5:          NOTRUN -> [SKIP][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/bat-dg1-5/igt@kms_hdr@static-toggle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_hdr@bpc-switch@pipe-a-dp-2}:
    - fi-cfl-8109u:       NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  
New tests
---------

  New tests have been introduced between IGT_6499 and IGTPW_7188:

### New IGT tests (4) ###

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  

Known issues
------------

  Here are the changes found in IGTPW_7188 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#5904] / [i915#62])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][5] -> [DMESG-WARN][6] ([i915#62]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gtt:
    - fi-bdw-5557u:       [PASS][7] -> [DMESG-FAIL][8] ([i915#3674])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-bdw-5557u/igt@i915_selftest@live@gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bdw-5557u/igt@i915_selftest@live@gtt.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [PASS][9] -> [DMESG-WARN][10] ([i915#5904]) +35 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][11] -> [DMESG-FAIL][12] ([i915#4528])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_color@pipe-a-deep-color:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][13] ([fdo#109271]) +6 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-soraka/igt@kms_color@pipe-a-deep-color.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][14] ([fdo#109271]) +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-hsw-4770/igt@kms_color@pipe-a-deep-color.html
    - bat-adlp-4:         NOTRUN -> [SKIP][15] ([i915#3555]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/bat-adlp-4/igt@kms_color@pipe-a-deep-color.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][16] ([fdo#109271]) +6 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html

  * igt@kms_color@pipe-b-deep-color:
    - fi-rkl-guc:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#4070]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-guc/igt@kms_color@pipe-b-deep-color.html
    - bat-dg1-6:          NOTRUN -> [SKIP][18] ([i915#3555]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/bat-dg1-6/igt@kms_color@pipe-b-deep-color.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][19] ([fdo#109271]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8700k/igt@kms_color@pipe-b-deep-color.html

  * igt@kms_color@pipe-c-deep-color:
    - fi-kbl-guc:         NOTRUN -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-guc/igt@kms_color@pipe-c-deep-color.html
    - fi-snb-2600:        NOTRUN -> [SKIP][21] ([fdo#109271]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-snb-2600/igt@kms_color@pipe-c-deep-color.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][22] ([i915#3555] / [i915#4070]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-11600/igt@kms_color@pipe-c-deep-color.html

  * igt@kms_color@pipe-d-deep-color:
    - fi-glk-dsi:         NOTRUN -> [SKIP][23] ([fdo#109271]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-glk-dsi/igt@kms_color@pipe-d-deep-color.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][24] ([fdo#109271]) +6 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bwr-2160/igt@kms_color@pipe-d-deep-color.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#533])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-hsw-4770/igt@kms_color@pipe-d-deep-color.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][26] ([i915#4070] / [i915#533])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-11600/igt@kms_color@pipe-d-deep-color.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][27] ([i915#4070] / [i915#533])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-guc/igt@kms_color@pipe-d-deep-color.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#533])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-hsw-g3258/igt@kms_color@pipe-d-deep-color.html

  * igt@kms_flip@basic-plain-flip@c-dp2:
    - fi-cfl-8109u:       [PASS][29] -> [DMESG-WARN][30] ([i915#165]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [PASS][31] -> [DMESG-WARN][32] ([i915#165] / [i915#62]) +15 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdr@bpc-switch:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][33] ([fdo#109271]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bdw-gvtdvm/igt@kms_hdr@bpc-switch.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][34] ([fdo#109271]) +6 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bsw-kefka/igt@kms_hdr@bpc-switch.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][35] ([fdo#109271]) +6 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-snb-2520m/igt@kms_hdr@bpc-switch.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][36] ([i915#3555]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-guc/igt@kms_hdr@bpc-switch.html
    - fi-skl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271]) +6 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-skl-guc/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-swap:
    - fi-elk-e7500:       NOTRUN -> [SKIP][38] ([fdo#109271]) +6 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-elk-e7500/igt@kms_hdr@static-swap.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][39] ([fdo#109271]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bsw-nick/igt@kms_hdr@static-swap.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#1845]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-guc/igt@kms_hdr@static-swap.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][41] ([fdo#109271]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-hsw-g3258/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - fi-tgl-u2:          NOTRUN -> [SKIP][42] ([i915#3555]) +6 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-tgl-u2/igt@kms_hdr@static-toggle.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][43] ([fdo#109271]) +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bxt-dsi/igt@kms_hdr@static-toggle.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][44] ([fdo#109271]) +6 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bsw-n3050/igt@kms_hdr@static-toggle.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][45] ([i915#3555]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-11600/igt@kms_hdr@static-toggle.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][46] ([fdo#109271]) +7 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-pnv-d510/igt@kms_hdr@static-toggle.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][47] ([fdo#109271]) +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-glk-j4005/igt@kms_hdr@static-toggle.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][48] ([fdo#109271]) +6 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-skl-6700k2/igt@kms_hdr@static-toggle.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][49] ([fdo#109271]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@kms_hdr@static-toggle.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][50] ([fdo#109271]) +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-7567u/igt@kms_hdr@static-toggle.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][51] ([fdo#109271]) +6 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-8809g/igt@kms_hdr@static-toggle.html
    - fi-ilk-650:         NOTRUN -> [SKIP][52] ([fdo#109271]) +6 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-ilk-650/igt@kms_hdr@static-toggle.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][53] ([i915#3555]) +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-tgl-1115g4/igt@kms_hdr@static-toggle.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][54] ([i915#3555]) +5 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-adl-ddr5/igt@kms_hdr@static-toggle.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][55] ([fdo#109271]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-guc/igt@kms_hdr@static-toggle.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][56] ([fdo#109271]) +6 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bdw-5557u/igt@kms_hdr@static-toggle.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][57] ([fdo#109271]) +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-blb-e6850/igt@kms_hdr@static-toggle.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][58] ([fdo#109271]) +6 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-skl-6600u/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-skl-6700k2:      [PASS][59] -> [INCOMPLETE][60] ([i915#4444])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-skl-6700k2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-skl-6700k2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][61] ([i915#5122]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][63] ([i915#4528]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@uncore:
    - {bat-dg2-9}:        [DMESG-WARN][65] ([i915#5763]) -> [PASS][66] +7 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/bat-dg2-9/igt@i915_selftest@live@uncore.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/bat-dg2-9/igt@i915_selftest@live@uncore.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3674]: https://gitlab.freedesktop.org/drm/intel/issues/3674
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4444]: https://gitlab.freedesktop.org/drm/intel/issues/4444
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5171]: https://gitlab.freedesktop.org/drm/intel/issues/5171
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5874]: https://gitlab.freedesktop.org/drm/intel/issues/5874
  [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6499 -> IGTPW_7188

  CI-20190529: 20190529
  CI_DRM_11709: ece6a17bc06b3f66ab7030dc9fcfcd77ab837dba @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7188: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/index.html
  IGT_6499: 0759259260a5f0b8121f51627a949cdfe516bb4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/index.html

--===============3563047336758218274==
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
<tr><td><b>Series:</b></td><td>Skip if current &amp; requested BPC doesn&#39;t match (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104275/">https://patchwork.freedesktop.org/series/104275/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6499 -&gt; IGTPW_7188</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7188 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7188, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/index.html</p>
<h2>Participating hosts (47 -&gt; 45)</h2>
<p>Missing    (2): bat-atsm-1 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7188:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_hdr@static-toggle:<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/bat-dg1-5/igt@kms_hdr@static-toggle.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_hdr@bpc-switch@pipe-a-dp-2}:<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6499 and IGTPW_7188:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7188 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3674">i915#3674</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a>) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-soraka/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-hsw-4770/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/bat-adlp-4/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-guc/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/bat-dg1-6/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8700k/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color:</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-guc/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-snb-2600/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-11600/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color:</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-glk-dsi/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bwr-2160/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-hsw-4770/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-11600/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-guc/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-hsw-g3258/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp2:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bdw-gvtdvm/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bsw-kefka/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-snb-2520m/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-guc/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-skl-guc/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-elk-e7500/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bsw-nick/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-guc/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +2 similar issues</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-hsw-g3258/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-tgl-u2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bxt-dsi/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bsw-n3050/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-rkl-11600/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-pnv-d510/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-glk-j4005/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-skl-6700k2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-8109u/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-7567u/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-kbl-8809g/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-ilk-650/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-tgl-1115g4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 similar issues</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-adl-ddr5/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-cfl-guc/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-bdw-5557u/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-blb-e6850/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-skl-6600u/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-skl-6700k2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-skl-6700k2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4444">i915#4444</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@uncore:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6499/bat-dg2-9/igt@i915_selftest@live@uncore.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/bat-dg2-9/igt@i915_selftest@live@uncore.html">PASS</a> +7 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6499 -&gt; IGTPW_7188</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11709: ece6a17bc06b3f66ab7030dc9fcfcd77ab837dba @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7188: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7188/index.html<br />
  IGT_6499: 0759259260a5f0b8121f51627a949cdfe516bb4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3563047336758218274==--
