Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DF6CA0EE4
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 20:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B47E10E0A7;
	Mon, 18 Aug 2025 20:59:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E9510E0A7;
 Mon, 18 Aug 2025 20:59:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3999501743373595194=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fcom?=
 =?utf-8?q?pute=5Fmode=3A_Remove_non-block_section?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Aug 2025 20:59:44 -0000
Message-ID: <175555078484.245484.13019682988053205611@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818165742.2648473-1-matthew.brost@intel.com>
In-Reply-To: <20250818165742.2648473-1-matthew.brost@intel.com>
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

--===============3999501743373595194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_compute_mode: Remove non-block section
URL   : https://patchwork.freedesktop.org/series/153082/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8496_BAT -> XEIGTPW_13594_BAT
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

  * IGT: IGT_8496 -> IGTPW_13594
  * Linux: xe-3570-912c10fafebf45522f7f56e33a020284e83c27ab -> xe-3572-c3cf4289245819615518b536cd16ebe6612694f9

  IGTPW_13594: 36e903d342f413b28010cea9ea54c3e67af7ab26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8496: acea60af09e5f4b3cb0cd6838c23ef1e92c17323 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3570-912c10fafebf45522f7f56e33a020284e83c27ab: 912c10fafebf45522f7f56e33a020284e83c27ab
  xe-3572-c3cf4289245819615518b536cd16ebe6612694f9: c3cf4289245819615518b536cd16ebe6612694f9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13594/index.html

--===============3999501743373595194==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_compute_mode: Remove non-block section</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153082/">https://patchwork.freedesktop.org/series/153082/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13594/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13594/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8496_BAT -&gt; XEIGTPW_13594_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8496 -&gt; IGTPW_13594</li>
<li>Linux: xe-3570-912c10fafebf45522f7f56e33a020284e83c27ab -&gt; xe-3572-c3cf4289245819615518b536cd16ebe6612694f9</li>
</ul>
<p>IGTPW_13594: 36e903d342f413b28010cea9ea54c3e67af7ab26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8496: acea60af09e5f4b3cb0cd6838c23ef1e92c17323 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3570-912c10fafebf45522f7f56e33a020284e83c27ab: 912c10fafebf45522f7f56e33a020284e83c27ab<br />
  xe-3572-c3cf4289245819615518b536cd16ebe6612694f9: c3cf4289245819615518b536cd16ebe6612694f9</p>

</body>
</html>

--===============3999501743373595194==--
