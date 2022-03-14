Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4468825350632005202=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ramalingam C" <ramalingam.c@intel.com>
Date: Mon, 14 Mar 2022 06:08:43 -0000
Message-ID: <164723812365.20567.2609783342030290086@emeril.freedesktop.org>
References: <20220314051432.15785-1-ramalingam.c@intel.com>
In-Reply-To: <20220314051432.15785-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Flmem=5Fswapping=3A_Add_ccs_subtests?=
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

--===============4468825350632005202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_lmem_swapping: Add ccs subtests
URL   : https://patchwork.freedesktop.org/series/101324/
State : success

== Summary ==

CI Bug Log - changes from IGT_6379 -> IGTPW_6786
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/index.html

Participating hosts (41 -> 37)
------------------------------

  Missing    (4): fi-kbl-soraka fi-bsw-cyan fi-bdw-samus fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6786:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_lmem_swapping@basic@lmem0:
    - {bat-dg2-9}:        [PASS][1] -> [CRASH][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-engines@lmem0:
    - {bat-dg2-9}:        [FAIL][3] ([i915#5192]) -> [CRASH][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines@lmem0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines@lmem0.html

  * igt@i915_selftest@live@gt_pm:
    - {bat-rpls-2}:       [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-dg2-9}:        [FAIL][7] ([i915#5276]) -> [DMESG-FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_6786 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-bdw-5557u:       [PASS][9] -> [INCOMPLETE][10] ([i915#146])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][11] -> [INCOMPLETE][12] ([i915#3303])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][13] ([fdo#109271] / [i915#1436] / [i915#4312])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/fi-hsw-4770/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
  [i915#5192]: https://gitlab.freedesktop.org/drm/intel/issues/5192
  [i915#5276]: https://gitlab.freedesktop.org/drm/intel/issues/5276


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6379 -> IGTPW_6786

  CI-20190529: 20190529
  CI_DRM_11355: 16e4683c0a29f572cbc04ff619f6fdb703d8024e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6786: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/index.html
  IGT_6379: e6a29643dc4d7ae45efc3f25c30ef8ffac875f18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_lmem_swapping@heavy-verify-multi-ccs
+igt@gem_lmem_swapping@heavy-verify-random-ccs
+igt@gem_lmem_swapping@parallel-random-verify-ccs
+igt@gem_lmem_swapping@verify-ccs
+igt@gem_lmem_swapping@verify-random-ccs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/index.html

--===============4468825350632005202==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_lmem_swapping: Add ccs subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101324/">https://patchwork.freedesktop.org/series/101324/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6379 -&gt; IGTPW_6786</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/index.html</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): fi-kbl-soraka fi-bsw-cyan fi-bdw-samus fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6786:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines@lmem0:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5192">i915#5192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines@lmem0.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5276">i915#5276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6786 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6379/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6379 -&gt; IGTPW_6786</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11355: 16e4683c0a29f572cbc04ff619f6fdb703d8024e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6786: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6786/index.html<br />
  IGT_6379: e6a29643dc4d7ae45efc3f25c30ef8ffac875f18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_lmem_swapping@heavy-verify-multi-ccs<br />
+igt@gem_lmem_swapping@heavy-verify-random-ccs<br />
+igt@gem_lmem_swapping@parallel-random-verify-ccs<br />
+igt@gem_lmem_swapping@verify-ccs<br />
+igt@gem_lmem_swapping@verify-random-ccs</p>

</body>
</html>

--===============4468825350632005202==--
