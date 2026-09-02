Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C77C624D4
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 22:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D1B10E052;
	Wed,  2 Sep 2026 22:03:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296C410E052;
 Wed,  2 Sep 2026 22:02:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2933291944831582705=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Xe3P_GPU_Error_Injection_?=
 =?utf-8?q?Test_Suite_with_DRM_RAS_Netlink_Support_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 02 Sep 2026 22:02:23 -0000
Message-ID: <178838654316.115662.11531416400257462779@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
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

--===============2933291944831582705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Xe3P GPU Error Injection Test Suite with DRM RAS Netlink Support (rev6)
URL   : https://patchwork.freedesktop.org/series/171275/
State : success

== Summary ==

CI Bug Log - changes from IGT_9080 -> IGTPW_15776
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15776/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9080 -> IGTPW_15776
  * Linux: CI_DRM_19073 -> CI_DRM_19078

  CI-20190529: 20190529
  CI_DRM_19073: be95a6d80ceeed520c4444e047e7dd5d42a43a4a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19078: bb742c97086d95b2a04b1b8fbc67822b4cf848c3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15776: 63712730f6fd94e38569aa908233605aae8f00d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15776/index.html

--===============2933291944831582705==
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
<tr><td><b>Series:</b></td><td>Xe3P GPU Error Injection Test Suite with DRM RAS Netlink Support (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171275/">https://patchwork.freedesktop.org/series/171275/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15776/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15776/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9080 -&gt; IGTPW_15776</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15776/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9080 -&gt; IGTPW_15776</li>
<li>Linux: CI_DRM_19073 -&gt; CI_DRM_19078</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19073: be95a6d80ceeed520c4444e047e7dd5d42a43a4a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19078: bb742c97086d95b2a04b1b8fbc67822b4cf848c3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15776: 63712730f6fd94e38569aa908233605aae8f00d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2933291944831582705==--
