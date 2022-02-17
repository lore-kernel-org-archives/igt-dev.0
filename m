Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============1948594853255895889=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 17 Feb 2022 17:04:05 -0000
Message-ID: <164511744593.18053.18209050757269347805@emeril.freedesktop.org>
References: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgTmV3IHN1?=
 =?utf-8?q?btests_for_deep_color_=28rev10=29?=
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

--===============1948594853255895889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New subtests for deep color (rev10)
URL   : https://patchwork.freedesktop.org/series/99239/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11240 -> IGTPW_6651
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/index.html

Participating hosts (44 -> 44)
------------------------------

  Additional (3): bat-jsl-2 fi-kbl-8809g fi-pnv-d510 
  Missing    (3): fi-bsw-cyan shard-tglu bat-adlp-4 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6651:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color@pipe-a-deep-color} (NEW):
    - bat-dg1-6:          NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-dg1-6/igt@kms_color@pipe-a-deep-color.html
    - {bat-jsl-2}:        NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-jsl-2/igt@kms_color@pipe-a-deep-color.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-jsl-1/igt@kms_color@pipe-a-deep-color.html

  * {igt@kms_color@pipe-a-deep-color@degamma-edp-1} (NEW):
    - {bat-adlp-6}:       NOTRUN -> [FAIL][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-adlp-6/igt@kms_color@pipe-a-deep-color@degamma-edp-1.html

  * {igt@kms_color@pipe-b-deep-color} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-tgl-dsi/igt@kms_color@pipe-b-deep-color.html

  * {igt@kms_color@pipe-c-deep-color} (NEW):
    - {bat-jsl-1}:        NOTRUN -> [SKIP][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-jsl-1/igt@kms_color@pipe-c-deep-color.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-rkl-guc/igt@kms_color@pipe-c-deep-color.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][8] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-rpls-1/igt@kms_color@pipe-c-deep-color.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11240 and IGTPW_6651:

### New IGT tests (40) ###

  * igt@kms_color@pipe-a-deep-color:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-deep-color@ctm-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_color@pipe-a-deep-color@ctm-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@pipe-a-deep-color@ctm-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_color@pipe-a-deep-color@degamma-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_color@pipe-a-deep-color@degamma-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [2.46] s

  * igt@kms_color@pipe-a-deep-color@degamma-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.64] s

  * igt@kms_color@pipe-a-deep-color@gamma-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_color@pipe-a-deep-color@gamma-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.16] s

  * igt@kms_color@pipe-a-deep-color@gamma-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.74] s

  * igt@kms_color@pipe-b-deep-color:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-b-deep-color@ctm-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_color@pipe-b-deep-color@ctm-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@pipe-b-deep-color@ctm-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.57] s

  * igt@kms_color@pipe-b-deep-color@degamma-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.01] s

  * igt@kms_color@pipe-b-deep-color@degamma-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [2.46] s

  * igt@kms_color@pipe-b-deep-color@degamma-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.65] s

  * igt@kms_color@pipe-b-deep-color@gamma-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_color@pipe-b-deep-color@gamma-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_color@pipe-b-deep-color@gamma-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.65] s

  * igt@kms_color@pipe-c-deep-color:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-deep-color@ctm-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_color@pipe-c-deep-color@ctm-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@pipe-c-deep-color@ctm-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.57] s

  * igt@kms_color@pipe-c-deep-color@degamma-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_color@pipe-c-deep-color@degamma-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [2.42] s

  * igt@kms_color@pipe-c-deep-color@degamma-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.64] s

  * igt@kms_color@pipe-c-deep-color@gamma-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_color@pipe-c-deep-color@gamma-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.83] s

  * igt@kms_color@pipe-c-deep-color@gamma-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.64] s

  * igt@kms_color@pipe-d-deep-color:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-deep-color@ctm-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_color@pipe-d-deep-color@ctm-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@pipe-d-deep-color@ctm-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_color@pipe-d-deep-color@degamma-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_color@pipe-d-deep-color@degamma-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [2.42] s

  * igt@kms_color@pipe-d-deep-color@degamma-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.60] s

  * igt@kms_color@pipe-d-deep-color@gamma-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_color@pipe-d-deep-color@gamma-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.86] s

  * igt@kms_color@pipe-d-deep-color@gamma-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [11.61] s

  

