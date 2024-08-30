Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73429CA1009
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 17:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E1310EAC5;
	Fri, 30 Aug 2024 17:48:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FCE10EAC5;
 Fri, 30 Aug 2024 17:48:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8799475067859559334=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fdrm=5Ffdinfo?=
 =?utf-8?q?=3A_Rename_and_reorder_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 Aug 2024 17:48:19 -0000
Message-ID: <172504009987.855156.10554579713485216650@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830135020.2031087-1-lucas.demarchi@intel.com>
In-Reply-To: <20240830135020.2031087-1-lucas.demarchi@intel.com>
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

--===============8799475067859559334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_drm_fdinfo: Rename and reorder tests (rev2)
URL   : https://patchwork.freedesktop.org/series/137823/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8000_BAT -> XEIGTPW_11670_BAT
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

  * IGT: IGT_8000 -> IGTPW_11670
  * Linux: xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758 -> xe-1869-1836028c756d6d0c6f741b9a31b2549f06dc3e79

  IGTPW_11670: 72379b7a4d171b3c6879558074487e7c72450e6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8000: fba44baafa5d79b6eed52fa24234781e8e47beb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758: 876db6b8ef45d285316cc53b5cf44cbc39aa8758
  xe-1869-1836028c756d6d0c6f741b9a31b2549f06dc3e79: 1836028c756d6d0c6f741b9a31b2549f06dc3e79

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11670/index.html

--===============8799475067859559334==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_drm_fdinfo: Rename and reorder tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137823/">https://patchwork.freedesktop.org/series/137823/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11670/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11670/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8000_BAT -&gt; XEIGTPW_11670_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8000 -&gt; IGTPW_11670</li>
<li>Linux: xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758 -&gt; xe-1869-1836028c756d6d0c6f741b9a31b2549f06dc3e79</li>
</ul>
<p>IGTPW_11670: 72379b7a4d171b3c6879558074487e7c72450e6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8000: fba44baafa5d79b6eed52fa24234781e8e47beb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758: 876db6b8ef45d285316cc53b5cf44cbc39aa8758<br />
  xe-1869-1836028c756d6d0c6f741b9a31b2549f06dc3e79: 1836028c756d6d0c6f741b9a31b2549f06dc3e79</p>

</body>
</html>

--===============8799475067859559334==--
