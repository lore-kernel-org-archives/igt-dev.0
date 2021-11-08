Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5972425965287630312=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 08 Nov 2021 06:10:50 -0000
Message-ID: <163635185022.32038.524943413488773689@emeril.freedesktop.org>
References: <20211108052836.374567-1-ananya.sharma@intel.com>
In-Reply-To: <20211108052836.374567-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_MPO_subtest-_mixing_pixel_formats_and_t?=
 =?utf-8?q?iling_on_different_planes=2E?=
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
To: Ananya Sharma <ananya.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============5972425965287630312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc: MPO subtest- mixing pixel formats and tiling on different planes.
URL   : https://patchwork.freedesktop.org/series/96647/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10853 -> IGTPW_6379
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/index.html

Participating hosts (41 -> 36)
------------------------------

  Additional (1): fi-bdw-samus 
  Missing    (6): bat-dg1-6 fi-bsw-n3050 bat-dg1-5 fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 

Known issues
------------

  Here are the changes found in IGTPW_6379 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@userptr:
    - fi-pnv-d510:        [PASS][1] -> [INCOMPLETE][2] ([i915#299])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10853/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html

  * igt@i915_module_load@reload:
    - fi-tgl-1115g4:      [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10853/fi-tgl-1115g4/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-tgl-1115g4/igt@i915_module_load@reload.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-bdw-samus:       NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-bdw-samus/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-bdw-samus:       NOTRUN -> [SKIP][6] ([fdo#109271]) +29 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-bdw-samus/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][7] ([i915#2403] / [i915#4312])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-u2:          [INCOMPLETE][8] ([i915#4006]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10853/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][10] ([i915#4269]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10853/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#4006]: https://gitlab.freedesktop.org/drm/intel/issues/4006
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6274 -> IGTPW_6379

  CI-20190529: 20190529
  CI_DRM_10853: 215295e7b0a3deb2015c6d6b343b319e4f6d9a1d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6379: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/index.html
  IGT_6274: 569de51145fba197a8d93b2417348d47507bf485 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/index.html

--===============5972425965287630312==
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
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc: MPO subtest- mixing pixel formats and tiling on different planes.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96647/">https://patchwork.freedesktop.org/series/96647/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10853 -&gt; IGTPW_6379</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/index.html</p>
<h2>Participating hosts (41 -&gt; 36)</h2>
<p>Additional (1): fi-bdw-samus <br />
  Missing    (6): bat-dg1-6 fi-bsw-n3050 bat-dg1-5 fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6379 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10853/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10853/fi-tgl-1115g4/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-tgl-1115g4/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-bdw-samus:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-bdw-samus/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-bdw-samus:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-bdw-samus/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10853/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4006">i915#4006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10853/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6274 -&gt; IGTPW_6379</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10853: 215295e7b0a3deb2015c6d6b343b319e4f6d9a1d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6379: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6379/index.html<br />
  IGT_6274: 569de51145fba197a8d93b2417348d47507bf485 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5972425965287630312==--
