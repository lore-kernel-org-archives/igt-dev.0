Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 12 Jan 2021 02:52:53 -0000
Message-ID: <161041997345.1918.9395678905512366212@emeril.freedesktop.org>
References: <20210112015726.2785-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210112015726.2785-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fsuspend=3A_Fix_cached/uncached_test_names?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1456539274=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1456539274==
Content-Type: multipart/alternative;
 boundary="===============0277240909301347543=="

--===============0277240909301347543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_suspend: Fix cached/uncached test names
URL   : https://patchwork.freedesktop.org/series/85728/
State : success

== Summary ==

CI Bug Log - changes from IGT_5955 -> IGTPW_5381
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/index.html

Known issues
------------

  Here are the changes found in IGTPW_5381 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@fork-gfx0:
    - fi-tgl-y:           NOTRUN -> [SKIP][1] ([fdo#109315] / [i915#2575]) +14 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-tgl-y/igt@amdgpu/amd_cs_nop@fork-gfx0.html

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_selftest@live@blt:
    - fi-snb-2600:        [PASS][4] -> [DMESG-FAIL][5] ([i915#1409])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-snb-2600/igt@i915_selftest@live@blt.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-snb-2600/igt@i915_selftest@live@blt.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][6] -> [FAIL][7] ([i915#1161] / [i915#262])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_store@basic:
    - fi-tgl-y:           [DMESG-WARN][8] ([i915#402]) -> [PASS][9] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-tgl-y/igt@gem_exec_store@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-tgl-y/igt@gem_exec_store@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][10] ([i915#1888]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1409]: https://gitlab.freedesktop.org/drm/intel/issues/1409
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (44 -> 37)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-cml-drallion fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5955 -> IGTPW_5381

  CI-20190529: 20190529
  CI_DRM_9585: ce8ee6513f0f9d00ea44e1c4b7aff8b4883cda13 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5381: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/index.html
  IGT_5955: 4ad3fdae02ad6e6147a96e3c05438be043426266 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_suspend@cached
+igt@gem_exec_suspend@cached-s3
+igt@gem_exec_suspend@cached-s4
+igt@gem_exec_suspend@uncached
+igt@gem_exec_suspend@uncached-s3
+igt@gem_exec_suspend@uncached-s4
-igt@gem_exec_suspend@cached-
-igt@gem_exec_suspend@cached--s3
-igt@gem_exec_suspend@cached--s4
-igt@gem_exec_suspend@uncached-
-igt@gem_exec_suspend@uncached--s3
-igt@gem_exec_suspend@uncached--s4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/index.html

--===============0277240909301347543==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_suspend: Fix cached/uncached test names</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85728/">https://patchwork.freedesktop.org/series/85728/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5955 -&gt; IGTPW_5381</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5381 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-gfx0:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-tgl-y/igt@amdgpu/amd_cs_nop@fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@blt:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-snb-2600/igt@i915_selftest@live@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-snb-2600/igt@i915_selftest@live@blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1409">i915#1409</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-tgl-y/igt@gem_exec_store@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-tgl-y/igt@gem_exec_store@basic.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5955/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (44 -&gt; 37)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-cml-drallion fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5955 -&gt; IGTPW_5381</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9585: ce8ee6513f0f9d00ea44e1c4b7aff8b4883cda13 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5381: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5381/index.html<br />
  IGT_5955: 4ad3fdae02ad6e6147a96e3c05438be043426266 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_suspend@cached<br />
+igt@gem_exec_suspend@cached-s3<br />
+igt@gem_exec_suspend@cached-s4<br />
+igt@gem_exec_suspend@uncached<br />
+igt@gem_exec_suspend@uncached-s3<br />
+igt@gem_exec_suspend@uncached-s4<br />
-igt@gem_exec_suspend@cached-<br />
-igt@gem_exec_suspend@cached--s3<br />
-igt@gem_exec_suspend@cached--s4<br />
-igt@gem_exec_suspend@uncached-<br />
-igt@gem_exec_suspend@uncached--s3<br />
-igt@gem_exec_suspend@uncached--s4</p>

</body>
</html>

--===============0277240909301347543==--

--===============1456539274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1456539274==--
