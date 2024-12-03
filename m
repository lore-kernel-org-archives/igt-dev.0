Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DCCE6C5FB
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 04:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C28D10E113;
	Tue,  3 Dec 2024 04:25:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76BE10E113;
 Tue,  3 Dec 2024 04:25:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8000147752208165055=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fjoiner=3A?=
 =?utf-8?q?_switch_modeset_from_uj_to_bj_and_vice-versa_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Dec 2024 04:25:50 -0000
Message-ID: <173319995087.1874388.10825931921229655021@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203034218.53066-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241203034218.53066-1-santhosh.reddy.guddati@intel.com>
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

--===============8000147752208165055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa (rev6)
URL   : https://patchwork.freedesktop.org/series/138525/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8134_BAT -> XEIGTPW_12230_BAT
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

  * IGT: IGT_8134 -> IGTPW_12230
  * Linux: xe-2306-83cfa47b496201ff05d4a369f6fe3f75665a2acf -> xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824

  IGTPW_12230: 12230
  IGT_8134: 027fbf68a00630d7bb8ae200c620296e2bad971d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2306-83cfa47b496201ff05d4a369f6fe3f75665a2acf: 83cfa47b496201ff05d4a369f6fe3f75665a2acf
  xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824: 4de82d50b8de6a278c1483a7f76ae830c89d1824

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12230/index.html

--===============8000147752208165055==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138525/">https://patchwork.freedesktop.org/series/138525/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12230/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12230/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8134_BAT -&gt; XEIGTPW_12230_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8134 -&gt; IGTPW_12230</li>
<li>Linux: xe-2306-83cfa47b496201ff05d4a369f6fe3f75665a2acf -&gt; xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824</li>
</ul>
<p>IGTPW_12230: 12230<br />
  IGT_8134: 027fbf68a00630d7bb8ae200c620296e2bad971d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2306-83cfa47b496201ff05d4a369f6fe3f75665a2acf: 83cfa47b496201ff05d4a369f6fe3f75665a2acf<br />
  xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824: 4de82d50b8de6a278c1483a7f76ae830c89d1824</p>

</body>
</html>

--===============8000147752208165055==--
