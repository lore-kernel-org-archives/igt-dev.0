Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630E6CC6B03
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 07:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E6710E752;
	Tue, 13 Oct 2026 07:48:21 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF24610E752;
 Tue, 13 Oct 2026 07:47:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5581568055927289554=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fccs=3A_fre?=
 =?utf-8?q?e_CCS_snapshot_buffer_in_surf=5Fcopy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Oct 2026 07:47:34 -0000
Message-ID: <179187765497.16334.12929456609550633486@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013041104.1107303-1-nishit.sharma@intel.com>
In-Reply-To: <20261013041104.1107303-1-nishit.sharma@intel.com>
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

--===============5581568055927289554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_ccs: free CCS snapshot buffer in surf_copy
URL   : https://patchwork.freedesktop.org/series/175998/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9140_BAT -> XEIGTPW_15973_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9140 -> IGTPW_15973
  * Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -> xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376

  IGTPW_15973: 94ef0ce3ae900eedd36103e0e161e15460db4987 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071ebdd0c3d6fb287f64a1
  xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376: 882b0f966d25236f00d6ec0c349f7948d2ed1376

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15973/index.html

--===============5581568055927289554==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_ccs: free CCS snapshot buffer in surf_copy</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175998/">https://patchwork.freedesktop.org/series/175998/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15973/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15973/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9140_BAT -&gt; XEIGTPW_15973_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9140 -&gt; IGTPW_15973</li>
<li>Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -&gt; xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376</li>
</ul>
<p>IGTPW_15973: 94ef0ce3ae900eedd36103e0e161e15460db4987 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071ebdd0c3d6fb287f64a1<br />
  xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376: 882b0f966d25236f00d6ec0c349f7948d2ed1376</p>

</body>
</html>

--===============5581568055927289554==--
