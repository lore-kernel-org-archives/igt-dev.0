Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FACC88E75
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 12:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4EB10E0A7;
	Tue, 15 Sep 2026 12:30:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7570D10E2C7;
 Tue, 15 Sep 2026 12:29:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6463087048581025625=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fcursor=5Flega?=
 =?utf-8?q?cy=3A_Skip_timing_checks_in_simulation_to_avoid_false_negatives?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Sep 2026 12:29:59 -0000
Message-ID: <178947539947.164378.1758680555579575666@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260915081959.257160-1-jeevan.b@intel.com>
In-Reply-To: <20260915081959.257160-1-jeevan.b@intel.com>
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

--===============6463087048581025625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_legacy: Skip timing checks in simulation to avoid false negatives
URL   : https://patchwork.freedesktop.org/series/174115/
State : success

== Summary ==

CI Bug Log - changes from IGT_9096 -> IGTPW_15845
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15845/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_15845 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [INCOMPLETE][1] ([i915#16229]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9096/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15845/bat-mtlp-8/igt@i915_selftest@live.html

  
  [i915#16229]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9096 -> IGTPW_15845
  * Linux: CI_DRM_19148 -> CI_DRM_19149

  CI-20190529: 20190529
  CI_DRM_19148: 885e7996176ebe07c2cc143c1ee067591e49fa66 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19149: 2bd2887dd30703cc280a0ca64919784240f66e2d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15845: 5de1615eb21f7c3d837a1938886645bae5729017 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9096: 9096

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15845/index.html

--===============6463087048581025625==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_legacy: Skip timing checks in simulation to avoid false negatives</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174115/">https://patchwork.freedesktop.org/series/174115/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15845/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15845/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9096 -&gt; IGTPW_15845</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15845/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15845 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9096/bat-mtlp-8/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229">i915#16229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15845/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9096 -&gt; IGTPW_15845</li>
<li>Linux: CI_DRM_19148 -&gt; CI_DRM_19149</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19148: 885e7996176ebe07c2cc143c1ee067591e49fa66 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19149: 2bd2887dd30703cc280a0ca64919784240f66e2d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15845: 5de1615eb21f7c3d837a1938886645bae5729017 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9096: 9096</p>

</body>
</html>

--===============6463087048581025625==--
