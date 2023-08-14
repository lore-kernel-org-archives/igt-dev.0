Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2996177359028717211=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Mon, 14 Aug 2023 09:41:58 -0000
Message-ID: <169200611871.19472.6934287177773640181@emeril.freedesktop.org>
References: <20230814080527.3017102-1-jeevan.b@intel.com>
In-Reply-To: <20230814080527.3017102-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUkZDOiB0?=
 =?utf-8?q?ests/kms=5Fsetmode=3A_rename_subtest_to_simplify_test_combinati?=
 =?utf-8?q?ons?=
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

--===============2996177359028717211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: tests/kms_setmode: rename subtest to simplify test combinations
URL   : https://patchwork.freedesktop.org/series/122409/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7435 -> IGTPW_9583
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9583 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9583, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/index.html

Participating hosts (41 -> 40)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9583:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - fi-apl-guc:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/fi-apl-guc/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adlp-9:         [SKIP][3] ([i915#3555]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-rkl-11600:       [SKIP][5] ([i915#3555] / [i915#4098]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adls-5:         [SKIP][7] ([i915#3555]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-adls-5/igt@kms_setmode@basic-clone-single-crtc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-adls-5/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-5:          [SKIP][9] ([i915#3555]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-9:          [SKIP][11] ([i915#3555]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-tgl-1115g4:      [SKIP][13] ([i915#3555]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-6:         [SKIP][15] ([i915#8809]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-rpls-2:         [SKIP][17] ([i915#3555]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-11:         [SKIP][19] ([i915#3555]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-8:         [SKIP][21] ([i915#8809]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-8:          [SKIP][23] ([i915#3555]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adlm-1:         [SKIP][25] ([i915#3555]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-rpls-1:         [SKIP][27] ([i915#3555]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-rpls-1/igt@kms_setmode@basic-clone-single-crtc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-1/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_setmode@basic-clone-single-crtc:
    - {bat-dg2-14}:       [SKIP][29] ([i915#3555]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html

  
Known issues
------------

  Here are the changes found in IGTPW_9583 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         [PASS][31] -> [DMESG-FAIL][32] ([i915#7059])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][33] ([i915#4258] / [i915#7913])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@migrate:
    - bat-mtlp-8:         NOTRUN -> [DMESG-FAIL][34] ([i915#7699])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-6:         [PASS][35] -> [DMESG-FAIL][36] ([i915#8497])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [DMESG-WARN][37] ([i915#6367])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@i915_selftest@live@slpc.html
    - bat-mtlp-8:         NOTRUN -> [DMESG-WARN][38] ([i915#6367])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-8:         NOTRUN -> [SKIP][39] ([i915#6645])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-rpls-2:         NOTRUN -> [SKIP][40] ([i915#7828])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][41] ([i915#7828])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-rpls-2:         NOTRUN -> [SKIP][42] ([i915#1845])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][43] ([i915#5334] / [i915#7872]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-rpls-2:         [INCOMPLETE][45] ([i915#4983] / [i915#7913]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-rpls-2/igt@i915_selftest@live@gt_lrc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@guc:
    - bat-rpls-1:         [DMESG-WARN][47] ([i915#7852]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-rpls-1/igt@i915_selftest@live@guc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-1/igt@i915_selftest@live@guc.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][49] ([i915#6367]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  
#### Warnings ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [ABORT][51] ([i915#7982] / [i915#8865]) -> [DMESG-FAIL][52] ([i915#8497])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-3:          [SKIP][53] ([i915#3555]) -> [SKIP][54] ([fdo#112080])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-jsl-1:          [SKIP][55] ([i915#3555]) -> [SKIP][56] ([fdo#112080])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7435 -> IGTPW_9583

  CI-20190529: 20190529
  CI_DRM_13515: 8dffdb87e35b56a507daec2cbcf5814a7e44d15c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9583: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/index.html
  IGT_7435: b6eaa6bfdc94c94b34ec80f437c4b6125eb19357 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_setmode@clone-single-crtc-negative
-igt@kms_setmode@basic-clone-single-crtc
-igt@kms_setmode@invalid-clone-exclusive-crtc
-igt@kms_setmode@invalid-clone-single-crtc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/index.html

--===============2996177359028717211==
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
<tr><td><b>Series:</b></td><td>RFC: tests/kms_setmode: rename subtest to simplify test combinations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122409/">https://patchwork.freedesktop.org/series/122409/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7435 -&gt; IGTPW_9583</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9583 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9583, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9583:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-adls-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-adls-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-rpls-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_setmode@basic-clone-single-crtc:<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9583 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-6/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-rpls-2/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-2/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-rpls-1/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7852">i915#7852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-rpls-1/igt@i915_selftest@live@guc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8865">i915#8865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-mtlp-8/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7435/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7435 -&gt; IGTPW_9583</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13515: 8dffdb87e35b56a507daec2cbcf5814a7e44d15c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9583: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9583/index.html<br />
  IGT_7435: b6eaa6bfdc94c94b34ec80f437c4b6125eb19357 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_setmode@clone-single-crtc-negative<br />
-igt@kms_setmode@basic-clone-single-crtc<br />
-igt@kms_setmode@invalid-clone-exclusive-crtc<br />
-igt@kms_setmode@invalid-clone-single-crtc</p>

</body>
</html>

--===============2996177359028717211==--
