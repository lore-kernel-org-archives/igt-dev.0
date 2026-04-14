Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA996F531E6
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 02:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7449010E059;
	Tue, 14 Apr 2026 02:55:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64FC10E059;
 Tue, 14 Apr 2026 02:55:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5145455524845851195=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tool/intel=5Fhdcp=3A_Fix_fl?=
 =?utf-8?q?ickering_and_show_actual_HDCP_status_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.harrison@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 14 Apr 2026 02:55:24 -0000
Message-ID: <177613532489.459650.4425797479284926764@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
In-Reply-To: <20260413233629.771034-1-John.Harrison@Igalia.com>
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

--===============5145455524845851195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tool/intel_hdcp: Fix flickering and show actual HDCP status (rev3)
URL   : https://patchwork.freedesktop.org/series/161513/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8854_BAT -> XEIGTPW_14976_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 11)
------------------------------

  Missing    (3): bat-dg2-oem2 bat-adlp-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8854 -> IGTPW_14976
  * Linux: xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5 -> xe-4897-c8bad7becc008716c8475847328c549e178c813c

  IGTPW_14976: 93e06fced633c6dc69ea7d4ca9825033f68ab1fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5: 3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5
  xe-4897-c8bad7becc008716c8475847328c549e178c813c: c8bad7becc008716c8475847328c549e178c813c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14976/index.html

--===============5145455524845851195==
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
<tr><td><b>Series:</b></td><td>tool/intel_hdcp: Fix flickering and show actual HDCP status (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161513/">https://patchwork.freedesktop.org/series/161513/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14976/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14976/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8854_BAT -&gt; XEIGTPW_14976_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 11)</h2>
<p>Missing    (3): bat-dg2-oem2 bat-adlp-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8854 -&gt; IGTPW_14976</li>
<li>Linux: xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5 -&gt; xe-4897-c8bad7becc008716c8475847328c549e178c813c</li>
</ul>
<p>IGTPW_14976: 93e06fced633c6dc69ea7d4ca9825033f68ab1fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5: 3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5<br />
  xe-4897-c8bad7becc008716c8475847328c549e178c813c: c8bad7becc008716c8475847328c549e178c813c</p>

</body>
</html>

--===============5145455524845851195==--
