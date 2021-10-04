Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3695103223304948377=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 Oct 2021 12:59:17 -0000
Message-ID: <163335235736.1480.12624923251860186916@emeril.freedesktop.org>
References: <20211004054056.24346-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211004054056.24346-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ2xlYW4g?=
 =?utf-8?q?buffer_and_bo_size_in_intel=5Fbuf?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3695103223304948377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Clean buffer and bo size in intel_buf
URL   : https://patchwork.freedesktop.org/series/95388/
State : success

== Summary ==

CI Bug Log - changes from IGT_6229 -> IGTPW_6277
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/index.html

Known issues
------------

  Here are the changes found in IGTPW_6277 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@nop-compute0:
    - fi-ilk-650:         NOTRUN -> [SKIP][1] ([fdo#109271]) +35 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-samus:       NOTRUN -> [WARN][3] ([i915#3718])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-bdw-samus/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-ilk-650:         NOTRUN -> [SKIP][4] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-bdw-samus:       NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-bdw-samus/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-bdw-samus:       NOTRUN -> [SKIP][6] ([fdo#109271]) +29 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-bdw-samus/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271]) +48 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@userptr:
    - fi-pnv-d510:        [INCOMPLETE][8] ([i915#299]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bdw-samus:       [INCOMPLETE][10] ([i915#146] / [i915#4173]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-bdw-samus/igt@gem_exec_suspend@basic-s3.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-bdw-samus/igt@gem_exec_suspend@basic-s3.html
    - fi-tgl-1115g4:      [FAIL][12] ([i915#1888]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][14] ([i915#3921]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-7500u:       [FAIL][16] ([i915#3449]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][18] ([i915#95]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#3449]: https://gitlab.freedesktop.org/drm/intel/issues/3449
  [i915#3718]: https://gitlab.freedesktop.org/drm/intel/issues/3718
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4173]: https://gitlab.freedesktop.org/drm/intel/issues/4173
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (33 -> 33)
------------------------------

  Additional (1): fi-ilk-650 
  Missing    (1): fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6229 -> IGTPW_6277

  CI-20190529: 20190529
  CI_DRM_10681: fe9b639a95a08713c8ee4ef110ce6a6388c9f9f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6277: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/index.html
  IGT_6229: dff598c339a2da647f15c86d0015e16378c7ea9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/index.html

--===============3695103223304948377==
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
<tr><td><b>Series:</b></td><td>Clean buffer and bo size in intel_buf</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95388/">https://patchwork.freedesktop.org/series/95388/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6229 -&gt; IGTPW_6277</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6277 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-compute0:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-samus:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-bdw-samus/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3718">i915#3718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-bdw-samus:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-bdw-samus/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-bdw-samus:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-bdw-samus/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>fi-bdw-samus:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-bdw-samus/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4173">i915#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-bdw-samus/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3449">i915#3449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (33 -&gt; 33)</h2>
<p>Additional (1): fi-ilk-650 <br />
  Missing    (1): fi-bsw-cyan </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6229 -&gt; IGTPW_6277</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10681: fe9b639a95a08713c8ee4ef110ce6a6388c9f9f2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6277: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6277/index.html<br />
  IGT_6229: dff598c339a2da647f15c86d0015e16378c7ea9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3695103223304948377==--
