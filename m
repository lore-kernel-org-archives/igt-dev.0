Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 26 Jul 2021 13:50:19 -0000
Message-ID: <162730741938.2613.9189851551999430784@emeril.freedesktop.org>
References: <20210726094938.155619-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210726094938.155619-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Handle_QUERY=5FMEMORY=5FREGIONS_on_older_kernels_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1938465382=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1938465382==
Content-Type: multipart/alternative;
 boundary="===============4312991607560365194=="

--===============4312991607560365194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915: Handle QUERY_MEMORY_REGIONS on older kernels (rev2)
URL   : https://patchwork.freedesktop.org/series/93006/
State : success

== Summary ==

CI Bug Log - changes from IGT_6151 -> IGTPW_6058
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/index.html

Known issues
------------

  Here are the changes found in IGTPW_6058 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +29 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][2] ([i915#3718])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [PASS][3] -> [FAIL][4] ([i915#1888])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
    - fi-tgl-1115g4:      [PASS][5] -> [FAIL][6] ([i915#1888])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][7] ([i915#579])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-bdw-5557u/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@gt_pm:
    - fi-icl-y:           [PASS][8] -> [DMESG-FAIL][9] ([i915#2291])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/fi-icl-y/igt@i915_selftest@live@gt_pm.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-icl-y/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][10] -> [FAIL][11] ([i915#1372])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#3718]: https://gitlab.freedesktop.org/drm/intel/issues/3718
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (39 -> 35)
------------------------------

  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6151 -> IGTPW_6058

  CI-20190529: 20190529
  CI_DRM_10394: e2ddb2cf7c4ae6795fa72f072e5caac4d332cd49 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6058: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/index.html
  IGT_6151: c3170c2d3744521b8351a4b9c579792bc9a5f835 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/index.html

--===============4312991607560365194==
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
<tr><td><b>Series:</b></td><td>lib/i915: Handle QUERY_MEMORY_REGIONS on older kernels (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93006/">https://patchwork.freedesktop.org/series/93006/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6151 -&gt; IGTPW_6058</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6058 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3718">i915#3718</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-bdw-5557u/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/fi-icl-y/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-icl-y/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 35)</h2>
<p>Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6151 -&gt; IGTPW_6058</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10394: e2ddb2cf7c4ae6795fa72f072e5caac4d332cd49 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6058: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6058/index.html<br />
  IGT_6151: c3170c2d3744521b8351a4b9c579792bc9a5f835 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4312991607560365194==--

--===============1938465382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1938465382==--
