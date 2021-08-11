Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6354058048576347175=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Aug 2021 22:51:56 -0000
Message-ID: <162872231631.27218.14420087155754057063@emeril.freedesktop.org>
References: <20210811202811.2162-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210811202811.2162-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZ2VtX2V4?=
 =?utf-8?q?ec=5Fbig_--_noreloc_support?=
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
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6354058048576347175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_exec_big -- noreloc support
URL   : https://patchwork.freedesktop.org/series/93610/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10470 -> IGTPW_6117
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6117 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6117, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6117:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_big@exhaustive} (NEW):
    - {fi-ehl-2}:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ehl-2/igt@gem_exec_big@exhaustive.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-dsi/igt@gem_exec_big@exhaustive.html
    - fi-icl-u2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-icl-u2/igt@gem_exec_big@exhaustive.html
    - fi-elk-e7500:       NOTRUN -> [TIMEOUT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-elk-e7500/igt@gem_exec_big@exhaustive.html
    - fi-icl-y:           NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-icl-y/igt@gem_exec_big@exhaustive.html
    - fi-ilk-650:         NOTRUN -> [TIMEOUT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ilk-650/igt@gem_exec_big@exhaustive.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-1115g4/igt@gem_exec_big@exhaustive.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-hsw-4770/igt@gem_exec_big@exhaustive.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-rkl-guc/igt@gem_exec_big@exhaustive.html
    - fi-cml-u2:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cml-u2/igt@gem_exec_big@exhaustive.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-jsl-1/igt@gem_exec_big@exhaustive.html
    - fi-bwr-2160:        NOTRUN -> [TIMEOUT][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bwr-2160/igt@gem_exec_big@exhaustive.html
    - fi-pnv-d510:        NOTRUN -> [TIMEOUT][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-pnv-d510/igt@gem_exec_big@exhaustive.html

  * igt@gem_exec_big@single:
    - fi-apl-guc:         NOTRUN -> [TIMEOUT][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-apl-guc/igt@gem_exec_big@single.html

  * igt@meta_test@fail-result (NEW):
    - fi-pnv-d510:        NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-pnv-d510/igt@meta_test@fail-result.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-jsl-1/igt@meta_test@fail-result.html
    - fi-icl-u2:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-icl-u2/igt@meta_test@fail-result.html
    - fi-cml-u2:          NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cml-u2/igt@meta_test@fail-result.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-8700k/igt@meta_test@fail-result.html
    - {fi-hsw-gt1}:       NOTRUN -> [FAIL][20] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-hsw-gt1/igt@meta_test@fail-result.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-dsi/igt@meta_test@fail-result.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][22] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-snb-2520m/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][23] +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ivb-3770/igt@meta_test@fail-result.html
    - fi-apl-guc:         NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-apl-guc/igt@meta_test@fail-result.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bxt-dsi/igt@meta_test@fail-result.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-elk-e7500/igt@meta_test@fail-result.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-skl-6700k2/igt@meta_test@fail-result.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-1115g4/igt@meta_test@fail-result.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-soraka/igt@meta_test@fail-result.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-guc/igt@meta_test@fail-result.html
    - fi-ilk-650:         NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ilk-650/igt@meta_test@fail-result.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-rkl-guc/igt@meta_test@fail-result.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][33] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bsw-kefka/igt@meta_test@fail-result.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-x1275/igt@meta_test@fail-result.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-8109u/igt@meta_test@fail-result.html
    - fi-icl-y:           NOTRUN -> [FAIL][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-icl-y/igt@meta_test@fail-result.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bdw-5557u/igt@meta_test@fail-result.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-glk-dsi/igt@meta_test@fail-result.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bsw-nick/igt@meta_test@fail-result.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-7567u/igt@meta_test@fail-result.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-8809g/igt@meta_test@fail-result.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bwr-2160/igt@meta_test@fail-result.html
    - fi-skl-guc:         NOTRUN -> [FAIL][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-skl-guc/igt@meta_test@fail-result.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ehl-2/igt@meta_test@fail-result.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-guc/igt@meta_test@fail-result.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bdw-gvtdvm/igt@meta_test@fail-result.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][47]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-7500u/igt@meta_test@fail-result.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_big@single:
    - {fi-tgl-dsi}:       NOTRUN -> [TIMEOUT][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-dsi/igt@gem_exec_big@single.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10470 and IGTPW_6117:

### New IGT tests (2) ###

  * igt@gem_exec_big@exhaustive:
    - Statuses : 5 fail(s) 26 skip(s) 4 timeout(s)
    - Exec time: [0.05, 121.87] s

  * igt@meta_test@fail-result:
    - Statuses : 35 fail(s)
    - Exec time: [0.01, 0.14] s

  

Known issues
------------

  Here are the changes found in IGTPW_6117 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-compute0:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][49] ([fdo#109271]) +18 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bdw-gvtdvm/igt@amdgpu/amd_cs_nop@sync-compute0.html

  * {igt@gem_exec_big@exhaustive} (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][50] ([fdo#109271]) +18 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-apl-guc/igt@gem_exec_big@exhaustive.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][51] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-8700k/igt@gem_exec_big@exhaustive.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][52] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-skl-6700k2/igt@gem_exec_big@exhaustive.html
    - fi-skl-guc:         NOTRUN -> [SKIP][53] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-skl-guc/igt@gem_exec_big@exhaustive.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][54] ([fdo#109271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-guc/igt@gem_exec_big@exhaustive.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][55] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-7567u/igt@gem_exec_big@exhaustive.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][56] ([fdo#109271])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bxt-dsi/igt@gem_exec_big@exhaustive.html
    - {fi-dg1-1}:         NOTRUN -> [SKIP][57] ([i915#3717])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-dg1-1/igt@gem_exec_big@exhaustive.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][58] ([fdo#109271])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-8809g/igt@gem_exec_big@exhaustive.html
    - fi-kbl-7500u:       NOTRUN -> [SKIP][59] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-7500u/igt@gem_exec_big@exhaustive.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][60] ([fdo#109271])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bsw-nick/igt@gem_exec_big@exhaustive.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][61] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-8109u/igt@gem_exec_big@exhaustive.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][62] ([fdo#109271])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-guc/igt@gem_exec_big@exhaustive.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][63] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-x1275/igt@gem_exec_big@exhaustive.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][64] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-soraka/igt@gem_exec_big@exhaustive.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][65] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-glk-dsi/igt@gem_exec_big@exhaustive.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][66] ([fdo#109271])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bdw-5557u/igt@gem_exec_big@exhaustive.html

  * igt@meta_test@fail-result (NEW):
    - {fi-dg1-1}:         NOTRUN -> [FAIL][67] ([i915#3717])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-dg1-1/igt@meta_test@fail-result.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717


Participating hosts (40 -> 35)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-jsl-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6170 -> IGTPW_6117

  CI-20190529: 20190529
  CI_DRM_10470: 8ef1164291b6c56baccf77f4be6e99a86821c684 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6117: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/index.html
  IGT_6170: d4ff2b4ab88d62a1888cb0316e70a1729fe4a685 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/index.html

--===============6354058048576347175==
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
<tr><td><b>Series:</b></td><td>gem_exec_big -- noreloc support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93610/">https://patchwork.freedesktop.org/series/93610/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10470 -&gt; IGTPW_6117</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6117 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6117, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6117:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_big@exhaustive} (NEW):</p>
<ul>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ehl-2/igt@gem_exec_big@exhaustive.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-dsi/igt@gem_exec_big@exhaustive.html">SKIP</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-icl-u2/igt@gem_exec_big@exhaustive.html">SKIP</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-elk-e7500/igt@gem_exec_big@exhaustive.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-icl-y/igt@gem_exec_big@exhaustive.html">SKIP</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ilk-650/igt@gem_exec_big@exhaustive.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-1115g4/igt@gem_exec_big@exhaustive.html">SKIP</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-hsw-4770/igt@gem_exec_big@exhaustive.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-rkl-guc/igt@gem_exec_big@exhaustive.html">SKIP</a></p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cml-u2/igt@gem_exec_big@exhaustive.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-jsl-1/igt@gem_exec_big@exhaustive.html">SKIP</a></p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bwr-2160/igt@gem_exec_big@exhaustive.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-pnv-d510/igt@gem_exec_big@exhaustive.html">TIMEOUT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-apl-guc/igt@gem_exec_big@single.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-pnv-d510/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-icl-u2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cml-u2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-8700k/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-hsw-gt1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-hsw-gt1/igt@meta_test@fail-result.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-snb-2520m/igt@meta_test@fail-result.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-apl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bxt-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-elk-e7500/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-skl-6700k2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-1115g4/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-soraka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ilk-650/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-rkl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bsw-kefka/igt@meta_test@fail-result.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-x1275/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-8109u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-icl-y/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bdw-5557u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-glk-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bsw-nick/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-7567u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-8809g/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bwr-2160/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-skl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-ehl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bdw-gvtdvm/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-7500u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_big@single:<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-tgl-dsi/igt@gem_exec_big@single.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10470 and IGTPW_6117:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_exec_big@exhaustive:</p>
<ul>
<li>Statuses : 5 fail(s) 26 skip(s) 4 timeout(s)</li>
<li>Exec time: [0.05, 121.87] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 35 fail(s)</li>
<li>Exec time: [0.01, 0.14] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6117 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-compute0:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bdw-gvtdvm/igt@amdgpu/amd_cs_nop@sync-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_big@exhaustive} (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-apl-guc/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-8700k/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-skl-6700k2/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-skl-guc/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-guc/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-7567u/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bxt-dsi/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>{fi-dg1-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-dg1-1/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-8809g/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-7500u/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bsw-nick/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-cfl-8109u/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-guc/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-x1275/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-kbl-soraka/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-glk-dsi/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-bdw-5557u/igt@gem_exec_big@exhaustive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>{fi-dg1-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/fi-dg1-1/igt@meta_test@fail-result.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-jsl-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6170 -&gt; IGTPW_6117</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10470: 8ef1164291b6c56baccf77f4be6e99a86821c684 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6117: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6117/index.html<br />
  IGT_6170: d4ff2b4ab88d62a1888cb0316e70a1729fe4a685 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6354058048576347175==--
