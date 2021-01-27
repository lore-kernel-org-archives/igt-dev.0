Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 27 Jan 2021 13:16:28 -0000
Message-ID: <161175338889.11911.7764612818480561774@emeril.freedesktop.org>
References: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/gem=5Fuserptr=5Fblits=3A?=
 =?utf-8?q?_Rework_userptr_tests_to_copy_with_changes_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1546069944=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1546069944==
Content-Type: multipart/alternative;
 boundary="===============6652916536409576250=="

--===============6652916536409576250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/gem_userptr_blits: Rework userptr tests to copy with changes (rev3)
URL   : https://patchwork.freedesktop.org/series/84948/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9687 -> IGTPW_5435
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/index.html

Known issues
------------

  Here are the changes found in IGTPW_5435 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +26 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][2] ([i915#2283])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#2411] / [i915#402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9687/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-tgl-y:           [PASS][6] -> [DMESG-WARN][7] ([i915#402]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9687/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-icl-u2:          [FAIL][8] ([i915#1161] / [i915#262]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9687/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_vgem@basic-gtt:
    - fi-tgl-y:           [DMESG-WARN][10] ([i915#402]) -> [PASS][11] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9687/fi-tgl-y/igt@prime_vgem@basic-gtt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-tgl-y/igt@prime_vgem@basic-gtt.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (45 -> 38)
------------------------------

  Missing    (7): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5974 -> IGTPW_5435

  CI-20190529: 20190529
  CI_DRM_9687: 7b5229b02338bfb24c3db4e76abb328d1e9cf8f1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5435: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/index.html
  IGT_5974: a85398dcae50930c0e27548cf8c9575ad0bf69d1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@gem_userptr_blits@map-fixed-invalidate-busy-gup
-igt@gem_userptr_blits@map-fixed-invalidate-gup
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/index.html

--===============6652916536409576250==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/gem_userptr_blits: Rework userptr tests to copy with changes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84948/">https://patchwork.freedesktop.org/series/84948/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9687 -&gt; IGTPW_5435</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5435 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9687/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9687/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9687/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9687/fi-tgl-y/igt@prime_vgem@basic-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/fi-tgl-y/igt@prime_vgem@basic-gtt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (45 -&gt; 38)</h2>
<p>Missing    (7): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5974 -&gt; IGTPW_5435</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9687: 7b5229b02338bfb24c3db4e76abb328d1e9cf8f1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5435: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5435/index.html<br />
  IGT_5974: a85398dcae50930c0e27548cf8c9575ad0bf69d1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>-igt@gem_userptr_blits@map-fixed-invalidate-busy-gup<br />
-igt@gem_userptr_blits@map-fixed-invalidate-gup<br />
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup<br />
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup</p>

</body>
</html>

--===============6652916536409576250==--

--===============1546069944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1546069944==--
