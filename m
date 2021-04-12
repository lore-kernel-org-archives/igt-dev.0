Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 12 Apr 2021 15:00:36 -0000
Message-ID: <161823963625.8701.6363848860943637137@emeril.freedesktop.org>
References: <20210412111808.137038-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210412111808.137038-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev35=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0699175896=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0699175896==
Content-Type: multipart/alternative;
 boundary="===============8726000105497200999=="

--===============8726000105497200999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev35)
URL   : https://patchwork.freedesktop.org/series/82954/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9960 -> IGTPW_5734
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9960 and IGTPW_5734:

### New IGT tests (2) ###

  * igt@gem_softpin@allocator-basic:
    - Statuses : 29 pass(s) 9 skip(s)
    - Exec time: [0.0, 1.00] s

  * igt@gem_softpin@allocator-basic-reserve:
    - Statuses : 29 pass(s) 9 skip(s)
    - Exec time: [0.0, 1.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_5734 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-tgl-u2:          NOTRUN -> [SKIP][1] ([fdo#109315])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-icl-y:           NOTRUN -> [SKIP][2] ([fdo#109315]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@fork-compute0:
    - fi-tgl-u2:          NOTRUN -> [SKIP][3] ([fdo#109315] / [i915#2575]) +16 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@amdgpu/amd_cs_nop@fork-compute0.html

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][4] ([fdo#109271]) +19 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-u2:          NOTRUN -> [SKIP][5] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html
    - fi-icl-y:           NOTRUN -> [SKIP][6] ([i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@gem_huc_copy@huc-copy.html

  * {igt@gem_softpin@allocator-basic} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-pnv-d510/igt@gem_softpin@allocator-basic.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-bwr-2160/igt@gem_softpin@allocator-basic.html
    - {fi-hsw-gt1}:       NOTRUN -> [SKIP][9] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-hsw-gt1/igt@gem_softpin@allocator-basic.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-snb-2520m/igt@gem_softpin@allocator-basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][11] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-ivb-3770/igt@gem_softpin@allocator-basic.html

  * {igt@gem_softpin@allocator-basic-reserve} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-elk-e7500/igt@gem_softpin@allocator-basic-reserve.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][13] ([fdo#109271]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html
    - fi-ilk-650:         NOTRUN -> [SKIP][14] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-icl-y:           NOTRUN -> [SKIP][15] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-tgl-u2:          NOTRUN -> [SKIP][16] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-u2:          NOTRUN -> [SKIP][19] ([fdo#109285])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html
    - fi-icl-y:           NOTRUN -> [SKIP][20] ([fdo#109285])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-icl-y:           NOTRUN -> [SKIP][21] ([fdo#109278])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-icl-y:           NOTRUN -> [SKIP][22] ([fdo#110189]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@kms_psr@primary_mmap_gtt.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [PASS][23] -> [DMESG-WARN][24] ([i915#402]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  * igt@prime_vgem@basic-userptr:
    - fi-tgl-u2:          NOTRUN -> [SKIP][25] ([i915#3301])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@prime_vgem@basic-userptr.html
    - fi-icl-y:           NOTRUN -> [SKIP][26] ([i915#3301])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][27] ([i915#1602] / [i915#2029])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - fi-tgl-y:           [DMESG-WARN][28] ([i915#402]) -> [PASS][29] +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-tgl-y/igt@fbdev@write.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-y/igt@fbdev@write.html

  * igt@gem_linear_blits@basic:
    - {fi-rkl-11500t}:    [FAIL][30] ([i915#3277]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-rkl-11500t/igt@gem_linear_blits@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-rkl-11500t/igt@gem_linear_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - {fi-rkl-11500t}:    [FAIL][32] ([i915#3278]) -> [PASS][33] +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-rkl-11500t/igt@gem_tiled_blits@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-rkl-11500t/igt@gem_tiled_blits@basic.html

  * igt@i915_module_load@reload:
    - fi-tgl-y:           [DMESG-WARN][34] ([i915#1982] / [k.org#205379]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-tgl-y/igt@i915_module_load@reload.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-y/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [DMESG-WARN][36] ([i915#3303]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [INCOMPLETE][38] ([i915#2782]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3278]: https://gitlab.freedesktop.org/drm/intel/issues/3278
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (45 -> 41)
------------------------------

  Additional (2): fi-icl-y fi-tgl-u2 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6063 -> IGTPW_5734

  CI-20190529: 20190529
  CI_DRM_9960: 83246a97b645e8b2df61e4fadb347b5ce8470efe @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5734: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/index.html
  IGT_6063: d3b7f74ce5df6fdea03e490b7c64f0c6bfe76f03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_allocator@alloc-simple
+igt@api_intel_allocator@execbuf-with-allocator
+igt@api_intel_allocator@fork-simple-once
+igt@api_intel_allocator@fork-simple-stress
+igt@api_intel_allocator@fork-simple-stress-signal
+igt@api_intel_allocator@open-vm
+igt@api_intel_allocator@random-allocator
+igt@api_intel_allocator@reloc-allocator
+igt@api_intel_allocator@reopen
+igt@api_intel_allocator@reopen-fork
+igt@api_intel_allocator@reserve
+igt@api_intel_allocator@reserve-simple
+igt@api_intel_allocator@reuse
+igt@api_intel_allocator@simple-allocator
+igt@api_intel_allocator@standalone
+igt@api_intel_allocator@two-level-inception
+igt@api_intel_allocator@two-level-inception-interruptible
+igt@api_intel_bb@add-remove-objects
+igt@api_intel_bb@bb-with-allocator
+igt@api_intel_bb@bb-with-vm
+igt@api_intel_bb@blit-noreloc-keep-cache-random
+igt@api_intel_bb@blit-noreloc-purge-cache-random
+igt@api_intel_bb@destroy-bb
+igt@api_intel_bb@object-noreloc-keep-cache-random
+igt@api_intel_bb@object-noreloc-keep-cache-simple
+igt@api_intel_bb@object-noreloc-purge-cache-random
+igt@api_intel_bb@object-noreloc-purge-cache-simple
+igt@api_intel_bb@object-reloc-keep-cache
+igt@api_intel_bb@object-reloc-purge-cache
+igt@api_intel_bb@purge-bb
+igt@api_intel_bb@reset-bb
+igt@gem_softpin@allocator-basic
+igt@gem_softpin@allocator-basic-reserve
+igt@gem_softpin@allocator-fork
+igt@gem_softpin@allocator-nopin
+igt@gem_softpin@allocator-nopin-reserve
-igt@api_intel_bb@check-canonical

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/index.html

--===============8726000105497200999==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev35)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9960 -&gt; IGTPW_5734</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9960 and IGTPW_5734:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 29 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 29 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 1.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5734 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-compute0:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@amdgpu/amd_cs_nop@fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@allocator-basic} (NEW):</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-pnv-d510/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-bwr-2160/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>{fi-hsw-gt1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-hsw-gt1/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-snb-2520m/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-ivb-3770/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@allocator-basic-reserve} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-elk-e7500/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-icl-y/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-tgl-y/igt@fbdev@write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-y/igt@fbdev@write.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-rkl-11500t/igt@gem_linear_blits@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3277">i915#3277</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-rkl-11500t/igt@gem_linear_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-rkl-11500t/igt@gem_tiled_blits@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3278">i915#3278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-rkl-11500t/igt@gem_tiled_blits@basic.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-tgl-y/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-tgl-y/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9960/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 41)</h2>
<p>Additional (2): fi-icl-y fi-tgl-u2 <br />
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6063 -&gt; IGTPW_5734</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9960: 83246a97b645e8b2df61e4fadb347b5ce8470efe @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5734: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5734/index.html<br />
  IGT_6063: d3b7f74ce5df6fdea03e490b7c64f0c6bfe76f03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@api_intel_allocator@alloc-simple<br />
+igt@api_intel_allocator@execbuf-with-allocator<br />
+igt@api_intel_allocator@fork-simple-once<br />
+igt@api_intel_allocator@fork-simple-stress<br />
+igt@api_intel_allocator@fork-simple-stress-signal<br />
+igt@api_intel_allocator@open-vm<br />
+igt@api_intel_allocator@random-allocator<br />
+igt@api_intel_allocator@reloc-allocator<br />
+igt@api_intel_allocator@reopen<br />
+igt@api_intel_allocator@reopen-fork<br />
+igt@api_intel_allocator@reserve<br />
+igt@api_intel_allocator@reserve-simple<br />
+igt@api_intel_allocator@reuse<br />
+igt@api_intel_allocator@simple-allocator<br />
+igt@api_intel_allocator@standalone<br />
+igt@api_intel_allocator@two-level-inception<br />
+igt@api_intel_allocator@two-level-inception-interruptible<br />
+igt@api_intel_bb@add-remove-objects<br />
+igt@api_intel_bb@bb-with-allocator<br />
+igt@api_intel_bb@bb-with-vm<br />
+igt@api_intel_bb@blit-noreloc-keep-cache-random<br />
+igt@api_intel_bb@blit-noreloc-purge-cache-random<br />
+igt@api_intel_bb@destroy-bb<br />
+igt@api_intel_bb@object-noreloc-keep-cache-random<br />
+igt@api_intel_bb@object-noreloc-keep-cache-simple<br />
+igt@api_intel_bb@object-noreloc-purge-cache-random<br />
+igt@api_intel_bb@object-noreloc-purge-cache-simple<br />
+igt@api_intel_bb@object-reloc-keep-cache<br />
+igt@api_intel_bb@object-reloc-purge-cache<br />
+igt@api_intel_bb@purge-bb<br />
+igt@api_intel_bb@reset-bb<br />
+igt@gem_softpin@allocator-basic<br />
+igt@gem_softpin@allocator-basic-reserve<br />
+igt@gem_softpin@allocator-fork<br />
+igt@gem_softpin@allocator-nopin<br />
+igt@gem_softpin@allocator-nopin-reserve<br />
-igt@api_intel_bb@check-canonical</p>

</body>
</html>

--===============8726000105497200999==--

--===============0699175896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0699175896==--
