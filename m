Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E09BC3DA7F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 13:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AB410E401;
	Thu, 15 Aug 2024 13:59:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32F110E401;
 Thu, 15 Aug 2024 13:59:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5762075081931784630=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_lib/igt=5Fkmod=3A_Unload/Re?=
 =?utf-8?q?load_the_mei_Modules_Before_Unloading/Reloading_the_i915/xe_Drive?=
 =?utf-8?q?r?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 15 Aug 2024 13:59:02 -0000
Message-ID: <172373034285.651696.415607180010335723@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240815130423.7686-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240815130423.7686-1-krishnaiah.bommu@intel.com>
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

--===============5762075081931784630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kmod: Unload/Reload the mei Modules Before Unloading/Reloading the i915/xe Driver
URL   : https://patchwork.freedesktop.org/series/137343/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15233 -> IGTPW_11585
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11585 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11585, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-dg2-11 bat-arlh-3 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11585:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@client:
    - bat-arls-1:         [PASS][1] -> [DMESG-WARN][2] +14 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-1/igt@i915_selftest@live@client.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-1/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-arls-5:         [PASS][3] -> [DMESG-WARN][4] +15 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html
    - bat-arlh-2:         [PASS][5] -> [DMESG-WARN][6] +16 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_timelines:
    - bat-arls-2:         [PASS][7] -> [DMESG-WARN][8] +4 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-2/igt@i915_selftest@live@gt_timelines.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-2/igt@i915_selftest@live@gt_timelines.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-mtlp-8:         [PASS][9] -> [DMESG-WARN][10] +16 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-mtlp-8/igt@i915_selftest@live@guc_multi_lrc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-mtlp-8/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_selftest@live@requests:
    - bat-arls-2:         [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-2/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-2/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [PASS][13] -> [DMESG-WARN][14] +16 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  
Known issues
------------

  Here are the changes found in IGTPW_11585 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - fi-kbl-7567u:       [PASS][15] -> [DMESG-WARN][16] ([i915#180] / [i915#9925]) +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - fi-kbl-7567u:       [PASS][17] -> [DMESG-WARN][18] ([i915#180] / [i915#1982] / [i915#9925])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [PASS][19] -> [DMESG-WARN][20] ([i915#11888] / [i915#180] / [i915#1982] / [i915#9925])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_contexts:
    - bat-arls-1:         [PASS][21] -> [DMESG-WARN][22] ([i915#11378]) +15 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-1/igt@i915_selftest@live@gt_contexts.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-1/igt@i915_selftest@live@gt_contexts.html

  * igt@i915_selftest@live@guc:
    - bat-mtlp-6:         [PASS][23] -> [DMESG-WARN][24] ([i915#11378]) +19 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-mtlp-6/igt@i915_selftest@live@guc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-mtlp-6/igt@i915_selftest@live@guc.html

  * igt@i915_selftest@live@ring_submission:
    - bat-mtlp-8:         [PASS][25] -> [DMESG-WARN][26] ([i915#11378]) +17 other tests dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-mtlp-8/igt@i915_selftest@live@ring_submission.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-mtlp-8/igt@i915_selftest@live@ring_submission.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [PASS][27] -> [DMESG-WARN][28] ([i915#11621]) +80 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
    - bat-arls-5:         [PASS][29] -> [DMESG-WARN][30] ([i915#11378]) +17 other tests dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-5/igt@i915_selftest@live@sanitycheck.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-5/igt@i915_selftest@live@sanitycheck.html
    - bat-arlh-2:         [PASS][31] -> [DMESG-WARN][32] ([i915#11378]) +19 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html
    - bat-arls-2:         [PASS][33] -> [DMESG-WARN][34] ([i915#11378]) +5 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-2/igt@i915_selftest@live@sanitycheck.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-2/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [PASS][35] -> [DMESG-WARN][36] ([i915#180])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@kms_busy@basic@flip.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][37] -> [DMESG-WARN][38] ([i915#11888] / [i915#180] / [i915#9925]) +36 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11888
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7970 -> IGTPW_11585

  CI-20190529: 20190529
  CI_DRM_15233: b29b4804ea3a6469d292aa80631565bfa54c7380 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11585: 11585
  IGT_7970: 496e86347f8607d032ed59cdad5eb018e5be6933 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/index.html

--===============5762075081931784630==
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
<tr><td><b>Series:</b></td><td>lib/igt_kmod: Unload/Reload the mei Modules Before Unloading/Reloading the i915/xe Driver</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137343/">https://patchwork.freedesktop.org/series/137343/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15233 -&gt; IGTPW_11585</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11585 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11585, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-dg2-11 bat-arlh-3 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11585:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-1/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-1/igt@i915_selftest@live@client.html">DMESG-WARN</a> +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> +15 other tests dmesg-warn</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> +16 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-2/igt@i915_selftest@live@gt_timelines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-2/igt@i915_selftest@live@gt_timelines.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-mtlp-8/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-mtlp-8/igt@i915_selftest@live@guc_multi_lrc.html">DMESG-WARN</a> +16 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-2/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-2/igt@i915_selftest@live@requests.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> +16 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11585 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11888">i915#11888</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_contexts:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-1/igt@i915_selftest@live@gt_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-1/igt@i915_selftest@live@gt_contexts.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>) +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-mtlp-6/igt@i915_selftest@live@guc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-mtlp-6/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>) +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-mtlp-8/igt@i915_selftest@live@ring_submission.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-mtlp-8/igt@i915_selftest@live@ring_submission.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +80 other tests dmesg-warn</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-5/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-5/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>) +17 other tests dmesg-warn</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>) +19 other tests dmesg-warn</li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/bat-arls-2/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/bat-arls-2/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15233/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11585/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11888">i915#11888</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) +36 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7970 -&gt; IGTPW_11585</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15233: b29b4804ea3a6469d292aa80631565bfa54c7380 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11585: 11585<br />
  IGT_7970: 496e86347f8607d032ed59cdad5eb018e5be6933 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5762075081931784630==--
