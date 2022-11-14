Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7603963417675509588=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 14 Nov 2022 08:44:45 -0000
Message-ID: <166841548541.32752.9592200247836579251@emeril.freedesktop.org>
References: <1668408044-618-1-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1668408044-618-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIG5l?=
 =?utf-8?q?w_subtest_and_test_cleanup?=
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

--===============7603963417675509588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add new subtest and test cleanup
URL   : https://patchwork.freedesktop.org/series/110845/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12374 -> IGTPW_8093
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_8093 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8093, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (2): bat-rpls-2 bat-atsm-1 
  Missing    (3): fi-hsw-4770 fi-bdw-samus fi-tgl-dsi 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8093:

### IGT changes ###

#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-rkl-guc:         [SKIP][1] ([i915#3012]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
    - bat-dg1-6:          [SKIP][3] ([i915#1155]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][5] ([i915#3012]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_backlight@basic-brightness:
    - {bat-dg2-8}:        [SKIP][7] ([i915#1155]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html
    - {bat-adlm-1}:       [SKIP][9] ([i915#1155]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-rpls-1}:       [SKIP][11] ([i915#1155]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-rpls-2}:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-9}:        [SKIP][14] ([i915#1155]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-11}:       [SKIP][16] ([i915#1155]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@migrate:
    - {bat-atsm-1}:       NOTRUN -> [INCOMPLETE][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-atsm-1/igt@i915_selftest@live@migrate.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12374 and IGTPW_8093:

### New IGT tests (1) ###

  * igt@i915_pm_backlight@basic-brightness@edp-1:
    - Statuses : 10 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8093 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-bxt-dsi:         [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html
    - fi-snb-2520m:       [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bxt-dsi:         [PASS][23] -> [DMESG-FAIL][24] ([i915#5334])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
    - fi-glk-j4005:       [PASS][25] -> [DMESG-FAIL][26] ([i915#5334])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-rkl-11600:       NOTRUN -> [SKIP][27] ([fdo#111827])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-icl-u2:          NOTRUN -> [SKIP][28] ([fdo#111827])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][29] ([fdo#111827])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@gem_huc_copy@huc-copy:
    - {bat-dg2-8}:        [FAIL][30] ([i915#7029]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-8/igt@gem_huc_copy@huc-copy.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-8/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@execlists:
    - fi-icl-u2:          [INCOMPLETE][32] -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-icl-u2/igt@i915_selftest@live@execlists.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-icl-u2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_mocs:
    - fi-rkl-guc:         [INCOMPLETE][34] ([i915#4983]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@migrate:
    - {bat-dg2-11}:       [DMESG-WARN][36] ([i915#7359]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - {bat-rpls-1}:       [INCOMPLETE][38] ([i915#4983] / [i915#6257]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-rpls-1/igt@i915_selftest@live@requests.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [INCOMPLETE][40] ([i915#4817]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7029]: https://gitlab.freedesktop.org/drm/intel/issues/7029
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7358]: https://gitlab.freedesktop.org/drm/intel/issues/7358
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7053 -> IGTPW_8093

  CI-20190529: 20190529
  CI_DRM_12374: 7963775fe0f4b1a4739dd6808abfd7fdf467779c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8093: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/index.html
  IGT_7053: a9e73e6c48ab6632e2adb095cb809118b437fdfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_backlight@fade-with-dpms
+igt@i915_pm_backlight@fade-with-suspend
-igt@i915_pm_backlight@fade_with_dpms
-igt@i915_pm_backlight@fade_with_suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/index.html

--===============7603963417675509588==
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
<tr><td><b>Series:</b></td><td>Add new subtest and test cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110845/">https://patchwork.freedesktop.org/series/110845/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12374 -&gt; IGTPW_8093</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_8093 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8093, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (2): bat-rpls-2 bat-atsm-1 <br />
  Missing    (3): fi-hsw-4770 fi-bdw-samus fi-tgl-dsi </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8093:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
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
<p>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-atsm-1/igt@i915_selftest@live@migrate.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12374 and IGTPW_8093:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_pm_backlight@basic-brightness@edp-1:<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8093 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7029">i915#7029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-icl-u2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-icl-u2/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7359">i915#7359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/bat-rpls-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6257">i915#6257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12374/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7053 -&gt; IGTPW_8093</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12374: 7963775fe0f4b1a4739dd6808abfd7fdf467779c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8093: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8093/index.html<br />
  IGT_7053: a9e73e6c48ab6632e2adb095cb809118b437fdfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_backlight@fade-with-dpms<br />
+igt@i915_pm_backlight@fade-with-suspend<br />
-igt@i915_pm_backlight@fade_with_dpms<br />
-igt@i915_pm_backlight@fade_with_suspend</p>

</body>
</html>

--===============7603963417675509588==--
