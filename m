Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0539733743698230109=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Date: Mon, 11 Apr 2022 14:57:32 -0000
Message-ID: <164968905261.2973.8054484726303907277@emeril.freedesktop.org>
References: <20220411072801.15097-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20220411072801.15097-1-Arunpravin.PaneerSelvam@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?drm=5Fbuddy=3A_Add_drm_buddy_test_cases?=
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

--===============0539733743698230109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/drm_buddy: Add drm buddy test cases
URL   : https://patchwork.freedesktop.org/series/102469/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11481 -> IGTPW_6912
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html

Participating hosts (48 -> 44)
------------------------------

  Additional (2): fi-pnv-d510 bat-dg1-5 
  Missing    (6): shard-tglu fi-bsw-cyan fi-icl-u2 shard-rkl shard-dg1 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6912:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@gt_pm:
    - {fi-tgl-dsi}:       [DMESG-FAIL][1] ([i915#1759]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11481/fi-tgl-dsi/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-tgl-dsi/igt@i915_selftest@live@gt_pm.html

  
Known issues
------------

  Here are the changes found in IGTPW_6912 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +57 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#5341])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][5] ([fdo#109271] / [i915#2722] / [i915#4312] / [i915#5594])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-hsw-4770/igt@runner@aborted.html
    - bat-dg1-5:          NOTRUN -> [FAIL][6] ([i915#5616])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/bat-dg1-5/igt@runner@aborted.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][7] ([i915#4312])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-bdw-5557u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#5616]: https://gitlab.freedesktop.org/drm/intel/issues/5616
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6415 -> IGTPW_6912

  CI-20190529: 20190529
  CI_DRM_11481: 9bf68eb47288411da23ce5c9967f27dba43bda1d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6912: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@drm_buddy@all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html

--===============0539733743698230109==
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
<tr><td><b>Series:</b></td><td>tests/drm_buddy: Add drm buddy test cases</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102469/">https://patchwork.freedesktop.org/series/102469/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11481 -&gt; IGTPW_6912</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html</p>
<h2>Participating hosts (48 -&gt; 44)</h2>
<p>Additional (2): fi-pnv-d510 bat-dg1-5 <br />
  Missing    (6): shard-tglu fi-bsw-cyan fi-icl-u2 shard-rkl shard-dg1 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6912:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@gt_pm:<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11481/fi-tgl-dsi/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1759">i915#1759</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-tgl-dsi/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6912 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/bat-dg1-5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5616">i915#5616</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6415 -&gt; IGTPW_6912</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11481: 9bf68eb47288411da23ce5c9967f27dba43bda1d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6912: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html<br />
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@drm_buddy@all</p>

</body>
</html>

--===============0539733743698230109==--
