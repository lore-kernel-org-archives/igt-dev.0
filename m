Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7FAC02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 12:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A7C10EADA;
	Fri, 17 Jan 2025 12:16:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF0510E23F;
 Fri, 17 Jan 2025 12:16:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2083002364672126435=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Fvrr=5Fra?=
 =?utf-8?q?nge=3A_Fix_panel_cannot_light_up_after_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jan 2025 12:16:23 -0000
Message-ID: <173711618305.714322.2311881253868854323@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117100101.4282-1-chiahsuan.chung@amd.com>
In-Reply-To: <20250117100101.4282-1-chiahsuan.chung@amd.com>
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

--===============2083002364672126435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_vrr_range: Fix panel cannot light up after test (rev2)
URL   : https://patchwork.freedesktop.org/series/143059/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8196_BAT -> XEIGTPW_12455_BAT
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

  * IGT: IGT_8196 -> IGTPW_12455
  * Linux: xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88 -> xe-2505-48e8781781323a28fabb378bcc79b3f48c1bcae0

  IGTPW_12455: 5885393e3cf3c5e6bc77566baf9056af5a04192d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8196: 824553d05138bbfa48b9e60e9c2a741497c7c627 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88: a15d2a84505eed8dbb58911147e44752734f3a88
  xe-2505-48e8781781323a28fabb378bcc79b3f48c1bcae0: 48e8781781323a28fabb378bcc79b3f48c1bcae0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12455/index.html

--===============2083002364672126435==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_vrr_range: Fix panel cannot light up after test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143059/">https://patchwork.freedesktop.org/series/143059/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12455/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12455/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8196_BAT -&gt; XEIGTPW_12455_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8196 -&gt; IGTPW_12455</li>
<li>Linux: xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88 -&gt; xe-2505-48e8781781323a28fabb378bcc79b3f48c1bcae0</li>
</ul>
<p>IGTPW_12455: 5885393e3cf3c5e6bc77566baf9056af5a04192d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8196: 824553d05138bbfa48b9e60e9c2a741497c7c627 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88: a15d2a84505eed8dbb58911147e44752734f3a88<br />
  xe-2505-48e8781781323a28fabb378bcc79b3f48c1bcae0: 48e8781781323a28fabb378bcc79b3f48c1bcae0</p>

</body>
</html>

--===============2083002364672126435==--
