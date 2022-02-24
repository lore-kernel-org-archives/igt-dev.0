Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7798980671995584389=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 24 Feb 2022 09:27:22 -0000
Message-ID: <164569484204.32674.2838159430012629803@emeril.freedesktop.org>
References: <20220224051648.91470-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220224051648.91470-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIE5l?=
 =?utf-8?q?gative_tests_to_VRR_=28rev4=29?=
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

--===============7798980671995584389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add Negative tests to VRR (rev4)
URL   : https://patchwork.freedesktop.org/series/100539/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11277 -> IGTPW_6697
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/index.html

Participating hosts (45 -> 35)
------------------------------

  Missing    (10): fi-bdw-samus bat-dg1-6 bat-dg1-5 bat-dg2-8 fi-bsw-cyan bat-adlp-6 fi-kbl-8809g bat-rpls-2 bat-jsl-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6697:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-tgl-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11277 and IGTPW_6697:

### New IGT tests (22) ###

  * igt@kms_vrr@negative-basic:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@negative-basic@pipe-a-dp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.14] s

  * igt@kms_vrr@negative-basic@pipe-a-dp-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.44] s

  * igt@kms_vrr@negative-basic@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_vrr@negative-basic@pipe-a-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.12, 0.45] s

  * igt@kms_vrr@negative-basic@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.32, 0.56] s

  * igt@kms_vrr@negative-basic@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.14] s

  * igt@kms_vrr@negative-basic@pipe-a-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.07, 0.24] s

  * igt@kms_vrr@negative-basic@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_vrr@negative-basic@pipe-a-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@kms_vrr@negative-basic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_vrr@parse-vrr-range:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.17] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dp-2:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.31, 0.58] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.18] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.05, 0.21] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-vga-1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@parse-vrr-range@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  

Known issues
------------

  Here are the changes found in IGTPW_6697 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@fork-compute0:
    - fi-ivb-3770:        NOTRUN -> [SKIP][2] ([fdo#109271]) +18 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-ivb-3770/igt@amdgpu/amd_cs_nop@fork-compute0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-skl-6600u:       [PASS][3] -> [INCOMPLETE][4] ([i915#4547])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11277/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][5] -> [INCOMPLETE][6] ([i915#3921])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11277/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * {igt@kms_vrr@negative-basic} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][7] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-bsw-nick/igt@kms_vrr@negative-basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-kbl-guc/igt@kms_vrr@negative-basic.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][9] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-bwr-2160/igt@kms_vrr@negative-basic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-elk-e7500/igt@kms_vrr@negative-basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][11] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-pnv-d510/igt@kms_vrr@negative-basic.html

  * {igt@kms_vrr@parse-vrr-range} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-blb-e6850/igt@kms_vrr@parse-vrr-range.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][13] ([fdo#109271]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-kbl-7567u/igt@kms_vrr@parse-vrr-range.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-dp-2} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-skl-guc/igt@kms_vrr@parse-vrr-range@pipe-a-dp-2.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][15] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-skl-6700k2/igt@kms_vrr@parse-vrr-range@pipe-a-dp-2.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1} (NEW):
    - fi-bxt-dsi:         NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-bxt-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][17] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-glk-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1} (NEW):
    - fi-snb-2520m:       NOTRUN -> [SKIP][18] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-snb-2520m/igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-vga-1} (NEW):
    - fi-snb-2600:        NOTRUN -> [SKIP][19] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-snb-2600/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html
    - fi-ilk-650:         NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-ilk-650/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-ivb-3770:        [INCOMPLETE][21] ([i915#3303]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11277/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][23] ([i915#4269]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11277/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6355 -> IGTPW_6697

  CI-20190529: 20190529
  CI_DRM_11277: a9d1ffee8dbe2c5506cccf9077eab8fe439eea46 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6697: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/index.html
  IGT_6355: 83ec34916bd8268bc331105cf77c4d3d3cd352be @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_vrr@negative-basic
+igt@kms_vrr@parse-vrr-range

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/index.html

--===============7798980671995584389==
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
<tr><td><b>Series:</b></td><td>Add Negative tests to VRR (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100539/">https://patchwork.freedesktop.org/series/100539/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11277 -&gt; IGTPW_6697</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/index.html</p>
<h2>Participating hosts (45 -&gt; 35)</h2>
<p>Missing    (10): fi-bdw-samus bat-dg1-6 bat-dg1-5 bat-dg2-8 fi-bsw-cyan bat-adlp-6 fi-kbl-8809g bat-rpls-2 bat-jsl-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6697:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1} (NEW):<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-tgl-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11277 and IGTPW_6697:</p>
<h3>New IGT tests (22)</h3>
<ul>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.05, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.12, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.32, 0.56] s</li>
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
<li>Exec time: [0.07, 0.24] s</li>
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
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.31, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.05, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6697 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-compute0:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-ivb-3770/igt@amdgpu/amd_cs_nop@fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11277/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11277/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@negative-basic} (NEW):</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-bsw-nick/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-kbl-guc/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-bwr-2160/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-elk-e7500/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-pnv-d510/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-blb-e6850/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-kbl-7567u/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-dp-2} (NEW):</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-skl-guc/igt@kms_vrr@parse-vrr-range@pipe-a-dp-2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-skl-6700k2/igt@kms_vrr@parse-vrr-range@pipe-a-dp-2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1} (NEW):</p>
<ul>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-bxt-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-glk-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1} (NEW):</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-snb-2520m/igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-vga-1} (NEW):</p>
<ul>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-snb-2600/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-ilk-650/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11277/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11277/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6355 -&gt; IGTPW_6697</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11277: a9d1ffee8dbe2c5506cccf9077eab8fe439eea46 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6697: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6697/index.html<br />
  IGT_6355: 83ec34916bd8268bc331105cf77c4d3d3cd352be @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_vrr@negative-basic<br />
+igt@kms_vrr@parse-vrr-range</p>

</body>
</html>

--===============7798980671995584389==--
