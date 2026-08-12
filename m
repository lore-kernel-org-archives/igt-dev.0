Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ED3C5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 14:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8F510F01F;
	Wed, 12 Aug 2026 14:15:23 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF07E10F021;
 Wed, 12 Aug 2026 14:14:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2259833459056097935=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_CMRR_subtests_=28rev4?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Aug 2026 14:14:47 -0000
Message-ID: <178654408770.43907.14914899926032113003@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
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

--===============2259833459056097935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CMRR subtests (rev4)
URL   : https://patchwork.freedesktop.org/series/171615/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9052_BAT -> XEIGTPW_15664_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-2 bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9052 -> IGTPW_15664
  * Linux: xe-5578-aabf41c0ea0ad661a2e384e51955b24343f6ca25 -> xe-5580-96ddbb14986632af742523e68f90d51c138c57f0

  IGTPW_15664: 88d475ce1257e96e412f238f819fe929f18a3947 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9052: 9052
  xe-5578-aabf41c0ea0ad661a2e384e51955b24343f6ca25: aabf41c0ea0ad661a2e384e51955b24343f6ca25
  xe-5580-96ddbb14986632af742523e68f90d51c138c57f0: 96ddbb14986632af742523e68f90d51c138c57f0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15664/index.html

--===============2259833459056097935==
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
<tr><td><b>Series:</b></td><td>Add CMRR subtests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171615/">https://patchwork.freedesktop.org/series/171615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15664/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15664/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9052_BAT -&gt; XEIGTPW_15664_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9052 -&gt; IGTPW_15664</li>
<li>Linux: xe-5578-aabf41c0ea0ad661a2e384e51955b24343f6ca25 -&gt; xe-5580-96ddbb14986632af742523e68f90d51c138c57f0</li>
</ul>
<p>IGTPW_15664: 88d475ce1257e96e412f238f819fe929f18a3947 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9052: 9052<br />
  xe-5578-aabf41c0ea0ad661a2e384e51955b24343f6ca25: aabf41c0ea0ad661a2e384e51955b24343f6ca25<br />
  xe-5580-96ddbb14986632af742523e68f90d51c138c57f0: 96ddbb14986632af742523e68f90d51c138c57f0</p>

</body>
</html>

--===============2259833459056097935==--
