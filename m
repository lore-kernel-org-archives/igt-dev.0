Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7535197254666470592=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 30 Sep 2022 17:15:23 -0000
Message-ID: <166455812363.23342.5771712274692977786@emeril.freedesktop.org>
References: <20220930115913.2640024-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220930115913.2640024-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIE5l?=
 =?utf-8?q?gative_tests_to_VRR_=28rev11=29?=
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

--===============7535197254666470592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add Negative tests to VRR (rev11)
URL   : https://patchwork.freedesktop.org/series/100539/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12203 -> IGTPW_7902
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7902 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7902, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/index.html

Participating hosts (48 -> 46)
------------------------------

  Missing    (2): fi-ctg-p8600 fi-hsw-4200u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7902:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@parse-vrr-range:
    - fi-rkl-11600:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-rkl-11600/igt@kms_vrr@parse-vrr-range.html
    - bat-dg1-5:          NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-dg1-5/igt@kms_vrr@parse-vrr-range.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-adl-ddr5/igt@kms_vrr@parse-vrr-range.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-rkl-guc/igt@kms_vrr@parse-vrr-range.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_vrr@negative-basic:
    - {bat-rpls-1}:       NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@parse-vrr-range:
    - {bat-adlm-1}:       NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-adlm-1/igt@kms_vrr@parse-vrr-range.html
    - {bat-rpls-2}:       NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-2/igt@kms_vrr@parse-vrr-range.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12203 and IGTPW_7902:

