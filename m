Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310A7CC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C806B10EBBD;
	Thu, 15 Oct 2026 13:24:15 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA4F10E8C2;
 Thu, 15 Oct 2026 13:17:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2421233759450918568=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Feld=3A_Log_modu?=
 =?utf-8?q?le_load_state_when_no_eld=23_nodes_are_found?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 15 Oct 2026 13:17:31 -0000
Message-ID: <179207025176.29708.797985096407682159@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015112548.2682369-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261015112548.2682369-1-chaitanya.kumar.borah@intel.com>
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

--===============2421233759450918568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_eld: Log module load state when no eld# nodes are found
URL   : https://patchwork.freedesktop.org/series/176206/
State : success

== Summary ==

CI Bug Log - changes from IGT_9149 -> IGTPW_15992
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15992/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15992 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2] ([i915#16664])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9149/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15992/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#16664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9149 -> IGTPW_15992

  CI-20190529: 20190529
  CI_DRM_19341: d0f854d04f85e2bd88bce0b7bd153e5a67957a5b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15992: c57f020d02e9ab414f7e894ba66686ccfb852062 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9149: 157f243d73fb8c010db8c884db81ca2e558b4ab2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15992/index.html

--===============2421233759450918568==
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
<tr><td><b>Series:</b></td><td>lib/igt_eld: Log module load state when no eld# nodes are found</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176206/">https://patchwork.freedesktop.org/series/176206/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15992/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15992/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9149 -&gt; IGTPW_15992</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15992/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15992 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9149/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15992/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664">i915#16664</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9149 -&gt; IGTPW_15992</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19341: d0f854d04f85e2bd88bce0b7bd153e5a67957a5b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15992: c57f020d02e9ab414f7e894ba66686ccfb852062 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9149: 157f243d73fb8c010db8c884db81ca2e558b4ab2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2421233759450918568==--
