Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2248691998637495548=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Tue, 28 Jun 2022 18:08:41 -0000
Message-ID: <165643972120.14503.747033940890526347@emeril.freedesktop.org>
References: <20220628134341.3363-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20220628134341.3363-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSEFYIGFk?=
 =?utf-8?q?d_description_to_gem=5Fsync_=28rev4=29?=
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

--===============2248691998637495548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: HAX add description to gem_sync (rev4)
URL   : https://patchwork.freedesktop.org/series/105661/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11820 -> IGTPW_7426
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7426 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7426, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/index.html

Participating hosts (38 -> 41)
------------------------------

  Additional (3): fi-icl-u2 bat-adls-5 bat-dg2-9 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7426:

### IGT changes ###

#### Possible regressions ####

  * igt@meta_test@fail-result (NEW):
    - fi-ilk-650:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-ilk-650/igt@meta_test@fail-result.html
    - fi-tgl-u2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-tgl-u2/igt@meta_test@fail-result.html
    - {bat-jsl-1}:        NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-jsl-1/igt@meta_test@fail-result.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bxt-dsi/igt@meta_test@fail-result.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-jsl-1/igt@meta_test@fail-result.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-blb-e6850/igt@meta_test@fail-result.html
    - {bat-adlp-6}:       NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-adlp-6/igt@meta_test@fail-result.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-skl-6600u/igt@meta_test@fail-result.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-glk-dsi/igt@meta_test@fail-result.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-ehl-2/igt@meta_test@fail-result.html
    - fi-icl-u2:          NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-icl-u2/igt@meta_test@fail-result.html
    - fi-apl-guc:         NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-apl-guc/igt@meta_test@fail-result.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-pnv-d510/igt@meta_test@fail-result.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bdw-5557u/igt@meta_test@fail-result.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-snb-2520m/igt@meta_test@fail-result.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-glk-j4005/igt@meta_test@fail-result.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-rkl-guc/igt@meta_test@fail-result.html
    - fi-skl-guc:         NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-skl-guc/igt@meta_test@fail-result.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-kbl-soraka/igt@meta_test@fail-result.html
    - bat-dg1-6:          NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-dg1-6/igt@meta_test@fail-result.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-kbl-7567u/igt@meta_test@fail-result.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-cfl-8700k/igt@meta_test@fail-result.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-tgl-dsi/igt@meta_test@fail-result.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bsw-nick/igt@meta_test@fail-result.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-hsw-g3258/igt@meta_test@fail-result.html
    - {bat-adls-5}:       NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-adls-5/igt@meta_test@fail-result.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bdw-gvtdvm/igt@meta_test@fail-result.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bsw-kefka/igt@meta_test@fail-result.html
    - fi-adl-ddr5:        NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-adl-ddr5/igt@meta_test@fail-result.html
    - {bat-dg2-9}:        NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-dg2-9/igt@meta_test@fail-result.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-hsw-4770/igt@meta_test@fail-result.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-skl-6700k2/igt@meta_test@fail-result.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-cfl-8109u/igt@meta_test@fail-result.html
    - bat-adlp-4:         NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-adlp-4/igt@meta_test@fail-result.html
    - {bat-adln-1}:       NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-adln-1/igt@meta_test@fail-result.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-kbl-8809g/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-ivb-3770/igt@meta_test@fail-result.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-elk-e7500/igt@meta_test@fail-result.html
    - {bat-dg2-8}:        NOTRUN -> [FAIL][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-dg2-8/igt@meta_test@fail-result.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-kbl-guc/igt@meta_test@fail-result.html
    - fi-snb-2600:        NOTRUN -> [FAIL][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-snb-2600/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11820 and IGTPW_7426:

### New IGT tests (1) ###

  * igt@meta_test@fail-result:
    - Statuses : 41 fail(s)
    - Exec time: [0.00, 0.25] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6549 -> IGTPW_7426

  CI-20190529: 20190529
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7426: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/index.html
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/index.html

--===============2248691998637495548==
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
<tr><td><b>Series:</b></td><td>HAX add description to gem_sync (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105661/">https://patchwork.freedesktop.org/series/105661/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11820 -&gt; IGTPW_7426</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7426 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7426, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/index.html</p>
<h2>Participating hosts (38 -&gt; 41)</h2>
<p>Additional (3): fi-icl-u2 bat-adls-5 bat-dg2-9 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7426:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-ilk-650/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-tgl-u2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bxt-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-blb-e6850/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-adlp-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-skl-6600u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-glk-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-ehl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-icl-u2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-apl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-pnv-d510/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bdw-5557u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-snb-2520m/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-glk-j4005/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-rkl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-skl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-kbl-soraka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-dg1-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-kbl-7567u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-cfl-8700k/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-tgl-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bsw-nick/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-hsw-g3258/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-adls-5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bdw-gvtdvm/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-bsw-kefka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-adl-ddr5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-dg2-9/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-hsw-4770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-skl-6700k2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-cfl-8109u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-adlp-4/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-adln-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-kbl-8809g/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-elk-e7500/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/bat-dg2-8/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-kbl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/fi-snb-2600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11820 and IGTPW_7426:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@meta_test@fail-result:<ul>
<li>Statuses : 41 fail(s)</li>
<li>Exec time: [0.00, 0.25] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6549 -&gt; IGTPW_7426</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7426: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7426/index.html<br />
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2248691998637495548==--
