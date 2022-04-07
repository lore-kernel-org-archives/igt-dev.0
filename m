Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5484740681574887712=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 07 Apr 2022 06:25:25 -0000
Message-ID: <164931272593.14671.9782486746743854088@emeril.freedesktop.org>
References: <20220407051908.3390083-1-lucas.demarchi@intel.com>
In-Reply-To: <20220407051908.3390083-1-lucas.demarchi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?intel-ci/fast-feedback=3A_Move_gem=5Flmem=5Fswapping_further?=
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

--===============5484740681574887712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci/fast-feedback: Move gem_lmem_swapping further
URL   : https://patchwork.freedesktop.org/series/102312/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11469 -> IGTPW_6889
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6889 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6889, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/index.html

Participating hosts (50 -> 45)
------------------------------

  Additional (1): bat-adlm-1 
  Missing    (6): fi-bxt-dsi shard-tglu fi-bsw-cyan fi-ctg-p8600 fi-pnv-d510 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6889:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-dg1-5:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-dg1-5/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-dg1-6:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-dg1-6/igt@gem_lmem_swapping@parallel-random-engines.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_lmem_swapping@basic:
    - {bat-adlm-1}:       NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-adlm-1/igt@gem_lmem_swapping@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_6889 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-multi-fence:
    - fi-bsw-nick:        NOTRUN -> [SKIP][4] ([fdo#109271]) +17 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-nick/igt@amdgpu/amd_basic@cs-multi-fence.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][5] ([fdo#109271]) +17 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8109u/igt@amdgpu/amd_basic@cs-multi-fence.html

  * igt@amdgpu/amd_basic@cs-sdma:
    - fi-adl-ddr5:        NOTRUN -> [SKIP][6] ([i915#2575]) +17 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-adl-ddr5/igt@amdgpu/amd_basic@cs-sdma.html

  * igt@amdgpu/amd_basic@query-info:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][7] ([fdo#109271]) +17 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][8] ([fdo#109315])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-tgl-1115g4/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-kbl-7500u:       NOTRUN -> [SKIP][9] ([fdo#109271]) +17 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-7500u/igt@amdgpu/amd_basic@semaphore.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_basic@userptr:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][11] ([fdo#109271]) +17 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8700k/igt@amdgpu/amd_basic@userptr.html

  * igt@amdgpu/amd_cs_nop@fork-compute0:
    - fi-rkl-guc:         NOTRUN -> [SKIP][12] ([fdo#109315]) +17 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-rkl-guc/igt@amdgpu/amd_cs_nop@fork-compute0.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][13] ([fdo#109271]) +17 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-blb-e6850/igt@amdgpu/amd_cs_nop@fork-compute0.html

  * igt@amdgpu/amd_cs_nop@fork-gfx0:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][14] ([fdo#109271]) +17 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@fork-gfx0.html

  * igt@amdgpu/amd_cs_nop@nop-gfx0:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][15] ([fdo#109315] / [i915#2575]) +16 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-tgl-1115g4/igt@amdgpu/amd_cs_nop@nop-gfx0.html

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][16] ([fdo#109271]) +17 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-skl-6700k2/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@amdgpu/amd_cs_nop@sync-gfx0:
    - fi-cfl-guc:         NOTRUN -> [SKIP][17] ([fdo#109271]) +17 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-guc/igt@amdgpu/amd_cs_nop@sync-gfx0.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][18] ([fdo#109271]) +17 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-glk-j4005/igt@amdgpu/amd_cs_nop@sync-gfx0.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][19] ([fdo#109271]) +17 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-7567u/igt@amdgpu/amd_cs_nop@sync-gfx0.html
    - fi-skl-guc:         NOTRUN -> [SKIP][20] ([fdo#109271]) +17 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-skl-guc/igt@amdgpu/amd_cs_nop@sync-gfx0.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-8700k:       NOTRUN -> [DMESG-FAIL][21] ([i915#5334])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][22] ([i915#1886])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][23] ([i915#4312])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-skl-6700k2:      [DMESG-WARN][24] ([i915#5437]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html
    - fi-rkl-guc:         [DMESG-WARN][26] ([i915#5577]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-adl-ddr5:        [DMESG-WARN][28] ([i915#5577]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-adl-ddr5/igt@core_hotunplug@unbind-rebind.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-adl-ddr5/igt@core_hotunplug@unbind-rebind.html
    - {fi-ehl-2}:         [DMESG-WARN][30] ([i915#5577]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html
    - fi-glk-j4005:       [DMESG-WARN][32] ([i915#5437]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-glk-j4005/igt@core_hotunplug@unbind-rebind.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-glk-j4005/igt@core_hotunplug@unbind-rebind.html
    - fi-bsw-nick:        [DMESG-WARN][34] ([i915#5437]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-bsw-nick/igt@core_hotunplug@unbind-rebind.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-nick/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-7567u:       [DMESG-WARN][36] ([i915#5437]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
    - {bat-jsl-2}:        [DMESG-WARN][38] ([i915#5577]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/bat-jsl-2/igt@core_hotunplug@unbind-rebind.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-jsl-2/igt@core_hotunplug@unbind-rebind.html
    - fi-bsw-n3050:       [DMESG-WARN][40] ([i915#5437]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html
    - fi-cfl-guc:         [DMESG-WARN][42] ([i915#5437]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-soraka:      [DMESG-WARN][44] ([i915#5437]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html
    - fi-tgl-1115g4:      [DMESG-WARN][46] ([i915#1982]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
    - fi-cfl-8700k:       [DMESG-WARN][48] ([i915#5437]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html
    - {fi-jsl-1}:         [DMESG-WARN][50] ([i915#5577]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-jsl-1/igt@core_hotunplug@unbind-rebind.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-jsl-1/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-7500u:       [DMESG-WARN][52] ([i915#5437]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html
    - fi-cfl-8109u:       [DMESG-WARN][54] ([i915#5437]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
    - fi-skl-guc:         [DMESG-WARN][56] ([i915#5437]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html
    - {bat-jsl-1}:        [DMESG-WARN][58] ([i915#5577]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html
    - fi-bsw-kefka:       [DMESG-WARN][60] ([i915#5437]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-bsw-kefka/igt@core_hotunplug@unbind-rebind.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-kefka/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-bdw-5557u:       [INCOMPLETE][62] ([i915#146]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][64] ([i915#4785]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][66] ([i915#4528]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-blb-e6850/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5437]: https://gitlab.freedesktop.org/drm/intel/issues/5437
  [i915#5577]: https://gitlab.freedesktop.org/drm/intel/issues/5577


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6415 -> IGTPW_6889

  CI-20190529: 20190529
  CI_DRM_11469: d95bb535e8e80c0484bb6f13d1875efcdb084862 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6889: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/index.html
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/index.html

--===============5484740681574887712==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci/fast-feedback: Move gem_lmem_swapping further</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102312/">https://patchwork.freedesktop.org/series/102312/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11469 -&gt; IGTPW_6889</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6889 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6889, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/index.html</p>
<h2>Participating hosts (50 -&gt; 45)</h2>
<p>Additional (1): bat-adlm-1 <br />
  Missing    (6): fi-bxt-dsi shard-tglu fi-bsw-cyan fi-ctg-p8600 fi-pnv-d510 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6889:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-dg1-5/igt@gem_lmem_swapping@parallel-random-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-dg1-6/igt@gem_lmem_swapping@parallel-random-engines.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_lmem_swapping@basic:<ul>
<li>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-adlm-1/igt@gem_lmem_swapping@basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6889 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-multi-fence:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-nick/igt@amdgpu/amd_basic@cs-multi-fence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8109u/igt@amdgpu/amd_basic@cs-multi-fence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@cs-sdma:</p>
<ul>
<li>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-adl-ddr5/igt@amdgpu/amd_basic@cs-sdma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-tgl-1115g4/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-7500u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@userptr:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8700k/igt@amdgpu/amd_basic@userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-compute0:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-rkl-guc/igt@amdgpu/amd_cs_nop@fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-blb-e6850/igt@amdgpu/amd_cs_nop@fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-gfx0:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-gfx0:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-tgl-1115g4/igt@amdgpu/amd_cs_nop@nop-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-skl-6700k2/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-gfx0:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-guc/igt@amdgpu/amd_cs_nop@sync-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-glk-j4005/igt@amdgpu/amd_cs_nop@sync-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-7567u/igt@amdgpu/amd_cs_nop@sync-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-skl-guc/igt@amdgpu/amd_cs_nop@sync-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5577">i915#5577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-adl-ddr5/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5577">i915#5577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-adl-ddr5/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5577">i915#5577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-glk-j4005/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-glk-j4005/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-bsw-nick/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-nick/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>{bat-jsl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/bat-jsl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5577">i915#5577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-jsl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-jsl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5577">i915#5577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-jsl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5577">i915#5577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-bsw-kefka/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5437">i915#5437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bsw-kefka/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11469/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6415 -&gt; IGTPW_6889</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11469: d95bb535e8e80c0484bb6f13d1875efcdb084862 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6889: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6889/index.html<br />
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5484740681574887712==--
