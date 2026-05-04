Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACA5CD3427
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 19:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A05D10E82C;
	Mon,  4 May 2026 19:29:59 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511E10E82C;
 Mon,  4 May 2026 19:29:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6664983163649647844=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Fexec=5Fsystem=5F?=
 =?utf-8?q?allocator=3A_Don=27t_use_NaN_in_an_input_buffer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 May 2026 19:29:43 -0000
Message-ID: <177792298334.36052.15866813679799808946@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504152820.3825451-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260504152820.3825451-2-zbigniew.kempczynski@intel.com>
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

--===============6664983163649647844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_system_allocator: Don't use NaN in an input buffer
URL   : https://patchwork.freedesktop.org/series/165920/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8883_BAT -> XEIGTPW_15095_BAT
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

  * IGT: IGT_8883 -> IGTPW_15095

  IGTPW_15095: e18a0ee125f3fc6ecb8e2b1e7c001fda5e8b1405 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8883: 8214859d2c4ecf8f81a08a3d2cd26f0a50d2b513 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5: bbd6f35a43ab45240a445b713c5a18638ad5a0d5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15095/index.html

--===============6664983163649647844==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_system_allocator: Don&#x27;t use NaN in an input buffer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165920/">https://patchwork.freedesktop.org/series/165920/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15095/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15095/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8883_BAT -&gt; XEIGTPW_15095_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8883 -&gt; IGTPW_15095</li>
</ul>
<p>IGTPW_15095: e18a0ee125f3fc6ecb8e2b1e7c001fda5e8b1405 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8883: 8214859d2c4ecf8f81a08a3d2cd26f0a50d2b513 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5: bbd6f35a43ab45240a445b713c5a18638ad5a0d5</p>

</body>
</html>

--===============6664983163649647844==--
