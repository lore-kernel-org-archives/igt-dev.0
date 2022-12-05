Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3467846603883055353=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 05 Dec 2022 11:22:57 -0000
Message-ID: <167023937707.24405.5798728581354879666@emeril.freedesktop.org>
References: <20221202081025.20273-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221202081025.20273-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Flmem=5Fswapping=3A_Use_feature_macro_instead_checking_pla?=
 =?utf-8?q?tform_=28rev3=29?=
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

--===============3467846603883055353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_lmem_swapping: Use feature macro instead checking platform (rev3)
URL   : https://patchwork.freedesktop.org/series/111573/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12466 -> IGTPW_8191
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8191 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8191, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): fi-rkl-11600 fi-tgl-dsi 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8191:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_softpin@evict-flink-all} (NEW):
    - {bat-adlp-9}:       NOTRUN -> [FAIL][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-adlp-9/igt@gem_softpin@evict-flink-all.html
    - {bat-dg2-11}:       NOTRUN -> [FAIL][2] +8 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg2-11/igt@gem_softpin@evict-flink-all.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][3] +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-bsw-nick/igt@gem_softpin@evict-flink-all.html
    - {bat-kbl-2}:        NOTRUN -> [FAIL][4] +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-kbl-2/igt@gem_softpin@evict-flink-all.html

  * {igt@gem_softpin@evict-flink@ccs0} (NEW):
    - {bat-dg2-9}:        NOTRUN -> [FAIL][5] +11 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg2-9/igt@gem_softpin@evict-flink@ccs0.html

  * {igt@gem_softpin@evict-flink@ccs1} (NEW):
    - {bat-dg2-8}:        NOTRUN -> [FAIL][6] +11 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg2-8/igt@gem_softpin@evict-flink@ccs1.html

  * {igt@gem_softpin@evict-flink@vcs0} (NEW):
    - bat-dg1-5:          NOTRUN -> [FAIL][7] +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg1-5/igt@gem_softpin@evict-flink@vcs0.html
    - {bat-jsl-3}:        NOTRUN -> [FAIL][8] +5 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-jsl-3/igt@gem_softpin@evict-flink@vcs0.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][9] +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-kbl-soraka/igt@gem_softpin@evict-flink@vcs0.html
    - bat-adlp-4:         NOTRUN -> [FAIL][10] +6 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-adlp-4/igt@gem_softpin@evict-flink@vcs0.html

  * igt@meta_test@fail-result (NEW):
    - {bat-adlp-6}:       NOTRUN -> [FAIL][11] +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-adlp-6/igt@meta_test@fail-result.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-bsw-n3050:       [FAIL][12] ([i915#4312]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/fi-bsw-n3050/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-bsw-n3050/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12466 and IGTPW_8191:

### New IGT tests (13) ###

  * igt@gem_softpin@evict-flink:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@evict-flink-all:
    - Statuses : 11 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@bcs0:
    - Statuses : 11 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@ccs0:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@ccs1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@ccs2:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@ccs3:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@rcs0:
    - Statuses : 11 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vcs0:
    - Statuses : 11 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vcs1:
    - Statuses : 8 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vecs0:
    - Statuses : 11 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vecs1:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@meta_test@fail-result:
    - Statuses : 11 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8191 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [PASS][14] -> [FAIL][15] ([i915#7229])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][16] ([fdo#109271] / [fdo#111827])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - {bat-rpls-2}:       [DMESG-WARN][17] ([i915#6434]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/bat-rpls-2/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-rpls-2/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - {bat-rpls-2}:       [WARN][19] ([i915#7346]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-rpls-2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_mocs:
    - {bat-dg1-7}:        [INCOMPLETE][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/bat-dg1-7/igt@i915_selftest@live@gt_mocs.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg1-7/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][23] ([i915#4785]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][25] ([i915#4983]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/bat-rpls-2/igt@i915_selftest@live@reset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][27] ([i915#6298]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7080 -> IGTPW_8191

  CI-20190529: 20190529
  CI_DRM_12466: 359d1acd20aea425840eaea1908f3257bb7de1eb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8191: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/index.html
  IGT_7080: 14721e0783757dfa44ca2677851c3ba508b09682 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@gem_softpin@evict-flink
-igt@gem_softpin@evict-flink-all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/index.html

--===============3467846603883055353==
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
<tr><td><b>Series:</b></td><td>tests/gem_lmem_swapping: Use feature macro instead checking platform (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111573/">https://patchwork.freedesktop.org/series/111573/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12466 -&gt; IGTPW_8191</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8191 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8191, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Missing    (2): fi-rkl-11600 fi-tgl-dsi </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8191:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_softpin@evict-flink-all} (NEW):</p>
<ul>
<li>
<p>{bat-adlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-adlp-9/igt@gem_softpin@evict-flink-all.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg2-11/igt@gem_softpin@evict-flink-all.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-bsw-nick/igt@gem_softpin@evict-flink-all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-kbl-2/igt@gem_softpin@evict-flink-all.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@ccs0} (NEW):</p>
<ul>
<li>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg2-9/igt@gem_softpin@evict-flink@ccs0.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@ccs1} (NEW):</p>
<ul>
<li>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg2-8/igt@gem_softpin@evict-flink@ccs1.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@vcs0} (NEW):</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg1-5/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-jsl-3/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-kbl-soraka/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-adlp-4/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-adlp-6/igt@meta_test@fail-result.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12466 and IGTPW_8191:</p>
<h3>New IGT tests (13)</h3>
<ul>
<li>
<p>igt@gem_softpin@evict-flink:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-all:</p>
<ul>
<li>Statuses : 11 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@bcs0:</p>
<ul>
<li>Statuses : 11 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@ccs0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@ccs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@ccs2:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@ccs3:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@rcs0:</p>
<ul>
<li>Statuses : 11 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vcs0:</p>
<ul>
<li>Statuses : 11 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vcs1:</p>
<ul>
<li>Statuses : 8 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vecs0:</p>
<ul>
<li>Statuses : 11 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vecs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 11 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8191 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/bat-rpls-2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6434">i915#6434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-rpls-2/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7346">i915#7346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>{bat-dg1-7}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/bat-dg1-7/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-dg1-7/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12466/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7080 -&gt; IGTPW_8191</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12466: 359d1acd20aea425840eaea1908f3257bb7de1eb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8191: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8191/index.html<br />
  IGT_7080: 14721e0783757dfa44ca2677851c3ba508b09682 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@gem_softpin@evict-flink<br />
-igt@gem_softpin@evict-flink-all</p>

</body>
</html>

--===============3467846603883055353==--
