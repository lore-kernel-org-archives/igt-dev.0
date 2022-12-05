Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8349900858725445279=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 05 Dec 2022 10:52:39 -0000
Message-ID: <167023755908.24405.7463364194849316746@emeril.freedesktop.org>
References: <20221205092511.16008-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221205092511.16008-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRXhlcmNp?=
 =?utf-8?q?se_evict-flink-*?=
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

--===============8349900858725445279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Exercise evict-flink-*
URL   : https://patchwork.freedesktop.org/series/111620/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12466 -> IGTPW_8190
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8190 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8190, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/index.html

Participating hosts (44 -> 31)
------------------------------

  Missing    (13): fi-kbl-soraka bat-kbl-2 bat-adlp-9 fi-bsw-n3050 bat-dg1-5 bat-dg2-8 bat-dg2-9 bat-adlp-6 bat-adlp-4 fi-hsw-4770 bat-jsl-3 bat-dg2-11 fi-bsw-nick 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8190:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_softpin@evict-flink-all} (NEW):
    - fi-rkl-guc:         NOTRUN -> [FAIL][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-rkl-guc/igt@gem_softpin@evict-flink-all.html
    - fi-skl-guc:         NOTRUN -> [FAIL][2] +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-skl-guc/igt@gem_softpin@evict-flink-all.html
    - bat-dg1-6:          NOTRUN -> [FAIL][3] +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-dg1-6/igt@gem_softpin@evict-flink-all.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][4] +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-cfl-8700k/igt@gem_softpin@evict-flink-all.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][5] +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-tgl-dsi/igt@gem_softpin@evict-flink-all.html
    - {bat-rplp-1}:       NOTRUN -> [FAIL][6] +6 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-rplp-1/igt@gem_softpin@evict-flink-all.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][7] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-rkl-11600/igt@gem_softpin@evict-flink-all.html

  * {igt@gem_softpin@evict-flink@bcs0} (NEW):
    - fi-adl-ddr5:        NOTRUN -> [FAIL][8] +5 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-adl-ddr5/igt@gem_softpin@evict-flink@bcs0.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][9] +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-cfl-guc/igt@gem_softpin@evict-flink@bcs0.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][10] +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ehl-2/igt@gem_softpin@evict-flink@bcs0.html

  * {igt@gem_softpin@evict-flink@rcs0} (NEW):
    - {bat-jsl-1}:        NOTRUN -> [FAIL][11] +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-jsl-1/igt@gem_softpin@evict-flink@rcs0.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][12] +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-jsl-1/igt@gem_softpin@evict-flink@rcs0.html

  * {igt@gem_softpin@evict-flink@vcs0} (NEW):
    - fi-icl-u2:          NOTRUN -> [FAIL][13] +6 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-icl-u2/igt@gem_softpin@evict-flink@vcs0.html
    - fi-apl-guc:         NOTRUN -> [FAIL][14] +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-apl-guc/igt@gem_softpin@evict-flink@vcs0.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][15] +6 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-bdw-gvtdvm/igt@gem_softpin@evict-flink@vcs0.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][16] +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-bsw-kefka/igt@gem_softpin@evict-flink@vcs0.html
    - {bat-dg1-7}:        NOTRUN -> [FAIL][17] +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-dg1-7/igt@gem_softpin@evict-flink@vcs0.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][18] +5 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-skl-6700k2/igt@gem_softpin@evict-flink@vcs0.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][19] +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-cfl-8109u/igt@gem_softpin@evict-flink@vcs0.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][20] +6 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-kbl-7567u/igt@gem_softpin@evict-flink@vcs0.html
    - {bat-adln-1}:       NOTRUN -> [FAIL][21] +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-adln-1/igt@gem_softpin@evict-flink@vcs0.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][22] +5 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-kbl-8809g/igt@gem_softpin@evict-flink@vcs0.html
    - {bat-adlm-1}:       NOTRUN -> [FAIL][23] +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-adlm-1/igt@gem_softpin@evict-flink@vcs0.html

  * {igt@gem_softpin@evict-flink@vecs0} (NEW):
    - {bat-rpls-2}:       NOTRUN -> [FAIL][24] +6 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-rpls-2/igt@gem_softpin@evict-flink@vecs0.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][25] +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-glk-j4005/igt@gem_softpin@evict-flink@vecs0.html

  * igt@meta_test@fail-result (NEW):
    - fi-ilk-650:         NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ilk-650/igt@meta_test@fail-result.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-blb-e6850/igt@meta_test@fail-result.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-pnv-d510/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ivb-3770/igt@meta_test@fail-result.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-elk-e7500/igt@meta_test@fail-result.html
    - fi-snb-2600:        NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-snb-2600/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12466 and IGTPW_8190:

