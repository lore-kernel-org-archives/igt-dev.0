Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEBB103E305
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 15:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74F010E00B;
	Fri, 13 Mar 2026 15:53:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F7610E00B;
 Fri, 13 Mar 2026 15:53:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5484480391467305991=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_Vebox_engine_copy_on?=
 =?utf-8?q?_Intel_Xe_driver_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Mar 2026 15:53:06 -0000
Message-ID: <177341718638.356420.7854668594718137756@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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

--===============5484480391467305991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable Vebox engine copy on Intel Xe driver (rev7)
URL   : https://patchwork.freedesktop.org/series/161376/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8802_BAT -> XEIGTPW_14760_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 10)
------------------------------

  Missing    (4): bat-adlp-7 bat-bmg-2 bat-atsm-2 bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8802 -> IGTPW_14760

  IGTPW_14760: 14760
  IGT_8802: 8802
  xe-4713-45618ec6cfed86e72cf6c2325c8f947bfbe7c132: 45618ec6cfed86e72cf6c2325c8f947bfbe7c132

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14760/index.html

--===============5484480391467305991==
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
<tr><td><b>Series:</b></td><td>Enable Vebox engine copy on Intel Xe driver (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161376/">https://patchwork.freedesktop.org/series/161376/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14760/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14760/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8802_BAT -&gt; XEIGTPW_14760_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 10)</h2>
<p>Missing    (4): bat-adlp-7 bat-bmg-2 bat-atsm-2 bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8802 -&gt; IGTPW_14760</li>
</ul>
<p>IGTPW_14760: 14760<br />
  IGT_8802: 8802<br />
  xe-4713-45618ec6cfed86e72cf6c2325c8f947bfbe7c132: 45618ec6cfed86e72cf6c2325c8f947bfbe7c132</p>

</body>
</html>

--===============5484480391467305991==--
