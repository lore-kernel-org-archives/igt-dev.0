Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAF4C54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 23:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A287810E1CD;
	Thu, 29 May 2025 23:00:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD9C10E1CD;
 Thu, 29 May 2025 23:00:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3174594233562458657=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_tests/intel/xe=5Fexec=5Fsy?=
 =?utf-8?q?stem=5Fallocator=3A_Test_to_validate_SVM_prefetch_ranges?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 May 2025 23:00:48 -0000
Message-ID: <174855964870.33093.7666895643582080593@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529115237.25974-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20250529115237.25974-1-sai.gowtham.ch@intel.com>
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

--===============3174594233562458657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Test to validate SVM prefetch ranges
URL   : https://patchwork.freedesktop.org/series/149640/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8383_FULL -> XEIGTPW_13209_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8383 -> IGTPW_13209
  * Linux: xe-3156-2f74377e0846598397723197386e6d9d65b7711e -> xe-3157-bf0749a9930efe943554c3f73454d03c43779d15

  IGTPW_13209: 718a44c81b11a642e16e133ee16b48fb3ffe265f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8383: 8383
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13209/index.html

--===============3174594233562458657==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Test to validate SVM prefetch ranges</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149640/">https://patchwork.freedesktop.org/series/149640/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13209/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13209/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8383_FULL -&gt; XEIGTPW_13209_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8383 -&gt; IGTPW_13209</li>
<li>Linux: xe-3156-2f74377e0846598397723197386e6d9d65b7711e -&gt; xe-3157-bf0749a9930efe943554c3f73454d03c43779d15</li>
</ul>
<p>IGTPW_13209: 718a44c81b11a642e16e133ee16b48fb3ffe265f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8383: 8383<br />
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e<br />
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15</p>

</body>
</html>

--===============3174594233562458657==--
