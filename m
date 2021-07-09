Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 09 Jul 2021 04:30:17 -0000
Message-ID: <162580501711.9812.15612641324976751153@emeril.freedesktop.org>
References: <20210709114134.15025-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210709114134.15025-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_tests/kms=5Fdither=3A_New?=
 =?utf-8?q?_IGT_to_validate_crtc_Dithering?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1931702007=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1931702007==
Content-Type: multipart/alternative;
 boundary="===============6909678637332440661=="

--===============6909678637332440661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/kms_dither: New IGT to validate crtc Dithering
URL   : https://patchwork.freedesktop.org/series/92349/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10320 -> IGTPW_6002
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6002:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-tgl-dsi/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a.html

  * {igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a} (NEW):
    - {fi-ehl-2}:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-ehl-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-jsl-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10320 and IGTPW_6002:

### New IGT tests (20) ###

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-1-pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.08, 0.22] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-2-pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.48] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-3-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a:
    - Statuses : 3 skip(s)
    - Exec time: [0.10, 0.44] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dvi-d-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a:
    - Statuses : 8 pass(s)
    - Exec time: [1.36, 2.10] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@lvds-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a:
    - Statuses : 4 skip(s)
    - Exec time: [0.05, 0.12] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-1-pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.22] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-2-pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.47] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-3-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dsi-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [0.10, 0.47] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dvi-d-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [1.41, 2.08] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.13] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-2-pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.12] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@lvds-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.29] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@vga-1-pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [0.04, 0.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_6002 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-soraka:      [PASS][4] -> [INCOMPLETE][5] ([i915#155])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10320/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       [PASS][6] -> [INCOMPLETE][7] ([i915#146] / [i915#198])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10320/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc} (NEW):
    - fi-kbl-8809g:       NOTRUN -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-kbl-8809g/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][9] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-kbl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bsw-nick/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][11] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bdw-5557u/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-kbl-7567u/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][13] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-cfl-8700k/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-elk-e7500/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - {fi-dg1-1}:         NOTRUN -> [SKIP][15] ([i915#3717])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-dg1-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-cfl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a} (NEW):
    - fi-glk-dsi:         NOTRUN -> [SKIP][17] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-glk-dsi/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][18] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bxt-dsi/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a.html

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@dvi-d-1-pipe-a} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][19] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bwr-2160/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dvi-d-1-pipe-a.html

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-ivb-3770/igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a.html
    - fi-ilk-650:         NOTRUN -> [SKIP][21] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-ilk-650/igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-pnv-d510/igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][23] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-hsw-4770/igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a.html

  * {igt@kms_dither@fb-8bpc-vs-panel-8bpc} (NEW):
    - {fi-hsw-gt1}:       NOTRUN -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-hsw-gt1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * {igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a} (NEW):
    - fi-bsw-kefka:       NOTRUN -> [SKIP][25] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bsw-kefka/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  * {igt@kms_dither@fb-8bpc-vs-panel-8bpc@lvds-1-pipe-a} (NEW):
    - fi-snb-2520m:       NOTRUN -> [SKIP][26] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-snb-2520m/igt@kms_dither@fb-8bpc-vs-panel-8bpc@lvds-1-pipe-a.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#198]: https://gitlab.freedesktop.org/drm/intel/issues/198
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717


Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6132 -> IGTPW_6002

  CI-20190529: 20190529
  CI_DRM_10320: 7d61ab4a59bcbb206324b6a430748b4c15dd8adb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6002: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/index.html
  IGT_6132: 61fb9cdf2a9132e3618c8b08b9d20fec0c347831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_dither@fb-8bpc-vs-panel-6bpc
+igt@kms_dither@fb-8bpc-vs-panel-8bpc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/index.html

--===============6909678637332440661==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/kms_dither: New IGT to validate crtc Dithering</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92349/">https://patchwork.freedesktop.org/series/92349/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10320 -&gt; IGTPW_6002</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6002:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-tgl-dsi/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a} (NEW):</p>
<ul>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-ehl-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-jsl-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10320 and IGTPW_6002:</p>
<h3>New IGT tests (20)</h3>
<ul>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.08, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-2-pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-3-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.10, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@dvi-d-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.36, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@lvds-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.05, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-2-pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-3-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@dsi-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.10, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@dvi-d-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [1.41, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@lvds-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.04, 0.12] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6002 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10320/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10320/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/198">i915#198</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc} (NEW):</p>
<ul>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-kbl-8809g/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-kbl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bsw-nick/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bdw-5557u/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-kbl-7567u/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-cfl-8700k/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-elk-e7500/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>{fi-dg1-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-dg1-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-cfl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a} (NEW):</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-glk-dsi/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bxt-dsi/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dsi-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@dvi-d-1-pipe-a} (NEW):</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bwr-2160/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dvi-d-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a} (NEW):</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-ivb-3770/igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-ilk-650/igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-pnv-d510/igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-hsw-4770/igt@kms_dither@fb-8bpc-vs-panel-6bpc@vga-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-8bpc} (NEW):</p>
<ul>
<li>{fi-hsw-gt1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-hsw-gt1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a} (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-bsw-kefka/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-8bpc@lvds-1-pipe-a} (NEW):</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/fi-snb-2520m/igt@kms_dither@fb-8bpc-vs-panel-8bpc@lvds-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): fi-bsw-cyan </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6132 -&gt; IGTPW_6002</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10320: 7d61ab4a59bcbb206324b6a430748b4c15dd8adb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6002: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6002/index.html<br />
  IGT_6132: 61fb9cdf2a9132e3618c8b08b9d20fec0c347831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_dither@fb-8bpc-vs-panel-6bpc<br />
+igt@kms_dither@fb-8bpc-vs-panel-8bpc</p>

</body>
</html>

--===============6909678637332440661==--

--===============1931702007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1931702007==--
