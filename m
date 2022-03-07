Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1174567642487851020=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 07 Mar 2022 05:07:15 -0000
Message-ID: <164662963515.12768.7823889319699554382@emeril.freedesktop.org>
References: <20220301164330.156289-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220301164330.156289-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_Fix_stealing_test_=28rev2=29?=
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

--===============1174567642487851020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Fix stealing test (rev2)
URL   : https://patchwork.freedesktop.org/series/100893/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11330 -> IGTPW_6741
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6741 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6741, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html

Participating hosts (48 -> 41)
------------------------------

  Additional (1): fi-glk-dsi 
  Missing    (8): fi-kbl-soraka shard-tglu fi-icl-u2 fi-bsw-cyan fi-pnv-d510 shard-rkl shard-dg1 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6741:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg1-6:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-5:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-1115g4:      [INCOMPLETE][5] ([i915#1385]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-tgl-1115g4:      [DMESG-WARN][7] ([i915#4002]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_setmode@basic-clone-single-crtc:
    - {bat-rpls-2}:       [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html
    - {fi-tgl-dsi}:       [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-tgl-dsi/igt@kms_setmode@basic-clone-single-crtc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-tgl-dsi/igt@kms_setmode@basic-clone-single-crtc.html
    - {fi-jsl-1}:         [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
    - {bat-jsl-1}:        [PASS][15] -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
    - {fi-ehl-2}:         [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-ehl-2/igt@kms_setmode@basic-clone-single-crtc.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-ehl-2/igt@kms_setmode@basic-clone-single-crtc.html
    - {bat-adlp-6}:       [PASS][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
    - {bat-jsl-2}:        [PASS][21] -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-jsl-2/igt@kms_setmode@basic-clone-single-crtc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-jsl-2/igt@kms_setmode@basic-clone-single-crtc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11330 and IGTPW_6741:

### New IGT tests (2) ###

  * igt@kms_setmode@basic-clone-single-crtc@pipe-a-vga-1-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_setmode@basic-clone-single-crtc@pipe-b-vga-1-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  

Known issues
------------

  Here are the changes found in IGTPW_6741 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-glk-dsi:         NOTRUN -> [SKIP][23] ([fdo#109271]) +31 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-hsw-4770:        NOTRUN -> [SKIP][24] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-skl-6600u:       [PASS][25] -> [INCOMPLETE][26] ([i915#4547])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-dsi:         NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-glk-dsi:         NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [PASS][29] -> [INCOMPLETE][30] ([i915#4418])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-7567u:       [PASS][31] -> [DMESG-FAIL][32] ([i915#541])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][33] -> [DMESG-FAIL][34] ([i915#5026])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-glk-dsi:         NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-glk-dsi:         NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#533])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-skl-6700k2:      [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-skl-6700k2/igt@kms_setmode@basic-clone-single-crtc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-skl-6700k2/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-blb-e6850:       [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-x1275:       [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bsw-kefka:       [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bsw-kefka/igt@kms_setmode@basic-clone-single-crtc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bsw-kefka/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bwr-2160:        [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bwr-2160/igt@kms_setmode@basic-clone-single-crtc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bwr-2160/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bsw-nick:        [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-guc:         [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-guc/igt@kms_setmode@basic-clone-single-crtc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-8809g:       [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-8809g/igt@kms_setmode@basic-clone-single-crtc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-8809g/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-rkl-guc:         [PASS][53] -> [SKIP][54] ([i915#4098])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-ilk-650:         [PASS][55] -> [SKIP][56] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-ilk-650/igt@kms_setmode@basic-clone-single-crtc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-ilk-650/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-elk-e7500:       [PASS][57] -> [SKIP][58] ([fdo#109271])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-elk-e7500/igt@kms_setmode@basic-clone-single-crtc.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-elk-e7500/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-snb-2520m:       [PASS][59] -> [SKIP][60] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-snb-2520m/igt@kms_setmode@basic-clone-single-crtc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-snb-2520m/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-cfl-8109u:       [PASS][61] -> [SKIP][62] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-7500u:       [PASS][63] -> [SKIP][64] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-7500u/igt@kms_setmode@basic-clone-single-crtc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-7500u/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bxt-dsi:         [PASS][65] -> [SKIP][66] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bxt-dsi/igt@kms_setmode@basic-clone-single-crtc.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bxt-dsi/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-hsw-4770:        [PASS][67] -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-hsw-4770/igt@kms_setmode@basic-clone-single-crtc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-hsw-4770/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-cfl-guc:         [PASS][69] -> [SKIP][70] ([fdo#109271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-cfl-guc/igt@kms_setmode@basic-clone-single-crtc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-cfl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-7567u:       [PASS][71] -> [SKIP][72] ([fdo#109271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-7567u/igt@kms_setmode@basic-clone-single-crtc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-7567u/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-skl-guc:         [PASS][73] -> [SKIP][74] ([fdo#109271])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bsw-n3050:       [PASS][75] -> [SKIP][76] ([fdo#109271])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bsw-n3050/igt@kms_setmode@basic-clone-single-crtc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bsw-n3050/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-ivb-3770:        [PASS][77] -> [SKIP][78] ([fdo#109271])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-ivb-3770/igt@kms_setmode@basic-clone-single-crtc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-ivb-3770/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-cfl-8700k:       [PASS][79] -> [SKIP][80] ([fdo#109271])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-cfl-8700k/igt@kms_setmode@basic-clone-single-crtc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-cfl-8700k/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-glk-j4005:       [PASS][81] -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-glk-j4005/igt@kms_setmode@basic-clone-single-crtc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-j4005/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@runner@aborted:
    - bat-dg1-6:          NOTRUN -> [FAIL][83] ([i915#4312])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-dg1-6/igt@runner@aborted.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][84] ([fdo#109271] / [i915#2403] / [i915#2426] / [i915#4312])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-blb-e6850/igt@runner@aborted.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][85] ([i915#4312])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-skl-6600u/igt@runner@aborted.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][86] ([i915#2426] / [i915#4312])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@dmabuf:
    - {fi-tgl-dsi}:       [FAIL][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-tgl-dsi/igt@i915_selftest@live@dmabuf.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-tgl-dsi/igt@i915_selftest@live@dmabuf.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][89] ([i915#4785]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@modeset:
    - {bat-adlp-6}:       [DMESG-WARN][91] ([i915#3576]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-adlp-6/igt@kms_busy@basic@modeset.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-adlp-6/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1385]: https://gitlab.freedesktop.org/drm/intel/issues/1385
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4002]: https://gitlab.freedesktop.org/drm/intel/issues/4002
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5026]: https://gitlab.freedesktop.org/drm/intel/issues/5026
  [i915#5087]: https://gitlab.freedesktop.org/drm/intel/issues/5087
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6364 -> IGTPW_6741

  CI-20190529: 20190529
  CI_DRM_11330: 68d8cd94c6eaa94aa6bae2e92efbd488523a1a1b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6741: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html
  IGT_6364: 3523fe577bc22e6512a8de7e60175c8f46cf61d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html

--===============1174567642487851020==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Fix stealing test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100893/">https://patchwork.freedesktop.org/series/100893/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11330 -&gt; IGTPW_6741</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6741 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6741, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html</p>
<h2>Participating hosts (48 -&gt; 41)</h2>
<p>Additional (1): fi-glk-dsi <br />
  Missing    (8): fi-kbl-soraka shard-tglu fi-icl-u2 fi-bsw-cyan fi-pnv-d510 shard-rkl shard-dg1 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6741:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1385">i915#1385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4002">i915#4002</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-tgl-dsi/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-tgl-dsi/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-ehl-2/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-ehl-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-jsl-2/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-jsl-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11330 and IGTPW_6741:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc@pipe-a-vga-1-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc@pipe-b-vga-1-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6741 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5026">i915#5026</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-skl-6700k2/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-skl-6700k2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bsw-kefka/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bsw-kefka/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bwr-2160/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bwr-2160/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-guc/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-8809g/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-8809g/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-ilk-650/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-ilk-650/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-elk-e7500/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-elk-e7500/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-snb-2520m/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-snb-2520m/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-7500u/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-7500u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bxt-dsi/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bxt-dsi/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-hsw-4770/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-hsw-4770/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-cfl-guc/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-cfl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-kbl-7567u/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-kbl-7567u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-bsw-n3050/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bsw-n3050/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-ivb-3770/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-ivb-3770/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-cfl-8700k/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-cfl-8700k/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-glk-j4005/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-glk-j4005/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-dg1-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-blb-e6850/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-tgl-dsi/igt@i915_selftest@live@dmabuf.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-tgl-dsi/igt@i915_selftest@live@dmabuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/bat-adlp-6/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/bat-adlp-6/igt@kms_busy@basic@modeset.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6364 -&gt; IGTPW_6741</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11330: 68d8cd94c6eaa94aa6bae2e92efbd488523a1a1b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6741: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html<br />
  IGT_6364: 3523fe577bc22e6512a8de7e60175c8f46cf61d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1174567642487851020==--
