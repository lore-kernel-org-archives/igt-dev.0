Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Dec 2020 13:04:13 -0000
Message-ID: <160803745327.24784.12903451630568885835@emeril.freedesktop.org>
References: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/gem=5Fuserptr=5Fblits=3A?=
 =?utf-8?q?_Rework_userptr_tests_to_copy_with_changes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1307990533=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1307990533==
Content-Type: multipart/alternative;
 boundary="===============4660875252611269981=="

--===============4660875252611269981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/gem_userptr_blits: Rework userptr tests to copy with changes
URL   : https://patchwork.freedesktop.org/series/84948/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9484 -> IGTPW_5292
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html

Known issues
------------

  Here are the changes found in IGTPW_5292 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +22 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][2] ([i915#2283])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([i915#1161] / [i915#262])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_self_import@basic-with_two_bos:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([i915#402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - {fi-tgl-dsi}:       [DMESG-FAIL][7] ([i915#2601]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html

  * igt@vgem_basic@create:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/fi-tgl-y/igt@vgem_basic@create.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-tgl-y/igt@vgem_basic@create.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2601]: https://gitlab.freedesktop.org/drm/intel/issues/2601
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5901 -> IGTPW_5292

  CI-20190529: 20190529
  CI_DRM_9484: c09ec1637b1a0d1bc22f81023883bead6038a37f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5292: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html
  IGT_5901: 565d911f08df697fa211dbd1faefe2fd57066f71 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@gem_userptr_blits@map-fixed-invalidate-busy-gup
-igt@gem_userptr_blits@map-fixed-invalidate-gup
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html

--===============4660875252611269981==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/gem_userptr_blits: Rework userptr tests to copy with changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84948/">https://patchwork.freedesktop.org/series/84948/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9484 -&gt; IGTPW_5292</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5292 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_two_bos:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2601">i915#2601</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@create:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/fi-tgl-y/igt@vgem_basic@create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/fi-tgl-y/igt@vgem_basic@create.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5901 -&gt; IGTPW_5292</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9484: c09ec1637b1a0d1bc22f81023883bead6038a37f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5292: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html<br />
  IGT_5901: 565d911f08df697fa211dbd1faefe2fd57066f71 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>-igt@gem_userptr_blits@map-fixed-invalidate-busy-gup<br />
-igt@gem_userptr_blits@map-fixed-invalidate-gup<br />
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup<br />
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup</p>

</body>
</html>

--===============4660875252611269981==--

--===============1307990533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1307990533==--