### New IGT tests (5) ###

  * igt@kms_vrr@negative-basic@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [5.45, 5.52] s

  * igt@kms_vrr@negative-basic@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [5.62, 6.16] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_7902 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-bdw-5557u:       [PASS][8] -> [INCOMPLETE][9] ([i915#146] / [i915#6712])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_vrr@flip-basic:
    - fi-icl-u2:          NOTRUN -> [SKIP][10] ([i915#3555]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-icl-u2/igt@kms_vrr@flip-basic.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][11] ([fdo#109271]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bdw-gvtdvm/igt@kms_vrr@flip-basic.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][12] ([fdo#109271]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bsw-kefka/igt@kms_vrr@flip-basic.html
    - bat-adlp-4:         NOTRUN -> [SKIP][13] ([i915#3546]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-adlp-4/igt@kms_vrr@flip-basic.html
    - fi-tgl-u2:          NOTRUN -> [SKIP][14] ([i915#3555]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-tgl-u2/igt@kms_vrr@flip-basic.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][15] ([fdo#109271]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bxt-dsi/igt@kms_vrr@flip-basic.html
    - bat-dg1-5:          NOTRUN -> [SKIP][16] ([i915#1845]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-dg1-5/igt@kms_vrr@flip-basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][17] ([fdo#109271]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-pnv-d510/igt@kms_vrr@flip-basic.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][18] ([fdo#109271]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-glk-j4005/igt@kms_vrr@flip-basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][19] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-kbl-7567u/igt@kms_vrr@flip-basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][20] ([i915#3555]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-rkl-11600/igt@kms_vrr@flip-basic.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][21] ([i915#3555]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-adl-ddr5/igt@kms_vrr@flip-basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][22] ([fdo#109271]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-cfl-guc/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - fi-blb-e6850:       NOTRUN -> [SKIP][23] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-blb-e6850/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - fi-skl-6600u:       NOTRUN -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-skl-6600u/igt@kms_vrr@negative-basic.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][25] ([fdo#109271]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-snb-2520m/igt@kms_vrr@negative-basic.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][26] ([i915#3555]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-rkl-guc/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@parse-vrr-range:
    - fi-ivb-3770:        NOTRUN -> [SKIP][27] ([fdo#109271]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-ivb-3770/igt@kms_vrr@parse-vrr-range.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][28] ([fdo#109271]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-elk-e7500/igt@kms_vrr@parse-vrr-range.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][29] ([fdo#109271]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bsw-nick/igt@kms_vrr@parse-vrr-range.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][30] ([fdo#109271]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-hsw-g3258/igt@kms_vrr@parse-vrr-range.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][31] ([fdo#109271]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-glk-dsi/igt@kms_vrr@parse-vrr-range.html
    - fi-snb-2600:        NOTRUN -> [SKIP][32] ([fdo#109271]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-snb-2600/igt@kms_vrr@parse-vrr-range.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][33] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-skl-6700k2/igt@kms_vrr@parse-vrr-range.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-cfl-8109u/igt@kms_vrr@parse-vrr-range.html
    - fi-ilk-650:         NOTRUN -> [SKIP][35] ([fdo#109271]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-ilk-650/igt@kms_vrr@parse-vrr-range.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][36] ([fdo#109271]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bdw-5557u/igt@kms_vrr@parse-vrr-range.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {bat-rpls-2}:       [SKIP][37] ([i915#2582]) -> [PASS][38] +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-rpls-2/igt@fbdev@read.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-2/igt@fbdev@read.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-adlm-1}:       [DMESG-WARN][39] ([i915#2867]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][41] ([i915#2867]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_module_load@reload:
    - {bat-rpls-2}:       [DMESG-WARN][43] ([i915#5537]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-rpls-2/igt@i915_module_load@reload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-jsl-1}:         [INCOMPLETE][45] ([i915#6106]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/fi-jsl-1/igt@i915_selftest@live@hangcheck.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-jsl-1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - {bat-rpls-1}:       [INCOMPLETE][47] ([i915#6257]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-rpls-1/igt@i915_selftest@live@requests.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - fi-bsw-kefka:       [FAIL][49] ([i915#2122]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#6106]: https://gitlab.freedesktop.org/drm/intel/issues/6106
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6712]: https://gitlab.freedesktop.org/drm/intel/issues/6712
  [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6670 -> IGTPW_7902

  CI-20190529: 20190529
  CI_DRM_12203: 40460fc26c763f07130fdafc72c39ba4110ad19b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/index.html
  IGT_6670: d618e9865fe5cbaf511ca43503abad442605d0a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_vrr@negative-basic
+igt@kms_vrr@parse-vrr-range

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/index.html

--===============7535197254666470592==
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
<tr><td><b>Series:</b></td><td>Add Negative tests to VRR (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100539/">https://patchwork.freedesktop.org/series/100539/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12203 -&gt; IGTPW_7902</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7902 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7902, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/index.html</p>
<h2>Participating hosts (48 -&gt; 46)</h2>
<p>Missing    (2): fi-ctg-p8600 fi-hsw-4200u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7902:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@parse-vrr-range:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-rkl-11600/igt@kms_vrr@parse-vrr-range.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-dg1-5/igt@kms_vrr@parse-vrr-range.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-adl-ddr5/igt@kms_vrr@parse-vrr-range.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-rkl-guc/igt@kms_vrr@parse-vrr-range.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-1/igt@kms_vrr@negative-basic.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range:</p>
<ul>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-adlm-1/igt@kms_vrr@parse-vrr-range.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-2/igt@kms_vrr@parse-vrr-range.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12203 and IGTPW_7902:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.45, 5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [5.62, 6.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7902 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6712">i915#6712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-icl-u2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bdw-gvtdvm/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bsw-kefka/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-adlp-4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +3 similar issues</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-tgl-u2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bxt-dsi/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-dg1-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-pnv-d510/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-glk-j4005/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-kbl-7567u/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-rkl-11600/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-adl-ddr5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-cfl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-blb-e6850/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-skl-6600u/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-snb-2520m/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-rkl-guc/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-ivb-3770/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-elk-e7500/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bsw-nick/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-hsw-g3258/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-glk-dsi/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-snb-2600/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-skl-6700k2/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-cfl-8109u/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-ilk-650/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bdw-5557u/igt@kms_vrr@parse-vrr-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-2/igt@fbdev@read.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-rpls-2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5537">i915#5537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-2/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6106">i915#6106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/bat-rpls-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6257">i915#6257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12203/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6670 -&gt; IGTPW_7902</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12203: 40460fc26c763f07130fdafc72c39ba4110ad19b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7902/index.html<br />
  IGT_6670: d618e9865fe5cbaf511ca43503abad442605d0a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_vrr@negative-basic<br />
+igt@kms_vrr@parse-vrr-range</p>

</body>
</html>

--===============7535197254666470592==--
