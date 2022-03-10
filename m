Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4460151995266241601=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Zhang" <dingchen.zhang@amd.com>
Date: Thu, 10 Mar 2022 23:24:47 -0000
Message-ID: <164695468785.17008.14314128578490665097@emeril.freedesktop.org>
References: <20220310223046.578910-1-dingchen.zhang@amd.com>
In-Reply-To: <20220310223046.578910-1-dingchen.zhang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUFNSLVNV?=
 =?utf-8?q?_MPO_case_test?=
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

--===============4460151995266241601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PSR-SU MPO case test
URL   : https://patchwork.freedesktop.org/series/101250/
State : success

== Summary ==

CI Bug Log - changes from IGT_6375 -> IGTPW_6775
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/index.html

Participating hosts (45 -> 41)
------------------------------

  Additional (2): bat-rpls-2 fi-cfl-8700k 
  Missing    (6): fi-hsw-4200u fi-bsw-cyan fi-icl-u2 fi-ctg-p8600 fi-pnv-d510 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6775:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - {bat-dg2-9}:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  
Known issues
------------

  Here are the changes found in IGTPW_6775 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-multi-fence:
    - fi-blb-e6850:       NOTRUN -> [SKIP][3] ([fdo#109271]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-blb-e6850/igt@amdgpu/amd_basic@cs-multi-fence.html

  * igt@amdgpu/amd_cs_nop@sync-fork-gfx0:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][4] ([fdo#109271]) +29 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-bdw-5557u:       [PASS][5] -> [INCOMPLETE][6] ([i915#146])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#2190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#4613]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#533])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][11] ([i915#4528]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-blb-e6850/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [DMESG-FAIL][13] ([i915#4957]) -> [DMESG-FAIL][14] ([i915#4494] / [i915#4957])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          [DMESG-FAIL][15] ([i915#4957]) -> [DMESG-FAIL][16] ([i915#4494] / [i915#4957])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6375 -> IGTPW_6775

  CI-20190529: 20190529
  CI_DRM_11349: 47cea122bb4617b37f3974d066b9bea91b5c6581 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6775: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/index.html
  IGT_6375: aa6eb64bac510b7d617436997171bfe388943d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@amdgpu/amd_psr@psr_su_mpo

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/index.html

--===============4460151995266241601==
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
<tr><td><b>Series:</b></td><td>PSR-SU MPO case test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101250/">https://patchwork.freedesktop.org/series/101250/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6375 -&gt; IGTPW_6775</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/index.html</p>
<h2>Participating hosts (45 -&gt; 41)</h2>
<p>Additional (2): bat-rpls-2 fi-cfl-8700k <br />
  Missing    (6): fi-hsw-4200u fi-bsw-cyan fi-icl-u2 fi-ctg-p8600 fi-pnv-d510 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6775:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6775 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-multi-fence:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-blb-e6850/igt@amdgpu/amd_basic@cs-multi-fence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-gfx0:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6375/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6375 -&gt; IGTPW_6775</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11349: 47cea122bb4617b37f3974d066b9bea91b5c6581 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6775: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6775/index.html<br />
  IGT_6375: aa6eb64bac510b7d617436997171bfe388943d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@amdgpu/amd_psr@psr_su_mpo</p>

</body>
</html>

--===============4460151995266241601==--
