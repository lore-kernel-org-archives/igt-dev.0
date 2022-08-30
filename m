Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7069266722370120179=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 30 Aug 2022 04:16:29 -0000
Message-ID: <166183298961.27287.16467951634113363349@emeril.freedesktop.org>
References: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fcursor=3A_Convert_tests_to_dynamic_=28rev3=29?=
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

--===============7069266722370120179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_cursor: Convert tests to dynamic (rev3)
URL   : https://patchwork.freedesktop.org/series/107119/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12046 -> IGTPW_7703
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html

Participating hosts (37 -> 35)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (3): fi-ctg-p8600 fi-bdw-samus fi-hsw-4200u 

Known issues
------------

  Here are the changes found in IGTPW_7703 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][1] ([i915#6179])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][2] -> [INCOMPLETE][3] ([i915#4785])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][4] -> [DMESG-FAIL][5] ([i915#4528])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][7] ([fdo#109271] / [i915#4312] / [i915#5594] / [i915#6246])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-hsw-4770/igt@runner@aborted.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][8] ([i915#4312])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][9] ([i915#2867]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [INCOMPLETE][11] ([i915#3303] / [i915#4785]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [FAIL][13] ([i915#6298]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [INCOMPLETE][15] ([i915#5982]) -> [FAIL][16] ([fdo#103375])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6179]: https://gitlab.freedesktop.org/drm/intel/issues/6179
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6530]: https://gitlab.freedesktop.org/drm/intel/issues/6530
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6637]: https://gitlab.freedesktop.org/drm/intel/issues/6637
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6637 -> IGTPW_7703

  CI-20190529: 20190529
  CI_DRM_12046: 3670ab033054d1817e1480cc7a1fdab412231876 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7703: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html
  IGT_6637: a23e8aed0b54018339647d0817267431bd2b7075 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_cursor@overlay
+igt@kms_plane_cursor@primary
+igt@kms_plane_cursor@viewport
-igt@kms_plane_cursor@pipe-a-overlay-size-64
-igt@kms_plane_cursor@pipe-a-overlay-size-128
-igt@kms_plane_cursor@pipe-a-overlay-size-256
-igt@kms_plane_cursor@pipe-a-primary-size-64
-igt@kms_plane_cursor@pipe-a-primary-size-128
-igt@kms_plane_cursor@pipe-a-primary-size-256
-igt@kms_plane_cursor@pipe-a-viewport-size-64
-igt@kms_plane_cursor@pipe-a-viewport-size-128
-igt@kms_plane_cursor@pipe-a-viewport-size-256
-igt@kms_plane_cursor@pipe-b-overlay-size-64
-igt@kms_plane_cursor@pipe-b-overlay-size-128
-igt@kms_plane_cursor@pipe-b-overlay-size-256
-igt@kms_plane_cursor@pipe-b-primary-size-64
-igt@kms_plane_cursor@pipe-b-primary-size-128
-igt@kms_plane_cursor@pipe-b-primary-size-256
-igt@kms_plane_cursor@pipe-b-viewport-size-64
-igt@kms_plane_cursor@pipe-b-viewport-size-128
-igt@kms_plane_cursor@pipe-b-viewport-size-256
-igt@kms_plane_cursor@pipe-c-overlay-size-64
-igt@kms_plane_cursor@pipe-c-overlay-size-128
-igt@kms_plane_cursor@pipe-c-overlay-size-256
-igt@kms_plane_cursor@pipe-c-primary-size-64
-igt@kms_plane_cursor@pipe-c-primary-size-128
-igt@kms_plane_cursor@pipe-c-primary-size-256
-igt@kms_plane_cursor@pipe-c-viewport-size-64
-igt@kms_plane_cursor@pipe-c-viewport-size-128
-igt@kms_plane_cursor@pipe-c-viewport-size-256
-igt@kms_plane_cursor@pipe-d-overlay-size-64
-igt@kms_plane_cursor@pipe-d-overlay-size-128
-igt@kms_plane_cursor@pipe-d-overlay-size-256
-igt@kms_plane_cursor@pipe-d-primary-size-64
-igt@kms_plane_cursor@pipe-d-primary-size-128
-igt@kms_plane_cursor@pipe-d-primary-size-256
-igt@kms_plane_cursor@pipe-d-viewport-size-64
-igt@kms_plane_cursor@pipe-d-viewport-size-128
-igt@kms_plane_cursor@pipe-d-viewport-size-256
-igt@kms_plane_cursor@pipe-e-overlay-size-64
-igt@kms_plane_cursor@pipe-e-overlay-size-128
-igt@kms_plane_cursor@pipe-e-overlay-size-256
-igt@kms_plane_cursor@pipe-e-primary-size-64
-igt@kms_plane_cursor@pipe-e-primary-size-128
-igt@kms_plane_cursor@pipe-e-primary-size-256
-igt@kms_plane_cursor@pipe-e-viewport-size-64
-igt@kms_plane_cursor@pipe-e-viewport-size-128
-igt@kms_plane_cursor@pipe-e-viewport-size-256
-igt@kms_plane_cursor@pipe-f-overlay-size-64
-igt@kms_plane_cursor@pipe-f-overlay-size-128
-igt@kms_plane_cursor@pipe-f-overlay-size-256
-igt@kms_plane_cursor@pipe-f-primary-size-64
-igt@kms_plane_cursor@pipe-f-primary-size-128
-igt@kms_plane_cursor@pipe-f-primary-size-256
-igt@kms_plane_cursor@pipe-f-viewport-size-64
-igt@kms_plane_cursor@pipe-f-viewport-size-128
-igt@kms_plane_cursor@pipe-f-viewport-size-256

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html

