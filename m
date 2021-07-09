Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 09 Jul 2021 09:23:37 -0000
Message-ID: <162582261737.9812.922918775916264735@emeril.freedesktop.org>
References: <20210709155946.28982-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210709155946.28982-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5BV2=2C1/2=5D_tests/kms=5Fdither=3A_New_IGT_to_?=
 =?utf-8?q?validate_crtc_Dithering?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0258013063=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0258013063==
Content-Type: multipart/alternative;
 boundary="===============1176834477476580344=="

--===============1176834477476580344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [V2,1/2] tests/kms_dither: New IGT to validate crtc Dithering
URL   : https://patchwork.freedesktop.org/series/92353/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10322 -> IGTPW_6004
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6004:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a} (NEW):
    - fi-cml-s:           NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-cml-s/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a.html

  * {igt@kms_dither@fb-8bpc-vs-panel-8bpc} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-tgl-dsi/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * {igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a} (NEW):
    - {fi-ehl-2}:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-ehl-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-jsl-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10322 and IGTPW_6004:

### New IGT tests (14) ###

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - Statuses : 14 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-1-pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.09, 0.25] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-2-pipe-a:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.00, 0.45] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-3-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a:
    - Statuses : 10 pass(s)
    - Exec time: [1.40, 2.20] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a:
    - Statuses : 4 skip(s)
    - Exec time: [0.00] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a:
    - Statuses : 4 skip(s)
    - Exec time: [0.00] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - Statuses : 14 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-1-pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.25] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-2-pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.44] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-3-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - Statuses : 7 pass(s) 3 skip(s)
    - Exec time: [1.40, 2.19] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-2-pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_6004 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc} (NEW):
    - fi-glk-dsi:         NOTRUN -> [SKIP][5] ([fdo#109271]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-glk-dsi/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][6] ([fdo#109271]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-kbl-8809g/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][7] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-kbl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bsw-nick/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][9] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bwr-2160/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-kbl-7567u/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-2-pipe-a} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][11] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-skl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-2-pipe-a.html

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][12] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-cfl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][13] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-cfl-8700k/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a.html

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a} (NEW):
    - {fi-dg1-1}:         NOTRUN -> [SKIP][14] ([i915#3717])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-dg1-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][15] ([fdo#109271]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-skl-6700k2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bdw-5557u/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a.html

  * {igt@kms_dither@fb-8bpc-vs-panel-8bpc} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][17] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-elk-e7500/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-ivb-3770/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
    - {fi-hsw-gt1}:       NOTRUN -> [SKIP][19] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-hsw-gt1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-pnv-d510/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][21] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-hsw-4770/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bxt-dsi/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][23] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-snb-2520m/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * {igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a} (NEW):
    - fi-bsw-kefka:       NOTRUN -> [SKIP][24] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bsw-kefka/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  
#### Possible fixes ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][25] ([i915#1372]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10322/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717


Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6132 -> IGTPW_6004

  CI-20190529: 20190529
  CI_DRM_10322: 8a67be6c4c77ea37207a93eb19bfc3e9f3561df6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6004: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/index.html
  IGT_6132: 61fb9cdf2a9132e3618c8b08b9d20fec0c347831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_dither@fb-8bpc-vs-panel-6bpc
+igt@kms_dither@fb-8bpc-vs-panel-8bpc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/index.html

--===============1176834477476580344==
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
<tr><td><b>Series:</b></td><td>series starting with [V2,1/2] tests/kms_dither: New IGT to validate crtc Dithering</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92353/">https://patchwork.freedesktop.org/series/92353/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10322 -&gt; IGTPW_6004</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6004:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a} (NEW):</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-cml-s/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-8bpc} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-tgl-dsi/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a} (NEW):</p>
<ul>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-ehl-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-jsl-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10322 and IGTPW_6004:</p>
<h3>New IGT tests (14)</h3>
<ul>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>Statuses : 14 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.09, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-2-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 0.45] s</li>
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
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [1.40, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>Statuses : 14 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-2-pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-3-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s) 3 skip(s)</li>
<li>Exec time: [1.40, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.12] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6004 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc} (NEW):</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-glk-dsi/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-kbl-8809g/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-kbl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bsw-nick/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bwr-2160/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-kbl-7567u/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-2-pipe-a} (NEW):</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-skl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-2-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a} (NEW):</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-cfl-guc/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-cfl-8700k/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a} (NEW):</p>
<ul>
<li>
<p>{fi-dg1-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-dg1-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-skl-6700k2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bdw-5557u/igt@kms_dither@fb-8bpc-vs-panel-6bpc@hdmi-a-2-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-8bpc} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-elk-e7500/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-ivb-3770/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>{fi-hsw-gt1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-hsw-gt1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-pnv-d510/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-hsw-4770/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bxt-dsi/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-snb-2520m/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a} (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-bsw-kefka/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium@dp-crc-fast:<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10322/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
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
<li>IGT: IGT_6132 -&gt; IGTPW_6004</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10322: 8a67be6c4c77ea37207a93eb19bfc3e9f3561df6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6004: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6004/index.html<br />
  IGT_6132: 61fb9cdf2a9132e3618c8b08b9d20fec0c347831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_dither@fb-8bpc-vs-panel-6bpc<br />
+igt@kms_dither@fb-8bpc-vs-panel-8bpc</p>

</body>
</html>

--===============1176834477476580344==--

--===============0258013063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0258013063==--
