Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16A1CA9ED2
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ACF10F396;
	Mon, 12 Oct 2026 21:11:22 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BBD10E690;
 Mon, 12 Oct 2026 21:10:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6333562651776888793=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fwedged=3A_?=
 =?utf-8?q?Add_cold-reset_wedge_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 12 Oct 2026 21:10:34 -0000
Message-ID: <179183943488.14539.12269141182249139930@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012081719.3961358-2-sk.anirban@intel.com>
In-Reply-To: <20261012081719.3961358-2-sk.anirban@intel.com>
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

--===============6333562651776888793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_wedged: Add cold-reset wedge test (rev2)
URL   : https://patchwork.freedesktop.org/series/175755/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9140_BAT -> XEIGTPW_15970_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-ptl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9140 -> IGTPW_15970
  * Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -> xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0

  IGTPW_15970: 04e919336ebd3a3fcee66e3a8ea305449f5df263 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071ebdd0c3d6fb287f64a1
  xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0: c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15970/index.html

--===============6333562651776888793==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_wedged: Add cold-reset wedge test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175755/">https://patchwork.freedesktop.org/series/175755/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15970/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15970/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9140_BAT -&gt; XEIGTPW_15970_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-ptl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9140 -&gt; IGTPW_15970</li>
<li>Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -&gt; xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0</li>
</ul>
<p>IGTPW_15970: 04e919336ebd3a3fcee66e3a8ea305449f5df263 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071ebdd0c3d6fb287f64a1<br />
  xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0: c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0</p>

</body>
</html>

--===============6333562651776888793==--
