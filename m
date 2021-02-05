Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 05 Feb 2021 08:26:44 -0000
Message-ID: <161251360420.1862.5016158589963951810@emeril.freedesktop.org>
References: <20210205074515.286343-1-mika.kahola@intel.com>
In-Reply-To: <20210205074515.286343-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Flowres=3A_Use_highest_and_lowest_resolution_for_t?=
 =?utf-8?q?esting_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0292773423=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0292773423==
Content-Type: multipart/alternative;
 boundary="===============6273585005094016488=="

--===============6273585005094016488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_lowres: Use highest and lowest resolution for testing (rev2)
URL   : https://patchwork.freedesktop.org/series/86698/
State : success

== Summary ==

CI Bug Log - changes from IGT_5992 -> IGTPW_5483
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/index.html

Known issues
------------

  Here are the changes found in IGTPW_5483 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][1] ([fdo#109271]) +28 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-skl-6700k2/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html

  * igt@i915_hangman@error-state-basic:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#402]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-tgl-y/igt@i915_hangman@error-state-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-tgl-y/igt@i915_hangman@error-state-basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#533])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-skl-6700k2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-skl-6700k2:      [DMESG-WARN][6] ([i915#1602]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-skl-6700k2/igt@gem_exec_suspend@basic-s0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-skl-6700k2/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [DMESG-WARN][8] ([i915#2411] / [i915#402]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-icl-u2:          [FAIL][10] ([i915#1161] / [i915#262]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [DMESG-WARN][12] ([i915#402]) -> [PASS][13] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-jsl-1 fi-ilk-m540 fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5992 -> IGTPW_5483

  CI-20190529: 20190529
  CI_DRM_9735: 186ea69ad1d026d004fbd64457fb576ab86556eb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5483: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/index.html
  IGT_5992: b781a32b06a0173a71b4e1ac30d18dd7164a67c4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/index.html

--===============6273585005094016488==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_lowres: Use highest and lowest resolution for testing (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86698/">https://patchwork.freedesktop.org/series/86698/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5992 -&gt; IGTPW_5483</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5483 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-skl-6700k2/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-tgl-y/igt@i915_hangman@error-state-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-tgl-y/igt@i915_hangman@error-state-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-skl-6700k2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-skl-6700k2/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-skl-6700k2/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5992/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-jsl-1 fi-ilk-m540 fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5992 -&gt; IGTPW_5483</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9735: 186ea69ad1d026d004fbd64457fb576ab86556eb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5483: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5483/index.html<br />
  IGT_5992: b781a32b06a0173a71b4e1ac30d18dd7164a67c4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============6273585005094016488==--

--===============0292773423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0292773423==--
