Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76402C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 04:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0C610E03E;
	Fri, 24 May 2024 04:48:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66FA10E03E;
 Fri, 24 May 2024 04:48:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0751495049358274803=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50ZWwgWGUgT0EgSUdUJ3MgKHJl?=
 =?utf-8?b?djIp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 May 2024 04:48:23 -0000
Message-ID: <171652610367.2170280.3726791384986314661@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524031439.106332-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240524031439.106332-1-ashutosh.dixit@intel.com>
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

--===============0751495049358274803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe OA IGT's (rev2)
URL   : https://patchwork.freedesktop.org/series/130033/
State : success

== Summary ==

CI Bug Log - changes from IGT_7871 -> IGTPW_11186
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/index.html

Participating hosts (42 -> 40)
------------------------------

  Additional (1): bat-jsl-1 
  Missing    (3): fi-cfl-8109u fi-snb-2520m fi-elk-e7500 

New tests
---------

  New tests have been introduced between IGT_7871 and IGTPW_11186:

### New IGT tests (64) ###

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.72, 1.15] s

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.70, 2.83] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.66, 0.90] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.73, 1.12] s

  * igt@kms_flip@basic-flip-vs-dpms@a-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.91, 1.57] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.06] s

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.30, 2.39] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 0.86] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.67, 0.83] s

  * igt@kms_flip@basic-flip-vs-dpms@b-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.85, 1.33] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.27] s

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.28, 2.38] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 0.86] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:
    - Statuses : 7 pass(s)
    - Exec time: [0.67, 2.70] s

  * igt@kms_flip@basic-flip-vs-dpms@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - Statuses : 4 pass(s)
    - Exec time: [2.29, 3.14] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.72, 1.23] s

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.66, 2.85] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.66, 0.89] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.72, 1.11] s

  * igt@kms_flip@basic-flip-vs-modeset@a-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.90, 1.47] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.20] s

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.30, 2.37] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.59, 0.85] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.66, 1.02] s

  * igt@kms_flip@basic-flip-vs-modeset@b-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.84, 1.24] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.19] s

  * igt@kms_flip@basic-flip-vs-modeset@c-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.30, 2.37] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 0.86] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:
    - Statuses : 7 pass(s)
    - Exec time: [0.66, 2.60] s

  * igt@kms_flip@basic-flip-vs-modeset@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
    - Statuses : 4 pass(s)
    - Exec time: [2.30, 2.37] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [1.00, 1.41] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.01, 2.31] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.80, 1.18] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [1.01, 1.69] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [1.12, 1.77] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [1.00, 1.33] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.96, 2.24] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.76, 1.14] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.96, 1.59] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [1.11, 1.57] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.99, 1.32] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.97, 2.24] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.76, 1.14] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - Statuses : 7 pass(s)
    - Exec time: [0.96, 2.79] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - Statuses : 4 pass(s)
    - Exec time: [1.98, 2.11] s

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.72, 1.12] s

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.73, 2.02] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.65, 0.91] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.74, 1.07] s

  * igt@kms_flip@basic-plain-flip@a-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.85, 1.50] s

  * igt@kms_flip@basic-plain-flip@b-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.70, 1.05] s

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.71, 1.98] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.64, 0.85] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.69, 0.99] s

  * igt@kms_flip@basic-plain-flip@b-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.83, 1.28] s

  * igt@kms_flip@basic-plain-flip@c-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.70, 1.08] s

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.71, 1.98] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.62, 0.85] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a2:
    - Statuses : 7 pass(s)
    - Exec time: [0.68, 2.50] s

  * igt@kms_flip@basic-plain-flip@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - Statuses : 4 pass(s)
    - Exec time: [1.73, 1.95] s

  

Known issues
------------

  Here are the changes found in IGTPW_11186 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][4] -> [ABORT][5] ([i915#10594])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][6] ([i915#4103]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9886])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-1:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-1:          NOTRUN -> [SKIP][9] ([i915#3555])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gtt:
    - bat-arls-2:         [DMESG-WARN][10] ([i915#10341]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-arls-2/igt@i915_selftest@live@gtt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-arls-2/igt@i915_selftest@live@gtt.html

  * igt@i915_selftest@live@ring_submission:
    - bat-arls-2:         [DMESG-FAIL][12] ([i915#10262]) -> [PASS][13] +16 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-arls-2/igt@i915_selftest@live@ring_submission.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-arls-2/igt@i915_selftest@live@ring_submission.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp8:
    - {bat-mtlp-9}:       [DMESG-WARN][14] ([i915#11009]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp8.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp8.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp9:
    - {bat-mtlp-9}:       [FAIL][16] -> [PASS][17] +3 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp9.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp9.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp8:
    - {bat-mtlp-9}:       [FAIL][18] ([i915#6121]) -> [PASS][19] +2 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp8.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp8.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7871 -> IGTPW_11186

  CI-20190529: 20190529
  CI_DRM_14813: 1385623a20ad940dab90bfaa4bc01fe599506e09 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11186: 11186
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/index.html

--===============0751495049358274803==
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
<tr><td><b>Series:</b></td><td>Intel Xe OA IGT&#x27;s (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130033/">https://patchwork.freedesktop.org/series/130033/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7871 -&gt; IGTPW_11186</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Additional (1): bat-jsl-1 <br />
  Missing    (3): fi-cfl-8109u fi-snb-2520m fi-elk-e7500 </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7871 and IGTPW_11186:</p>
<h3>New IGT tests (64)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.72, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.70, 2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.66, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.73, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.91, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.30, 2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.61, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.67, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.85, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.28, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.61, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.67, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.29, 3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.72, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.66, 2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.66, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.72, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.90, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.30, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.59, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.66, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.84, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.30, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.60, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.66, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-edp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.30, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.00, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.01, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.80, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.01, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.12, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.00, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.96, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.76, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.96, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.11, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.99, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.97, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.76, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.96, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.98, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.72, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.73, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.65, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.74, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.85, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.70, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.71, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.64, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.69, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.83, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.70, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.71, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.62, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a2:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.68, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-edp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.73, 1.95] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11186 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594">i915#10594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-arls-2/igt@i915_selftest@live@gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-arls-2/igt@i915_selftest@live@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-arls-2/igt@i915_selftest@live@ring_submission.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-arls-2/igt@i915_selftest@live@ring_submission.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp8:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp8.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp8.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp9:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp9.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp9.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp8:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp8.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11186/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp8.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7871 -&gt; IGTPW_11186</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14813: 1385623a20ad940dab90bfaa4bc01fe599506e09 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11186: 11186<br />
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0751495049358274803==--
