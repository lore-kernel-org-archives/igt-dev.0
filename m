Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============2391276028858474166=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 22 Feb 2022 04:18:59 -0000
Message-ID: <164550353992.23043.8596412373826269489@emeril.freedesktop.org>
References: <20220222033601.43925-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220222033601.43925-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIE5l?=
 =?utf-8?q?gative_tests_to_VRR?=
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

--===============2391276028858474166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add Negative tests to VRR
URL   : https://patchwork.freedesktop.org/series/100539/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11264 -> IGTPW_6670
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/index.html

Participating hosts (44 -> 42)
------------------------------

  Additional (2): fi-bdw-5557u fi-pnv-d510 
  Missing    (4): fi-bsw-cyan shard-rkl shard-dg1 shard-tglu 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6670:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_vrr@negative-basic} (NEW):
    - bat-dg1-6:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/bat-dg1-6/igt@kms_vrr@negative-basic.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/bat-rpls-1/igt@kms_vrr@negative-basic.html

  * {igt@kms_vrr@negative-basic@pipe-a-dp-1} (NEW):
    - fi-ilk-650:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-ilk-650/igt@kms_vrr@negative-basic@pipe-a-dp-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11264 and IGTPW_6670:

### New IGT tests (11) ###

  * igt@kms_vrr@negative-basic:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@negative-basic@pipe-a-dp-1:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.05, 0.11] s

  * igt@kms_vrr@negative-basic@pipe-a-dp-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.44] s

  * igt@kms_vrr@negative-basic@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_vrr@negative-basic@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.42] s

  * igt@kms_vrr@negative-basic@pipe-a-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.31, 0.53] s

  * igt@kms_vrr@negative-basic@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.14] s

  * igt@kms_vrr@negative-basic@pipe-a-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.07, 0.22] s

  * igt@kms_vrr@negative-basic@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_vrr@negative-basic@pipe-a-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.11] s

  * igt@kms_vrr@negative-basic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  

Known issues
------------

  Here are the changes found in IGTPW_6670 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_flink_basic@bad-flink:
    - fi-skl-6600u:       NOTRUN -> [FAIL][4] ([i915#4547])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html

  * igt@gem_huc_copy@huc-copy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][5] ([fdo#109271]) +40 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][6] -> [INCOMPLETE][7] ([i915#2940])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        NOTRUN -> [DMESG-FAIL][8] ([i915#2927])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * {igt@kms_vrr@negative-basic} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][9] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bsw-nick/igt@kms_vrr@negative-basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-kbl-guc/igt@kms_vrr@negative-basic.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][11] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bwr-2160/igt@kms_vrr@negative-basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][12] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-kbl-7567u/igt@kms_vrr@negative-basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][13] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-kbl-8809g/igt@kms_vrr@negative-basic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-elk-e7500/igt@kms_vrr@negative-basic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][15] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-blb-e6850/igt@kms_vrr@negative-basic.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][16] ([fdo#109271] / [i915#2403] / [i915#4312])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-pnv-d510/igt@runner@aborted.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][17] ([fdo#109271] / [i915#1436] / [i915#3428] / [i915#4312])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bsw-nick/igt@runner@aborted.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][18] ([i915#2426] / [i915#4312])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-skl-6600u:       [INCOMPLETE][19] ([i915#4547]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-1115g4:      [DMESG-FAIL][21] ([i915#3987]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@gt_timelines:
    - {fi-tgl-dsi}:       [INCOMPLETE][23] -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-tgl-dsi/igt@i915_selftest@live@gt_timelines.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-tgl-dsi/igt@i915_selftest@live@gt_timelines.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][25] ([i915#3303]) -> [INCOMPLETE][26] ([i915#4785])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2927]: https://gitlab.freedesktop.org/drm/intel/issues/2927
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6349 -> IGTPW_6670

  CI-20190529: 20190529
  CI_DRM_11264: 3b562232559bd940e63f977619548e5cc70da985 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6670: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/index.html
  IGT_6349: 0513032006f385f34fcd094c810b93f31cbed09d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_vrr@negative-basic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/index.html

--===============2391276028858474166==
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
<tr><td><b>Series:</b></td><td>Add Negative tests to VRR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100539/">https://patchwork.freedesktop.org/series/100539/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11264 -&gt; IGTPW_6670</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Additional (2): fi-bdw-5557u fi-pnv-d510 <br />
  Missing    (4): fi-bsw-cyan shard-rkl shard-dg1 shard-tglu </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6670:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_vrr@negative-basic} (NEW):</p>
<ul>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/bat-dg1-6/igt@kms_vrr@negative-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/bat-rpls-1/igt@kms_vrr@negative-basic.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@negative-basic@pipe-a-dp-1} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-ilk-650/igt@kms_vrr@negative-basic@pipe-a-dp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11264 and IGTPW_6670:</p>
<h3>New IGT tests (11)</h3>
<ul>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.05, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.31, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.05, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.07, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6670 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2927">i915#2927</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@negative-basic} (NEW):</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bsw-nick/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-kbl-guc/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bwr-2160/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-kbl-7567u/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-kbl-8809g/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-elk-e7500/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-blb-e6850/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#3987</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-tgl-dsi/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-tgl-dsi/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11264/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6349 -&gt; IGTPW_6670</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11264: 3b562232559bd940e63f977619548e5cc70da985 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6670: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6670/index.html<br />
  IGT_6349: 0513032006f385f34fcd094c810b93f31cbed09d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_vrr@negative-basic</p>

</body>
</html>

--===============2391276028858474166==--
