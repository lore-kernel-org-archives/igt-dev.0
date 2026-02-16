Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A5FE7BD87
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 10:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4AA10E21F;
	Mon, 16 Feb 2026 10:15:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C962610E10B;
 Mon, 16 Feb 2026 10:14:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5708155096464344309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/2=5D_lib/amdgpu=3A_support_FWM_packet_in_user_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yogesh Mohan Marimuthu" <yogesh.mohanmarimuthu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 16 Feb 2026 10:14:59 -0000
Message-ID: <177123689980.255575.8710575390154233190@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260216094506.36506-1-yogesh.mohanmarimuthu@amd.com>
In-Reply-To: <20260216094506.36506-1-yogesh.mohanmarimuthu@amd.com>
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

--===============5708155096464344309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] lib/amdgpu: support FWM packet in user queue
URL   : https://patchwork.freedesktop.org/series/161638/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8753_BAT -> XEIGTPW_14555_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8753 -> IGTPW_14555
  * Linux: xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92 -> xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc

  IGTPW_14555: 14555
  IGT_8753: 8753
  xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92: ec995dd44a15b6f448fa3c7c8967f71443264b92
  xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc: eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14555/index.html

--===============5708155096464344309==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] lib/amdgpu: support FWM packet in user queue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161638/">https://patchwork.freedesktop.org/series/161638/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14555/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14555/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8753_BAT -&gt; XEIGTPW_14555_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8753 -&gt; IGTPW_14555</li>
<li>Linux: xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92 -&gt; xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc</li>
</ul>
<p>IGTPW_14555: 14555<br />
  IGT_8753: 8753<br />
  xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92: ec995dd44a15b6f448fa3c7c8967f71443264b92<br />
  xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc: eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc</p>

</body>
</html>

--===============5708155096464344309==--
