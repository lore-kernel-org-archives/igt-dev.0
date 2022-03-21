Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4118006445221892240=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Mon, 21 Mar 2022 15:04:09 -0000
Message-ID: <164787504978.18159.1982793666116611774@emeril.freedesktop.org>
References: <20220321131205.267500-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20220321131205.267500-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSEFYIGFk?=
 =?utf-8?q?d_description_to_prime=5Fself=5Fimport?=
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

--===============4118006445221892240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: HAX add description to prime_self_import
URL   : https://patchwork.freedesktop.org/series/101586/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11390 -> IGTPW_6805
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6805 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6805, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/index.html

Participating hosts (47 -> 34)
------------------------------

  Additional (1): fi-hsw-g3258 
  Missing    (14): fi-bdw-samus shard-tglu bat-dg1-6 fi-hsw-4200u bat-dg2-8 shard-rkl bat-dg2-9 fi-bsw-cyan bat-adlp-6 fi-ctg-p8600 bat-rpls-1 bat-rpls-2 bat-jsl-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6805:

### IGT changes ###

#### Possible regressions ####

  * igt@meta_test@fail-result (NEW):
    - {fi-adl-ddr5}:      NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-adl-ddr5/igt@meta_test@fail-result.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-jsl-1/igt@meta_test@fail-result.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-cfl-8700k/igt@meta_test@fail-result.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-tgl-dsi/igt@meta_test@fail-result.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-snb-2520m/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-ivb-3770/igt@meta_test@fail-result.html
    - fi-apl-guc:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-apl-guc/igt@meta_test@fail-result.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bxt-dsi/igt@meta_test@fail-result.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-elk-e7500/igt@meta_test@fail-result.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-skl-6700k2/igt@meta_test@fail-result.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-tgl-1115g4/igt@meta_test@fail-result.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-soraka/igt@meta_test@fail-result.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-cfl-guc/igt@meta_test@fail-result.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bsw-n3050/igt@meta_test@fail-result.html
    - fi-ilk-650:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-ilk-650/igt@meta_test@fail-result.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-rkl-guc/igt@meta_test@fail-result.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bsw-kefka/igt@meta_test@fail-result.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-x1275/igt@meta_test@fail-result.html
    - fi-snb-2600:        NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-snb-2600/igt@meta_test@fail-result.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-cfl-8109u/igt@meta_test@fail-result.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-glk-dsi/igt@meta_test@fail-result.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bsw-nick/igt@meta_test@fail-result.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-glk-j4005/igt@meta_test@fail-result.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-7567u/igt@meta_test@fail-result.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-8809g/igt@meta_test@fail-result.html
    - {fi-hsw-g3258}:     NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-hsw-g3258/igt@meta_test@fail-result.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-blb-e6850/igt@meta_test@fail-result.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bwr-2160/igt@meta_test@fail-result.html
    - {fi-rkl-11600}:     NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-rkl-11600/igt@meta_test@fail-result.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-ehl-2/igt@meta_test@fail-result.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-guc/igt@meta_test@fail-result.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bdw-gvtdvm/igt@meta_test@fail-result.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-hsw-4770/igt@meta_test@fail-result.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-7500u/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11390 and IGTPW_6805:

### New IGT tests (1) ###

  * igt@meta_test@fail-result:
    - Statuses : 34 fail(s)
    - Exec time: [0.00, 0.27] s

  

Known issues
------------

  Here are the changes found in IGTPW_6805 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][35] ([fdo#109271]) +17 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@amdgpu/amd_basic@cs-multi-fence:
    - fi-blb-e6850:       NOTRUN -> [SKIP][36] ([fdo#109271]) +17 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-blb-e6850/igt@amdgpu/amd_basic@cs-multi-fence.html

  * igt@amdgpu/amd_basic@cs-sdma:
    - fi-kbl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271]) +17 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-guc/igt@amdgpu/amd_basic@cs-sdma.html

  * igt@amdgpu/amd_cs_nop@nop-gfx0:
    - fi-apl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271]) +17 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html

  * igt@amdgpu/amd_cs_nop@sync-compute0:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][39] ([fdo#109271]) +17 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bdw-gvtdvm/igt@amdgpu/amd_cs_nop@sync-compute0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6386 -> IGTPW_6805

  CI-20190529: 20190529
  CI_DRM_11390: 51a4c9ee097bd8af45ae14c2d1650b71550882ae @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6805: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/index.html
  IGT_6386: 0fcd59ad25b2960c0b654f90dfe4dd9e7c7b874d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/index.html

--===============4118006445221892240==
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
<tr><td><b>Series:</b></td><td>HAX add description to prime_self_import</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101586/">https://patchwork.freedesktop.org/series/101586/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11390 -&gt; IGTPW_6805</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6805 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6805, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/index.html</p>
<h2>Participating hosts (47 -&gt; 34)</h2>
<p>Additional (1): fi-hsw-g3258 <br />
  Missing    (14): fi-bdw-samus shard-tglu bat-dg1-6 fi-hsw-4200u bat-dg2-8 shard-rkl bat-dg2-9 fi-bsw-cyan bat-adlp-6 fi-ctg-p8600 bat-rpls-1 bat-rpls-2 bat-jsl-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6805:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>{fi-adl-ddr5}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-adl-ddr5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-cfl-8700k/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-tgl-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-snb-2520m/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-apl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bxt-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-elk-e7500/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-skl-6700k2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-tgl-1115g4/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-soraka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-cfl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bsw-n3050/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-ilk-650/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-rkl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bsw-kefka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-x1275/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-snb-2600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-cfl-8109u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-glk-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bsw-nick/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-glk-j4005/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-7567u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-8809g/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-hsw-g3258}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-hsw-g3258/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-blb-e6850/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bwr-2160/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-rkl-11600}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-rkl-11600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-ehl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bdw-gvtdvm/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-hsw-4770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-7500u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11390 and IGTPW_6805:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@meta_test@fail-result:<ul>
<li>Statuses : 34 fail(s)</li>
<li>Exec time: [0.00, 0.27] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6805 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@cs-multi-fence:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-blb-e6850/igt@amdgpu/amd_basic@cs-multi-fence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@cs-sdma:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-kbl-guc/igt@amdgpu/amd_basic@cs-sdma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-gfx0:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-compute0:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/fi-bdw-gvtdvm/igt@amdgpu/amd_cs_nop@sync-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6386 -&gt; IGTPW_6805</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11390: 51a4c9ee097bd8af45ae14c2d1650b71550882ae @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6805: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6805/index.html<br />
  IGT_6386: 0fcd59ad25b2960c0b654f90dfe4dd9e7c7b874d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4118006445221892240==--
