Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29487C7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 18:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D370E10E013;
	Mon, 23 Jun 2025 18:10:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F65A10E013;
 Mon, 23 Jun 2025 18:10:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3656575779608514212=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fcursor=5Fcrc=3A?=
 =?utf-8?q?_optimise_cursor_crc_on_simulation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 23 Jun 2025 18:10:42 -0000
Message-ID: <175070224211.101275.1688886284270536044@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250623120643.613082-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250623120643.613082-1-santhosh.reddy.guddati@intel.com>
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

--===============3656575779608514212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: optimise cursor crc on simulation
URL   : https://patchwork.freedesktop.org/series/150628/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8422_BAT -> XEIGTPW_13337_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8422 -> IGTPW_13337

  IGTPW_13337: ad36f828fc9637b822e88a94ee83cc0735a54bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8422: 9b9c9136b17a2ed0680fb9589d51446c03698b37 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3291-9ec4850b4b065a9a15957da0ed1bb3904d4a3b18: 9ec4850b4b065a9a15957da0ed1bb3904d4a3b18

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13337/index.html

--===============3656575779608514212==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: optimise cursor crc on simulation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150628/">https://patchwork.freedesktop.org/series/150628/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13337/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13337/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8422_BAT -&gt; XEIGTPW_13337_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8422 -&gt; IGTPW_13337</li>
</ul>
<p>IGTPW_13337: ad36f828fc9637b822e88a94ee83cc0735a54bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8422: 9b9c9136b17a2ed0680fb9589d51446c03698b37 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3291-9ec4850b4b065a9a15957da0ed1bb3904d4a3b18: 9ec4850b4b065a9a15957da0ed1bb3904d4a3b18</p>

</body>
</html>

--===============3656575779608514212==--
