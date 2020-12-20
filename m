Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 20 Dec 2020 08:53:21 -0000
Message-ID: <160845440126.12071.9062561401909079714@emeril.freedesktop.org>
References: <20201220081108.331051-1-apoorva1.singh@intel.com>
In-Reply-To: <20201220081108.331051-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fasync=3A_Add_subtest_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1303601550=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1303601550==
Content-Type: multipart/alternative;
 boundary="===============5915785561880301979=="

--===============5915785561880301979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_async: Add subtest description
URL   : https://patchwork.freedesktop.org/series/85109/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9507 -> IGTPW_5315
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/index.html

Known issues
------------

  Here are the changes found in IGTPW_5315 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@vgem_basic@setversion:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-tgl-y/igt@vgem_basic@setversion.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-tgl-y/igt@vgem_basic@setversion.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-kbl-7500u:       [DMESG-WARN][3] ([i915#2605]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-kbl-7500u/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-kbl-7500u/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-apl-guc:         [DMESG-WARN][5] ([i915#1037]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-apl-guc/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-apl-guc/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@ring_submission:
    - fi-apl-guc:         [DMESG-WARN][7] ([i915#203]) -> [PASS][8] +11 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-apl-guc/igt@i915_selftest@live@ring_submission.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-apl-guc/igt@i915_selftest@live@ring_submission.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#203]: https://gitlab.freedesktop.org/drm/intel/issues/203
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (42 -> 37)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5911 -> IGTPW_5315

  CI-20190529: 20190529
  CI_DRM_9507: 8b45cf5105ca18b54f9ae4cedf665a4b5b505630 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5315: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/index.html
  IGT_5911: 101834d77ec9af97f549e2977d4d1f714c7c3047 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/index.html

--===============5915785561880301979==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_async: Add subtest description</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85109/">https://patchwork.freedesktop.org/series/85109/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9507 -&gt; IGTPW_5315</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5315 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@vgem_basic@setversion:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-tgl-y/igt@vgem_basic@setversion.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-tgl-y/igt@vgem_basic@setversion.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-kbl-7500u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-kbl-7500u/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-apl-guc/igt@i915_selftest@live@execlists.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-apl-guc/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-apl-guc/igt@i915_selftest@live@ring_submission.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/203">i915#203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-apl-guc/igt@i915_selftest@live@ring_submission.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9507/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 37)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5911 -&gt; IGTPW_5315</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9507: 8b45cf5105ca18b54f9ae4cedf665a4b5b505630 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5315: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5315/index.html<br />
  IGT_5911: 101834d77ec9af97f549e2977d4d1f714c7c3047 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5915785561880301979==--

--===============1303601550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1303601550==--