--===============7069266722370120179==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_cursor: Convert tests to dynamic (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107119/">https://patchwork.freedesktop.org/series/107119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12046 -&gt; IGTPW_7703</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (3): fi-ctg-p8600 fi-bdw-samus fi-hsw-4200u </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7703 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6179">i915#6179</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6637 -&gt; IGTPW_7703</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12046: 3670ab033054d1817e1480cc7a1fdab412231876 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7703: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html<br />
  IGT_6637: a23e8aed0b54018339647d0817267431bd2b7075 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_cursor@overlay<br />
+igt@kms_plane_cursor@primary<br />
+igt@kms_plane_cursor@viewport<br />
-igt@kms_plane_cursor@pipe-a-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-a-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-a-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-a-primary-size-64<br />
-igt@kms_plane_cursor@pipe-a-primary-size-128<br />
-igt@kms_plane_cursor@pipe-a-primary-size-256<br />
-igt@kms_plane_cursor@pipe-a-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-a-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-a-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-b-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-b-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-b-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-b-primary-size-64<br />
-igt@kms_plane_cursor@pipe-b-primary-size-128<br />
-igt@kms_plane_cursor@pipe-b-primary-size-256<br />
-igt@kms_plane_cursor@pipe-b-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-b-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-b-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-c-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-c-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-c-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-c-primary-size-64<br />
-igt@kms_plane_cursor@pipe-c-primary-size-128<br />
-igt@kms_plane_cursor@pipe-c-primary-size-256<br />
-igt@kms_plane_cursor@pipe-c-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-c-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-c-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-d-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-d-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-d-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-d-primary-size-64<br />
-igt@kms_plane_cursor@pipe-d-primary-size-128<br />
-igt@kms_plane_cursor@pipe-d-primary-size-256<br />
-igt@kms_plane_cursor@pipe-d-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-d-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-d-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-e-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-e-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-e-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-e-primary-size-64<br />
-igt@kms_plane_cursor@pipe-e-primary-size-128<br />
-igt@kms_plane_cursor@pipe-e-primary-size-256<br />
-igt@kms_plane_cursor@pipe-e-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-e-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-e-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-f-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-f-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-f-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-f-primary-size-64<br />
-igt@kms_plane_cursor@pipe-f-primary-size-128<br />
-igt@kms_plane_cursor@pipe-f-primary-size-256<br />
-igt@kms_plane_cursor@pipe-f-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-f-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-f-viewport-size-256</p>

</body>
</html>

--===============7069266722370120179==--
