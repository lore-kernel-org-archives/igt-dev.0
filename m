Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474B8CA5FC5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 01:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBEC10F533;
	Thu,  1 Oct 2026 01:17:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE8410F533;
 Thu,  1 Oct 2026 01:16:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8688717222328158209=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/amdgpu=3A_don=27t_ver?=
 =?utf-8?q?ify_dispatch_results_after_a_cancelled_submission?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Oct 2026 01:16:19 -0000
Message-ID: <179081737996.226559.14648676866416053954@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930201005.66857-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260930201005.66857-1-vitaly.prosyak@amd.com>
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

--===============8688717222328158209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: don't verify dispatch results after a cancelled submission
URL   : https://patchwork.freedesktop.org/series/175329/
State : success

== Summary ==

CI Bug Log - changes from IGT_9119 -> IGTPW_15928
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15928/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15928 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [FAIL][1] ([i915#16664]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9119/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15928/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#16664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9119 -> IGTPW_15928
  * Linux: CI_DRM_19250 -> CI_DRM_19251

  CI-20190529: 20190529
  CI_DRM_19250: 332faa4cbc2e48ba71db4b3f45c981248f089b2d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19251: bfcd7480a7729861f46a8f56582ab8fcec0dae5f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15928: 0f3bd0126c385dd41705b2ddbf71dddd58967039 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9119: 9985dcc24949e018ed6dfde5313846780c4f2d21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15928/index.html

--===============8688717222328158209==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: don&#x27;t verify dispatch results after a cancelled submission</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175329/">https://patchwork.freedesktop.org/series/175329/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15928/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15928/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9119 -&gt; IGTPW_15928</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15928/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15928 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9119/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664">i915#16664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15928/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9119 -&gt; IGTPW_15928</li>
<li>Linux: CI_DRM_19250 -&gt; CI_DRM_19251</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19250: 332faa4cbc2e48ba71db4b3f45c981248f089b2d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19251: bfcd7480a7729861f46a8f56582ab8fcec0dae5f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15928: 0f3bd0126c385dd41705b2ddbf71dddd58967039 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9119: 9985dcc24949e018ed6dfde5313846780c4f2d21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8688717222328158209==--
