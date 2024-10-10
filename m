Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF38CF07BE
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 07:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A9110E880;
	Thu, 10 Oct 2024 07:54:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB2610E880;
 Thu, 10 Oct 2024 07:54:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6727381981565228641=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/xe=3A_Add_tests_to_va?=
 =?utf-8?q?lidate_GT_coarse_power_gating_status_and_toggle_coarse_power_gati?=
 =?utf-8?q?ng_states_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Oct 2024 07:54:46 -0000
Message-ID: <172854688644.1214169.14082368656805072957@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010065312.1988533-1-sk.anirban@intel.com>
In-Reply-To: <20241010065312.1988533-1-sk.anirban@intel.com>
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

--===============6727381981565228641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states (rev2)
URL   : https://patchwork.freedesktop.org/series/139808/
State : success

== Summary ==

CI Bug Log - changes from IGT_8063 -> IGTPW_11895
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11895:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pm_residency@cpg-basic} (NEW):
    - bat-arls-1:         NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arls-1/igt@xe_pm_residency@cpg-basic.html

  * {igt@xe_pm_residency@toggle-gt-cpg} (NEW):
    - {bat-arlh-3}:       NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arlh-3/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-dg1-7:          NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg1-7/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-adlp-9:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adlp-9/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-rpls-4:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-rpls-4/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-twl-1:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-twl-1/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-arls-5:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arls-5/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-rplp-1:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-rplp-1/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-arlh-2:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arlh-2/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-dg2-9:          NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg2-9/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-adlp-11:        NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adlp-11/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-arls-2:         NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arls-2/igt@xe_pm_residency@toggle-gt-cpg.html
    - {bat-dg1-6}:        NOTRUN -> [SKIP][13] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg1-6/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-adlp-6:         NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adlp-6/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-mtlp-6/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-twl-2:          NOTRUN -> [SKIP][16] +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-twl-2/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-dg2-11:         NOTRUN -> [SKIP][17] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg2-11/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-jsl-3:          NOTRUN -> [SKIP][18] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-jsl-3/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][19] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-mtlp-8/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-dg2-8:          NOTRUN -> [SKIP][20] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg2-8/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-adls-6:         NOTRUN -> [SKIP][21] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adls-6/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-adlm-1:         NOTRUN -> [SKIP][22] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adlm-1/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-jsl-1:          NOTRUN -> [SKIP][23] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-jsl-1/igt@xe_pm_residency@toggle-gt-cpg.html

  
New tests
---------

  New tests have been introduced between IGT_8063 and IGTPW_11895:

### New IGT tests (2) ###

  * igt@xe_pm_residency@cpg-basic:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pm_residency@toggle-gt-cpg:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11895 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-dg2-14:         NOTRUN -> [FAIL][24] ([i915#12292])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg2-14/igt@runner@aborted.html

  * {igt@xe_pm_residency@cpg-basic} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][25] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-bsw-n3050/igt@xe_pm_residency@cpg-basic.html

  * {igt@xe_pm_residency@toggle-gt-cpg} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][26] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-glk-j4005/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][27] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][28] +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-rkl-11600/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][29] +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-cfl-guc/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][30] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-x1275/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][31] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-cfl-8109u/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-ilk-650:         NOTRUN -> [SKIP][32] +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-ilk-650/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][33] ([i915#2575]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-tgl-1115g4/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][34] +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-blb-e6850/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][35] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-cfl-8700k/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][36] +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-bsw-nick/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-kbl-2:          NOTRUN -> [SKIP][37] +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-kbl-2/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][38] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-hsw-4770/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][39] +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-ivb-3770/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][40] +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-elk-e7500/igt@xe_pm_residency@toggle-gt-cpg.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][41] +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-guc/igt@xe_pm_residency@toggle-gt-cpg.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-kbl-7567u:       [DMESG-WARN][42] ([i915#11621] / [i915#180] / [i915#1982]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-kbl-7567u/igt@i915_module_load@reload.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@i915_module_load@reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][44] ([i915#12216]) -> [PASS][45] +1 other test pass
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-mtlp-8/igt@i915_selftest@live.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-mtlp-8/igt@i915_selftest@live.html
    - {bat-arlh-3}:       [ABORT][46] ([i915#12133]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-arlh-3/igt@i915_selftest@live.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arlh-3/igt@i915_selftest@live.html
    - bat-twl-2:          [INCOMPLETE][48] ([i915#12133]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-twl-2/igt@i915_selftest@live.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-twl-2:          [INCOMPLETE][50] ([i915#12382]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-twl-2/igt@i915_selftest@live@hangcheck.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-twl-2/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][52] ([i915#11621]) -> [PASS][53] +132 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][54] ([i915#11621]) -> [PASS][55] +81 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - {bat-arlh-3}:       [ABORT][56] ([i915#12061]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [DMESG-WARN][58] ([i915#180]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@kms_busy@basic@flip.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][60] ([i915#11621] / [i915#180]) -> [PASS][61] +50 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216
  [i915#12292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12292
  [i915#12382]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12382
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8063 -> IGTPW_11895

  CI-20190529: 20190529
  CI_DRM_15510: e1aba2bf4f79f2f8ae7ce538124d445fc91df852 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11895: 11895
  IGT_8063: 8063

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/index.html

--===============6727381981565228641==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139808/">https://patchwork.freedesktop.org/series/139808/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8063 -&gt; IGTPW_11895</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11895:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_pm_residency@cpg-basic} (NEW):</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arls-1/igt@xe_pm_residency@cpg-basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_pm_residency@toggle-gt-cpg} (NEW):</p>
<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arlh-3/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg1-7/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adlp-9/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-rpls-4/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-twl-1/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arls-5/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-rplp-1/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arlh-2/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg2-9/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adlp-11/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arls-2/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>{bat-dg1-6}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg1-6/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adlp-6/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-mtlp-6/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-twl-2/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg2-11/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-jsl-3/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-mtlp-8/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg2-8/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adls-6/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-adlm-1/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-jsl-1/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8063 and IGTPW_11895:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-cpg:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11895 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-dg2-14/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12292">i915#12292</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_pm_residency@cpg-basic} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-bsw-n3050/igt@xe_pm_residency@cpg-basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_pm_residency@toggle-gt-cpg} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-glk-j4005/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-rkl-11600/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-cfl-guc/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-x1275/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-cfl-8109u/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-ilk-650/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-tgl-1115g4/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-blb-e6850/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-cfl-8700k/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-bsw-nick/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-kbl-2/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-hsw-4770/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-ivb-3770/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-elk-e7500/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-guc/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-kbl-7567u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@i915_module_load@reload.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216">i915#12216</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-arlh-3/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arlh-3/igt@i915_selftest@live.html">PASS</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-twl-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-twl-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-twl-2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12382">i915#12382</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-twl-2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +132 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/bat-arlh-3/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8063/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11895/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +50 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8063 -&gt; IGTPW_11895</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15510: e1aba2bf4f79f2f8ae7ce538124d445fc91df852 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11895: 11895<br />
  IGT_8063: 8063</p>

</body>
</html>

--===============6727381981565228641==--
