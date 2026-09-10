Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9AFC79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 18:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAA310E2C8;
	Thu, 10 Sep 2026 18:47:25 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3A910E2C8;
 Thu, 10 Sep 2026 18:46:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0751946275035782654=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_igt=3A_xe=5Fexec=5Freset?=
 =?utf-8?q?=3A_Remove_RAPID=5FRESET=5FSTRESS_from_mixed-engine_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Sep 2026 18:46:43 -0000
Message-ID: <178906600336.147924.2997588701305600179@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910132251.1669256-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260910132251.1669256-1-naresh.kumar.g@intel.com>
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

--===============0751946275035782654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: igt: xe_exec_reset: Remove RAPID_RESET_STRESS from mixed-engine test
URL   : https://patchwork.freedesktop.org/series/173794/
State : success

== Summary ==

CI Bug Log - changes from IGT_9090 -> IGTPW_15826
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15826/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9090 -> IGTPW_15826
  * Linux: CI_DRM_19120 -> CI_DRM_19121

  CI-20190529: 20190529
  CI_DRM_19120: b8885acadfe9e40109912dd45986112b007b0d98 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19121: de0b423cd4c2178272a2057ee6c7b05fbd4015a6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15826: f5b975dc0aea1d96759e673949edde268f790556 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9090: 9090

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15826/index.html

--===============0751946275035782654==
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
<tr><td><b>Series:</b></td><td>igt: xe_exec_reset: Remove RAPID_RESET_STRESS from mixed-engine test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173794/">https://patchwork.freedesktop.org/series/173794/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15826/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15826/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9090 -&gt; IGTPW_15826</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15826/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9090 -&gt; IGTPW_15826</li>
<li>Linux: CI_DRM_19120 -&gt; CI_DRM_19121</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19120: b8885acadfe9e40109912dd45986112b007b0d98 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19121: de0b423cd4c2178272a2057ee6c7b05fbd4015a6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15826: f5b975dc0aea1d96759e673949edde268f790556 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9090: 9090</p>

</body>
</html>

--===============0751946275035782654==--
