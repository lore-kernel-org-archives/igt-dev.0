Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB939CD98F2
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 18:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651FA10E7C9;
	Mon, 22 Jun 2026 18:04:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A3D10E7C9;
 Mon, 22 Jun 2026 18:04:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5286453389365743333=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_CPU_idle_state_control_?=
 =?utf-8?q?for_accurate_vblank_timing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason-JH Lin" <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 22 Jun 2026 18:04:15 -0000
Message-ID: <178215145578.102379.718361730671642403@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260621084445.614024-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260621084445.614024-1-jason-jh.lin@mediatek.com>
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

--===============5286453389365743333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CPU idle state control for accurate vblank timing (rev2)
URL   : https://patchwork.freedesktop.org/series/166912/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8977_BAT -> XEIGTPW_15413_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8977 -> IGTPW_15413

  IGTPW_15413: 4d55f6f9ca576c8610f0bedfa7edb8e4bde4ce62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8977: c8bdb0bc2140e337e1d79969430c3d7a5c088c9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798: 6583dd200482a34bb17e5dc54551f91f53b79798

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15413/index.html

--===============5286453389365743333==
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
<tr><td><b>Series:</b></td><td>Add CPU idle state control for accurate vblank timing (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166912/">https://patchwork.freedesktop.org/series/166912/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15413/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15413/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8977_BAT -&gt; XEIGTPW_15413_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8977 -&gt; IGTPW_15413</li>
</ul>
<p>IGTPW_15413: 4d55f6f9ca576c8610f0bedfa7edb8e4bde4ce62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8977: c8bdb0bc2140e337e1d79969430c3d7a5c088c9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798: 6583dd200482a34bb17e5dc54551f91f53b79798</p>

</body>
</html>

--===============5286453389365743333==--
