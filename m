Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2776360756057236106=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 01 Sep 2022 07:05:36 -0000
Message-ID: <166201593636.11921.10086445529033064846@emeril.freedesktop.org>
References: <20220901063000.25640-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901063000.25640-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUXVpY2sg?=
 =?utf-8?q?bat_tests=2C_please_don=27t_review=2E?=
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

--===============2776360756057236106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Quick bat tests, please don't review.
URL   : https://patchwork.freedesktop.org/series/107996/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12058 -> IGTPW_7714
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7714 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7714, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/index.html

Participating hosts (37 -> 34)
------------------------------

  Missing    (3): fi-adl-ddr5 fi-hsw-4770 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7714:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_mmap_offset@clear@smem0} (NEW):
    - fi-hsw-g3258:       NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-hsw-g3258/igt@gem_mmap_offset@clear@smem0.html

  * igt@gem_mmap_offset@close-race:
    - fi-elk-e7500:       NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-elk-e7500/igt@gem_mmap_offset@close-race.html

  * {igt@gem_mmap_offset@ptrace@lmem0-fixed} (NEW):
    - {bat-dg2-11}:       NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-dg2-11/igt@gem_mmap_offset@ptrace@lmem0-fixed.html
    - {bat-dg2-8}:        NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-dg2-8/igt@gem_mmap_offset@ptrace@lmem0-fixed.html
    - {bat-dg2-9}:        NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-dg2-9/igt@gem_mmap_offset@ptrace@lmem0-fixed.html

  * igt@meta_test@fail-result (NEW):
    - {fi-jsl-1}:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-jsl-1/igt@meta_test@fail-result.html
    - {bat-rpls-1}:       NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-rpls-1/igt@meta_test@fail-result.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-skl-6600u/igt@meta_test@fail-result.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-ehl-2/igt@meta_test@fail-result.html
    - bat-dg1-5:          NOTRUN -> [FAIL][10] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-dg1-5/igt@meta_test@fail-result.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][11] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-pnv-d510/igt@meta_test@fail-result.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-bdw-5557u/igt@meta_test@fail-result.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-snb-2520m/igt@meta_test@fail-result.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-glk-j4005/igt@meta_test@fail-result.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-rkl-guc/igt@meta_test@fail-result.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-kbl-7567u/igt@meta_test@fail-result.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-cfl-8700k/igt@meta_test@fail-result.html
    - {bat-rplp-1}:       NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-rplp-1/igt@meta_test@fail-result.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-rkl-11600/igt@meta_test@fail-result.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-bdw-gvtdvm/igt@meta_test@fail-result.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-bsw-kefka/igt@meta_test@fail-result.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-cfl-guc/igt@meta_test@fail-result.html
    - {bat-jsl-3}:        NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-jsl-3/igt@meta_test@fail-result.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-skl-6700k2/igt@meta_test@fail-result.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-cfl-8109u/igt@meta_test@fail-result.html
    - bat-adlp-4:         NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-adlp-4/igt@meta_test@fail-result.html
    - {bat-adln-1}:       NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-adln-1/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-ivb-3770/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12058 and IGTPW_7714:

