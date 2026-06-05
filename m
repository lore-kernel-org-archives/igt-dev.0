Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2F0CD6E7C
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 16:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9AC11A98B;
	Fri,  5 Jun 2026 16:31:45 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA1E11A98B;
 Fri,  5 Jun 2026 16:31:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3479826819347925262=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fchamelium=5Fc?=
 =?utf-8?q?olor=5Fpipeline=3A_Add_plane_color_pipeline_validation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Jun 2026 16:31:23 -0000
Message-ID: <178067708376.49282.5109159743512277428@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605113019.2597500-1-swati2.sharma@intel.com>
In-Reply-To: <20260605113019.2597500-1-swati2.sharma@intel.com>
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

--===============3479826819347925262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_chamelium_color_pipeline: Add plane color pipeline validation (rev3)
URL   : https://patchwork.freedesktop.org/series/162563/
State : success

== Summary ==

CI Bug Log - changes from IGT_8950 -> IGTPW_15310
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15310/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15310 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8950/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15310/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8950 -> IGTPW_15310
  * Linux: CI_DRM_18634 -> CI_DRM_18635

  CI-20190529: 20190529
  CI_DRM_18634: fe3f27ecb39e8357b0af59cfe9402fd5cc0c07b1 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18635: 979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15310: b2b4760415080a7d8a099dee9d3a8acd9a74edc2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8950: 8950

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15310/index.html

--===============3479826819347925262==
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
<tr><td><b>Series:</b></td><td>tests/kms_chamelium_color_pipeline: Add plane color pipeline validation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162563/">https://patchwork.freedesktop.org/series/162563/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15310/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15310/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8950 -&gt; IGTPW_15310</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15310/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15310 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8950/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15310/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8950 -&gt; IGTPW_15310</li>
<li>Linux: CI_DRM_18634 -&gt; CI_DRM_18635</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18634: fe3f27ecb39e8357b0af59cfe9402fd5cc0c07b1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18635: 979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15310: b2b4760415080a7d8a099dee9d3a8acd9a74edc2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8950: 8950</p>

</body>
</html>

--===============3479826819347925262==--
