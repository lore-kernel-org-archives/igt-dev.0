Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1570391068979641117=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Dec 2021 14:43:40 -0000
Message-ID: <164078902033.17173.13912282131244531841@emeril.freedesktop.org>
References: <20211229135742.37177-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211229135742.37177-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIHN0?=
 =?utf-8?q?art_offset_and_alignment_detection?=
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

--===============1570391068979641117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add start offset and alignment detection
URL   : https://patchwork.freedesktop.org/series/98402/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11039 -> IGTPW_6520
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/index.html

Participating hosts (42 -> 34)
------------------------------

  Missing    (8): fi-kbl-soraka bat-dg1-6 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-rpls-1 bat-jsl-2 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6520:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_softpin@safe-alignment} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-jsl-1/igt@gem_softpin@safe-alignment.html
    - fi-cml-u2:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-cml-u2/igt@gem_softpin@safe-alignment.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-tgl-dsi/igt@gem_softpin@safe-alignment.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-ehl-2/igt@gem_softpin@safe-alignment.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-rkl-11600/igt@gem_softpin@safe-alignment.html
    - fi-tgl-u2:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-tgl-u2/igt@gem_softpin@safe-alignment.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-tgl-1115g4/igt@gem_softpin@safe-alignment.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-rkl-guc/igt@gem_softpin@safe-alignment.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11039 and IGTPW_6520:

### New IGT tests (1) ###

  * igt@gem_softpin@safe-alignment:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6520 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@gem_softpin@safe-alignment} (NEW):
    - fi-kbl-8809g:       NOTRUN -> [SKIP][9] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-8809g/igt@gem_softpin@safe-alignment.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-guc/igt@gem_softpin@safe-alignment.html
    - fi-kbl-7500u:       NOTRUN -> [SKIP][11] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-7500u/igt@gem_softpin@safe-alignment.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][12] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-cfl-8109u/igt@gem_softpin@safe-alignment.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][13] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-skl-6600u/igt@gem_softpin@safe-alignment.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bwr-2160/igt@gem_softpin@safe-alignment.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][15] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bsw-kefka/igt@gem_softpin@safe-alignment.html
    - fi-apl-guc:         NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-apl-guc/igt@gem_softpin@safe-alignment.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][17] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-x1275/igt@gem_softpin@safe-alignment.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][18] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-pnv-d510/igt@gem_softpin@safe-alignment.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][19] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-snb-2520m/igt@gem_softpin@safe-alignment.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-glk-dsi/igt@gem_softpin@safe-alignment.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][21] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-blb-e6850/igt@gem_softpin@safe-alignment.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-skl-6700k2/igt@gem_softpin@safe-alignment.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][23] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-cfl-8700k/igt@gem_softpin@safe-alignment.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][24] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-elk-e7500/igt@gem_softpin@safe-alignment.html
    - fi-ilk-650:         NOTRUN -> [SKIP][25] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-ilk-650/igt@gem_softpin@safe-alignment.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][26] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-ivb-3770/igt@gem_softpin@safe-alignment.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][27] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bsw-n3050/igt@gem_softpin@safe-alignment.html
    - fi-skl-guc:         NOTRUN -> [SKIP][28] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-skl-guc/igt@gem_softpin@safe-alignment.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][29] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-7567u/igt@gem_softpin@safe-alignment.html
    - fi-snb-2600:        NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-snb-2600/igt@gem_softpin@safe-alignment.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][31] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-cfl-guc/igt@gem_softpin@safe-alignment.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][32] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-hsw-4770/igt@gem_softpin@safe-alignment.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][33] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bxt-dsi/igt@gem_softpin@safe-alignment.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [PASS][34] -> [INCOMPLETE][35] ([i915#2940])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][36] -> [INCOMPLETE][37] ([i915#4838])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@runner@aborted:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][38] ([fdo#109271] / [i915#1436] / [i915#2722] / [i915#3428] / [i915#4312])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bsw-kefka/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4838]: https://gitlab.freedesktop.org/drm/intel/issues/4838


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6321 -> IGTPW_6520

  CI-20190529: 20190529
  CI_DRM_11039: c90264924b9988493890773248bde3173a4866b4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6520: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/index.html
  IGT_6321: 85a5938090cd3da34e4fba8f541fbe240210b47d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_softpin@safe-alignment

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/index.html

--===============1570391068979641117==
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
<tr><td><b>Series:</b></td><td>Add start offset and alignment detection</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98402/">https://patchwork.freedesktop.org/series/98402/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11039 -&gt; IGTPW_6520</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/index.html</p>
<h2>Participating hosts (42 -&gt; 34)</h2>
<p>Missing    (8): fi-kbl-soraka bat-dg1-6 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-rpls-1 bat-jsl-2 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6520:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_softpin@safe-alignment} (NEW):</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-jsl-1/igt@gem_softpin@safe-alignment.html">SKIP</a></p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-cml-u2/igt@gem_softpin@safe-alignment.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-tgl-dsi/igt@gem_softpin@safe-alignment.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-ehl-2/igt@gem_softpin@safe-alignment.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-rkl-11600/igt@gem_softpin@safe-alignment.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-tgl-u2/igt@gem_softpin@safe-alignment.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-tgl-1115g4/igt@gem_softpin@safe-alignment.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-rkl-guc/igt@gem_softpin@safe-alignment.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11039 and IGTPW_6520:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_softpin@safe-alignment:<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6520 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@gem_softpin@safe-alignment} (NEW):</p>
<ul>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-8809g/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-guc/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-7500u/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-cfl-8109u/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-skl-6600u/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bwr-2160/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bsw-kefka/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-apl-guc/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-x1275/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-pnv-d510/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-snb-2520m/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-glk-dsi/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-blb-e6850/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-skl-6700k2/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-cfl-8700k/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-elk-e7500/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-ilk-650/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-ivb-3770/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bsw-n3050/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-skl-guc/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-kbl-7567u/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-snb-2600/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-cfl-guc/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-hsw-4770/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bxt-dsi/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4838">i915#4838</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/fi-bsw-kefka/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6321 -&gt; IGTPW_6520</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11039: c90264924b9988493890773248bde3173a4866b4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6520: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6520/index.html<br />
  IGT_6321: 85a5938090cd3da34e4fba8f541fbe240210b47d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_softpin@safe-alignment</p>

</body>
</html>

--===============1570391068979641117==--
