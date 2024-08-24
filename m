Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CD4C5321E
	for <igt-dev@archiver.kernel.org>; Sat, 24 Aug 2024 01:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52C910E187;
	Sat, 24 Aug 2024 01:09:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE1010E187;
 Sat, 24 Aug 2024 01:09:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1977311862814082231=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fdrm=5Ffdinfo?=
 =?utf-8?q?=3A_concurrent_spinners?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 24 Aug 2024 01:09:32 -0000
Message-ID: <172446177228.748004.7810068808496123723@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823230250.1090900-1-lucas.demarchi@intel.com>
In-Reply-To: <20240823230250.1090900-1-lucas.demarchi@intel.com>
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

--===============1977311862814082231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_drm_fdinfo: concurrent spinners
URL   : https://patchwork.freedesktop.org/series/137738/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7989_BAT -> XEIGTPW_11629_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7989 -> IGTPW_11629
  * Linux: xe-1821-96041621daaf71059d790a2ddbaa60114371eada -> xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8

  IGTPW_11629: 11629
  IGT_7989: 7989
  xe-1821-96041621daaf71059d790a2ddbaa60114371eada: 96041621daaf71059d790a2ddbaa60114371eada
  xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8: 411a047925bb7e169a075a2ddfb63ba96f26a8c8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11629/index.html

--===============1977311862814082231==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_drm_fdinfo: concurrent spinners</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137738/">https://patchwork.freedesktop.org/series/137738/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11629/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11629/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7989_BAT -&gt; XEIGTPW_11629_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7989 -&gt; IGTPW_11629</li>
<li>Linux: xe-1821-96041621daaf71059d790a2ddbaa60114371eada -&gt; xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8</li>
</ul>
<p>IGTPW_11629: 11629<br />
  IGT_7989: 7989<br />
  xe-1821-96041621daaf71059d790a2ddbaa60114371eada: 96041621daaf71059d790a2ddbaa60114371eada<br />
  xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8: 411a047925bb7e169a075a2ddfb63ba96f26a8c8</p>

</body>
</html>

--===============1977311862814082231==--
