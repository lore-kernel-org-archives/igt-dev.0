Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3003968710466213469=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Aug 2021 12:38:16 -0000
Message-ID: <162937669667.746.12620168400413651122@emeril.freedesktop.org>
References: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4ZXMg?=
 =?utf-8?q?for_some_kms-related_DG1_tests?=
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
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3003968710466213469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fixes for some kms-related DG1 tests
URL   : https://patchwork.freedesktop.org/series/93823/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10498 -> IGTPW_6139
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/index.html

Known issues
------------

  Here are the changes found in IGTPW_6139 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-gfx0:
    - fi-rkl-11600:       NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@amdgpu/amd_cs_nop@sync-gfx0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][3] ([i915#3282])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] ([i915#3012])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-rkl-11600:       NOTRUN -> [SKIP][5] ([fdo#111827]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-bsw-n3050/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-rkl-11600:       NOTRUN -> [SKIP][7] ([fdo#109285])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-rkl-11600:       NOTRUN -> [SKIP][8] ([i915#533])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][9] ([fdo#109271]) +42 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-bsw-n3050/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-rkl-11600:       NOTRUN -> [SKIP][10] ([i915#1072]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@kms_psr@primary_mmap_gtt.html

  * igt@prime_vgem@basic-userptr:
    - fi-rkl-11600:       NOTRUN -> [SKIP][11] ([i915#3301])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@basic-write:
    - fi-rkl-11600:       NOTRUN -> [SKIP][12] ([i915#3291]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@prime_vgem@basic-write.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][13] ([i915#1602] / [i915#2029])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gtt:
    - {fi-tgl-dsi}:       [DMESG-WARN][14] -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10498/fi-tgl-dsi/igt@i915_selftest@live@gtt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-tgl-dsi/igt@i915_selftest@live@gtt.html

  * igt@i915_selftest@live@perf:
    - {fi-tgl-dsi}:       [DMESG-WARN][16] ([i915#2867]) -> [PASS][17] +6 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10498/fi-tgl-dsi/igt@i915_selftest@live@perf.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-tgl-dsi/igt@i915_selftest@live@perf.html

  * igt@kms_addfb_basic@invalid-get-prop-any:
    - {fi-dg1-1}:         [WARN][18] ([i915#3717]) -> [PASS][19] +6 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10498/fi-dg1-1/igt@kms_addfb_basic@invalid-get-prop-any.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-dg1-1/igt@kms_addfb_basic@invalid-get-prop-any.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (35 -> 35)
------------------------------

  Additional (2): fi-rkl-11600 fi-bsw-n3050 
  Missing    (2): fi-tgl-1115g4 fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6178 -> IGTPW_6139

  CI-20190529: 20190529
  CI_DRM_10498: b66f2ed13db3f8f7bcf616cea0e59ebe8728b131 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6139: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/index.html
  IGT_6178: 146260200f9a6d4536e48a195e2ab49a07d4f0c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/index.html

--===============3003968710466213469==
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
<tr><td><b>Series:</b></td><td>Fixes for some kms-related DG1 tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93823/">https://patchwork.freedesktop.org/series/93823/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10498 -&gt; IGTPW_6139</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6139 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-gfx0:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@amdgpu/amd_cs_nop@sync-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-bsw-n3050/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-bsw-n3050/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-rkl-11600/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10498/fi-tgl-dsi/igt@i915_selftest@live@gtt.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-tgl-dsi/igt@i915_selftest@live@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10498/fi-tgl-dsi/igt@i915_selftest@live@perf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-tgl-dsi/igt@i915_selftest@live@perf.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop-any:</p>
<ul>
<li>{fi-dg1-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10498/fi-dg1-1/igt@kms_addfb_basic@invalid-get-prop-any.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/fi-dg1-1/igt@kms_addfb_basic@invalid-get-prop-any.html">PASS</a> +6 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (35 -&gt; 35)</h2>
<p>Additional (2): fi-rkl-11600 fi-bsw-n3050 <br />
  Missing    (2): fi-tgl-1115g4 fi-bsw-cyan </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6178 -&gt; IGTPW_6139</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10498: b66f2ed13db3f8f7bcf616cea0e59ebe8728b131 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6139: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6139/index.html<br />
  IGT_6178: 146260200f9a6d4536e48a195e2ab49a07d4f0c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3003968710466213469==--
