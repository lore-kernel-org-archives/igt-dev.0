Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3956840012108524770=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Tue, 15 Nov 2022 15:42:32 -0000
Message-ID: <166852695258.16900.396206706866457195@emeril.freedesktop.org>
References: <1668517250-4514-1-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1668517250-4514-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIG5l?=
 =?utf-8?q?w_subtest_and_test_cleanup_=28rev3=29?=
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

--===============3956840012108524770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add new subtest and test cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/110845/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12382 -> IGTPW_8106
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8106 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8106, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/index.html

Participating hosts (40 -> 41)
------------------------------

  Additional (3): fi-kbl-soraka fi-hsw-4770 bat-atsm-1 
  Missing    (2): bat-dg2-11 bat-dg1-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8106:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@perf:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@i915_selftest@live@perf.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-rkl-guc:         [SKIP][2] ([i915#3012]) -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][4] ([i915#3012]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
    - bat-dg1-5:          [SKIP][6] ([i915#1155]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_backlight@basic-brightness:
    - {bat-rpls-2}:       [SKIP][8] ([i915#1155]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-8}:        [SKIP][10] ([i915#1155]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html
    - {bat-adlm-1}:       [SKIP][12] ([i915#1155]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-rpls-1}:       [SKIP][14] ([i915#1155]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg1-7}:        [SKIP][16] ([i915#1155]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg1-7/igt@i915_pm_backlight@basic-brightness.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg1-7/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-9}:        [SKIP][18] ([i915#1155]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12382 and IGTPW_8106:

### New IGT tests (1) ###

  * igt@i915_pm_backlight@basic-brightness@edp-1:
    - Statuses : 11 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8106 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][20] ([fdo#109271]) +8 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#2190])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_softpin@allocator-basic-reserve:
    - fi-hsw-4770:        NOTRUN -> [SKIP][23] ([fdo#109271]) +10 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-snb-2520m:       [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html
    - fi-bxt-dsi:         [PASS][26] -> [SKIP][27] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][28] ([i915#1886])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        NOTRUN -> [INCOMPLETE][29] ([i915#4785])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-hsw-4770:        NOTRUN -> [SKIP][30] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][31] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#1072]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][33] ([fdo#109271] / [i915#4312] / [i915#5594])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_huc_copy@huc-copy:
    - {bat-dg2-8}:        [FAIL][34] ([i915#7029]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg2-8/igt@gem_huc_copy@huc-copy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg2-8/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@mman:
    - {bat-rpls-1}:       [TIMEOUT][36] ([i915#6794]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-rpls-1/igt@i915_selftest@live@mman.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-rpls-1/igt@i915_selftest@live@mman.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7029]: https://gitlab.freedesktop.org/drm/intel/issues/7029
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7358]: https://gitlab.freedesktop.org/drm/intel/issues/7358
  [i915#7535]: https://gitlab.freedesktop.org/drm/intel/issues/7535


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7057 -> IGTPW_8106

  CI-20190529: 20190529
  CI_DRM_12382: cb74864693414b221b3601572e75449558126e8b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8106: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/index.html
  IGT_7057: e2138d48c2c506816868c16cf3ba64f81bdead41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_backlight@fade-with-dpms
+igt@i915_pm_backlight@fade-with-suspend
-igt@i915_pm_backlight@fade_with_dpms
-igt@i915_pm_backlight@fade_with_suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/index.html

--===============3956840012108524770==
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
<tr><td><b>Series:</b></td><td>Add new subtest and test cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110845/">https://patchwork.freedesktop.org/series/110845/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12382 -&gt; IGTPW_8106</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8106 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8106, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/index.html</p>
<h2>Participating hosts (40 -&gt; 41)</h2>
<p>Additional (3): fi-kbl-soraka fi-hsw-4770 bat-atsm-1 <br />
  Missing    (2): bat-dg2-11 bat-dg1-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8106:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@perf:<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@i915_selftest@live@perf.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg1-7}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg1-7/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg1-7/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12382 and IGTPW_8106:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_pm_backlight@basic-brightness@edp-1:<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8106 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7029">i915#7029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/bat-rpls-1/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/bat-rpls-1/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7057 -&gt; IGTPW_8106</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12382: cb74864693414b221b3601572e75449558126e8b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8106: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8106/index.html<br />
  IGT_7057: e2138d48c2c506816868c16cf3ba64f81bdead41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_backlight@fade-with-dpms<br />
+igt@i915_pm_backlight@fade-with-suspend<br />
-igt@i915_pm_backlight@fade_with_dpms<br />
-igt@i915_pm_backlight@fade_with_suspend</p>

</body>
</html>

--===============3956840012108524770==--
