Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0476596401040114327=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Sat, 12 Nov 2022 06:51:14 -0000
Message-ID: <166823587456.14830.4945143583574628966@emeril.freedesktop.org>
References: <20221112060714.1084199-1-vikas.srivastava@intel.com>
In-Reply-To: <20221112060714.1084199-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Ffence=3A_Replacing_custom_spinner_with_igt=5F?=
 =?utf-8?q?spin_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0476596401040114327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_fence: Replacing custom spinner with igt_spin (rev2)
URL   : https://patchwork.freedesktop.org/series/110735/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12372 -> IGTPW_8091
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (2): fi-ctg-p8600 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_8091 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_engines:
    - fi-rkl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#4418])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +43 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@runner@aborted:
    - fi-rkl-guc:         NOTRUN -> [FAIL][4] ([i915#4312])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-rkl-guc/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-glk-j4005:       [SKIP][5] ([fdo#109271]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-glk-j4005/igt@gem_exec_fence@basic-busy@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-glk-j4005/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-bxt-dsi:         [SKIP][7] ([fdo#109271]) -> [PASS][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-bxt-dsi/igt@gem_exec_fence@basic-busy@bcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-bxt-dsi/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-skl-6700k2:      [SKIP][9] ([fdo#109271]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-skl-6700k2/igt@gem_exec_fence@basic-busy@bcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-skl-6700k2/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-cfl-8109u:       [SKIP][11] ([fdo#109271]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@bcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-kbl-7567u:       [SKIP][13] ([fdo#109271]) -> [PASS][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@bcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_fence@basic-wait@bcs0:
    - fi-cfl-guc:         [SKIP][15] ([fdo#109271]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-cfl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-cfl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
    - {bat-kbl-2}:        [SKIP][17] ([fdo#109271]) -> [PASS][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/bat-kbl-2/igt@gem_exec_fence@basic-wait@bcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/bat-kbl-2/igt@gem_exec_fence@basic-wait@bcs0.html
    - fi-skl-6600u:       [SKIP][19] ([fdo#109271]) -> [PASS][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-skl-6600u/igt@gem_exec_fence@basic-wait@bcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-skl-6600u/igt@gem_exec_fence@basic-wait@bcs0.html
    - fi-apl-guc:         [SKIP][21] ([fdo#109271]) -> [PASS][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-apl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-apl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
    - fi-skl-guc:         [SKIP][23] ([fdo#109271]) -> [PASS][24] +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-skl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-skl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
    - fi-cfl-8700k:       [SKIP][25] ([fdo#109271]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-cfl-8700k/igt@gem_exec_fence@basic-wait@bcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-cfl-8700k/igt@gem_exec_fence@basic-wait@bcs0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rplp-1}:       [DMESG-WARN][27] ([i915#2867]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@hugepages:
    - {bat-rpls-2}:       [DMESG-WARN][29] ([i915#5278]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/bat-rpls-2/igt@i915_selftest@live@hugepages.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/bat-rpls-2/igt@i915_selftest@live@hugepages.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6949]: https://gitlab.freedesktop.org/drm/intel/issues/6949
  [i915#7058]: https://gitlab.freedesktop.org/drm/intel/issues/7058
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7051 -> IGTPW_8091

  CI-20190529: 20190529
  CI_DRM_12372: 2cc304afd4967ceffd14940ff73a8beb31778f90 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8091: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/index.html
  IGT_7051: 7da9f813cdacb80d4471fc6ddb493bae9c46913d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/index.html

--===============0476596401040114327==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_fence: Replacing custom spinner with igt_spin (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110735/">https://patchwork.freedesktop.org/series/110735/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12372 -&gt; IGTPW_8091</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (2): fi-ctg-p8600 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8091 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-rkl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-glk-j4005/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-glk-j4005/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-bxt-dsi/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-bxt-dsi/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-skl-6700k2/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-skl-6700k2/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-cfl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-cfl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>{bat-kbl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/bat-kbl-2/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/bat-kbl-2/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-skl-6600u/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-skl-6600u/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-apl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-apl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-skl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-skl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/fi-cfl-8700k/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/fi-cfl-8700k/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12372/bat-rpls-2/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5278">i915#5278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/bat-rpls-2/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7051 -&gt; IGTPW_8091</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12372: 2cc304afd4967ceffd14940ff73a8beb31778f90 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8091: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8091/index.html<br />
  IGT_7051: 7da9f813cdacb80d4471fc6ddb493bae9c46913d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0476596401040114327==--
