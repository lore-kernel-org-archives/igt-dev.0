Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0877924588806964766=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 04 Jul 2023 10:02:12 -0000
Message-ID: <168846493287.28590.5604354362285708562@emeril.freedesktop.org>
References: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRXh0ZW5k?=
 =?utf-8?q?_intel=5Fblt_to_work_on_Xe?=
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

--===============0877924588806964766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend intel_blt to work on Xe
URL   : https://patchwork.freedesktop.org/series/120162/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7369 -> IGTPW_9327
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9327 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9327, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/index.html

Participating hosts (41 -> 42)
------------------------------

  Additional (2): fi-kbl-soraka fi-pnv-d510 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9327:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_busy@busy@all-engines:
    - bat-mtlp-8:         [PASS][1] -> [FAIL][2] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-8/igt@gem_busy@busy@all-engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-8/igt@gem_busy@busy@all-engines.html

  * igt@gem_exec_fence@basic-await@bcs0:
    - bat-atsm-1:         [PASS][3] -> [FAIL][4] +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-atsm-1/igt@gem_exec_fence@basic-await@bcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-atsm-1/igt@gem_exec_fence@basic-await@bcs0.html
    - bat-dg2-8:          [PASS][5] -> [FAIL][6] +11 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg2-8/igt@gem_exec_fence@basic-await@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg2-8/igt@gem_exec_fence@basic-await@bcs0.html
    - bat-adlm-1:         [PASS][7] -> [FAIL][8] +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adlm-1/igt@gem_exec_fence@basic-await@bcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adlm-1/igt@gem_exec_fence@basic-await@bcs0.html

  * igt@gem_exec_fence@basic-await@ccs0:
    - bat-dg2-11:         [PASS][9] -> [FAIL][10] +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg2-11/igt@gem_exec_fence@basic-await@ccs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg2-11/igt@gem_exec_fence@basic-await@ccs0.html

  * igt@gem_exec_fence@basic-await@ccs1:
    - bat-dg2-9:          [PASS][11] -> [FAIL][12] +11 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg2-9/igt@gem_exec_fence@basic-await@ccs1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg2-9/igt@gem_exec_fence@basic-await@ccs1.html

  * igt@gem_exec_fence@basic-await@rcs0:
    - bat-mtlp-6:         [PASS][13] -> [FAIL][14] +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-6/igt@gem_exec_fence@basic-await@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-6/igt@gem_exec_fence@basic-await@rcs0.html
    - bat-rpls-2:         [PASS][15] -> [FAIL][16] +6 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rpls-2/igt@gem_exec_fence@basic-await@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-2/igt@gem_exec_fence@basic-await@rcs0.html
    - bat-adlp-6:         [PASS][17] -> [FAIL][18] +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adlp-6/igt@gem_exec_fence@basic-await@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adlp-6/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@basic-await@vcs0:
    - bat-adlp-9:         [PASS][19] -> [FAIL][20] +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adlp-9/igt@gem_exec_fence@basic-await@vcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adlp-9/igt@gem_exec_fence@basic-await@vcs0.html
    - bat-adln-1:         [PASS][21] -> [FAIL][22] +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adln-1/igt@gem_exec_fence@basic-await@vcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adln-1/igt@gem_exec_fence@basic-await@vcs0.html
    - bat-rplp-1:         [PASS][23] -> [FAIL][24] +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rplp-1/igt@gem_exec_fence@basic-await@vcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rplp-1/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_fence@basic-await@vecs0:
    - bat-rpls-1:         [PASS][25] -> [FAIL][26] +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rpls-1/igt@gem_exec_fence@basic-await@vecs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-1/igt@gem_exec_fence@basic-await@vecs0.html
    - fi-rkl-11600:       [PASS][27] -> [FAIL][28] +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/fi-rkl-11600/igt@gem_exec_fence@basic-await@vecs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-rkl-11600/igt@gem_exec_fence@basic-await@vecs0.html
    - bat-adls-5:         [PASS][29] -> [FAIL][30] +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adls-5/igt@gem_exec_fence@basic-await@vecs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adls-5/igt@gem_exec_fence@basic-await@vecs0.html
    - bat-dg1-5:          [PASS][31] -> [FAIL][32] +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg1-5/igt@gem_exec_fence@basic-await@vecs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg1-5/igt@gem_exec_fence@basic-await@vecs0.html
    - bat-dg1-7:          [PASS][33] -> [FAIL][34] +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg1-7/igt@gem_exec_fence@basic-await@vecs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg1-7/igt@gem_exec_fence@basic-await@vecs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_9327 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#2190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#4613]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-6:         [PASS][37] -> [DMESG-FAIL][38] ([i915#7059])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][39] ([i915#1886] / [i915#7913])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-2:         [PASS][40] -> [ABORT][41] ([i915#7913] / [i915#7982])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rpls-2/igt@i915_selftest@live@requests.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-2/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][42] -> [DMESG-FAIL][43] ([i915#6763])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         NOTRUN -> [ABORT][44] ([i915#6687] / [i915#7978] / [i915#8668])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][45] ([fdo#109271]) +15 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][46] -> [ABORT][47] ([i915#8442] / [i915#8668])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][48] ([fdo#109271]) +38 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [ABORT][49] ([i915#7920]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rpls-1/igt@i915_selftest@live@requests.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][51] ([i915#6367]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7369 -> IGTPW_9327

  CI-20190529: 20190529
  CI_DRM_13343: f113b6e13583b2068062c3de150051bc59f1cfac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9327: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/index.html
  IGT_7369: 22009ac9c26ceec8450dd312f5c93fc01d986348 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_ccs@block-copy-compressed
