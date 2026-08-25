Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5E5C61DB9
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 18:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FE889DD8;
	Tue, 25 Aug 2026 18:38:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BB010E1B6;
 Tue, 25 Aug 2026 18:37:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0856535952114247099=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_scale_MPO?=
 =?utf-8?q?_bandwidth-skip_tolerance_to_the_panel_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: haoming.qi@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Aug 2026 18:37:37 -0000
Message-ID: <178768305751.84443.4706082586520906575@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260821193021.2156148-1-Haoming.Qi@amd.com>
In-Reply-To: <20260821193021.2156148-1-Haoming.Qi@amd.com>
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

--===============0856535952114247099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: scale MPO bandwidth-skip tolerance to the panel (rev2)
URL   : https://patchwork.freedesktop.org/series/172655/
State : success

== Summary ==

CI Bug Log - changes from IGT_9074 -> IGTPW_15732
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15732/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15732 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [DMESG-WARN][1] ([i915#15673]) -> [PASS][2] +78 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9074/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15732/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9074 -> IGTPW_15732

  CI-20190529: 20190529
  CI_DRM_19041: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15732: b545cd04b7ec6255f882b1297c366af69e4dc041 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9074: 9074

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15732/index.html

--===============0856535952114247099==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: scale MPO bandwidth-skip tolerance to the panel (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172655/">https://patchwork.freedesktop.org/series/172655/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15732/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15732/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9074 -&gt; IGTPW_15732</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15732/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15732 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9074/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15732/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9074 -&gt; IGTPW_15732</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19041: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15732: b545cd04b7ec6255f882b1297c366af69e4dc041 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9074: 9074</p>

</body>
</html>

--===============0856535952114247099==--
