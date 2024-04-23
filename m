Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48831C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 09:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0B010FB78;
	Tue, 23 Apr 2024 09:58:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6298610FB74;
 Tue, 23 Apr 2024 09:58:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2162222101778041014=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Use_xe2_render-copy_on_newer_h?=
 =?utf-8?q?ardware?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Apr 2024 09:58:09 -0000
Message-ID: <171386628940.1607645.6586386709917889813@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
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

--===============2162222101778041014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use xe2 render-copy on newer hardware
URL   : https://patchwork.freedesktop.org/series/132752/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7816_BAT -> XEIGTPW_11054_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7816 -> IGTPW_11054
  * Linux: xe-1158-b2461ae195a8859f0627817898b0311a7b697c72 -> xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf

  IGTPW_11054: fffff5774ca9e3bdbed475d30338eaff2b40d802 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7816: 2e8f3e06fbd7335cf65a93115c72f0e167a570a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1158-b2461ae195a8859f0627817898b0311a7b697c72: b2461ae195a8859f0627817898b0311a7b697c72
  xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf: 861eed75446fe9dbac9d28d11f44caa47cebeebf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11054/index.html

--===============2162222101778041014==
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
<tr><td><b>Series:</b></td><td>Use xe2 render-copy on newer hardware</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132752/">https://patchwork.freedesktop.org/series/132752/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11054/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11054/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7816_BAT -&gt; XEIGTPW_11054_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7816 -&gt; IGTPW_11054</li>
<li>Linux: xe-1158-b2461ae195a8859f0627817898b0311a7b697c72 -&gt; xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf</li>
</ul>
<p>IGTPW_11054: fffff5774ca9e3bdbed475d30338eaff2b40d802 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7816: 2e8f3e06fbd7335cf65a93115c72f0e167a570a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1158-b2461ae195a8859f0627817898b0311a7b697c72: b2461ae195a8859f0627817898b0311a7b697c72<br />
  xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf: 861eed75446fe9dbac9d28d11f44caa47cebeebf</p>

</body>
</html>

--===============2162222101778041014==--
