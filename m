Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8087241700274361754=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Wed, 09 Mar 2022 13:29:27 -0000
Message-ID: <164683256778.14947.12135318658494841658@emeril.freedesktop.org>
References: <20220309092017.140761-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20220309092017.140761-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSEFYIGFk?=
 =?utf-8?q?d_description_to_vgem=5Fbasic?=
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

--===============8087241700274361754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: HAX add description to vgem_basic
URL   : https://patchwork.freedesktop.org/series/101198/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11341 -> IGTPW_6762
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6762 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6762, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/index.html

Participating hosts (44 -> 35)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (10): bat-dg1-6 bat-dg1-5 bat-dg2-9 fi-bsw-cyan bat-adlp-6 bat-adlp-4 fi-ctg-p8600 bat-rpls-2 bat-jsl-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6762:

### IGT changes ###

#### Possible regressions ####

  * igt@meta_test@fail-result (NEW):
    - fi-pnv-d510:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-pnv-d510/igt@meta_test@fail-result.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-skl-6600u/igt@meta_test@fail-result.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-jsl-1/igt@meta_test@fail-result.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-cfl-8700k/igt@meta_test@fail-result.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-tgl-dsi/igt@meta_test@fail-result.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-snb-2520m/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-ivb-3770/igt@meta_test@fail-result.html
    - fi-apl-guc:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-apl-guc/igt@meta_test@fail-result.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bxt-dsi/igt@meta_test@fail-result.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-elk-e7500/igt@meta_test@fail-result.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-skl-6700k2/igt@meta_test@fail-result.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-soraka/igt@meta_test@fail-result.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-cfl-guc/igt@meta_test@fail-result.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bsw-n3050/igt@meta_test@fail-result.html
    - fi-ilk-650:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-ilk-650/igt@meta_test@fail-result.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-rkl-guc/igt@meta_test@fail-result.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bsw-kefka/igt@meta_test@fail-result.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-x1275/igt@meta_test@fail-result.html
    - fi-snb-2600:        NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-snb-2600/igt@meta_test@fail-result.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-cfl-8109u/igt@meta_test@fail-result.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bdw-5557u/igt@meta_test@fail-result.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-glk-dsi/igt@meta_test@fail-result.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bsw-nick/igt@meta_test@fail-result.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-glk-j4005/igt@meta_test@fail-result.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-7567u/igt@meta_test@fail-result.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-8809g/igt@meta_test@fail-result.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-blb-e6850/igt@meta_test@fail-result.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bwr-2160/igt@meta_test@fail-result.html
    - {fi-rkl-11600}:     NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-rkl-11600/igt@meta_test@fail-result.html
    - fi-skl-guc:         NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-skl-guc/igt@meta_test@fail-result.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-ehl-2/igt@meta_test@fail-result.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-guc/igt@meta_test@fail-result.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bdw-gvtdvm/igt@meta_test@fail-result.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-hsw-4770/igt@meta_test@fail-result.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-7500u/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11341 and IGTPW_6762:

### New IGT tests (1) ###

  * igt@meta_test@fail-result:
    - Statuses : 35 fail(s)
    - Exec time: [0.00, 0.16] s

  

Known issues
------------

  Here are the changes found in IGTPW_6762 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-hsw-4770:        NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-hsw-4770/igt@amdgpu/amd_basic@cs-gfx.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][37] ([fdo#109271]) +17 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@amdgpu/amd_basic@cs-sdma:
    - fi-kbl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271]) +17 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-guc/igt@amdgpu/amd_basic@cs-sdma.html

  * igt@amdgpu/amd_basic@query-info:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][39] ([fdo#109271]) +17 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][40] ([fdo#109271]) +17 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@nop-gfx0:
    - fi-apl-guc:         NOTRUN -> [SKIP][41] ([fdo#109271]) +17 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html

  * igt@amdgpu/amd_cs_nop@sync-compute0:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][42] ([fdo#109271]) +17 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bdw-gvtdvm/igt@amdgpu/amd_cs_nop@sync-compute0.html

  * igt@amdgpu/amd_cs_nop@sync-fork-gfx0:
    - fi-skl-6600u:       NOTRUN -> [SKIP][43] ([fdo#109271]) +17 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-pnv-d510:        NOTRUN -> [SKIP][44] ([fdo#109271]) +17 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-pnv-d510/igt@amdgpu/amd_prime@amd-to-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6373 -> IGTPW_6762

  CI-20190529: 20190529
  CI_DRM_11341: 5cbb7a9b0e483d745269d3f85d9b0d7a890837b5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6762: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/index.html
  IGT_6373: 82306f1903c0fee8371f43a156d8b63163ca61c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/index.html

--===============8087241700274361754==
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
<tr><td><b>Series:</b></td><td>HAX add description to vgem_basic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101198/">https://patchwork.freedesktop.org/series/101198/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11341 -&gt; IGTPW_6762</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6762 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6762, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/index.html</p>
<h2>Participating hosts (44 -&gt; 35)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (10): bat-dg1-6 bat-dg1-5 bat-dg2-9 fi-bsw-cyan bat-adlp-6 bat-adlp-4 fi-ctg-p8600 bat-rpls-2 bat-jsl-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6762:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-pnv-d510/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-skl-6600u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-cfl-8700k/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-tgl-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-snb-2520m/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-apl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bxt-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-elk-e7500/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-skl-6700k2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-soraka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-cfl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bsw-n3050/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-ilk-650/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-rkl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bsw-kefka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-x1275/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-snb-2600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-cfl-8109u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bdw-5557u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-glk-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bsw-nick/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-glk-j4005/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-7567u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-8809g/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-blb-e6850/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bwr-2160/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-rkl-11600}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-rkl-11600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-skl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-ehl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bdw-gvtdvm/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-hsw-4770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-7500u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11341 and IGTPW_6762:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@meta_test@fail-result:<ul>
<li>Statuses : 35 fail(s)</li>
<li>Exec time: [0.00, 0.16] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6762 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-hsw-4770/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@cs-sdma:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-kbl-guc/igt@amdgpu/amd_basic@cs-sdma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-gfx0:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-compute0:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-bdw-gvtdvm/igt@amdgpu/amd_cs_nop@sync-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-gfx0:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/fi-pnv-d510/igt@amdgpu/amd_prime@amd-to-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6373 -&gt; IGTPW_6762</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11341: 5cbb7a9b0e483d745269d3f85d9b0d7a890837b5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6762: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6762/index.html<br />
  IGT_6373: 82306f1903c0fee8371f43a156d8b63163ca61c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8087241700274361754==--
