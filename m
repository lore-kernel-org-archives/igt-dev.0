Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0203192543053635671=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Mon, 16 May 2022 10:58:17 -0000
Message-ID: <165269869789.21522.8467005068859331228@emeril.freedesktop.org>
References: <20220513053615.3194-1-karthik.b.s@intel.com>
In-Reply-To: <20220513053615.3194-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdp=5Ftiled=5Fdisplay=3A_Close_fd_after_igt=5Fdisplay=5Ffi?=
 =?utf-8?b?bmkgKHJldjIp?=
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

--===============0203192543053635671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_dp_tiled_display: Close fd after igt_display_fini (rev2)
URL   : https://patchwork.freedesktop.org/series/103966/
State : success

== Summary ==

CI Bug Log - changes from IGT_6473 -> IGTPW_7105
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/index.html

Participating hosts (42 -> 40)
------------------------------

  Additional (1): bat-dg2-9 
  Missing    (3): bat-adln-1 bat-jsl-1 bat-adlp-4 

Known issues
------------

  Here are the changes found in IGTPW_7105 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#1888] / [i915#62])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][5] -> [DMESG-FAIL][6] ([i915#62])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-soraka:      [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-5:          [PASS][9] -> [INCOMPLETE][10] ([i915#4418])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-dg1-5/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@memory_region:
    - fi-cfl-8109u:       [PASS][11] -> [DMESG-WARN][12] ([i915#5904]) +11 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-cfl-8109u/igt@i915_selftest@live@memory_region.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-cfl-8109u/igt@i915_selftest@live@memory_region.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html
    - bat-dg1-6:          NOTRUN -> [SKIP][14] ([fdo#111827])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-dg1-6/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][15] ([fdo#109271]) +13 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       [PASS][16] -> [DMESG-WARN][17] ([i915#62]) +14 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#533])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@runner@aborted:
    - bat-dg1-5:          NOTRUN -> [FAIL][19] ([i915#4312] / [i915#5257])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-dg1-5/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [INCOMPLETE][20] ([i915#4418]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][22] ([i915#3576]) -> [PASS][23] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5879]: https://gitlab.freedesktop.org/drm/intel/issues/5879
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6473 -> IGTPW_7105

  CI-20190529: 20190529
  CI_DRM_11656: 416780e079b848ddd4da752cb90b619b97eb773e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7105: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/index.html
  IGT_6473: 64723cd44c1cd2f8b8263e3b3681c99f05a1b499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/index.html

--===============0203192543053635671==
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
<tr><td><b>Series:</b></td><td>tests/kms_dp_tiled_display: Close fd after igt_display_fini (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/103966/">https://patchwork.freedesktop.org/series/103966/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6473 -&gt; IGTPW_7105</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Additional (1): bat-dg2-9 <br />
  Missing    (3): bat-adln-1 bat-jsl-1 bat-adlp-4 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7105 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@memory_region:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-cfl-8109u/igt@i915_selftest@live@memory_region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-cfl-8109u/igt@i915_selftest@live@memory_region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-dg1-6/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/fi-bxt-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-dg1-5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6473/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6473 -&gt; IGTPW_7105</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11656: 416780e079b848ddd4da752cb90b619b97eb773e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7105: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7105/index.html<br />
  IGT_6473: 64723cd44c1cd2f8b8263e3b3681c99f05a1b499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0203192543053635671==--
