Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A42BC5DF84
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388FD10E2FF;
	Tue, 18 Aug 2026 14:21:27 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54CB10E2FF;
 Tue, 18 Aug 2026 14:20:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8121441598638987104=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Order_SR-IOV_scheduling_p?=
 =?utf-8?q?rovisioning_safely?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 18 Aug 2026 14:20:49 -0000
Message-ID: <178706284966.63645.8847493208899042749@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
In-Reply-To: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
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

--===============8121441598638987104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Order SR-IOV scheduling provisioning safely
URL   : https://patchwork.freedesktop.org/series/172390/
State : success

== Summary ==

CI Bug Log - changes from IGT_9059 -> IGTPW_15698
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15698/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15698 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [DMESG-WARN][1] ([i915#13400]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9059/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15698/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9059 -> IGTPW_15698
  * Linux: CI_DRM_19006 -> CI_DRM_19010

  CI-20190529: 20190529
  CI_DRM_19006: b801f94c49ffdb0f65e37baf31d68570356d4983 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19010: 275df33dcf4c5d018717867a0b29ed1d3b62c1ef @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15698: f006191dbda63bfddb4cd2d81e36f7783765981f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15698/index.html

--===============8121441598638987104==
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
<tr><td><b>Series:</b></td><td>Order SR-IOV scheduling provisioning safely</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172390/">https://patchwork.freedesktop.org/series/172390/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15698/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15698/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9059 -&gt; IGTPW_15698</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15698/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15698 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_rpm@basic-rte:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9059/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15698/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9059 -&gt; IGTPW_15698</li>
<li>Linux: CI_DRM_19006 -&gt; CI_DRM_19010</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19006: b801f94c49ffdb0f65e37baf31d68570356d4983 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19010: 275df33dcf4c5d018717867a0b29ed1d3b62c1ef @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15698: f006191dbda63bfddb4cd2d81e36f7783765981f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8121441598638987104==--
