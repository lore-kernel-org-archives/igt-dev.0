Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8177845791986801467=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Mon, 30 May 2022 07:02:17 -0000
Message-ID: <165389413777.17900.4466159013559324042@emeril.freedesktop.org>
References: <20220530064012.1027500-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20220530064012.1027500-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSEFYIGFk?=
 =?utf-8?q?d_test_description_for_gem=5Frender=5Ftiled=5Fblits?=
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

--===============8177845791986801467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: HAX add test description for gem_render_tiled_blits
URL   : https://patchwork.freedesktop.org/series/104491/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6496 -> IGTPW_7183
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7183 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7183, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/index.html

Participating hosts (47 -> 46)
------------------------------

  Additional (1): bat-dg2-9 
  Missing    (2): bat-atsm-1 bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7183:

### IGT changes ###

#### Possible regressions ####

  * igt@meta_test@fail-result (NEW):
    - {bat-jsl-2}:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-jsl-2/igt@meta_test@fail-result.html
    - fi-ilk-650:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-ilk-650/igt@meta_test@fail-result.html
    - fi-tgl-u2:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-tgl-u2/igt@meta_test@fail-result.html
    - {bat-jsl-1}:        NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-jsl-1/igt@meta_test@fail-result.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-tgl-1115g4/igt@meta_test@fail-result.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bxt-dsi/igt@meta_test@fail-result.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-jsl-1/igt@meta_test@fail-result.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-blb-e6850/igt@meta_test@fail-result.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bsw-n3050/igt@meta_test@fail-result.html
    - {bat-adlp-6}:       NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-adlp-6/igt@meta_test@fail-result.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-skl-6600u/igt@meta_test@fail-result.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-glk-dsi/igt@meta_test@fail-result.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-ehl-2/igt@meta_test@fail-result.html
    - fi-apl-guc:         NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-apl-guc/igt@meta_test@fail-result.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-pnv-d510/igt@meta_test@fail-result.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bdw-5557u/igt@meta_test@fail-result.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-snb-2520m/igt@meta_test@fail-result.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-glk-j4005/igt@meta_test@fail-result.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-rkl-guc/igt@meta_test@fail-result.html
    - fi-skl-guc:         NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-skl-guc/igt@meta_test@fail-result.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-kbl-soraka/igt@meta_test@fail-result.html
    - bat-dg1-6:          NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-dg1-6/igt@meta_test@fail-result.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-kbl-7567u/igt@meta_test@fail-result.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-cfl-8700k/igt@meta_test@fail-result.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-tgl-dsi/igt@meta_test@fail-result.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bsw-nick/igt@meta_test@fail-result.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-rkl-11600/igt@meta_test@fail-result.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-hsw-g3258/igt@meta_test@fail-result.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bdw-gvtdvm/igt@meta_test@fail-result.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bsw-kefka/igt@meta_test@fail-result.html
    - fi-adl-ddr5:        NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-adl-ddr5/igt@meta_test@fail-result.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-cfl-guc/igt@meta_test@fail-result.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bwr-2160/igt@meta_test@fail-result.html
    - {bat-dg2-9}:        NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-dg2-9/igt@meta_test@fail-result.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-hsw-4770/igt@meta_test@fail-result.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-skl-6700k2/igt@meta_test@fail-result.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-cfl-8109u/igt@meta_test@fail-result.html
    - bat-adlp-4:         NOTRUN -> [FAIL][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-adlp-4/igt@meta_test@fail-result.html
    - {bat-adln-1}:       NOTRUN -> [FAIL][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-adln-1/igt@meta_test@fail-result.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-kbl-8809g/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-ivb-3770/igt@meta_test@fail-result.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-elk-e7500/igt@meta_test@fail-result.html
    - {bat-dg2-8}:        NOTRUN -> [FAIL][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-dg2-8/igt@meta_test@fail-result.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-kbl-guc/igt@meta_test@fail-result.html
    - fi-snb-2600:        NOTRUN -> [FAIL][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-snb-2600/igt@meta_test@fail-result.html
    - {bat-adlm-1}:       NOTRUN -> [FAIL][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-adlm-1/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between IGT_6496 and IGTPW_7183:

### New IGT tests (1) ###

  * igt@meta_test@fail-result:
    - Statuses : 46 fail(s)
    - Exec time: [0.00, 0.37] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6496 -> IGTPW_7183

  CI-20190529: 20190529
  CI_DRM_11705: 18a2e6dbca526f996da04741cf5ef169e810a50e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7183: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/index.html
  IGT_6496: 58a5a2d5be19b916311541401aaa48b787f9a185 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/index.html

--===============8177845791986801467==
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
<tr><td><b>Series:</b></td><td>HAX add test description for gem_render_tiled_blits</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104491/">https://patchwork.freedesktop.org/series/104491/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6496 -&gt; IGTPW_7183</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7183 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7183, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/index.html</p>
<h2>Participating hosts (47 -&gt; 46)</h2>
<p>Additional (1): bat-dg2-9 <br />
  Missing    (2): bat-atsm-1 bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7183:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>{bat-jsl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-jsl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-ilk-650/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-tgl-u2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-tgl-1115g4/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bxt-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-blb-e6850/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bsw-n3050/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-adlp-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-skl-6600u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-glk-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-ehl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-apl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-pnv-d510/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bdw-5557u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-snb-2520m/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-glk-j4005/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-rkl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-skl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-kbl-soraka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-dg1-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-kbl-7567u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-cfl-8700k/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-tgl-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bsw-nick/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-rkl-11600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-hsw-g3258/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bdw-gvtdvm/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bsw-kefka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-adl-ddr5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-cfl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-bwr-2160/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-dg2-9/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-hsw-4770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-skl-6700k2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-cfl-8109u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-adlp-4/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-adln-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-kbl-8809g/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-elk-e7500/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-dg2-8/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-kbl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/fi-snb-2600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/bat-adlm-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6496 and IGTPW_7183:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@meta_test@fail-result:<ul>
<li>Statuses : 46 fail(s)</li>
<li>Exec time: [0.00, 0.37] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6496 -&gt; IGTPW_7183</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11705: 18a2e6dbca526f996da04741cf5ef169e810a50e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7183: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7183/index.html<br />
  IGT_6496: 58a5a2d5be19b916311541401aaa48b787f9a185 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8177845791986801467==--
