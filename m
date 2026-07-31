Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B78EC5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 08:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E8510E1C5;
	Fri, 31 Jul 2026 08:30:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82ED10E1C5;
 Fri, 31 Jul 2026 08:29:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1764495306601745496=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/amdgpu/amd=5Fcursor?=
 =?utf-8?q?=5Foverlay=3A_reset_primary_position_for_reference_frame?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "James Lin" <pinglei.lin@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Jul 2026 08:29:42 -0000
Message-ID: <178548658274.8278.3766037457607069975@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730125740.110354-1-PingLei.Lin@amd.com>
In-Reply-To: <20260730125740.110354-1-PingLei.Lin@amd.com>
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

--===============1764495306601745496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_cursor_overlay: reset primary position for reference frame
URL   : https://patchwork.freedesktop.org/series/171420/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9034 -> IGTPW_15614
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15614 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15614, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15614/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): bat-dg2-13 bat-dg2-9 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15614:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gtt:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/bat-arlh-2/igt@i915_selftest@live@gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15614/bat-arlh-2/igt@i915_selftest@live@gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_15614 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4] ([i915#16547])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/bat-arlh-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15614/bat-arlh-2/igt@i915_selftest@live.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9034 -> IGTPW_15614
  * Linux: CI_DRM_18925 -> CI_DRM_18929

  CI-20190529: 20190529
  CI_DRM_18925: 5e24f68d311764bf343f9def49b752b509dfd5fd @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18929: 9103d091078b8e56e68b810a1b1a506ef4e51478 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15614: 15614
  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15614/index.html

--===============1764495306601745496==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_cursor_overlay: reset primary position for reference frame</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171420/">https://patchwork.freedesktop.org/series/171420/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15614/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15614/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9034 -&gt; IGTPW_15614</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15614 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15614, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15614/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): bat-dg2-13 bat-dg2-9 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15614:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gtt:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/bat-arlh-2/igt@i915_selftest@live@gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15614/bat-arlh-2/igt@i915_selftest@live@gtt.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15614 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15614/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9034 -&gt; IGTPW_15614</li>
<li>Linux: CI_DRM_18925 -&gt; CI_DRM_18929</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18925: 5e24f68d311764bf343f9def49b752b509dfd5fd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18929: 9103d091078b8e56e68b810a1b1a506ef4e51478 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15614: 15614<br />
  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1764495306601745496==--
