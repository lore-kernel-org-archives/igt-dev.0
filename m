Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B29E10AB82A
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 22:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4E510E688;
	Thu, 26 Mar 2026 22:24:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C51B10E688;
 Thu, 26 Mar 2026 22:24:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5265096155888691991=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Prepare_for_returning_NUL?=
 =?utf-8?q?L_from_igt=5Fcrtc=5Ffor=5Fpipe=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 22:24:16 -0000
Message-ID: <177456385635.404030.951013524498856898@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1774529527.git.jani.nikula@intel.com>
In-Reply-To: <cover.1774529527.git.jani.nikula@intel.com>
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

--===============5265096155888691991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prepare for returning NULL from igt_crtc_for_pipe() (rev3)
URL   : https://patchwork.freedesktop.org/series/163278/
State : success

== Summary ==

CI Bug Log - changes from IGT_8834 -> IGTPW_14866
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14866/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): bat-dg2-13 bat-mtlp-9 bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8834 -> IGTPW_14866
  * Linux: CI_DRM_18222 -> CI_DRM_18228

  CI-20190529: 20190529
  CI_DRM_18222: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18228: e7f370d78d32ed29cc3f100fbc3d1fe1a844978f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14866: 14866
  IGT_8834: 8834

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14866/index.html

--===============5265096155888691991==
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
<tr><td><b>Series:</b></td><td>Prepare for returning NULL from igt_crtc_for_pipe() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163278/">https://patchwork.freedesktop.org/series/163278/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14866/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14866/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8834 -&gt; IGTPW_14866</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14866/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): bat-dg2-13 bat-mtlp-9 bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8834 -&gt; IGTPW_14866</li>
<li>Linux: CI_DRM_18222 -&gt; CI_DRM_18228</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18222: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18228: e7f370d78d32ed29cc3f100fbc3d1fe1a844978f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14866: 14866<br />
  IGT_8834: 8834</p>

</body>
</html>

--===============5265096155888691991==--
