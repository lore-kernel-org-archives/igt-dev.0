Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 27 Dec 2020 12:35:43 -0000
Message-ID: <160907254308.18723.16257041195474019155@emeril.freedesktop.org>
References: <20201227120435.371959-1-apoorva1.singh@intel.com>
In-Reply-To: <20201227120435.371959-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Freset=5Fstats=3A_Add_test_and_subtests_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0407710500=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0407710500==
Content-Type: multipart/alternative;
 boundary="===============0713843302242224496=="

--===============0713843302242224496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_reset_stats: Add test and subtests description
URL   : https://patchwork.freedesktop.org/series/85250/
State : success

== Summary ==

CI Bug Log - changes from IGT_5924 -> IGTPW_5334
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/index.html

Known issues
------------

  Here are the changes found in IGTPW_5334 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-gdg-551:         NOTRUN -> [SKIP][1] ([fdo#109271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-gdg-551/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@gem_flink_basic@bad-open:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-tgl-y/igt@gem_flink_basic@bad-open.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-tgl-y/igt@gem_flink_basic@bad-open.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][4] ([i915#2029])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_mmap_gtt@basic:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#402]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-tgl-y/igt@gem_mmap_gtt@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-tgl-y/igt@gem_mmap_gtt@basic.html

  * igt@i915_selftest@live@execlists:
    - fi-apl-guc:         [DMESG-WARN][7] ([i915#1037]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-apl-guc/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-apl-guc/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_contexts:
    - fi-apl-guc:         [DMESG-WARN][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-apl-guc/igt@i915_selftest@live@gt_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-apl-guc/igt@i915_selftest@live@gt_contexts.html

  * igt@i915_selftest@live@gt_heartbeat:
    - {fi-tgl-dsi}:       [INCOMPLETE][11] ([i915#2601]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@ring_submission:
    - fi-apl-guc:         [DMESG-WARN][13] ([i915#203]) -> [PASS][14] +24 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-apl-guc/igt@i915_selftest@live@ring_submission.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-apl-guc/igt@i915_selftest@live@ring_submission.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@i915-to-amd:
    - fi-gdg-551:         [INCOMPLETE][15] ([i915#172]) -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-gdg-551/igt@amdgpu/amd_prime@i915-to-amd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-gdg-551/igt@amdgpu/amd_prime@i915-to-amd.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#172]: https://gitlab.freedesktop.org/drm/intel/issues/172
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#203]: https://gitlab.freedesktop.org/drm/intel/issues/203
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2601]: https://gitlab.freedesktop.org/drm/intel/issues/2601
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-dg1-1 fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5924 -> IGTPW_5334

  CI-20190529: 20190529
  CI_DRM_9527: 5f4ab60f910567453058c32e806ed10cc72cd8d7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/index.html
  IGT_5924: bb9fca32214d8cba6209b0f3b82393a76b01edeb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/index.html

--===============0713843302242224496==
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
<tr><td><b>Series:</b></td><td>i915/gem_reset_stats: Add test and subtests description</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85250/">https://patchwork.freedesktop.org/series/85250/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5924 -&gt; IGTPW_5334</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5334 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>fi-gdg-551:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-gdg-551/igt@amdgpu/amd_prime@amd-to-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-open:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-tgl-y/igt@gem_flink_basic@bad-open.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-tgl-y/igt@gem_flink_basic@bad-open.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-tgl-y/igt@gem_mmap_gtt@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-tgl-y/igt@gem_mmap_gtt@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-apl-guc/igt@i915_selftest@live@execlists.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-apl-guc/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_contexts:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-apl-guc/igt@i915_selftest@live@gt_contexts.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-apl-guc/igt@i915_selftest@live@gt_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2601">i915#2601</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-apl-guc/igt@i915_selftest@live@ring_submission.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/203">i915#203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-apl-guc/igt@i915_selftest@live@ring_submission.html">PASS</a> +24 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@amdgpu/amd_prime@i915-to-amd:<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5924/fi-gdg-551/igt@amdgpu/amd_prime@i915-to-amd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/172">i915#172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/fi-gdg-551/igt@amdgpu/amd_prime@i915-to-amd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-dg1-1 fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5924 -&gt; IGTPW_5334</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9527: 5f4ab60f910567453058c32e806ed10cc72cd8d7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5334/index.html<br />
  IGT_5924: bb9fca32214d8cba6209b0f3b82393a76b01edeb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============0713843302242224496==--

--===============0407710500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0407710500==--
