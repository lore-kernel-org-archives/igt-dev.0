Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 14 Dec 2020 04:21:41 -0000
Message-ID: <160791970181.28165.15269533194040869656@emeril.freedesktop.org>
References: <20201214035812.8224-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201214035812.8224-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkZWQg?=
 =?utf-8?q?dynamic_Subtest_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1856887272=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1856887272==
Content-Type: multipart/alternative;
 boundary="===============8140034446988427107=="

--===============8140034446988427107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Added dynamic Subtest (rev7)
URL   : https://patchwork.freedesktop.org/series/83576/
State : success

== Summary ==

CI Bug Log - changes from IGT_5892 -> IGTPW_5281
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/index.html

Known issues
------------

  Here are the changes found in IGTPW_5281 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-compute:
    - fi-elk-e7500:       NOTRUN -> [SKIP][1] ([fdo#109271]) +46 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-elk-e7500/igt@amdgpu/amd_basic@cs-compute.html

  * igt@amdgpu/amd_basic@memory-alloc:
    - fi-cml-u2:          NOTRUN -> [SKIP][2] ([fdo#109315]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@amdgpu/amd_basic@memory-alloc.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-cml-u2:          NOTRUN -> [SKIP][3] ([i915#1208]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-bsw-kefka:       [PASS][4] -> [INCOMPLETE][5] ([i915#2539])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cml-u2:          NOTRUN -> [SKIP][6] ([i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@gem_huc_copy@huc-copy.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-cml-u2:          NOTRUN -> [SKIP][7] ([i915#1004]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-cml-u2:          NOTRUN -> [SKIP][8] ([fdo#109309]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-cml-u2:          NOTRUN -> [SKIP][9] ([fdo#109285])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-cml-u2:          NOTRUN -> [SKIP][10] ([fdo#109278] / [i915#533])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@prime_vgem@basic-write:
    - fi-tgl-y:           [PASS][11] -> [DMESG-WARN][12] ([i915#402])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/fi-tgl-y/igt@prime_vgem@basic-write.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-tgl-y/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][13] ([i915#1161] / [i915#262]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [DMESG-WARN][15] ([i915#402]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1004]: https://gitlab.freedesktop.org/drm/intel/issues/1004
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1208]: https://gitlab.freedesktop.org/drm/intel/issues/1208
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2539]: https://gitlab.freedesktop.org/drm/intel/issues/2539
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (40 -> 34)
------------------------------

  Additional (2): fi-cml-u2 fi-elk-e7500 
  Missing    (8): fi-bxt-dsi fi-bdw-samus fi-bsw-n3050 fi-hsw-4200u fi-skl-guc fi-dg1-1 fi-blb-e6850 fi-skl-6700k2 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5892 -> IGTPW_5281

  CI-20190529: 20190529
  CI_DRM_9478: 94cf3a4cc350324f21728c70954c46e535405c87 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5281: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/index.html
  IGT_5892: 5c4766f5c4ca896a4c7b61645ecca2b80546dc3b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_atomic_transition@modeset-transitions
-igt@kms_atomic_transition@1x-modeset-transitions
-igt@kms_atomic_transition@1x-modeset-transitions-fencing
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@2x-modeset-transitions
-igt@kms_atomic_transition@2x-modeset-transitions-fencing
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@3x-modeset-transitions
-igt@kms_atomic_transition@3x-modeset-transitions-fencing
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@4x-modeset-transitions
-igt@kms_atomic_transition@4x-modeset-transitions-fencing
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@5x-modeset-transitions
-igt@kms_atomic_transition@5x-modeset-transitions-fencing
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@6x-modeset-transitions
-igt@kms_atomic_transition@6x-modeset-transitions-fencing
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/index.html

--===============8140034446988427107==
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
<tr><td><b>Series:</b></td><td>Added dynamic Subtest (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83576/">https://patchwork.freedesktop.org/series/83576/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5892 -&gt; IGTPW_5281</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5281 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-compute:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-elk-e7500/igt@amdgpu/amd_basic@cs-compute.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@memory-alloc:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@amdgpu/amd_basic@memory-alloc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1208">i915#1208</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2539">i915#2539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1004">i915#1004</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-cml-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/fi-tgl-y/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-tgl-y/igt@prime_vgem@basic-write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (40 -&gt; 34)</h2>
<p>Additional (2): fi-cml-u2 fi-elk-e7500 <br />
  Missing    (8): fi-bxt-dsi fi-bdw-samus fi-bsw-n3050 fi-hsw-4200u fi-skl-guc fi-dg1-1 fi-blb-e6850 fi-skl-6700k2 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5892 -&gt; IGTPW_5281</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9478: 94cf3a4cc350324f21728c70954c46e535405c87 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5281: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5281/index.html<br />
  IGT_5892: 5c4766f5c4ca896a4c7b61645ecca2b80546dc3b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_atomic_transition@modeset-transitions<br />
-igt@kms_atomic_transition@1x-modeset-transitions<br />
-igt@kms_atomic_transition@1x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@2x-modeset-transitions<br />
-igt@kms_atomic_transition@2x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@3x-modeset-transitions<br />
-igt@kms_atomic_transition@3x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@4x-modeset-transitions<br />
-igt@kms_atomic_transition@4x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@5x-modeset-transitions<br />
-igt@kms_atomic_transition@5x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@6x-modeset-transitions<br />
-igt@kms_atomic_transition@6x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing</p>

</body>
</html>

--===============8140034446988427107==--

--===============1856887272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1856887272==--
