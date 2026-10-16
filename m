Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA813CCA46C
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 16:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFEE10E239;
	Fri, 16 Oct 2026 16:06:34 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD5510E239;
 Fri, 16 Oct 2026 16:05:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4979130284841332494=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel=3A_Add_helper?=
 =?utf-8?q?_to_dump_GT_debug_state_on_C6_wait_failures_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 16 Oct 2026 16:05:41 -0000
Message-ID: <179216674136.35582.7037706133004395293@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016095145.330496-2-sk.anirban@intel.com>
In-Reply-To: <20261016095145.330496-2-sk.anirban@intel.com>
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

--===============4979130284841332494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add helper to dump GT debug state on C6 wait failures (rev2)
URL   : https://patchwork.freedesktop.org/series/174646/
State : success

== Summary ==

CI Bug Log - changes from IGT_9150 -> IGTPW_16002
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16002 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@late_gt_pm:
    - bat-mtlp-9:         [PASS][1] -> [INCOMPLETE][2] ([i915#16229]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9150/bat-mtlp-9/igt@i915_selftest@live@late_gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/bat-mtlp-9/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@requests:
    - bat-apl-1:          [PASS][3] -> [DMESG-WARN][4] ([i915#13735]) +77 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9150/bat-apl-1/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/bat-apl-1/igt@i915_selftest@live@requests.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - bat-apl-1:          [PASS][5] -> [DMESG-WARN][6] ([i915#13735] / [i915#180]) +49 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9150/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#16229]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9150 -> IGTPW_16002
  * Linux: CI_DRM_19344 -> CI_DRM_19352

  CI-20190529: 20190529
  CI_DRM_19344: 551605da81c33c1a2352b6a6116360609798f171 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19352: 5fe1ae49f9cd4c3e98bbf07d4b44adf672eb7e8b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16002: 16002
  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/index.html

--===============4979130284841332494==
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
<tr><td><b>Series:</b></td><td>tests/intel: Add helper to dump GT debug state on C6 wait failures (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174646/">https://patchwork.freedesktop.org/series/174646/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9150 -&gt; IGTPW_16002</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16002 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9150/bat-mtlp-9/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/bat-mtlp-9/igt@i915_selftest@live@late_gt_pm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229">i915#16229</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9150/bat-apl-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/bat-apl-1/igt@i915_selftest@live@requests.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +77 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9150/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16002/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +49 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9150 -&gt; IGTPW_16002</li>
<li>Linux: CI_DRM_19344 -&gt; CI_DRM_19352</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19344: 551605da81c33c1a2352b6a6116360609798f171 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19352: 5fe1ae49f9cd4c3e98bbf07d4b44adf672eb7e8b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16002: 16002<br />
  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4979130284841332494==--
