Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 08 May 2021 09:23:31 -0000
Message-ID: <162046581129.3597.7844504560716328507@emeril.freedesktop.org>
References: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IG1v?=
 =?utf-8?q?de_selection_for_2x_tests_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1790987131=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1790987131==
Content-Type: multipart/alternative;
 boundary="===============2991854229694959533=="

--===============2991854229694959533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix mode selection for 2x tests (rev5)
URL   : https://patchwork.freedesktop.org/series/88902/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10060 -> IGTPW_5795
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/index.html

Known issues
------------

  Here are the changes found in IGTPW_5795 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@fork-gfx0:
    - fi-tgl-y:           NOTRUN -> [SKIP][1] ([fdo#109315] / [i915#2575]) +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/fi-tgl-y/igt@amdgpu/amd_cs_nop@fork-gfx0.html

  * igt@i915_module_load@reload:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#1982] / [k.org#205379])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10060/fi-tgl-y/igt@i915_module_load@reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/fi-tgl-y/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][4] -> [INCOMPLETE][5] ([i915#2782] / [i915#2940])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10060/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][6] ([i915#1436])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/fi-bsw-nick/igt@runner@aborted.html

  
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (42 -> 38)
------------------------------

  Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-tgl-u2 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6081 -> IGTPW_5795

  CI-20190529: 20190529
  CI_DRM_10060: ca1f02fd329bec1a62fc515647b1fd2ecc6b7aac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5795: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/index.html
  IGT_6081: fdff4bba7abf9cb7c8ea21abf14e36d344ebb8c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/index.html

--===============2991854229694959533==
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
<tr><td><b>Series:</b></td><td>Fix mode selection for 2x tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88902/">https://patchwork.freedesktop.org/series/88902/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10060 -&gt; IGTPW_5795</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5795 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-gfx0:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/fi-tgl-y/igt@amdgpu/amd_cs_nop@fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10060/fi-tgl-y/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/fi-tgl-y/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10060/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-tgl-u2 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6081 -&gt; IGTPW_5795</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10060: ca1f02fd329bec1a62fc515647b1fd2ecc6b7aac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5795: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5795/index.html<br />
  IGT_6081: fdff4bba7abf9cb7c8ea21abf14e36d344ebb8c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============2991854229694959533==--

--===============1790987131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1790987131==--
