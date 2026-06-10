Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF68CD98C5
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 23:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C06C10EC28;
	Wed, 10 Jun 2026 23:25:16 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACE310EC28;
 Wed, 10 Jun 2026 23:24:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6852494389770700343=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fconcurrent=3A?=
 =?utf-8?q?_Skip_mode=5Flo_if_it_requires_bigjoiner_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Jun 2026 23:24:51 -0000
Message-ID: <178113389175.66769.13928104572369120070@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610111207.3423966-1-sowmiya.s@intel.com>
In-Reply-To: <20260610111207.3423966-1-sowmiya.s@intel.com>
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

--===============6852494389770700343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_concurrent: Skip mode_lo if it requires bigjoiner (rev2)
URL   : https://patchwork.freedesktop.org/series/168233/
State : success

== Summary ==

CI Bug Log - changes from IGT_8958 -> IGTPW_15339
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15339/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8958 -> IGTPW_15339

  CI-20190529: 20190529
  CI_DRM_18657: 10db0c83b0ccc3211990b54235475abb9d383851 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15339: 15339
  IGT_8958: 8958

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15339/index.html

--===============6852494389770700343==
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
<tr><td><b>Series:</b></td><td>tests/kms_concurrent: Skip mode_lo if it requires bigjoiner (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168233/">https://patchwork.freedesktop.org/series/168233/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15339/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15339/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8958 -&gt; IGTPW_15339</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15339/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8958 -&gt; IGTPW_15339</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18657: 10db0c83b0ccc3211990b54235475abb9d383851 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15339: 15339<br />
  IGT_8958: 8958</p>

</body>
</html>

--===============6852494389770700343==--
