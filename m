Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1024C87FCF
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 18:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2385F10E22A;
	Mon,  4 Aug 2025 18:09:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9570B10E22A;
 Mon,  4 Aug 2025 18:09:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0378261315550186223=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Replace_hard_coded_modifiers_with_async_modifiers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Aug 2025 18:09:51 -0000
Message-ID: <175433099160.211102.12247062251423935561@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250804141115.953393-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250804141115.953393-1-santhosh.reddy.guddati@intel.com>
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

--===============0378261315550186223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Replace hard coded modifiers with async modifiers (rev3)
URL   : https://patchwork.freedesktop.org/series/151648/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8485_BAT -> XEIGTPW_13550_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8485 -> IGTPW_13550
  * Linux: xe-3503-8ef111c44cc83f182055c33c552523ac3f3f7a97 -> xe-3505-7358407738e36791d7c141decf98622e05b34a01

  IGTPW_13550: ab65af489e2a2f374102caa4313e47bc2c3ee37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8485: cb040c57e8bbc1cdac111ada808d5a7dd569a546 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3503-8ef111c44cc83f182055c33c552523ac3f3f7a97: 8ef111c44cc83f182055c33c552523ac3f3f7a97
  xe-3505-7358407738e36791d7c141decf98622e05b34a01: 7358407738e36791d7c141decf98622e05b34a01

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13550/index.html

--===============0378261315550186223==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Replace hard coded modifiers with async modifiers (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151648/">https://patchwork.freedesktop.org/series/151648/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13550/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13550/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8485_BAT -&gt; XEIGTPW_13550_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8485 -&gt; IGTPW_13550</li>
<li>Linux: xe-3503-8ef111c44cc83f182055c33c552523ac3f3f7a97 -&gt; xe-3505-7358407738e36791d7c141decf98622e05b34a01</li>
</ul>
<p>IGTPW_13550: ab65af489e2a2f374102caa4313e47bc2c3ee37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8485: cb040c57e8bbc1cdac111ada808d5a7dd569a546 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3503-8ef111c44cc83f182055c33c552523ac3f3f7a97: 8ef111c44cc83f182055c33c552523ac3f3f7a97<br />
  xe-3505-7358407738e36791d7c141decf98622e05b34a01: 7358407738e36791d7c141decf98622e05b34a01</p>

</body>
</html>

--===============0378261315550186223==--
