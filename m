Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6252CCFA13
	for <igt-dev@archiver.kernel.org>; Fri,  1 May 2026 11:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CA410E1B2;
	Fri,  1 May 2026 11:13:28 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B23D10E1B2;
 Fri,  1 May 2026 11:13:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4639326958644601929=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fcdclk=3A_?=
 =?utf-8?q?Skip_non-4K_outputs_instead_of_skipping_the_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 01 May 2026 11:13:12 -0000
Message-ID: <177763399203.31620.4827648003797798070@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260501103634.2360004-1-swati2.sharma@intel.com>
In-Reply-To: <20260501103634.2360004-1-swati2.sharma@intel.com>
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

--===============4639326958644601929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_cdclk: Skip non-4K outputs instead of skipping the test
URL   : https://patchwork.freedesktop.org/series/165836/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8881_BAT -> XEIGTPW_15090_BAT
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

  * IGT: IGT_8881 -> IGTPW_15090
  * Linux: xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d -> xe-4962-89363c11fcc2fcd068a09c06ce1a3aca43bb6bb1

  IGTPW_15090: 5d95f3e6d2d6cb3bdf12d958cf0c2ac92bdcdd83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d: 3ac514cf64f272cc4d5143f4cc28fb18a8aba76d
  xe-4962-89363c11fcc2fcd068a09c06ce1a3aca43bb6bb1: 89363c11fcc2fcd068a09c06ce1a3aca43bb6bb1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15090/index.html

--===============4639326958644601929==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_cdclk: Skip non-4K outputs instead of skipping the test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165836/">https://patchwork.freedesktop.org/series/165836/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15090/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15090/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8881_BAT -&gt; XEIGTPW_15090_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8881 -&gt; IGTPW_15090</li>
<li>Linux: xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d -&gt; xe-4962-89363c11fcc2fcd068a09c06ce1a3aca43bb6bb1</li>
</ul>
<p>IGTPW_15090: 5d95f3e6d2d6cb3bdf12d958cf0c2ac92bdcdd83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d: 3ac514cf64f272cc4d5143f4cc28fb18a8aba76d<br />
  xe-4962-89363c11fcc2fcd068a09c06ce1a3aca43bb6bb1: 89363c11fcc2fcd068a09c06ce1a3aca43bb6bb1</p>

</body>
</html>

--===============4639326958644601929==--
