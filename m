Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAC4C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 09:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F3211A347;
	Thu, 25 Apr 2024 09:57:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5557B11A347;
 Thu, 25 Apr 2024 09:57:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3588644134404962893=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tools/intel=5Freg=3A_Fix_mc?=
 =?utf-8?q?hbar_register_write?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 25 Apr 2024 09:57:24 -0000
Message-ID: <171403904434.1650497.18431261100127777957@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418112633.2423-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240418112633.2423-1-ville.syrjala@linux.intel.com>
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

--===============3588644134404962893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_reg: Fix mchbar register write
URL   : https://patchwork.freedesktop.org/series/132598/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14606 -> IGTPW_11040
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/index.html

Participating hosts (39 -> 36)
------------------------------

  Additional (3): bat-adlm-1 fi-apl-guc bat-mtlp-6 
  Missing    (6): fi-kbl-7567u fi-bsw-n3050 fi-glk-j4005 fi-cfl-8109u fi-elk-e7500 bat-dg2-11 

Known issues
------------

  Here are the changes found in IGTPW_11040 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-apl-guc:         NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-apl-guc/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][2] ([i915#9318])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@eof:
    - bat-kbl-2:          NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-kbl-2/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][4] ([i915#1849])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-kbl-2/igt@fbdev@info.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#1849] / [i915#2582])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@fbdev@info.html

  * igt@fbdev@write:
    - bat-mtlp-6:         NOTRUN -> [SKIP][6] ([i915#2582]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@fbdev@write.html

  * igt@gem_close_race@basic-process:
    - bat-mtlp-6:         NOTRUN -> [DMESG-WARN][7] ([i915#10875])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@gem_close_race@basic-process.html

  * igt@i915_module_load@load:
    - bat-adlm-1:         NOTRUN -> [INCOMPLETE][8] ([i915#10875])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-adlm-1/igt@i915_module_load@load.html
    - fi-kbl-x1275:       [PASS][9] -> [INCOMPLETE][10] ([i915#10893])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/fi-kbl-x1275/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-kbl-x1275/igt@i915_module_load@load.html
    - bat-dg2-8:          [PASS][11] -> [INCOMPLETE][12] ([i915#10877])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg2-8/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg2-8/igt@i915_module_load@load.html

  * igt@kms_busy@basic@flip:
    - bat-adls-6:         [PASS][13] -> [ABORT][14] ([i915#10875])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-adls-6/igt@kms_busy@basic@flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-adls-6/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - bat-dg2-14:         [PASS][15] -> [INCOMPLETE][16] ([i915#10056] / [i915#10875])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg2-14/igt@kms_busy@basic@modeset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg2-14/igt@kms_busy@basic@modeset.html
    - fi-cfl-guc:         [PASS][17] -> [INCOMPLETE][18] ([i915#10056])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/fi-cfl-guc/igt@kms_busy@basic@modeset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-cfl-guc/igt@kms_busy@basic@modeset.html
    - bat-mtlp-8:         [PASS][19] -> [DMESG-WARN][20] ([i915#10875])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-mtlp-8/igt@kms_busy@basic@modeset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-8/igt@kms_busy@basic@modeset.html
    - bat-adls-6:         [PASS][21] -> [DMESG-WARN][22] ([i915#10875])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-adls-6/igt@kms_busy@basic@modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-adls-6/igt@kms_busy@basic@modeset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg1-7:          NOTRUN -> [SKIP][23] ([i915#4103] / [i915#4213]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][24] ([i915#3555] / [i915#3840])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - fi-apl-guc:         NOTRUN -> [INCOMPLETE][25] ([i915#10875])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - bat-jsl-1:          [PASS][26] -> [INCOMPLETE][27] ([i915#10876])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg1-7:          NOTRUN -> [SKIP][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-dg1-7:          NOTRUN -> [SKIP][29] ([i915#433])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-2:
    - bat-dg1-7:          NOTRUN -> [ABORT][30] ([i915#10875])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-2.html

  
#### Possible fixes ####

  * igt@gem_ctx_create@basic:
    - fi-rkl-11600:       [DMESG-WARN][31] ([i915#10875]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/fi-rkl-11600/igt@gem_ctx_create@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-rkl-11600/igt@gem_ctx_create@basic.html

  * igt@i915_module_load@load:
    - bat-kbl-2:          [INCOMPLETE][33] ([i915#10875] / [i915#10877]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-kbl-2/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-kbl-2/igt@i915_module_load@load.html

  * igt@kms_busy@basic@modeset:
    - bat-dg1-7:          [ABORT][35] ([i915#10875]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg1-7/igt@kms_busy@basic@modeset.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_busy@basic@modeset.html

  
#### Warnings ####

  * igt@gem_close_race@basic-process:
    - bat-dg2-9:          [INCOMPLETE][37] ([i915#10875]) -> [DMESG-WARN][38] ([i915#10875])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg2-9/igt@gem_close_race@basic-process.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg2-9/igt@gem_close_race@basic-process.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10875]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875
  [i915#10876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10876
  [i915#10877]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10877
  [i915#10893]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10893
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7813 -> IGTPW_11040

  CI-20190529: 20190529
  CI_DRM_14606: 121bb3cb2e7ce2d6f5c35cea84c6ae308cf1da0a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11040: d591925568a45c97dc8484361a79e9d0b01636c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/index.html

--===============3588644134404962893==
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
<tr><td><b>Series:</b></td><td>tools/intel_reg: Fix mchbar register write</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132598/">https://patchwork.freedesktop.org/series/132598/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14606 -&gt; IGTPW_11040</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Additional (3): bat-adlm-1 fi-apl-guc bat-mtlp-6 <br />
  Missing    (6): fi-kbl-7567u fi-bsw-n3050 fi-glk-j4005 fi-cfl-8109u fi-elk-e7500 bat-dg2-11 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11040 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-apl-guc/igt@debugfs_test@basic-hwmon.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-kbl-2/igt@fbdev@eof.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@gem_close_race@basic-process.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-adlm-1/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>)</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/fi-kbl-x1275/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-kbl-x1275/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10893">i915#10893</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg2-8/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg2-8/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10877">i915#10877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-adls-6/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-adls-6/igt@kms_busy@basic@flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg2-14/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg2-14/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>)</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/fi-cfl-guc/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-cfl-guc/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-mtlp-8/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-8/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>)</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-adls-6/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-adls-6/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10876">i915#10876</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_create@basic:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/fi-rkl-11600/igt@gem_ctx_create@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-rkl-11600/igt@gem_ctx_create@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-kbl-2/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10877">i915#10877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-kbl-2/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg1-7/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_close_race@basic-process:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg2-9/igt@gem_close_race@basic-process.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg2-9/igt@gem_close_race@basic-process.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10875">i915#10875</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7813 -&gt; IGTPW_11040</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14606: 121bb3cb2e7ce2d6f5c35cea84c6ae308cf1da0a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11040: d591925568a45c97dc8484361a79e9d0b01636c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3588644134404962893==--