+igt@xe_ccs@block-copy-uncompressed
+igt@xe_ccs@block-multicopy-compressed
+igt@xe_ccs@block-multicopy-inplace
+igt@xe_ccs@ctrl-surf-copy
+igt@xe_ccs@ctrl-surf-copy-new-ctx
+igt@xe_ccs@suspend-resume
+igt@xe_exercise_blt@fast-copy
+igt@xe_exercise_blt@fast-copy-emit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/index.html

--===============0877924588806964766==
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
<tr><td><b>Series:</b></td><td>Extend intel_blt to work on Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120162/">https://patchwork.freedesktop.org/series/120162/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7369 -&gt; IGTPW_9327</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9327 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9327, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/index.html</p>
<h2>Participating hosts (41 -&gt; 42)</h2>
<p>Additional (2): fi-kbl-soraka fi-pnv-d510 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9327:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_busy@busy@all-engines:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">FAIL</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-atsm-1/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-atsm-1/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg2-8/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg2-8/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adlm-1/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adlm-1/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@ccs0:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg2-11/igt@gem_exec_fence@basic-await@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg2-11/igt@gem_exec_fence@basic-await@ccs0.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@ccs1:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg2-9/igt@gem_exec_fence@basic-await@ccs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg2-9/igt@gem_exec_fence@basic-await@ccs1.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-6/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-6/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rpls-2/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-2/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adlp-6/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adlp-6/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adlp-9/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adlp-9/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adln-1/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adln-1/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rplp-1/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rplp-1/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rpls-1/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-1/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/fi-rkl-11600/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-rkl-11600/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-adls-5/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-adls-5/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg1-5/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg1-5/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-dg1-7/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-dg1-7/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9327 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rpls-2/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6763">i915#6763</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +38 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7369/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7369 -&gt; IGTPW_9327</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13343: f113b6e13583b2068062c3de150051bc59f1cfac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9327: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9327/index.html<br />
  IGT_7369: 22009ac9c26ceec8450dd312f5c93fc01d986348 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_ccs@block-copy-compressed<br />
+igt@xe_ccs@block-copy-uncompressed<br />
+igt@xe_ccs@block-multicopy-compressed<br />
+igt@xe_ccs@block-multicopy-inplace<br />
+igt@xe_ccs@ctrl-surf-copy<br />
+igt@xe_ccs@ctrl-surf-copy-new-ctx<br />
+igt@xe_ccs@suspend-resume<br />
+igt@xe_exercise_blt@fast-copy<br />
+igt@xe_exercise_blt@fast-copy-emit</p>

</body>
</html>

--===============0877924588806964766==--
