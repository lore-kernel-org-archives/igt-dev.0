Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF8410BA426
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 05:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8F110E3A9;
	Fri, 27 Mar 2026 05:09:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE8710E3A9;
 Fri, 27 Mar 2026 05:08:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1647279164523268158=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fcontent=5Fpro?=
 =?utf-8?q?tection=3A_Optimize_framebuffer_management_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason-JH Lin" <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Mar 2026 05:08:56 -0000
Message-ID: <177458813688.404868.10153604939252261826@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327035405.3151190-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260327035405.3151190-1-jason-jh.lin@mediatek.com>
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

--===============1647279164523268158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_content_protection: Optimize framebuffer management (rev3)
URL   : https://patchwork.freedesktop.org/series/163255/
State : success

== Summary ==

CI Bug Log - changes from IGT_8834 -> IGTPW_14869
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14869/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 bat-mtlp-9 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8834 -> IGTPW_14869
  * Linux: CI_DRM_18222 -> CI_DRM_18231

  CI-20190529: 20190529
  CI_DRM_18222: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18231: 113d411a9890a805edaffd3c3dd2cf436a868b68 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14869: 8fbaa114ec8c8c1890c7d32fc5f7dc4d273ba011 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8834: 8834

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14869/index.html

--===============1647279164523268158==
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
<tr><td><b>Series:</b></td><td>tests/kms_content_protection: Optimize framebuffer management (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163255/">https://patchwork.freedesktop.org/series/163255/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14869/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14869/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8834 -&gt; IGTPW_14869</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14869/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 bat-mtlp-9 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8834 -&gt; IGTPW_14869</li>
<li>Linux: CI_DRM_18222 -&gt; CI_DRM_18231</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18222: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18231: 113d411a9890a805edaffd3c3dd2cf436a868b68 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14869: 8fbaa114ec8c8c1890c7d32fc5f7dc4d273ba011 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8834: 8834</p>

</body>
</html>

--===============1647279164523268158==--
