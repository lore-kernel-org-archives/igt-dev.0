Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 29 Jul 2021 15:53:39 -0000
Message-ID: <162757401944.27326.4887070551243661583@emeril.freedesktop.org>
References: <20210729144946.351161-1-daniels@collabora.com>
In-Reply-To: <20210729144946.351161-1-daniels@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgY2k6IFVz?=
 =?utf-8?q?e_FDO=5FCI=5FCONCURRENT_to_limit_build/test_concurrency_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1899504366=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1899504366==
Content-Type: multipart/alternative;
 boundary="===============6932017821444474777=="

--===============6932017821444474777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: ci: Use FDO_CI_CONCURRENT to limit build/test concurrency (rev2)
URL   : https://patchwork.freedesktop.org/series/93189/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10418 -> IGTPW_6076
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/index.html

Known issues
------------

  Here are the changes found in IGTPW_6076 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +29 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][2] ([i915#3718])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [PASS][3] -> [FAIL][4] ([i915#1888])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10418/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][5] ([i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-bdw-5557u/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [FAIL][7] ([i915#1888]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10418/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [DMESG-FAIL][9] ([i915#165]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10418/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#3718]: https://gitlab.freedesktop.org/drm/intel/issues/3718
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (41 -> 34)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6156 -> IGTPW_6076

  CI-20190529: 20190529
  CI_DRM_10418: e8b9eb4ffe9ad59eeda3c5318282fc2d7acbe7da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6076: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/index.html
  IGT_6156: 354638455597ac48ac433606b24b82a4d7b65d20 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/index.html

--===============6932017821444474777==
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
<tr><td><b>Series:</b></td><td>ci: Use FDO_CI_CONCURRENT to limit build/test concurrency (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93189/">https://patchwork.freedesktop.org/series/93189/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10418 -&gt; IGTPW_6076</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6076 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3718">i915#3718</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10418/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-bdw-5557u/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10418/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10418/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (41 -&gt; 34)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6156 -&gt; IGTPW_6076</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10418: e8b9eb4ffe9ad59eeda3c5318282fc2d7acbe7da @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6076: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6076/index.html<br />
  IGT_6156: 354638455597ac48ac433606b24b82a4d7b65d20 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6932017821444474777==--

--===============1899504366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1899504366==--
