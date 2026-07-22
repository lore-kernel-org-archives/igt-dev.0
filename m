Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2A3C44536
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 12:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455CB10E437;
	Wed, 22 Jul 2026 12:35:02 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC8910E437;
 Wed, 22 Jul 2026 12:34:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4997619320146829830=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2CV2=2C1/2=5D_tests/amdgpu/amd=5Fdeadlock=3A_add_gfx_user-queu?=
 =?utf-8?q?e_clean-hang_reset_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 Jul 2026 12:34:29 -0000
Message-ID: <178472366990.216113.6002803934098333864@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722062137.3019454-1-Jesse.Zhang@amd.com>
In-Reply-To: <20260722062137.3019454-1-Jesse.Zhang@amd.com>
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

--===============4997619320146829830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,V2,1/2] tests/amdgpu/amd_deadlock: add gfx user-queue clean-hang reset test
URL   : https://patchwork.freedesktop.org/series/170884/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9018_BAT -> XEIGTPW_15579_BAT
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

  * IGT: IGT_9018 -> IGTPW_15579
  * Linux: xe-5453-5726f9c4bde0290e5e60e636b9632bb03a57498c -> xe-5456-a2dbc8135f5db01ae8e10adbd7e47566806c5b15

  IGTPW_15579: 15579
  IGT_9018: f4345861cbd5d97fd50b73bf7af5fe3286fca056 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5453-5726f9c4bde0290e5e60e636b9632bb03a57498c: 5726f9c4bde0290e5e60e636b9632bb03a57498c
  xe-5456-a2dbc8135f5db01ae8e10adbd7e47566806c5b15: a2dbc8135f5db01ae8e10adbd7e47566806c5b15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15579/index.html

--===============4997619320146829830==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,V2,1/2] tests/amdgpu/amd_deadlock: add gfx user-queue clean-hang reset test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170884/">https://patchwork.freedesktop.org/series/170884/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15579/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15579/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9018_BAT -&gt; XEIGTPW_15579_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9018 -&gt; IGTPW_15579</li>
<li>Linux: xe-5453-5726f9c4bde0290e5e60e636b9632bb03a57498c -&gt; xe-5456-a2dbc8135f5db01ae8e10adbd7e47566806c5b15</li>
</ul>
<p>IGTPW_15579: 15579<br />
  IGT_9018: f4345861cbd5d97fd50b73bf7af5fe3286fca056 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5453-5726f9c4bde0290e5e60e636b9632bb03a57498c: 5726f9c4bde0290e5e60e636b9632bb03a57498c<br />
  xe-5456-a2dbc8135f5db01ae8e10adbd7e47566806c5b15: a2dbc8135f5db01ae8e10adbd7e47566806c5b15</p>

</body>
</html>

--===============4997619320146829830==--
