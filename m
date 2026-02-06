Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAF8EE2084
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 10:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4592710E6EB;
	Fri,  6 Feb 2026 10:37:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DCF10E6E9;
 Fri,  6 Feb 2026 10:37:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5822707346287012491=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/amdgpu/amd=5Fjpeg=5Fsha?=
 =?utf-8?q?red=3A_Fix_JPEG_decode_on_VCN_5=2Ex_with_correct_register_offsets?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tessita Thomas" <tessita.thomas@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Feb 2026 10:37:02 -0000
Message-ID: <177037422224.232294.10132340089614297137@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206095617.453868-1-Tessita.Thomas@amd.com>
In-Reply-To: <20260206095617.453868-1-Tessita.Thomas@amd.com>
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

--===============5822707346287012491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu/amd_jpeg_shared: Fix JPEG decode on VCN 5.x with correct register offsets
URL   : https://patchwork.freedesktop.org/series/161260/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8740_BAT -> XEIGTPW_14509_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8740 -> IGTPW_14509
  * Linux: xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb -> xe-4518-0082025812a31eda451fb14f13f52683ed375c49

  IGTPW_14509: 14509
  IGT_8740: 36ebdc56b434bf330c44e96205f1fcefcf598651 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb: 75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb
  xe-4518-0082025812a31eda451fb14f13f52683ed375c49: 0082025812a31eda451fb14f13f52683ed375c49

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14509/index.html

--===============5822707346287012491==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu/amd_jpeg_shared: Fix JPEG decode on VCN 5.x with correct register offsets</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161260/">https://patchwork.freedesktop.org/series/161260/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14509/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14509/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8740_BAT -&gt; XEIGTPW_14509_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8740 -&gt; IGTPW_14509</li>
<li>Linux: xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb -&gt; xe-4518-0082025812a31eda451fb14f13f52683ed375c49</li>
</ul>
<p>IGTPW_14509: 14509<br />
  IGT_8740: 36ebdc56b434bf330c44e96205f1fcefcf598651 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb: 75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb<br />
  xe-4518-0082025812a31eda451fb14f13f52683ed375c49: 0082025812a31eda451fb14f13f52683ed375c49</p>

</body>
</html>

--===============5822707346287012491==--