### New IGT tests (8) ###

  * igt@gem_softpin@evict-flink:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-all:
    - Statuses : 25 fail(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@bcs0:
    - Statuses : 25 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@rcs0:
    - Statuses : 25 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vcs0:
    - Statuses : 25 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vcs1:
    - Statuses : 10 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vecs0:
    - Statuses : 25 fail(s)
    - Exec time: [0.0] s

  * igt@meta_test@fail-result:
    - Statuses : 31 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8190 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@gem_softpin@evict-flink} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][32] ([fdo#109271]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-blb-e6850/igt@gem_softpin@evict-flink.html

  * {igt@gem_softpin@evict-flink-all} (NEW):
    - fi-snb-2600:        NOTRUN -> [SKIP][33] ([fdo#109271]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-snb-2600/igt@gem_softpin@evict-flink-all.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][34] ([fdo#109271]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ivb-3770/igt@gem_softpin@evict-flink-all.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][35] ([fdo#109271]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-elk-e7500/igt@gem_softpin@evict-flink-all.html
    - fi-ilk-650:         NOTRUN -> [SKIP][36] ([fdo#109271]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ilk-650/igt@gem_softpin@evict-flink-all.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][37] ([fdo#109271]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-pnv-d510/igt@gem_softpin@evict-flink-all.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7080 -> IGTPW_8190

  CI-20190529: 20190529
  CI_DRM_12466: 359d1acd20aea425840eaea1908f3257bb7de1eb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8190: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/index.html
  IGT_7080: 14721e0783757dfa44ca2677851c3ba508b09682 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_softpin@evict-flink
+igt@gem_softpin@evict-flink-all
-igt@kms_async_flips@async-flip-with-page-flip-events-linear

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/index.html

--===============8349900858725445279==
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
<tr><td><b>Series:</b></td><td>Exercise evict-flink-*</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111620/">https://patchwork.freedesktop.org/series/111620/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12466 -&gt; IGTPW_8190</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8190 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8190, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/index.html</p>
<h2>Participating hosts (44 -&gt; 31)</h2>
<p>Missing    (13): fi-kbl-soraka bat-kbl-2 bat-adlp-9 fi-bsw-n3050 bat-dg1-5 bat-dg2-8 bat-dg2-9 bat-adlp-6 bat-adlp-4 fi-hsw-4770 bat-jsl-3 bat-dg2-11 fi-bsw-nick </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8190:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_softpin@evict-flink-all} (NEW):</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-rkl-guc/igt@gem_softpin@evict-flink-all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-skl-guc/igt@gem_softpin@evict-flink-all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-dg1-6/igt@gem_softpin@evict-flink-all.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-cfl-8700k/igt@gem_softpin@evict-flink-all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-tgl-dsi/igt@gem_softpin@evict-flink-all.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-rplp-1/igt@gem_softpin@evict-flink-all.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-rkl-11600/igt@gem_softpin@evict-flink-all.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@bcs0} (NEW):</p>
<ul>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-adl-ddr5/igt@gem_softpin@evict-flink@bcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-cfl-guc/igt@gem_softpin@evict-flink@bcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ehl-2/igt@gem_softpin@evict-flink@bcs0.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@rcs0} (NEW):</p>
<ul>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-jsl-1/igt@gem_softpin@evict-flink@rcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-jsl-1/igt@gem_softpin@evict-flink@rcs0.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@vcs0} (NEW):</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-icl-u2/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-apl-guc/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-bdw-gvtdvm/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-bsw-kefka/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{bat-dg1-7}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-dg1-7/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-skl-6700k2/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-cfl-8109u/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-kbl-7567u/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-adln-1/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-kbl-8809g/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-adlm-1/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@vecs0} (NEW):</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/bat-rpls-2/igt@gem_softpin@evict-flink@vecs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-glk-j4005/igt@gem_softpin@evict-flink@vecs0.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ilk-650/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-blb-e6850/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-pnv-d510/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-elk-e7500/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-snb-2600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12466 and IGTPW_8190:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@gem_softpin@evict-flink:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-all:</p>
<ul>
<li>Statuses : 25 fail(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@bcs0:</p>
<ul>
<li>Statuses : 25 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@rcs0:</p>
<ul>
<li>Statuses : 25 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vcs0:</p>
<ul>
<li>Statuses : 25 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vcs1:</p>
<ul>
<li>Statuses : 10 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vecs0:</p>
<ul>
<li>Statuses : 25 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 31 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8190 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@gem_softpin@evict-flink} (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-blb-e6850/igt@gem_softpin@evict-flink.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink-all} (NEW):</p>
<ul>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-snb-2600/igt@gem_softpin@evict-flink-all.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ivb-3770/igt@gem_softpin@evict-flink-all.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-elk-e7500/igt@gem_softpin@evict-flink-all.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-ilk-650/igt@gem_softpin@evict-flink-all.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/fi-pnv-d510/igt@gem_softpin@evict-flink-all.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7080 -&gt; IGTPW_8190</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12466: 359d1acd20aea425840eaea1908f3257bb7de1eb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8190: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8190/index.html<br />
  IGT_7080: 14721e0783757dfa44ca2677851c3ba508b09682 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_softpin@evict-flink<br />
+igt@gem_softpin@evict-flink-all<br />
-igt@kms_async_flips@async-flip-with-page-flip-events-linear</p>

</body>
</html>

--===============8349900858725445279==--
