Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A781BC88E4C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 01:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC1510E047;
	Fri, 11 Sep 2026 01:07:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3535A10E047;
 Fri, 11 Sep 2026 01:06:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6224781945554266267=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/amdgpu=3A_add_asic_id?=
 =?utf-8?q?_for_gfx1102?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Sep 2026 01:06:30 -0000
Message-ID: <178908879020.148519.16916931344279693354@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910171148.29997-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260910171148.29997-1-vitaly.prosyak@amd.com>
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

--===============6224781945554266267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: add asic id for gfx1102
URL   : https://patchwork.freedesktop.org/series/173804/
State : success

== Summary ==

CI Bug Log - changes from IGT_9091 -> IGTPW_15829
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15829/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9091 -> IGTPW_15829

  CI-20190529: 20190529
  CI_DRM_19124: cf3f6830cd1a44f792534b4f5695c5ca7a69943d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15829: 2d3abe40d24a39377c6688227273f382510d02cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9091: 9091

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15829/index.html

--===============6224781945554266267==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: add asic id for gfx1102</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173804/">https://patchwork.freedesktop.org/series/173804/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15829/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15829/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9091 -&gt; IGTPW_15829</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15829/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9091 -&gt; IGTPW_15829</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19124: cf3f6830cd1a44f792534b4f5695c5ca7a69943d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15829: 2d3abe40d24a39377c6688227273f382510d02cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9091: 9091</p>

</body>
</html>

--===============6224781945554266267==--
