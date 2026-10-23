Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D944606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 15:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9F110E63D;
	Fri, 23 Oct 2026 15:28:10 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8CD10E63D;
 Fri, 23 Oct 2026 15:27:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1868413632627496116=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_add_coverage_for_xe=5Fpxp?=
 =?utf-8?q?=5Fdebugfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Oct 2026 15:27:21 -0000
Message-ID: <179276924157.60980.4714323438174742463@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023052644.192314-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261023052644.192314-1-shivtej.eknath.patil@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1868413632627496116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add coverage for xe_pxp_debugfs (rev3)
URL   : https://patchwork.freedesktop.org/series/175588/
State : success

== Summary ==

CI Bug Log - changes from IGT_9161 -> IGTPW_16037
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16037/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16037 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2] ([i915#16664])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9161/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16037/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#16664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9161 -> IGTPW_16037
  * Linux: CI_DRM_19388 -> CI_DRM_19390

  CI-20190529: 20190529
  CI_DRM_19388: d6c8f78b0a1bb599990dcae731e1f6a29daeb9d4 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19390: a4c732aca52a51c32227b9a9a1364e1e533d275c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16037: 16037
  IGT_9161: 9161

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16037/index.html

--===============1868413632627496116==
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
<tr><td><b>Series:</b></td><td>add coverage for xe_pxp_debugfs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175588/">https://patchwork.freedesktop.org/series/175588/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16037/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16037/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9161 -&gt; IGTPW_16037</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16037/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16037 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9161/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16037/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664">i915#16664</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9161 -&gt; IGTPW_16037</li>
<li>Linux: CI_DRM_19388 -&gt; CI_DRM_19390</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19388: d6c8f78b0a1bb599990dcae731e1f6a29daeb9d4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19390: a4c732aca52a51c32227b9a9a1364e1e533d275c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16037: 16037<br />
  IGT_9161: 9161</p>

</body>
</html>

--===============1868413632627496116==--
