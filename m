Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============2259516146175028789=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: apoorva1.singh@intel.com
Date: Mon, 21 Feb 2022 07:52:48 -0000
Message-ID: <164542996840.21415.8860528718859968576@emeril.freedesktop.org>
References: <20220221072459.4423-1-apoorva1.singh@intel.com>
In-Reply-To: <20220221072459.4423-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fcreate=3A_Added_test_description_for_test_case_=28re?=
 =?utf-8?b?djQp?=
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

--===============2259516146175028789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_create: Added test description for test case (rev4)
URL   : https://patchwork.freedesktop.org/series/82544/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11262 -> IGTPW_6659
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/index.html

Participating hosts (44 -> 41)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (4): fi-bsw-cyan shard-rkl shard-dg1 shard-tglu 

Known issues
------------

  Here are the changes found in IGTPW_6659 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-hsw-4770:        NOTRUN -> [SKIP][1] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@fork-compute0:
    - fi-rkl-guc:         NOTRUN -> [SKIP][2] ([fdo#109315]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-rkl-guc/igt@amdgpu/amd_cs_nop@fork-compute0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       NOTRUN -> [INCOMPLETE][3] ([i915#4547])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([fdo#109271]) +57 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@gtt:
    - fi-bdw-5557u:       NOTRUN -> [DMESG-FAIL][5] ([i915#3674])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-bdw-5557u/igt@i915_selftest@live@gtt.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [PASS][6] -> [DMESG-FAIL][7] ([i915#4494] / [i915#4957])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][8] ([i915#3921])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [PASS][9] -> [INCOMPLETE][10] ([i915#3921])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_psr@cursor_plane_move:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][12] ([fdo#109271]) +13 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][13] ([i915#3303]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - fi-rkl-guc:         [INCOMPLETE][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][17] ([i915#4269]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [DMESG-FAIL][19] ([i915#4494] / [i915#4957]) -> [DMESG-FAIL][20] ([i915#4957])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][21] ([i915#4312]) -> [FAIL][22] ([i915#2722] / [i915#4312])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-skl-6600u/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-skl-6600u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3674]: https://gitlab.freedesktop.org/drm/intel/issues/3674
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4898]: https://gitlab.freedesktop.org/drm/intel/issues/4898
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6348 -> IGTPW_6659

  CI-20190529: 20190529
  CI_DRM_11262: bdd4b6e5826af317a1cf144ca75ff9902ec89a60 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6659: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/index.html
  IGT_6348: 9cb64a757d2ff1e180b1648e611439d94afd697d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/index.html

--===============2259516146175028789==
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
<tr><td><b>Series:</b></td><td>i915/gem_ctx_create: Added test description for test case (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82544/">https://patchwork.freedesktop.org/series/82544/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11262 -&gt; IGTPW_6659</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/index.html</p>
<h2>Participating hosts (44 -&gt; 41)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (4): fi-bsw-cyan shard-rkl shard-dg1 shard-tglu </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6659 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-compute0:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-rkl-guc/igt@amdgpu/amd_cs_nop@fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3674">i915#3674</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11262/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6348 -&gt; IGTPW_6659</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11262: bdd4b6e5826af317a1cf144ca75ff9902ec89a60 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6659: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6659/index.html<br />
  IGT_6348: 9cb64a757d2ff1e180b1648e611439d94afd697d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2259516146175028789==--
