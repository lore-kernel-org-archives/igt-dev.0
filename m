Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C076C71136
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 00:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82B410E1E2;
	Fri, 13 Jun 2025 00:20:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5B010E1E2;
 Fri, 13 Jun 2025 00:20:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4649517702842158606=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel-ci=3A_Blockli?=
 =?utf-8?q?st_unsupported_Xe_scaling_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jun 2025 00:20:49 -0000
Message-ID: <174977404996.74490.2371918969434235420@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612201734.3280725-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250612201734.3280725-1-ramanaidu.naladala@intel.com>
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

--===============4649517702842158606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Blocklist unsupported Xe scaling tests
URL   : https://patchwork.freedesktop.org/series/150185/
State : success

== Summary ==

CI Bug Log - changes from IGT_8409 -> IGTPW_13286
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13286/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13286 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2] ([i915#13930])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8409/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13286/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#13930]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13930


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8409 -> IGTPW_13286
  * Linux: CI_DRM_16694 -> CI_DRM_16695

  CI-20190529: 20190529
  CI_DRM_16694: aca8df1835568921d5f108fe9fd16b1d282a74b2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16695: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13286: ec3f79958262789d5578a29070cf6bda86cba803 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13286/index.html

--===============4649517702842158606==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Blocklist unsupported Xe scaling tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150185/">https://patchwork.freedesktop.org/series/150185/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13286/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13286/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8409 -&gt; IGTPW_13286</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13286/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13286 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8409/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13286/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13930">i915#13930</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8409 -&gt; IGTPW_13286</li>
<li>Linux: CI_DRM_16694 -&gt; CI_DRM_16695</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16694: aca8df1835568921d5f108fe9fd16b1d282a74b2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16695: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13286: ec3f79958262789d5578a29070cf6bda86cba803 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4649517702842158606==--
