Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F02DC54E58
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 08:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C409A10E16F;
	Tue, 26 Mar 2024 08:11:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C5510E16C;
 Tue, 26 Mar 2024 08:11:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0852975870407090776=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Add_support_to_paint_alread?=
 =?utf-8?q?y_mmaped_buffer_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vandita Kulkarni" <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 08:11:09 -0000
Message-ID: <171144066910.1039584.15410720823697055562@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325093730.13640-1-vandita.kulkarni@intel.com>
In-Reply-To: <20240325093730.13640-1-vandita.kulkarni@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

--===============0852975870407090776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support to paint already mmaped buffer (rev3)
URL   : https://patchwork.freedesktop.org/series/131167/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14482 -> IGTPW_10913
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10913 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10913, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/index.html

Participating hosts (37 -> 34)
------------------------------

  Additional (2): bat-arls-4 fi-glk-j4005 
  Missing    (5): bat-dg1-7 fi-snb-2520m bat-dg2-11 bat-mtlp-8 bat-arls-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10913:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
    - bat-jsl-1:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-jsl-1/igt@kms_frontbuffer_tracking@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-jsl-1/igt@kms_frontbuffer_tracking@basic.html
    - fi-tgl-1115g4:      [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html
    - bat-arls-1:         [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-arls-1/igt@kms_frontbuffer_tracking@basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-arls-1/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-9:         [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-adlp-9/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-adlp-9/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-8700k:       [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-14:         [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-14/igt@kms_frontbuffer_tracking@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-14/igt@kms_frontbuffer_tracking@basic.html
    - fi-rkl-11600:       [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-guc:         [PASS][16] -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-kbl-7567u:       [DMESG-WARN][18] ([i915#8585] / [i915#9730]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@kms_frontbuffer_tracking@basic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-rpls-3:         [SKIP][20] ([i915#9920]) -> [SKIP][21] +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-rpls-3/igt@kms_pipe_crc_basic@read-crc.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-rpls-3/igt@kms_pipe_crc_basic@read-crc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {bat-mtlp-9}:       [SKIP][22] ([i915#4213]) -> [SKIP][23] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - {bat-mtlp-9}:       [PASS][24] -> [SKIP][25] +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - {bat-mtlp-9}:       [SKIP][26] ([i915#3555] / [i915#3840] / [i915#9159]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-mtlp-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-arls-4}:       NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-arls-4/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][29] +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc.html

  
Known issues
------------

  Here are the changes found in IGTPW_10913 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][30] ([i915#2190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][31] ([i915#2190])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][32] ([i915#4613]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-glk-j4005/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][33] ([i915#4613]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][34] +10 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][35] +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-14:         [FAIL][36] ([i915#10378]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_module_load@load:
    - fi-kbl-7567u:       [DMESG-WARN][38] ([i915#180] / [i915#1982] / [i915#8585]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@i915_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@i915_module_load@load.html

  * igt@i915_selftest@live@execlists:
    - bat-dg2-14:         [ABORT][40] ([i915#10366]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-14/igt@i915_selftest@live@execlists.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-14/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_pm:
    - bat-dg2-9:          [ABORT][42] ([i915#10366]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-9/igt@i915_selftest@live@gt_pm.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-9/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - bat-rpls-3:         [DMESG-WARN][44] ([i915#5591]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@mman:
    - bat-dg2-8:          [ABORT][46] ([i915#10366]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-8/igt@i915_selftest@live@mman.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-8/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][48] ([i915#9730]) -> [PASS][49] +37 other tests pass
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - fi-kbl-7567u:       [DMESG-WARN][50] ([i915#8585] / [i915#9730]) -> [PASS][51] +39 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-kbl-7567u:       [DMESG-WARN][52] ([i915#8585]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@kms_force_connector_basic@prune-stale-modes.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][54] ([i915#180] / [i915#8585]) -> [PASS][55] +40 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
  [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
  [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9730]: https://gitlab.freedesktop.org/drm/intel/issues/9730
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
  [i915#9920]: https://gitlab.freedesktop.org/drm/intel/issues/9920


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7782 -> IGTPW_10913

  CI-20190529: 20190529
  CI_DRM_14482: 4a8fabcf2f1aadbbb777a94edd01549c2aa95caf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10913: 10913
  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/index.html

--===============0852975870407090776==
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
<tr><td><b>Series:</b></td><td>Add support to paint already mmaped buffer (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131167/">https://patchwork.freedesktop.org/series/131167/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14482 -&gt; IGTPW_10913</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10913 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10913, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/index.html</p>
<h2>Participating hosts (37 -&gt; 34)</h2>
<p>Additional (2): bat-arls-4 fi-glk-j4005 <br />
  Missing    (5): bat-dg1-7 fi-snb-2520m bat-dg2-11 bat-mtlp-8 bat-arls-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10913:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-jsl-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-jsl-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-arls-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-arls-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-adlp-9/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-adlp-9/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-14/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-14/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-rpls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-rpls-3/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9920">i915#9920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-rpls-3/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9159">i915#9159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-arls-4/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10913 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-glk-j4005/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-14/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-14/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-9/igt@i915_selftest@live@gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-9/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-rpls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/bat-dg2-8/igt@i915_selftest@live@mman.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/bat-dg2-8/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14482/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10913/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +40 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7782 -&gt; IGTPW_10913</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14482: 4a8fabcf2f1aadbbb777a94edd01549c2aa95caf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10913: 10913<br />
  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0852975870407090776==--
