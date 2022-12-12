Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2389481660731674160=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Mon, 12 Dec 2022 07:02:56 -0000
Message-ID: <167082857601.12116.9524549358050323270@emeril.freedesktop.org>
References: <20221212061233.2220742-1-ashutosh.dixit@intel.com>
In-Reply-To: <20221212061233.2220742-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fhwmon=3A_General_verification_of_hwmon_attributes?=
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

--===============2389481660731674160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_hwmon: General verification of hwmon attributes
URL   : https://patchwork.freedesktop.org/series/111833/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12491 -> IGTPW_8220
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/index.html

Participating hosts (41 -> 24)
------------------------------

  Missing    (17): fi-kbl-soraka bat-kbl-2 bat-adls-5 bat-adlp-9 bat-dg1-5 fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 bat-adlp-6 bat-adlp-4 bat-atsm-1 bat-jsl-3 bat-dg2-11 fi-bsw-nick fi-skl-6600u fi-snb-2600 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8220:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_hwmon@hwmon-read} (NEW):
    - {bat-rplp-1}:       NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-rplp-1/igt@i915_hwmon@hwmon-read.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-rkl-11600/igt@i915_hwmon@hwmon-read.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-adl-ddr5/igt@i915_hwmon@hwmon-read.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-ehl-2/igt@i915_hwmon@hwmon-read.html

  * {igt@i915_hwmon@hwmon-write} (NEW):
    - {bat-rpls-2}:       NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-rpls-2/igt@i915_hwmon@hwmon-write.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-jsl-1/igt@i915_hwmon@hwmon-write.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-jsl-1/igt@i915_hwmon@hwmon-write.html
    - fi-icl-u2:          NOTRUN -> [SKIP][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-icl-u2/igt@i915_hwmon@hwmon-write.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][9] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-rkl-guc/igt@i915_hwmon@hwmon-write.html
    - {bat-adln-1}:       NOTRUN -> [SKIP][10] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-adln-1/igt@i915_hwmon@hwmon-write.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest:
    - {fi-jsl-1}:         NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-jsl-1/igt@i915_selftest.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12491 and IGTPW_8220:

