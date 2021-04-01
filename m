Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 01 Apr 2021 17:24:33 -0000
Message-ID: <161729787344.12178.997803184202799137@emeril.freedesktop.org>
References: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5BRFC=2Ci-g-t=2C1/6=5D_tests/core=5Fhotunplug?=
 =?utf-8?q?=3A_Add_=27GEM_context=27_variants?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0522381548=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0522381548==
Content-Type: multipart/alternative;
 boundary="===============4854120184901265256=="

--===============4854120184901265256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [RFC,i-g-t,1/6] tests/core_hotunplug: Add 'GEM context' variants
URL   : https://patchwork.freedesktop.org/series/88666/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9923 -> IGTPW_5687
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/index.html

Known issues
------------

  Here are the changes found in IGTPW_5687 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-icl-y:           NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/fi-icl-y/igt@amdgpu/amd_basic@semaphore.html

  * igt@prime_self_import@basic-with_one_bo:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9923/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-y:           [INCOMPLETE][4] ([i915#2782]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9923/fi-icl-y/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/fi-icl-y/igt@i915_selftest@live@hangcheck.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [DMESG-WARN][6] ([i915#402]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9923/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (47 -> 41)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6056 -> IGTPW_5687

  CI-20190529: 20190529
  CI_DRM_9923: 393640bea31c5d35f268c3d3e6bf77fe0dff2bb8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5687: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/index.html
  IGT_6056: 84e6a7e19ccc7fafc46f372e756cad9d4aa093f7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@core_hotunplug@ctx-hotunbind-lateclose
+igt@core_hotunplug@ctx-hotunplug-lateclose
+igt@core_hotunplug@gem-hotunbind-lateclose
+igt@core_hotunplug@gem-hotunplug-lateclose
+igt@core_hotunplug@prime-hotunbind-lateclose
+igt@core_hotunplug@prime-hotunplug-lateclose
+igt@core_hotunplug@spin-hotunbind-lateclose
+igt@core_hotunplug@spin-hotunplug-lateclose
+igt@core_hotunplug@userptr-hotunbind-lateclose
+igt@core_hotunplug@userptr-hotunplug-lateclose
+igt@core_hotunplug@vm-hotunbind-lateclose
+igt@core_hotunplug@vm-hotunplug-lateclose

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/index.html

--===============4854120184901265256==
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
<tr><td><b>Series:</b></td><td>series starting with [RFC,i-g-t,1/6] tests/core_hotunplug: Add &#39;GEM context&#39; variants</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88666/">https://patchwork.freedesktop.org/series/88666/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9923 -&gt; IGTPW_5687</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5687 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/fi-icl-y/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9923/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9923/fi-icl-y/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/fi-icl-y/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9923/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (47 -&gt; 41)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6056 -&gt; IGTPW_5687</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9923: 393640bea31c5d35f268c3d3e6bf77fe0dff2bb8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5687: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5687/index.html<br />
  IGT_6056: 84e6a7e19ccc7fafc46f372e756cad9d4aa093f7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@core_hotunplug@ctx-hotunbind-lateclose<br />
+igt@core_hotunplug@ctx-hotunplug-lateclose<br />
+igt@core_hotunplug@gem-hotunbind-lateclose<br />
+igt@core_hotunplug@gem-hotunplug-lateclose<br />
+igt@core_hotunplug@prime-hotunbind-lateclose<br />
+igt@core_hotunplug@prime-hotunplug-lateclose<br />
+igt@core_hotunplug@spin-hotunbind-lateclose<br />
+igt@core_hotunplug@spin-hotunplug-lateclose<br />
+igt@core_hotunplug@userptr-hotunbind-lateclose<br />
+igt@core_hotunplug@userptr-hotunplug-lateclose<br />
+igt@core_hotunplug@vm-hotunbind-lateclose<br />
+igt@core_hotunplug@vm-hotunplug-lateclose</p>

</body>
</html>

--===============4854120184901265256==--

--===============0522381548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0522381548==--
