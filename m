Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8097566745187215847=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 20 Jan 2023 13:48:21 -0000
Message-ID: <167422250135.22911.6467604353274380813@emeril.freedesktop.org>
References: <20230120122857.28445-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230120122857.28445-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fcreate=3A_add_two_multi-gpu_subtests?=
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

--===============8097566745187215847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_ctx_create: add two multi-gpu subtests
URL   : https://patchwork.freedesktop.org/series/113151/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12617 -> IGTPW_8381
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8381 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8381, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/index.html

Participating hosts (35 -> 36)
------------------------------

  Additional (3): fi-kbl-soraka bat-adls-5 fi-pnv-d510 
  Missing    (2): fi-bsw-kefka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8381:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_create@basic:
    - fi-elk-e7500:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-elk-e7500/igt@gem_ctx_create@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-elk-e7500/igt@gem_ctx_create@basic.html
    - fi-bsw-nick:        [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-bsw-nick/igt@gem_ctx_create@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-bsw-nick/igt@gem_ctx_create@basic.html
    - fi-ilk-650:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-ilk-650/igt@gem_ctx_create@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-ilk-650/igt@gem_ctx_create@basic.html
    - fi-ctg-p8600:       [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-ctg-p8600/igt@gem_ctx_create@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-ctg-p8600/igt@gem_ctx_create@basic.html
    - fi-bsw-n3050:       [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-bsw-n3050/igt@gem_ctx_create@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-bsw-n3050/igt@gem_ctx_create@basic.html
    - fi-adl-ddr5:        [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-adl-ddr5/igt@gem_ctx_create@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-adl-ddr5/igt@gem_ctx_create@basic.html
    - fi-skl-6600u:       [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-skl-6600u/igt@gem_ctx_create@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-skl-6600u/igt@gem_ctx_create@basic.html
    - fi-snb-2600:        [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-snb-2600/igt@gem_ctx_create@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-snb-2600/igt@gem_ctx_create@basic.html
    - bat-dg1-6:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg1-6/igt@gem_ctx_create@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg1-6/igt@gem_ctx_create@basic.html
    - fi-cfl-8700k:       [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-cfl-8700k/igt@gem_ctx_create@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-cfl-8700k/igt@gem_ctx_create@basic.html
    - fi-rkl-11600:       [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-rkl-11600/igt@gem_ctx_create@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-rkl-11600/igt@gem_ctx_create@basic.html
    - fi-apl-guc:         [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-apl-guc/igt@gem_ctx_create@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-apl-guc/igt@gem_ctx_create@basic.html
    - bat-dg1-5:          [PASS][25] -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg1-5/igt@gem_ctx_create@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg1-5/igt@gem_ctx_create@basic.html
    - fi-rkl-guc:         [PASS][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-rkl-guc/igt@gem_ctx_create@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-rkl-guc/igt@gem_ctx_create@basic.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@gem_ctx_create@basic.html
    - fi-skl-6700k2:      [PASS][30] -> [FAIL][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-skl-6700k2/igt@gem_ctx_create@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-skl-6700k2/igt@gem_ctx_create@basic.html
    - fi-cfl-8109u:       [PASS][32] -> [FAIL][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-cfl-8109u/igt@gem_ctx_create@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-cfl-8109u/igt@gem_ctx_create@basic.html
    - fi-kbl-8809g:       [PASS][34] -> [FAIL][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-kbl-8809g/igt@gem_ctx_create@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-8809g/igt@gem_ctx_create@basic.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-ivb-3770:        [PASS][36] -> [FAIL][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_ctx_create@basic:
    - {bat-dg2-8}:        [PASS][38] -> [FAIL][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg2-8/igt@gem_ctx_create@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg2-8/igt@gem_ctx_create@basic.html
    - {bat-adlm-1}:       [PASS][40] -> [FAIL][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adlm-1/igt@gem_ctx_create@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adlm-1/igt@gem_ctx_create@basic.html
    - {bat-rplp-1}:       [PASS][42] -> [FAIL][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-rplp-1/igt@gem_ctx_create@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-rplp-1/igt@gem_ctx_create@basic.html
    - {bat-rpls-1}:       [PASS][44] -> [FAIL][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-rpls-1/igt@gem_ctx_create@basic.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-rpls-1/igt@gem_ctx_create@basic.html
    - {bat-rpls-2}:       [PASS][46] -> [FAIL][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-rpls-2/igt@gem_ctx_create@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-rpls-2/igt@gem_ctx_create@basic.html
    - {bat-adlp-9}:       [PASS][48] -> [FAIL][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adlp-9/igt@gem_ctx_create@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adlp-9/igt@gem_ctx_create@basic.html
    - {bat-jsl-1}:        [PASS][50] -> [FAIL][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-jsl-1/igt@gem_ctx_create@basic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-jsl-1/igt@gem_ctx_create@basic.html
    - {bat-kbl-2}:        [PASS][52] -> [FAIL][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-kbl-2/igt@gem_ctx_create@basic.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-kbl-2/igt@gem_ctx_create@basic.html
    - {bat-adlp-6}:       [PASS][54] -> [FAIL][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adlp-6/igt@gem_ctx_create@basic.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adlp-6/igt@gem_ctx_create@basic.html
    - {bat-adls-5}:       NOTRUN -> [FAIL][56]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adls-5/igt@gem_ctx_create@basic.html
    - {bat-dg1-7}:        [PASS][57] -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg1-7/igt@gem_ctx_create@basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg1-7/igt@gem_ctx_create@basic.html
    - {bat-jsl-3}:        [PASS][59] -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-jsl-3/igt@gem_ctx_create@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-jsl-3/igt@gem_ctx_create@basic.html
    - {bat-dg2-9}:        [PASS][61] -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg2-9/igt@gem_ctx_create@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg2-9/igt@gem_ctx_create@basic.html
    - {bat-dg2-11}:       [PASS][63] -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg2-11/igt@gem_ctx_create@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg2-11/igt@gem_ctx_create@basic.html
    - {bat-adln-1}:       [PASS][65] -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adln-1/igt@gem_ctx_create@basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adln-1/igt@gem_ctx_create@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_8381 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        NOTRUN -> [FAIL][67] ([i915#7229])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#2190])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#4613]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_module_load@load:
    - fi-ctg-p8600:       [PASS][70] -> [DMESG-WARN][71] ([i915#6020])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-ctg-p8600/igt@i915_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-ctg-p8600/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][72] ([i915#1886])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][73] ([fdo#109271]) +15 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][74] ([fdo#109271])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-bsw-n3050/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][75] ([fdo#109271]) +44 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - {bat-adlp-6}:       [DMESG-WARN][76] ([i915#7077]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [INCOMPLETE][78] ([i915#6972]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][80] ([i915#5334]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][82] ([i915#4983]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-rpls-2/igt@i915_selftest@live@reset.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-rpls-2/igt@i915_selftest@live@reset.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [FAIL][84] ([fdo#103375]) -> [INCOMPLETE][85] ([i915#4817])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6020]: https://gitlab.freedesktop.org/drm/intel/issues/6020
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
  [i915#6972]: https://gitlab.freedesktop.org/drm/intel/issues/6972
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7128 -> IGTPW_8381

  CI-20190529: 20190529
  CI_DRM_12617: 328799697aa88d6f14c6a7267e5aefc9129725de @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8381: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/index.html
  IGT_7128: be755d8bfee83a21448e58217edea2b615eef1a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_ctx_create@multigpu-basic
+igt@gem_ctx_create@multigpu-basic-files

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/index.html

--===============8097566745187215847==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_ctx_create: add two multi-gpu subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113151/">https://patchwork.freedesktop.org/series/113151/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12617 -&gt; IGTPW_8381</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8381 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8381, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/index.html</p>
<h2>Participating hosts (35 -&gt; 36)</h2>
<p>Additional (3): fi-kbl-soraka bat-adls-5 fi-pnv-d510 <br />
  Missing    (2): fi-bsw-kefka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8381:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_create@basic:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-elk-e7500/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-elk-e7500/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-bsw-nick/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-bsw-nick/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-ilk-650/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-ilk-650/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-ctg-p8600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-ctg-p8600/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-ctg-p8600/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-bsw-n3050/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-bsw-n3050/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-adl-ddr5/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-adl-ddr5/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-skl-6600u/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-skl-6600u/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-snb-2600/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-snb-2600/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg1-6/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg1-6/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-cfl-8700k/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-cfl-8700k/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-rkl-11600/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-rkl-11600/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-apl-guc/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-apl-guc/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg1-5/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg1-5/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-rkl-guc/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-rkl-guc/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-skl-6700k2/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-skl-6700k2/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-cfl-8109u/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-cfl-8109u/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-kbl-8809g/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-8809g/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_ctx_create@basic:</p>
<ul>
<li>
<p>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg2-8/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg2-8/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adlm-1/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adlm-1/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-rplp-1/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-rplp-1/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-rpls-1/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-rpls-1/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-rpls-2/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-rpls-2/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adlp-9/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adlp-9/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-jsl-1/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-jsl-1/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-kbl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-kbl-2/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-kbl-2/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adlp-6/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adlp-6/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adls-5/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg1-7}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg1-7/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg1-7/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-3}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-jsl-3/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-jsl-3/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg2-9/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg2-9/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-dg2-11/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-dg2-11/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adln-1/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adln-1/igt@gem_ctx_create@basic.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8381 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-ctg-p8600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-ctg-p8600/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-ctg-p8600/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6020">i915#6020</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-bsw-n3050/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +44 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6972">i915#6972</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12617/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7128 -&gt; IGTPW_8381</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12617: 328799697aa88d6f14c6a7267e5aefc9129725de @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8381: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8381/index.html<br />
  IGT_7128: be755d8bfee83a21448e58217edea2b615eef1a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_ctx_create@multigpu-basic<br />
+igt@gem_ctx_create@multigpu-basic-files</p>

</body>
</html>

--===============8097566745187215847==--