### New IGT tests (2) ###

  * igt@i915_hwmon@hwmon-read:
    - Statuses : 2 pass(s) 22 skip(s)
    - Exec time: [0.0] s

  * igt@i915_hwmon@hwmon-write:
    - Statuses : 2 pass(s) 22 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8220 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@i915_hwmon@hwmon-read} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-elk-e7500/igt@i915_hwmon@hwmon-read.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][13] ([fdo#109271]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-bsw-kefka/igt@i915_hwmon@hwmon-read.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][14] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-cfl-guc/igt@i915_hwmon@hwmon-read.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][15] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-hsw-4770/igt@i915_hwmon@hwmon-read.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-ivb-3770/igt@i915_hwmon@hwmon-read.html

  * {igt@i915_hwmon@hwmon-write} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][17] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-bdw-gvtdvm/igt@i915_hwmon@hwmon-write.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-pnv-d510/igt@i915_hwmon@hwmon-write.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][19] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-glk-j4005/igt@i915_hwmon@hwmon-write.html
    - fi-skl-guc:         NOTRUN -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-skl-guc/igt@i915_hwmon@hwmon-write.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][21] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-skl-6700k2/igt@i915_hwmon@hwmon-write.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-kbl-7567u/igt@i915_hwmon@hwmon-write.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][23] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-kbl-8809g/igt@i915_hwmon@hwmon-write.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][24] -> [INCOMPLETE][25] ([i915#4817])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - {bat-adln-1}:       [DMESG-FAIL][26] ([i915#4258]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/bat-adln-1/igt@i915_selftest@live@gt_pm.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-adln-1/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][28] ([i915#6298]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7355]: https://gitlab.freedesktop.org/drm/intel/issues/7355


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7090 -> IGTPW_8220

  CI-20190529: 20190529
  CI_DRM_12491: d322881f7e33af24901ee8ccaec3beef82f21203 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8220: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/index.html
  IGT_7090: 5aafcf060b6dfbb2fa7aace76c8074d98ac7da8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_hwmon@hwmon-read
+igt@i915_hwmon@hwmon-write
-igt@msm_shrink@copy-gpu-8
-igt@msm_shrink@copy-gpu-32
-igt@msm_shrink@copy-gpu-madvise-8
-igt@msm_shrink@copy-gpu-madvise-32
-igt@msm_shrink@copy-gpu-oom-8
-igt@msm_shrink@copy-gpu-oom-32
-igt@msm_shrink@copy-gpu-sanitycheck-8
-igt@msm_shrink@copy-gpu-sanitycheck-32
-igt@msm_shrink@copy-mmap-8
-igt@msm_shrink@copy-mmap-32
-igt@msm_shrink@copy-mmap-dmabuf-8
-igt@msm_shrink@copy-mmap-dmabuf-32
-igt@msm_shrink@copy-mmap-dmabuf-madvise-8
-igt@msm_shrink@copy-mmap-dmabuf-madvise-32
-igt@msm_shrink@copy-mmap-dmabuf-oom-8
-igt@msm_shrink@copy-mmap-dmabuf-oom-32
-igt@msm_shrink@copy-mmap-dmabuf-sanitycheck-8
-igt@msm_shrink@copy-mmap-dmabuf-sanitycheck-32
-igt@msm_shrink@copy-mmap-madvise-8
-igt@msm_shrink@copy-mmap-madvise-32
-igt@msm_shrink@copy-mmap-oom-8
-igt@msm_shrink@copy-mmap-oom-32
-igt@msm_shrink@copy-mmap-sanitycheck-8
-igt@msm_shrink@copy-mmap-sanitycheck-32

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/index.html

--===============2389481660731674160==
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
<tr><td><b>Series:</b></td><td>i915/i915_hwmon: General verification of hwmon attributes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111833/">https://patchwork.freedesktop.org/series/111833/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12491 -&gt; IGTPW_8220</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/index.html</p>
<h2>Participating hosts (41 -&gt; 24)</h2>
<p>Missing    (17): fi-kbl-soraka bat-kbl-2 bat-adls-5 bat-adlp-9 bat-dg1-5 fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 bat-adlp-6 bat-adlp-4 bat-atsm-1 bat-jsl-3 bat-dg2-11 fi-bsw-nick fi-skl-6600u fi-snb-2600 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8220:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_hwmon@hwmon-read} (NEW):</p>
<ul>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-rplp-1/igt@i915_hwmon@hwmon-read.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-rkl-11600/igt@i915_hwmon@hwmon-read.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-adl-ddr5/igt@i915_hwmon@hwmon-read.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-ehl-2/igt@i915_hwmon@hwmon-read.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_hwmon@hwmon-write} (NEW):</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-rpls-2/igt@i915_hwmon@hwmon-write.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-jsl-1/igt@i915_hwmon@hwmon-write.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-jsl-1/igt@i915_hwmon@hwmon-write.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-icl-u2/igt@i915_hwmon@hwmon-write.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-rkl-guc/igt@i915_hwmon@hwmon-write.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-adln-1/igt@i915_hwmon@hwmon-write.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest:<ul>
<li>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-jsl-1/igt@i915_selftest.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12491 and IGTPW_8220:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>Statuses : 2 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-write:</p>
<ul>
<li>Statuses : 2 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8220 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@i915_hwmon@hwmon-read} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-elk-e7500/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-bsw-kefka/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-cfl-guc/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-hsw-4770/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-ivb-3770/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_hwmon@hwmon-write} (NEW):</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-bdw-gvtdvm/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-pnv-d510/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-glk-j4005/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-skl-guc/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-skl-6700k2/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-kbl-7567u/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-kbl-8809g/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/bat-adln-1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/bat-adln-1/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7090 -&gt; IGTPW_8220</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12491: d322881f7e33af24901ee8ccaec3beef82f21203 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8220: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8220/index.html<br />
  IGT_7090: 5aafcf060b6dfbb2fa7aace76c8074d98ac7da8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_hwmon@hwmon-read<br />
+igt@i915_hwmon@hwmon-write<br />
-igt@msm_shrink@copy-gpu-8<br />
-igt@msm_shrink@copy-gpu-32<br />
-igt@msm_shrink@copy-gpu-madvise-8<br />
-igt@msm_shrink@copy-gpu-madvise-32<br />
-igt@msm_shrink@copy-gpu-oom-8<br />
-igt@msm_shrink@copy-gpu-oom-32<br />
-igt@msm_shrink@copy-gpu-sanitycheck-8<br />
-igt@msm_shrink@copy-gpu-sanitycheck-32<br />
-igt@msm_shrink@copy-mmap-8<br />
-igt@msm_shrink@copy-mmap-32<br />
-igt@msm_shrink@copy-mmap-dmabuf-8<br />
-igt@msm_shrink@copy-mmap-dmabuf-32<br />
-igt@msm_shrink@copy-mmap-dmabuf-madvise-8<br />
-igt@msm_shrink@copy-mmap-dmabuf-madvise-32<br />
-igt@msm_shrink@copy-mmap-dmabuf-oom-8<br />
-igt@msm_shrink@copy-mmap-dmabuf-oom-32<br />
-igt@msm_shrink@copy-mmap-dmabuf-sanitycheck-8<br />
-igt@msm_shrink@copy-mmap-dmabuf-sanitycheck-32<br />
-igt@msm_shrink@copy-mmap-madvise-8<br />
-igt@msm_shrink@copy-mmap-madvise-32<br />
-igt@msm_shrink@copy-mmap-oom-8<br />
-igt@msm_shrink@copy-mmap-oom-32<br />
-igt@msm_shrink@copy-mmap-sanitycheck-8<br />
-igt@msm_shrink@copy-mmap-sanitycheck-32</p>

</body>
</html>

--===============2389481660731674160==--
