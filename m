Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC36C369C9
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 21:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B83C10E1C1;
	Fri, 18 Apr 2025 21:50:50 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9C510E141;
 Fri, 18 Apr 2025 21:50:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0441959715584303011=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Foa=3A_Remo?=
 =?utf-8?q?ve_buffer_overflow_guard_from_buffer-size_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Apr 2025 21:50:49 -0000
Message-ID: <174501304963.18569.16807408760398831746@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250418205211.346135-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250418205211.346135-1-jonathan.cavitt@intel.com>
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

--===============0441959715584303011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Remove buffer overflow guard from buffer-size tests (rev3)
URL   : https://patchwork.freedesktop.org/series/147983/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8328_BAT -> XEIGTPW_13011_BAT
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

  * IGT: IGT_8328 -> IGTPW_13011
  * Linux: xe-2972-ae8b802164bb536a9e8bbb239d2b5f1d999ff319 -> xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d

  IGTPW_13011: 13011
  IGT_8328: 8328
  xe-2972-ae8b802164bb536a9e8bbb239d2b5f1d999ff319: ae8b802164bb536a9e8bbb239d2b5f1d999ff319
  xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d: d161139329a7bc9d9659a73b965292d036c97e9d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13011/index.html

--===============0441959715584303011==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Remove buffer overflow guard from buffer-size tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147983/">https://patchwork.freedesktop.org/series/147983/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13011/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13011/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8328_BAT -&gt; XEIGTPW_13011_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8328 -&gt; IGTPW_13011</li>
<li>Linux: xe-2972-ae8b802164bb536a9e8bbb239d2b5f1d999ff319 -&gt; xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d</li>
</ul>
<p>IGTPW_13011: 13011<br />
  IGT_8328: 8328<br />
  xe-2972-ae8b802164bb536a9e8bbb239d2b5f1d999ff319: ae8b802164bb536a9e8bbb239d2b5f1d999ff319<br />
  xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d: d161139329a7bc9d9659a73b965292d036c97e9d</p>

</body>
</html>

--===============0441959715584303011==--
