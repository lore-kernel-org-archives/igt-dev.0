Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63164C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 06:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0539F10E0DB;
	Mon, 12 Aug 2024 06:20:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BE510E0DB;
 Mon, 12 Aug 2024 06:20:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4921291588269792575=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/core=5Fsetmaster=3A_H?=
 =?utf-8?q?andle_the_test_even_if_cards_are_non-continuous?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 12 Aug 2024 06:20:33 -0000
Message-ID: <172344363368.593603.12738890502194780491@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
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

--===============4921291588269792575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_setmaster: Handle the test even if cards are non-continuous
URL   : https://patchwork.freedesktop.org/series/137135/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15213 -> IGTPW_11556
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): fi-snb-2520m fi-kbl-8809g 

Known issues
------------

  Here are the changes found in IGTPW_11556 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#180])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@i915_module_load@load.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - bat-apl-1:          [DMESG-WARN][3] ([i915#180]) -> [PASS][4] +5 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@core_auth@basic-auth.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@core_auth@basic-auth.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-adlp-6:         [ABORT][5] ([i915#11811]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-adlp-6/igt@i915_selftest@live@gt_mocs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-adlp-6/igt@i915_selftest@live@gt_mocs.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-apl-1:          [DMESG-WARN][7] ([i915#180] / [i915#1982]) -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-7:          [SKIP][9] ([i915#6621]) -> [SKIP][10] ([i915#11681] / [i915#6621])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg1-7/igt@i915_pm_rps@basic-api.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg1-7/igt@i915_pm_rps@basic-api.html
    - bat-dg2-14:         [SKIP][11] ([i915#6621]) -> [SKIP][12] ([i915#11681] / [i915#6621])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg2-14/igt@i915_pm_rps@basic-api.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg2-14/igt@i915_pm_rps@basic-api.html
    - bat-dg2-9:          [SKIP][13] ([i915#6621]) -> [SKIP][14] ([i915#11681] / [i915#6621])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg2-9/igt@i915_pm_rps@basic-api.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg2-9/igt@i915_pm_rps@basic-api.html
    - bat-dg2-11:         [SKIP][15] ([i915#6621]) -> [SKIP][16] ([i915#11681] / [i915#6621])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg2-11/igt@i915_pm_rps@basic-api.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg2-11/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-8:         [SKIP][17] ([i915#6621]) -> [SKIP][18] ([i915#11681] / [i915#6621])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
    - bat-dg2-8:          [SKIP][19] ([i915#6621]) -> [SKIP][20] ([i915#11681] / [i915#6621])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg2-8/igt@i915_pm_rps@basic-api.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg2-8/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-6:         [SKIP][21] ([i915#6621]) -> [SKIP][22] ([i915#11681] / [i915#6621])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-mtlp-6/igt@i915_pm_rps@basic-api.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - bat-apl-1:          [DMESG-WARN][23] -> [DMESG-WARN][24] ([i915#11621]) +39 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@kms_addfb_basic@invalid-set-prop.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_busy@basic@flip:
    - bat-apl-1:          [DMESG-WARN][25] ([i915#1982]) -> [DMESG-WARN][26] ([i915#180] / [i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@kms_busy@basic@flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-apl-1:          [DMESG-WARN][27] -> [DMESG-WARN][28] ([i915#180]) +4 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-apl-1:          [DMESG-WARN][29] ([i915#180]) -> [DMESG-WARN][30] ([i915#11621]) +1 other test dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html

  
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11811]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11811
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7966 -> IGTPW_11556

  CI-20190529: 20190529
  CI_DRM_15213: ac6319ef8c6027f0fc65b71b614a8312aed19423 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11556: ea87997228d376b91837c5006345a9777558ee02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/index.html

--===============4921291588269792575==
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
<tr><td><b>Series:</b></td><td>tests/core_setmaster: Handle the test even if cards are non-continuous</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137135/">https://patchwork.freedesktop.org/series/137135/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15213 -&gt; IGTPW_11556</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): fi-snb-2520m fi-kbl-8809g </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11556 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@core_auth@basic-auth.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-adlp-6/igt@i915_selftest@live@gt_mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11811">i915#11811</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-adlp-6/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg2-14/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg2-14/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +39 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15213/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11556/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7966 -&gt; IGTPW_11556</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15213: ac6319ef8c6027f0fc65b71b614a8312aed19423 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11556: ea87997228d376b91837c5006345a9777558ee02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4921291588269792575==--
