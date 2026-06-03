Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC95CD6E5D
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 03:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA04710F7C9;
	Wed,  3 Jun 2026 03:18:40 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE9B10F7C8;
 Wed,  3 Jun 2026 03:18:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1478465668881933632=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fbw=3A_fix_con?=
 =?utf-8?q?nected_output_count_when_connectors_exceed_pipe_count_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Jun 2026 03:18:19 -0000
Message-ID: <178045669990.38098.14311977914403782046@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602052407.3326517-1-sowmiya.s@intel.com>
In-Reply-To: <20260602052407.3326517-1-sowmiya.s@intel.com>
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

--===============1478465668881933632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_bw: fix connected output count when connectors exceed pipe count (rev2)
URL   : https://patchwork.freedesktop.org/series/167710/
State : success

== Summary ==

CI Bug Log - changes from IGT_8947 -> IGTPW_15287
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8947 -> IGTPW_15287
  * Linux: CI_DRM_18611 -> CI_DRM_18613

  CI-20190529: 20190529
  CI_DRM_18611: f059886850b97ea5c089703ba3e566a4f847fa19 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18613: ab2d36ce7e67d2825cea19ea956947a21e932f70 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15287: 15287
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html

--===============1478465668881933632==
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
<tr><td><b>Series:</b></td><td>tests/kms_bw: fix connected output count when connectors exceed pipe count (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167710/">https://patchwork.freedesktop.org/series/167710/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8947 -&gt; IGTPW_15287</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8947 -&gt; IGTPW_15287</li>
<li>Linux: CI_DRM_18611 -&gt; CI_DRM_18613</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18611: f059886850b97ea5c089703ba3e566a4f847fa19 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18613: ab2d36ce7e67d2825cea19ea956947a21e932f70 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15287: 15287<br />
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1478465668881933632==--