Known issues
------------

  Here are the changes found in IGTPW_6651 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-hsw-4770:        NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@fork-compute0:
    - fi-rkl-guc:         NOTRUN -> [SKIP][10] ([fdo#109315]) +17 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-rkl-guc/igt@amdgpu/amd_cs_nop@fork-compute0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][11] ([i915#4962]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][12] ([fdo#109271]) +61 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#2190])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_selftest@live@hugepages:
    - bat-dg1-5:          [PASS][15] -> [INCOMPLETE][16] ([i915#4999])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/bat-dg1-5/igt@i915_selftest@live@hugepages.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-dg1-5/igt@i915_selftest@live@hugepages.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][17] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html

  * {igt@kms_color@pipe-a-deep-color} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][18] ([fdo#109271]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bsw-n3050/igt@kms_color@pipe-a-deep-color.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][19] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-skl-6700k2/igt@kms_color@pipe-a-deep-color.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][21] ([fdo#109271]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-glk-dsi/igt@kms_color@pipe-a-deep-color.html
    - fi-kbl-7500u:       NOTRUN -> [SKIP][22] ([fdo#109271]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-7500u/igt@kms_color@pipe-a-deep-color.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][23] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-snb-2520m/igt@kms_color@pipe-a-deep-color.html

  * {igt@kms_color@pipe-b-deep-color} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-blb-e6850/igt@kms_color@pipe-b-deep-color.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][25] ([fdo#109271]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-cfl-8109u/igt@kms_color@pipe-b-deep-color.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][26] ([fdo#109271]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-cfl-guc/igt@kms_color@pipe-b-deep-color.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][27] ([fdo#109271]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-soraka/igt@kms_color@pipe-b-deep-color.html

  * {igt@kms_color@pipe-c-deep-color} (NEW):
    - {fi-ehl-2}:         NOTRUN -> [SKIP][28] ([fdo#109278]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-ehl-2/igt@kms_color@pipe-c-deep-color.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][29] ([fdo#109271]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-elk-e7500/igt@kms_color@pipe-c-deep-color.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][30] ([fdo#109271]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-7567u/igt@kms_color@pipe-c-deep-color.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][31] ([fdo#109271]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-hsw-4770/igt@kms_color@pipe-c-deep-color.html

  * {igt@kms_color@pipe-d-deep-color} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][32] ([fdo#109278]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-cml-u2/igt@kms_color@pipe-d-deep-color.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][33] ([fdo#109271]) +58 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@kms_color@pipe-d-deep-color.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-glk-j4005/igt@kms_color@pipe-d-deep-color.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][35] ([fdo#109271]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-cfl-8700k/igt@kms_color@pipe-d-deep-color.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][36] ([fdo#109271]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bsw-nick/igt@kms_color@pipe-d-deep-color.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][37] ([fdo#109271]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-x1275/igt@kms_color@pipe-d-deep-color.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-guc/igt@kms_color@pipe-d-deep-color.html
    - fi-skl-guc:         NOTRUN -> [SKIP][39] ([fdo#109271]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-skl-guc/igt@kms_color@pipe-d-deep-color.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][40] ([fdo#109271]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bwr-2160/igt@kms_color@pipe-d-deep-color.html
    - fi-snb-2600:        NOTRUN -> [SKIP][41] ([fdo#109271]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-snb-2600/igt@kms_color@pipe-d-deep-color.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][42] ([fdo#109271]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bsw-kefka/igt@kms_color@pipe-d-deep-color.html
    - fi-ilk-650:         NOTRUN -> [SKIP][43] ([fdo#109271]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-ilk-650/igt@kms_color@pipe-d-deep-color.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#533])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][45] ([i915#2426] / [i915#4312])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rpls-1}:       [INCOMPLETE][46] ([i915#4898]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         [INCOMPLETE][48] -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [DMESG-FAIL][50] ([i915#4494] / [i915#4957]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
    - fi-hsw-4770:        [INCOMPLETE][52] ([i915#3303]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4898]: https://gitlab.freedesktop.org/drm/intel/issues/4898
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4962]: https://gitlab.freedesktop.org/drm/intel/issues/4962
  [i915#4999]: https://gitlab.freedesktop.org/drm/intel/issues/4999
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6347 -> IGTPW_6651

  CI-20190529: 20190529
  CI_DRM_11240: 6c7dfb9d61c43210726e569c2523ec7cb6a2e3b9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6651: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/index.html
  IGT_6347: 37ea4c86f97c0e05fcb6b04cff72ec927930536e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_color@pipe-a-deep-color
+igt@kms_color@pipe-b-deep-color
+igt@kms_color@pipe-c-deep-color
+igt@kms_color@pipe-d-deep-color
+igt@kms_color@pipe-e-deep-color
+igt@kms_color@pipe-f-deep-color

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/index.html

--===============1948594853255895889==
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
<tr><td><b>Series:</b></td><td>New subtests for deep color (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99239/">https://patchwork.freedesktop.org/series/99239/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11240 -&gt; IGTPW_6651</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/index.html</p>
<h2>Participating hosts (44 -&gt; 44)</h2>
<p>Additional (3): bat-jsl-2 fi-kbl-8809g fi-pnv-d510 <br />
  Missing    (3): fi-bsw-cyan shard-tglu bat-adlp-4 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6651:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color@pipe-a-deep-color} (NEW):</p>
<ul>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-dg1-6/igt@kms_color@pipe-a-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{bat-jsl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-jsl-2/igt@kms_color@pipe-a-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-jsl-1/igt@kms_color@pipe-a-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-deep-color@degamma-edp-1} (NEW):</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-adlp-6/igt@kms_color@pipe-a-deep-color@degamma-edp-1.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-deep-color} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-tgl-dsi/igt@kms_color@pipe-b-deep-color.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-deep-color} (NEW):</p>
<ul>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-jsl-1/igt@kms_color@pipe-c-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-rkl-guc/igt@kms_color@pipe-c-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-rpls-1/igt@kms_color@pipe-c-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11240 and IGTPW_6651:</p>
<h3>New IGT tests (40)</h3>
<ul>
<li>
<p>igt@kms_color@pipe-a-deep-color:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@ctm-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@ctm-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@ctm-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@degamma-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@degamma-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@degamma-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@gamma-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@gamma-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@gamma-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@ctm-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@ctm-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@ctm-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@degamma-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@degamma-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@degamma-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@gamma-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@gamma-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@gamma-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@ctm-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@ctm-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@ctm-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@degamma-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@degamma-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@degamma-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@gamma-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@gamma-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@gamma-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@ctm-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@ctm-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@ctm-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@degamma-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@degamma-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@degamma-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@gamma-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@gamma-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@gamma-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.61] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6651 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-compute0:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-rkl-guc/igt@amdgpu/amd_cs_nop@fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4962">i915#4962</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +61 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/bat-dg1-5/igt@i915_selftest@live@hugepages.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-dg1-5/igt@i915_selftest@live@hugepages.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4999">i915#4999</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bsw-n3050/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-skl-6700k2/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-glk-dsi/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-7500u/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-snb-2520m/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-blb-e6850/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-cfl-8109u/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-cfl-guc/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-soraka/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-deep-color} (NEW):</p>
<ul>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-ehl-2/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +3 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-elk-e7500/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-7567u/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-hsw-4770/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-cml-u2/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +58 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-glk-j4005/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-cfl-8700k/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bsw-nick/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-x1275/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-guc/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-skl-guc/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bwr-2160/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-snb-2600/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bsw-kefka/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-ilk-650/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4898">i915#4898</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11240/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6347 -&gt; IGTPW_6651</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11240: 6c7dfb9d61c43210726e569c2523ec7cb6a2e3b9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6651: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6651/index.html<br />
  IGT_6347: 37ea4c86f97c0e05fcb6b04cff72ec927930536e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_color@pipe-a-deep-color<br />
+igt@kms_color@pipe-b-deep-color<br />
+igt@kms_color@pipe-c-deep-color<br />
+igt@kms_color@pipe-d-deep-color<br />
+igt@kms_color@pipe-e-deep-color<br />
+igt@kms_color@pipe-f-deep-color</p>

</body>
</html>

--===============1948594853255895889==--
