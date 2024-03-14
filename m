Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD98C54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 06:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1376710F906;
	Thu, 14 Mar 2024 06:48:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B599B10F906;
 Thu, 14 Mar 2024 06:48:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1520393189414297230=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel-ci=3A_Unblock_core?=
 =?utf-8?q?_hotunplug_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 14 Mar 2024 06:48:53 -0000
Message-ID: <171039893374.753907.10160215361448033539@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314044630.9816-1-himanshu.girotra@intel.com>
In-Reply-To: <20240314044630.9816-1-himanshu.girotra@intel.com>
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

--===============1520393189414297230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Unblock core hotunplug test
URL   : https://patchwork.freedesktop.org/series/131119/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7761_BAT -> XEIGTPW_10831_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 2)
------------------------------

  Missing    (2): bat-pvc-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7761 -> IGTPW_10831

  IGTPW_10831: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10831/index.html
  IGT_7761: 67af6998a7e0467a7a0718cbbfe05a9fd383206f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-938-96e47e3f3a5952e104d56352872becdc0048d26e: 96e47e3f3a5952e104d56352872becdc0048d26e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10831/index.html

--===============1520393189414297230==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Unblock core hotunplug test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131119/">https://patchwork.freedesktop.org/series/131119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10831/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10831/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7761_BAT -&gt; XEIGTPW_10831_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 2)</h2>
<p>Missing    (2): bat-pvc-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7761 -&gt; IGTPW_10831</li>
</ul>
<p>IGTPW_10831: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10831/index.html<br />
  IGT_7761: 67af6998a7e0467a7a0718cbbfe05a9fd383206f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-938-96e47e3f3a5952e104d56352872becdc0048d26e: 96e47e3f3a5952e104d56352872becdc0048d26e</p>

</body>
</html>

--===============1520393189414297230==--
