Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5448015227332958798=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 21 Apr 2022 07:31:38 -0000
Message-ID: <165052629892.10763.14524695513685694040@emeril.freedesktop.org>
References: <20220421065008.24682-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220421065008.24682-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Flmem=5Fswapping=3A_Add_parallel-random-verify-ccs_su?=
 =?utf-8?q?btest?=
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

--===============5448015227332958798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_lmem_swapping: Add parallel-random-verify-ccs subtest
URL   : https://patchwork.freedesktop.org/series/102909/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11530 -> IGTPW_6962
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/index.html

Participating hosts (45 -> 45)
------------------------------

  Additional (2): fi-cml-u2 fi-icl-u2 
  Missing    (2): fi-bsw-cyan fi-tgl-u2 

Known issues
------------

  Here are the changes found in IGTPW_6962 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-cml-u2:          NOTRUN -> [SKIP][1] ([i915#1208]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-cml-u2:          NOTRUN -> [INCOMPLETE][2] ([i915#5680])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-cml-u2/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-icl-u2:          NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][4] ([i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [PASS][5] -> [INCOMPLETE][6] ([i915#4418])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11530/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][7] ([fdo#111827]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-u2:          NOTRUN -> [SKIP][8] ([fdo#109278]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-icl-u2:          NOTRUN -> [SKIP][9] ([fdo#109285])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-icl-u2:          NOTRUN -> [SKIP][10] ([i915#3555])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][11] ([i915#3301])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][12] ([i915#4312])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-bdw-5557u/igt@runner@aborted.html
    - bat-dg1-6:          NOTRUN -> [FAIL][13] ([i915#4312] / [i915#5257])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/bat-dg1-6/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - {bat-rpls-2}:       [INCOMPLETE][14] ([i915#5329]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11530/bat-rpls-2/igt@i915_module_load@reload.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/bat-rpls-2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [DMESG-FAIL][16] ([i915#4494] / [i915#4957]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11530/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1208]: https://gitlab.freedesktop.org/drm/intel/issues/1208
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5329]: https://gitlab.freedesktop.org/drm/intel/issues/5329
  [i915#5338]: https://gitlab.freedesktop.org/drm/intel/issues/5338
  [i915#5401]: https://gitlab.freedesktop.org/drm/intel/issues/5401
  [i915#5414]: https://gitlab.freedesktop.org/drm/intel/issues/5414
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#5680]: https://gitlab.freedesktop.org/drm/intel/issues/5680


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6442 -> IGTPW_6962

  CI-20190529: 20190529
  CI_DRM_11530: aa020e951b9496aafe472b08f182a9635518e638 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6962: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/index.html
  IGT_6442: 891ce2ff8769675b52dcfff3cf1c91bb711ddb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_lmem_swapping@parallel-random-verify-ccs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/index.html

--===============5448015227332958798==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_lmem_swapping: Add parallel-random-verify-ccs subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102909/">https://patchwork.freedesktop.org/series/102909/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11530 -&gt; IGTPW_6962</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/index.html</p>
<h2>Participating hosts (45 -&gt; 45)</h2>
<p>Additional (2): fi-cml-u2 fi-icl-u2 <br />
  Missing    (2): fi-bsw-cyan fi-tgl-u2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6962 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1208">i915#1208</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-cml-u2/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5680">i915#5680</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11530/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/bat-dg1-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11530/bat-rpls-2/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5329">i915#5329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/bat-rpls-2/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11530/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6442 -&gt; IGTPW_6962</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11530: aa020e951b9496aafe472b08f182a9635518e638 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6962: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6962/index.html<br />
  IGT_6442: 891ce2ff8769675b52dcfff3cf1c91bb711ddb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_lmem_swapping@parallel-random-verify-ccs</p>

</body>
</html>

--===============5448015227332958798==--
