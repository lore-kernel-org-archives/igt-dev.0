Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3147953942798321129=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Fri, 18 Nov 2022 08:59:43 -0000
Message-ID: <166876198356.25644.14514760492673571435@emeril.freedesktop.org>
References: <20221118073111.1688105-1-vikas.srivastava@intel.com>
In-Reply-To: <20221118073111.1688105-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Ffence=3A_Replacing_custom_spinner_with_igt=5F?=
 =?utf-8?q?spin_=28rev3=29?=
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

--===============3147953942798321129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_fence: Replacing custom spinner with igt_spin (rev3)
URL   : https://patchwork.freedesktop.org/series/110735/
State : success

== Summary ==

CI Bug Log - changes from IGT_7067 -> IGTPW_8127
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): fi-ctg-p8600 fi-ilk-m540 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_8127 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       [PASS][1] -> [INCOMPLETE][2] ([i915#6179])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-rkl-guc:         [PASS][3] -> [INCOMPLETE][4] ([i915#4983])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][5] -> [FAIL][6] ([fdo#103375])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-glk-j4005:       [SKIP][7] ([fdo#109271]) -> [PASS][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-glk-j4005/igt@gem_exec_fence@basic-busy@bcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-glk-j4005/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-bxt-dsi:         [SKIP][9] ([fdo#109271]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-bxt-dsi/igt@gem_exec_fence@basic-busy@bcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-bxt-dsi/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-skl-6700k2:      [SKIP][11] ([fdo#109271]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-skl-6700k2/igt@gem_exec_fence@basic-busy@bcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-skl-6700k2/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-cfl-8109u:       [SKIP][13] ([fdo#109271]) -> [PASS][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@bcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-kbl-7567u:       [SKIP][15] ([fdo#109271]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@bcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_fence@basic-wait@bcs0:
    - fi-kbl-x1275:       [SKIP][17] ([fdo#109271]) -> [PASS][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-kbl-x1275/igt@gem_exec_fence@basic-wait@bcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-kbl-x1275/igt@gem_exec_fence@basic-wait@bcs0.html
    - fi-skl-6600u:       [SKIP][19] ([fdo#109271]) -> [PASS][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-skl-6600u/igt@gem_exec_fence@basic-wait@bcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-skl-6600u/igt@gem_exec_fence@basic-wait@bcs0.html
    - fi-apl-guc:         [SKIP][21] ([fdo#109271]) -> [PASS][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-apl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-apl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
    - fi-skl-guc:         [SKIP][23] ([fdo#109271]) -> [PASS][24] +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-skl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-skl-guc/igt@gem_exec_fence@basic-wait@bcs0.html
    - fi-cfl-8700k:       [SKIP][25] ([fdo#109271]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-cfl-8700k/igt@gem_exec_fence@basic-wait@bcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-cfl-8700k/igt@gem_exec_fence@basic-wait@bcs0.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:
    - {bat-dg2-11}:       [FAIL][27] ([i915#7336]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6179]: https://gitlab.freedesktop.org/drm/intel/issues/6179
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6856]: https://gitlab.freedesktop.org/drm/intel/issues/6856
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7125]: https://gitlab.freedesktop.org/drm/intel/issues/7125
  [i915#7336]: https://gitlab.freedesktop.org/drm/intel/issues/7336
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7067 -> IGTPW_8127

  CI-20190529: 20190529
  CI_DRM_12397: a9ef9d744f7292d5bc02fc19734e1156a240ead6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8127: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/index.html
  IGT_7067: 856f71209f60ef0caccb836984642cc19ea96445 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/index.html

--===============3147953942798321129==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_fence: Replacing custom spinner with igt_spin (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110735/">https://patchwork.freedesktop.org/series/110735/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7067 -&gt; IGTPW_8127</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): fi-ctg-p8600 fi-ilk-m540 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8127 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6179">i915#6179</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-glk-j4005/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-glk-j4005/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-bxt-dsi/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-bxt-dsi/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-skl-6700k2/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-skl-6700k2/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-kbl-x1275/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-kbl-x1275/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-skl-6600u/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-skl-6600u/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-apl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-apl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-skl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-skl-guc/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/fi-cfl-8700k/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/fi-cfl-8700k/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7067/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7336">i915#7336</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7067 -&gt; IGTPW_8127</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12397: a9ef9d744f7292d5bc02fc19734e1156a240ead6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8127: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8127/index.html<br />
  IGT_7067: 856f71209f60ef0caccb836984642cc19ea96445 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3147953942798321129==--
