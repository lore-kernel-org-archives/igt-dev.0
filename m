Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52892C04FF8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 14:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF563113D32;
	Thu, 18 Apr 2024 14:56:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B14113D30;
 Thu, 18 Apr 2024 14:56:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0647528290317588529=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Align_Xe_header_and_restore?=
 =?utf-8?q?_some_uAPI_flags_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Apr 2024 14:56:11 -0000
Message-ID: <171345217181.1501116.17620227248295049537@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412142159.6-1-francois.dugast@intel.com>
In-Reply-To: <20240412142159.6-1-francois.dugast@intel.com>
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

--===============0647528290317588529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Align Xe header and restore some uAPI flags (rev5)
URL   : https://patchwork.freedesktop.org/series/131816/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7813 -> IGTPW_11039
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11039 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11039, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/index.html

Participating hosts (42 -> 36)
------------------------------

  Additional (1): fi-elk-e7500 
  Missing    (7): fi-kbl-7567u bat-dg1-7 fi-glk-j4005 fi-kbl-8809g bat-dg2-11 bat-mtlp-8 bat-mtlp-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11039:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_busy@basic@flip:
    - bat-adls-6:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-adls-6/igt@kms_busy@basic@flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adls-6/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-arls-1:         NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - fi-cfl-8109u:       [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - fi-tgl-1115g4:      NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_11039 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - fi-kbl-x1275:       NOTRUN -> [INCOMPLETE][7] ([i915#2295])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-kbl-x1275/igt@core_auth@basic-auth.html

  * igt@debugfs_test@basic-hwmon:
    - fi-rkl-11600:       NOTRUN -> [SKIP][8] ([i915#9318])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
    - bat-adlm-1:         NOTRUN -> [SKIP][9] ([i915#3826])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@eof:
    - fi-rkl-11600:       NOTRUN -> [SKIP][10] ([i915#2582]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@fbdev@eof.html
    - bat-adlm-1:         NOTRUN -> [SKIP][11] ([i915#2582]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@fbdev@eof.html

  * igt@fbdev@info:
    - fi-rkl-11600:       NOTRUN -> [SKIP][12] ([i915#1849] / [i915#2582])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@fbdev@info.html
    - bat-adlm-1:         NOTRUN -> [SKIP][13] ([i915#1849] / [i915#2582])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@fbdev@info.html

  * igt@gem_exec_basic@basic:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][14] ([i915#2295])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@gem_exec_basic@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-elk-e7500:       NOTRUN -> [SKIP][15] +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-elk-e7500/igt@gem_huc_copy@huc-copy.html

  * igt@kms_busy@basic@modeset:
    - bat-dg2-14:         [PASS][16] -> [DMESG-WARN][17] ([i915#10875])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-dg2-14/igt@kms_busy@basic@modeset.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-dg2-14/igt@kms_busy@basic@modeset.html
    - bat-rplp-1:         [PASS][18] -> [DMESG-WARN][19] ([i915#10875])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-rplp-1/igt@kms_busy@basic@modeset.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-rplp-1/igt@kms_busy@basic@modeset.html
    - fi-cfl-guc:         [PASS][20] -> [INCOMPLETE][21] ([i915#10056])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-cfl-guc/igt@kms_busy@basic@modeset.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-cfl-guc/igt@kms_busy@basic@modeset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-adln-1:         NOTRUN -> [SKIP][22] ([i915#4213]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-apl-guc:         NOTRUN -> [SKIP][23] +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-arls-2:         NOTRUN -> [ABORT][24] ([i915#10875])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-blb-e6850:       NOTRUN -> [SKIP][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-cfl-8700k:       [PASS][26] -> [INCOMPLETE][27] ([i915#9878])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - bat-dg2-9:          [DMESG-WARN][28] ([i915#10875]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-dg2-9/igt@gem_close_race@basic-threads.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-dg2-9/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@load:
    - fi-rkl-11600:       [INCOMPLETE][30] -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-rkl-11600/igt@i915_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@i915_module_load@load.html
    - bat-adlm-1:         [INCOMPLETE][32] ([i915#10875]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-adlm-1/igt@i915_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@i915_module_load@load.html
    - fi-kbl-x1275:       [INCOMPLETE][34] -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-kbl-x1275/igt@i915_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-kbl-x1275/igt@i915_module_load@load.html

  * igt@kms_busy@basic@flip:
    - fi-bsw-nick:        [INCOMPLETE][36] -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-bsw-nick/igt@kms_busy@basic@flip.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-bsw-nick/igt@kms_busy@basic@flip.html
    - fi-apl-guc:         [INCOMPLETE][38] -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-apl-guc/igt@kms_busy@basic@flip.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-apl-guc/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - fi-ivb-3770:        [INCOMPLETE][40] -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-ivb-3770/igt@kms_busy@basic@modeset.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-ivb-3770/igt@kms_busy@basic@modeset.html
    - fi-ilk-650:         [INCOMPLETE][42] -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-ilk-650/igt@kms_busy@basic@modeset.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-ilk-650/igt@kms_busy@basic@modeset.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-arls-2:         [ABORT][44] ([i915#10875]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-arls-1:         [ABORT][46] ([i915#10875]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - fi-tgl-1115g4:      [INCOMPLETE][48] -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-dg2-8:          [INCOMPLETE][50] ([i915#10877]) -> [INCOMPLETE][51] ([i915#10875] / [i915#10877])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-dg2-8/igt@i915_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-dg2-8/igt@i915_module_load@load.html

  * igt@kms_busy@basic@modeset:
    - bat-adls-6:         [ABORT][52] ([i915#10875]) -> [DMESG-WARN][53] ([i915#10875])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-adls-6/igt@kms_busy@basic@modeset.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adls-6/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/intel/issues/10056
  [i915#10875]: https://gitlab.freedesktop.org/drm/intel/issues/10875
  [i915#10877]: https://gitlab.freedesktop.org/drm/intel/issues/10877
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9878]: https://gitlab.freedesktop.org/drm/intel/issues/9878


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7813 -> IGTPW_11039

  CI-20190529: 20190529
  CI_DRM_14602: 4eddedf2b31be4f2280a7c42966eaf9b6cb251a8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11039: 7d07174eaa3a97b60dd118a1775ae7b23c06817c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/index.html

--===============0647528290317588529==
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
<tr><td><b>Series:</b></td><td>Align Xe header and restore some uAPI flags (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131816/">https://patchwork.freedesktop.org/series/131816/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7813 -&gt; IGTPW_11039</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11039 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11039, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/index.html</p>
<h2>Participating hosts (42 -&gt; 36)</h2>
<p>Additional (1): fi-elk-e7500 <br />
  Missing    (7): fi-kbl-7567u bat-dg1-7 fi-glk-j4005 fi-kbl-8809g bat-dg2-11 bat-mtlp-8 bat-mtlp-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11039:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-adls-6/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adls-6/igt@kms_busy@basic@flip.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11039 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-kbl-x1275/igt@core_auth@basic-auth.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3826">i915#3826</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@gem_exec_basic@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-elk-e7500/igt@gem_huc_copy@huc-copy.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-dg2-14/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-dg2-14/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-rplp-1/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-rplp-1/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-cfl-guc/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-cfl-guc/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9878">i915#9878</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_close_race@basic-threads:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-dg2-9/igt@gem_close_race@basic-threads.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-dg2-9/igt@gem_close_race@basic-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-rkl-11600/igt@i915_module_load@load.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-adlm-1/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-kbl-x1275/igt@i915_module_load@load.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-kbl-x1275/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-bsw-nick/igt@kms_busy@basic@flip.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-bsw-nick/igt@kms_busy@basic@flip.html">PASS</a></li>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-apl-guc/igt@kms_busy@basic@flip.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-apl-guc/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-ivb-3770/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-ivb-3770/igt@kms_busy@basic@modeset.html">PASS</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-ilk-650/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-ilk-650/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a></li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-dg2-8/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10877">i915#10877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-dg2-8/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10877">i915#10877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-adls-6/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adls-6/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7813 -&gt; IGTPW_11039</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14602: 4eddedf2b31be4f2280a7c42966eaf9b6cb251a8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11039: 7d07174eaa3a97b60dd118a1775ae7b23c06817c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0647528290317588529==--
