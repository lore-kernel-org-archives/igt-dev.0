Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964FFC54E41
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 13:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CC410E212;
	Tue,  5 Mar 2024 13:08:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC5B10E212;
 Tue,  5 Mar 2024 13:08:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6293745988762908928=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_xe=5Frender=5Fcopy_tests_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 Mar 2024 13:08:50 -0000
Message-ID: <170964413050.524851.15491210893109453774@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
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

--===============6293745988762908928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add xe_render_copy tests (rev2)
URL   : https://patchwork.freedesktop.org/series/130707/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7746_BAT -> XEIGTPW_10777_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7746 -> IGTPW_10777
  * Linux: xe-897-98da761379cfaa31b32641ad648f83c90a8e629e -> xe-898-1d6fe19a74ebc7356b6cbed32aa1dedb215b4aff

  IGTPW_10777: 10777
  IGT_7746: 7746
  xe-897-98da761379cfaa31b32641ad648f83c90a8e629e: 98da761379cfaa31b32641ad648f83c90a8e629e
  xe-898-1d6fe19a74ebc7356b6cbed32aa1dedb215b4aff: 1d6fe19a74ebc7356b6cbed32aa1dedb215b4aff

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10777/index.html

--===============6293745988762908928==
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
<tr><td><b>Series:</b></td><td>Add xe_render_copy tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130707/">https://patchwork.freedesktop.org/series/130707/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10777/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10777/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7746_BAT -&gt; XEIGTPW_10777_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7746 -&gt; IGTPW_10777</li>
<li>Linux: xe-897-98da761379cfaa31b32641ad648f83c90a8e629e -&gt; xe-898-1d6fe19a74ebc7356b6cbed32aa1dedb215b4aff</li>
</ul>
<p>IGTPW_10777: 10777<br />
  IGT_7746: 7746<br />
  xe-897-98da761379cfaa31b32641ad648f83c90a8e629e: 98da761379cfaa31b32641ad648f83c90a8e629e<br />
  xe-898-1d6fe19a74ebc7356b6cbed32aa1dedb215b4aff: 1d6fe19a74ebc7356b6cbed32aa1dedb215b4aff</p>

</body>
</html>

--===============6293745988762908928==--