### New IGT tests (19) ###

  * igt@gem_create@busy-create@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [32.28, 32.36] s

  * igt@gem_create@busy-create@smem0:
    - Statuses : 28 pass(s)
    - Exec time: [32.23, 35.96] s

  * igt@gem_create@create-clear@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [32.86, 38.41] s

  * igt@gem_create@create-clear@smem0:
    - Statuses : 1 fail(s) 27 pass(s)
    - Exec time: [32.34, 37.34] s

  * igt@gem_create@hog-create:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_create@hog-create@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [32.27, 32.34] s

  * igt@gem_create@hog-create@smem0:
    - Statuses : 28 pass(s)
    - Exec time: [32.23, 33.49] s

  * igt@gem_mmap_offset@clear@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [21.56, 27.00] s

  * igt@gem_mmap_offset@clear@smem0:
    - Statuses : 1 fail(s) 27 pass(s)
    - Exec time: [2.25, 27.37] s

  * igt@gem_mmap_offset@perf:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_offset@perf@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.14, 0.58] s

  * igt@gem_mmap_offset@perf@smem0:
    - Statuses : 28 pass(s)
    - Exec time: [0.00, 0.47] s

  * igt@gem_mmap_offset@ptrace@lmem0-fixed:
    - Statuses : 4 fail(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_mmap_offset@ptrace@smem0-fixed:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_mmap_offset@ptrace@smem0-gtt:
    - Statuses : 24 pass(s)
    - Exec time: [0.02, 0.20] s

  * igt@gem_mmap_offset@ptrace@smem0-uc:
    - Statuses : 24 pass(s)
    - Exec time: [0.01, 0.20] s

  * igt@gem_mmap_offset@ptrace@smem0-wb:
    - Statuses : 24 pass(s)
    - Exec time: [0.01, 0.20] s

  * igt@gem_mmap_offset@ptrace@smem0-wc:
    - Statuses : 24 pass(s)
    - Exec time: [0.01, 0.20] s

  * igt@meta_test@fail-result:
    - Statuses : 28 fail(s)
    - Exec time: [0.00, 0.12] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6639 -> IGTPW_7714

  CI-20190529: 20190529
  CI_DRM_12058: 2ef8278465adc6572e0d22dffbaa332d56b4b40c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7714: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/index.html
  IGT_6639: ba61c48dba71d5597d7297a07dc3e307665f961b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_create@hog-create
+igt@gem_mmap_offset@perf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/index.html

--===============2776360756057236106==
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
<tr><td><b>Series:</b></td><td>Quick bat tests, please don&#39;t review.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107996/">https://patchwork.freedesktop.org/series/107996/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12058 -&gt; IGTPW_7714</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7714 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7714, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/index.html</p>
<h2>Participating hosts (37 -&gt; 34)</h2>
<p>Missing    (3): fi-adl-ddr5 fi-hsw-4770 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7714:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_mmap_offset@clear@smem0} (NEW):</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-hsw-g3258/igt@gem_mmap_offset@clear@smem0.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@close-race:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-elk-e7500/igt@gem_mmap_offset@close-race.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_mmap_offset@ptrace@lmem0-fixed} (NEW):</p>
<ul>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-dg2-11/igt@gem_mmap_offset@ptrace@lmem0-fixed.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-dg2-8/igt@gem_mmap_offset@ptrace@lmem0-fixed.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-dg2-9/igt@gem_mmap_offset@ptrace@lmem0-fixed.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-rpls-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-skl-6600u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-ehl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-dg1-5/igt@meta_test@fail-result.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-pnv-d510/igt@meta_test@fail-result.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-bdw-5557u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-snb-2520m/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-glk-j4005/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-rkl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-kbl-7567u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-cfl-8700k/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-rplp-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-rkl-11600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-bdw-gvtdvm/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-bsw-kefka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-cfl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-jsl-3/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-skl-6700k2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-cfl-8109u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-adlp-4/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/bat-adln-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12058 and IGTPW_7714:</p>
<h3>New IGT tests (19)</h3>
<ul>
<li>
<p>igt@gem_create@busy-create@lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [32.28, 32.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_create@busy-create@smem0:</p>
<ul>
<li>Statuses : 28 pass(s)</li>
<li>Exec time: [32.23, 35.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear@lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [32.86, 38.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear@smem0:</p>
<ul>
<li>Statuses : 1 fail(s) 27 pass(s)</li>
<li>Exec time: [32.34, 37.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_create@hog-create:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_create@hog-create@lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [32.27, 32.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_create@hog-create@smem0:</p>
<ul>
<li>Statuses : 28 pass(s)</li>
<li>Exec time: [32.23, 33.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear@lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [21.56, 27.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear@smem0:</p>
<ul>
<li>Statuses : 1 fail(s) 27 pass(s)</li>
<li>Exec time: [2.25, 27.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@perf:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@perf@lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.14, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@perf@smem0:</p>
<ul>
<li>Statuses : 28 pass(s)</li>
<li>Exec time: [0.00, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@ptrace@lmem0-fixed:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@ptrace@smem0-fixed:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@ptrace@smem0-gtt:</p>
<ul>
<li>Statuses : 24 pass(s)</li>
<li>Exec time: [0.02, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@ptrace@smem0-uc:</p>
<ul>
<li>Statuses : 24 pass(s)</li>
<li>Exec time: [0.01, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@ptrace@smem0-wb:</p>
<ul>
<li>Statuses : 24 pass(s)</li>
<li>Exec time: [0.01, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@ptrace@smem0-wc:</p>
<ul>
<li>Statuses : 24 pass(s)</li>
<li>Exec time: [0.01, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 28 fail(s)</li>
<li>Exec time: [0.00, 0.12] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6639 -&gt; IGTPW_7714</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12058: 2ef8278465adc6572e0d22dffbaa332d56b4b40c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7714: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7714/index.html<br />
  IGT_6639: ba61c48dba71d5597d7297a07dc3e307665f961b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_create@hog-create<br />
+igt@gem_mmap_offset@perf</p>

</body>
</html>

--===============2776360756057236106==--
