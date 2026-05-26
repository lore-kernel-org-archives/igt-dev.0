Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAB6CD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 18:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932E810E1B1;
	Tue, 26 May 2026 18:36:14 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34B610E1B1;
 Tue, 26 May 2026 18:35:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6361120531537654818=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_test/kms=5Fcolorop=5Fhelper?=
 =?utf-8?q?=3A_don=27t_requests_colorop_updates_indefinitely?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 May 2026 18:35:53 -0000
Message-ID: <177982055385.11680.6848633766695369945@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526140752.503380-1-mwen@igalia.com>
In-Reply-To: <20260526140752.503380-1-mwen@igalia.com>
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

--===============6361120531537654818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/kms_colorop_helper: don't requests colorop updates indefinitely
URL   : https://patchwork.freedesktop.org/series/167285/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8938_BAT -> XEIGTPW_15245_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8938 -> IGTPW_15245
  * Linux: xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33 -> xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c

  IGTPW_15245: 3c70d804c32990cb07777af1708db7aa07c12748 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33: ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33
  xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c: 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15245/index.html

--===============6361120531537654818==
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
<tr><td><b>Series:</b></td><td>test/kms_colorop_helper: don&#x27;t requests colorop updates indefinitely</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167285/">https://patchwork.freedesktop.org/series/167285/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15245/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15245/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8938_BAT -&gt; XEIGTPW_15245_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8938 -&gt; IGTPW_15245</li>
<li>Linux: xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33 -&gt; xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c</li>
</ul>
<p>IGTPW_15245: 3c70d804c32990cb07777af1708db7aa07c12748 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33: ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33<br />
  xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c: 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c</p>

</body>
</html>

--===============6361120531537654818==--
