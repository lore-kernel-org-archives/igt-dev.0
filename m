Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C84C02198
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 00:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D132A10E4A1;
	Sat, 15 Feb 2025 00:51:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E798C10E4A1;
 Sat, 15 Feb 2025 00:51:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2749505180832855065=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=3A_Test_scratch_page_und?=
 =?utf-8?q?er_fault_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 15 Feb 2025 00:51:51 -0000
Message-ID: <173958071194.2227020.14976470548146502149@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214215920.282425-1-oak.zeng@intel.com>
In-Reply-To: <20250214215920.282425-1-oak.zeng@intel.com>
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

--===============2749505180832855065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Test scratch page under fault mode
URL   : https://patchwork.freedesktop.org/series/144907/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8230_BAT -> XEIGTPW_12604_BAT
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

  * IGT: IGT_8230 -> IGTPW_12604
  * Linux: xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9 -> xe-2669-cbd747025a1ef985e1ebfa040aa0da4a5d77aacd

  IGTPW_12604: fe89e403eea82cd18b34ae0fcf3d746f9fbec4ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8230: 8230
  xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9: 57457d93f156d8b4bdff8d138127d81b8f97d8c9
  xe-2669-cbd747025a1ef985e1ebfa040aa0da4a5d77aacd: cbd747025a1ef985e1ebfa040aa0da4a5d77aacd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12604/index.html

--===============2749505180832855065==
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
<tr><td><b>Series:</b></td><td>xe: Test scratch page under fault mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144907/">https://patchwork.freedesktop.org/series/144907/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12604/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12604/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8230_BAT -&gt; XEIGTPW_12604_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8230 -&gt; IGTPW_12604</li>
<li>Linux: xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9 -&gt; xe-2669-cbd747025a1ef985e1ebfa040aa0da4a5d77aacd</li>
</ul>
<p>IGTPW_12604: fe89e403eea82cd18b34ae0fcf3d746f9fbec4ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8230: 8230<br />
  xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9: 57457d93f156d8b4bdff8d138127d81b8f97d8c9<br />
  xe-2669-cbd747025a1ef985e1ebfa040aa0da4a5d77aacd: cbd747025a1ef985e1ebfa040aa0da4a5d77aacd</p>

</body>
</html>

--===============2749505180832855065==--
