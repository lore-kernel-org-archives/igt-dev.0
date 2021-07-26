Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 26 Jul 2021 12:56:09 -0000
Message-ID: <162730416926.2616.13708741058291796967@emeril.freedesktop.org>
References: <20210726120310.1115522-1-matthew.auld@intel.com>
In-Reply-To: <20210726120310.1115522-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/7=5D_lib/i915/gem=5Fmman=3A_add_FIX?=
 =?utf-8?q?ED_mmap_mode?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1661116765=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1661116765==
Content-Type: multipart/alternative;
 boundary="===============9192394272426916640=="

--===============9192394272426916640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/7] lib/i915/gem_mman: add FIXED mmap mode
URL   : https://patchwork.freedesktop.org/series/93008/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10394 -> IGTPW_6057
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/index.html

Known issues
------------

  Here are the changes found in IGTPW_6057 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - fi-kbl-7500u:       NOTRUN -> [FAIL][1] ([i915#1814] / [i915#3363])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-kbl-7500u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][2] ([i915#1888]) -> [PASS][3] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10394/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_sync@basic-all:
    - {fi-dg1-1}:         [FAIL][4] ([i915#3717]) -> [PASS][5] +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10394/fi-dg1-1/igt@gem_sync@basic-all.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-dg1-1/igt@gem_sync@basic-all.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-jsl-1}:         [INCOMPLETE][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10394/fi-jsl-1/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-jsl-1/igt@i915_selftest@live@hangcheck.html
    - {fi-hsw-gt1}:       [DMESG-WARN][8] ([i915#3303]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10394/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3626]: https://gitlab.freedesktop.org/drm/intel/issues/3626
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717


Participating hosts (42 -> 35)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adls-4 bat-adls-3 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6150 -> IGTPW_6057

  CI-20190529: 20190529
  CI_DRM_10394: e2ddb2cf7c4ae6795fa72f072e5caac4d332cd49 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6057: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/index.html
  IGT_6150: 08c084830e1b30409df513f94ccdce84f950ced0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/index.html

--===============9192394272426916640==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/7] lib/i915/gem_mman: add FIXED mmap mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93008/">https://patchwork.freedesktop.org/series/93008/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10394 -&gt; IGTPW_6057</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6057 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10394/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-all:</p>
<ul>
<li>{fi-dg1-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10394/fi-dg1-1/igt@gem_sync@basic-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-dg1-1/igt@gem_sync@basic-all.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10394/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10394/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (42 -&gt; 35)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adls-4 bat-adls-3 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6150 -&gt; IGTPW_6057</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10394: e2ddb2cf7c4ae6795fa72f072e5caac4d332cd49 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6057: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6057/index.html<br />
  IGT_6150: 08c084830e1b30409df513f94ccdce84f950ced0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============9192394272426916640==--

--===============1661116765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1661116765==--
