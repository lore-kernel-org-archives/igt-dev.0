Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9915ACA6002
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 16:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3630210E63D;
	Wed,  7 Oct 2026 16:41:02 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3907310E63D;
 Wed,  7 Oct 2026 16:40:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6371046721009595422=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_igt=5Frunner_hang_and_r?=
 =?utf-8?q?esource_leak_associated_with_pw-reserve?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Oct 2026 16:40:15 -0000
Message-ID: <179139121522.249379.1343638221916539270@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com>
In-Reply-To: <20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com>
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

--===============6371046721009595422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix igt_runner hang and resource leak associated with pw-reserve
URL   : https://patchwork.freedesktop.org/series/175697/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9133_BAT -> XEIGTPW_15953_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9133 -> IGTPW_15953

  IGTPW_15953: 67642d1264abffa503eae1e36bc1a9e2a23ee8f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9133: 87159cf671a3bf9e04bd46442ef1a358481a66f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05: 5dc178a4563d8d2ee7fc3a81d005700cbfa04c05

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15953/index.html

--===============6371046721009595422==
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
<tr><td><b>Series:</b></td><td>Fix igt_runner hang and resource leak associated with pw-reserve</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175697/">https://patchwork.freedesktop.org/series/175697/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15953/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15953/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9133_BAT -&gt; XEIGTPW_15953_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9133 -&gt; IGTPW_15953</li>
</ul>
<p>IGTPW_15953: 67642d1264abffa503eae1e36bc1a9e2a23ee8f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9133: 87159cf671a3bf9e04bd46442ef1a358481a66f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05: 5dc178a4563d8d2ee7fc3a81d005700cbfa04c05</p>

</body>
</html>

--===============6371046721009595422==--
