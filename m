Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742EBC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 00:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD2910F5D7;
	Fri, 19 Apr 2024 00:05:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AE810F5DB;
 Fri, 19 Apr 2024 00:05:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5527460551682860827=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Force_joiner_support_in_big?=
 =?utf-8?q?joiner_checks_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Apr 2024 00:05:03 -0000
Message-ID: <171348510373.1502081.14048486870930524872@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
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

--===============5527460551682860827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Force joiner support in bigjoiner checks (rev4)
URL   : https://patchwork.freedesktop.org/series/132557/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14607 -> IGTPW_11041
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11041 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11041, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/index.html

Participating hosts (37 -> 36)
------------------------------

  Additional (3): bat-kbl-2 bat-jsl-1 bat-mtlp-6 
  Missing    (4): fi-cfl-8109u bat-dg2-11 bat-atsm-1 bat-arls-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11041:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-adln-1:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-1:
    - fi-cfl-8700k:       [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-1.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlm-1:         [INCOMPLETE][6] ([i915#10875]) -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-adlm-1/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adlm-1/igt@i915_module_load@load.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - {bat-rpls-4}:       NOTRUN -> [ABORT][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - {bat-rpls-4}:       NOTRUN -> [DMESG-FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - {bat-rpls-4}:       NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_11041 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - fi-kbl-x1275:       NOTRUN -> [INCOMPLETE][11] ([i915#2295])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-kbl-x1275/igt@core_auth@basic-auth.html

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][12] ([i915#9318])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][13] ([i915#9318])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-mtlp-6:         NOTRUN -> [SKIP][14] ([i915#1849] / [i915#2582])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-mtlp-6/igt@fbdev@info.html

  * igt@fbdev@write:
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] ([i915#2582]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-mtlp-6/igt@fbdev@write.html

  * igt@gem_close_race@basic-process:
    - bat-mtlp-6:         NOTRUN -> [DMESG-WARN][16] ([i915#10875])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-mtlp-6/igt@gem_close_race@basic-process.html

  * igt@gem_close_race@basic-threads:
    - bat-dg2-9:          NOTRUN -> [DMESG-WARN][17] ([i915#10875])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-dg2-9/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_basic@basic:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][18] ([i915#2295])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-rkl-11600/igt@gem_exec_basic@basic.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][19] ([i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@i915_module_load@load:
    - bat-kbl-2:          NOTRUN -> [INCOMPLETE][20] ([i915#10877])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-kbl-2/igt@i915_module_load@load.html

  * igt@kms_busy@basic@modeset:
    - bat-dg1-7:          [PASS][21] -> [ABORT][22] ([i915#10875])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-dg1-7/igt@kms_busy@basic@modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-dg1-7/igt@kms_busy@basic@modeset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-adlp-9:         NOTRUN -> [SKIP][23] ([i915#4103]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-cfl-guc:         NOTRUN -> [SKIP][24] +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][25] ([i915#4103]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-arls-1:         NOTRUN -> [SKIP][26] ([i915#10202]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-arls-2:         [PASS][27] -> [ABORT][28] ([i915#10875])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-arls-1:         NOTRUN -> [ABORT][29] ([i915#10875])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][30] ([i915#3555] / [i915#9886])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@kms_dsc@dsc-basic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][31] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-blb-e6850/igt@kms_dsc@dsc-basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][32] ([i915#3555] / [i915#3840])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adlp-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - bat-jsl-1:          NOTRUN -> [INCOMPLETE][33] ([i915#10876])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - bat-adlp-9:         NOTRUN -> [INCOMPLETE][34] ([i915#10876])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-process:
    - bat-dg2-9:          [INCOMPLETE][35] ([i915#10875]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-dg2-9/igt@gem_close_race@basic-process.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-dg2-9/igt@gem_close_race@basic-process.html

  * igt@i915_module_load@load:
    - fi-kbl-x1275:       [INCOMPLETE][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-kbl-x1275/igt@i915_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-kbl-x1275/igt@i915_module_load@load.html

  * igt@kms_busy@basic@flip:
    - {bat-rpls-4}:       [ABORT][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-rpls-4/igt@kms_busy@basic@flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - {bat-rpls-4}:       [DMESG-WARN][41] ([i915#10875]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-rpls-4/igt@kms_busy@basic@modeset.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_busy@basic@modeset.html
    - fi-cfl-guc:         [INCOMPLETE][43] ([i915#10056]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-cfl-guc/igt@kms_busy@basic@modeset.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-cfl-guc/igt@kms_busy@basic@modeset.html
    - bat-arls-1:         [ABORT][45] ([i915#10875]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-arls-1/igt@kms_busy@basic@modeset.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-arls-1/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/intel/issues/10056
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10875]: https://gitlab.freedesktop.org/drm/intel/issues/10875
  [i915#10876]: https://gitlab.freedesktop.org/drm/intel/issues/10876
  [i915#10877]: https://gitlab.freedesktop.org/drm/intel/issues/10877
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7813 -> IGTPW_11041

  CI-20190529: 20190529
  CI_DRM_14607: cabe88f47c1f688f4493de88acc532bf584efe3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11041: 03a75ee7a903117c070d7205de4bd3b9be150229 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/index.html

--===============5527460551682860827==
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
<tr><td><b>Series:</b></td><td>Force joiner support in bigjoiner checks (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132557/">https://patchwork.freedesktop.org/series/132557/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14607 -&gt; IGTPW_11041</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11041 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11041, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Additional (3): bat-kbl-2 bat-jsl-1 bat-mtlp-6 <br />
  Missing    (4): fi-cfl-8109u bat-dg2-11 bat-atsm-1 bat-arls-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11041:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-1:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-adlm-1/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adlm-1/igt@i915_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11041 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-kbl-x1275/igt@core_auth@basic-auth.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-mtlp-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-mtlp-6/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-mtlp-6/igt@gem_close_race@basic-process.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-threads:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-dg2-9/igt@gem_close_race@basic-threads.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-rkl-11600/igt@gem_exec_basic@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-kbl-2/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10877">i915#10877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-dg1-7/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-dg1-7/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> +2 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10202">i915#10202</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-blb-e6850/igt@kms_dsc@dsc-basic.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10876">i915#10876</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10876">i915#10876</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-dg2-9/igt@gem_close_race@basic-process.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-dg2-9/igt@gem_close_race@basic-process.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-kbl-x1275/igt@i915_module_load@load.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-kbl-x1275/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>{bat-rpls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-rpls-4/igt@kms_busy@basic@flip.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>{bat-rpls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-rpls-4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-rpls-4/igt@kms_busy@basic@modeset.html">PASS</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-cfl-guc/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10056">i915#10056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/fi-cfl-guc/igt@kms_busy@basic@modeset.html">PASS</a></li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-arls-1/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11041/bat-arls-1/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7813 -&gt; IGTPW_11041</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14607: cabe88f47c1f688f4493de88acc532bf584efe3c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11041: 03a75ee7a903117c070d7205de4bd3b9be150229 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5527460551682860827==--
