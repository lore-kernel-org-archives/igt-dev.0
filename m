Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D767CDE001
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA8B10EE24;
	Wed, 24 Jun 2026 08:54:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6299110E070;
 Wed, 24 Jun 2026 08:48:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5129018613740316175=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpat=3A_Fix?=
 =?utf-8?q?_semaphore=5Fwait_instruction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Jun 2026 08:48:00 -0000
Message-ID: <178229088039.110128.2505553603416799225@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624064751.2271122-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260624064751.2271122-2-balasubramani.vivekanandan@intel.com>
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

--===============5129018613740316175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: Fix semaphore_wait instruction
URL   : https://patchwork.freedesktop.org/series/169065/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8982_BAT -> XEIGTPW_15437_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8982 -> IGTPW_15437
  * Linux: xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36 -> xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82

  IGTPW_15437: 97997bb1786c9fb004c79be06040369e62530e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8982: 48befce9e6b0c0d371c4812bfff34a61319f68f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36: e7cd62086ec5a70cefb8b8b00964096692bfab36
  xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82: b2817f6a1517bc9ecdef5229b84e8a44d983de82

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15437/index.html

--===============5129018613740316175==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: Fix semaphore_wait instruction</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169065/">https://patchwork.freedesktop.org/series/169065/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15437/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15437/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8982_BAT -&gt; XEIGTPW_15437_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8982 -&gt; IGTPW_15437</li>
<li>Linux: xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36 -&gt; xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82</li>
</ul>
<p>IGTPW_15437: 97997bb1786c9fb004c79be06040369e62530e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8982: 48befce9e6b0c0d371c4812bfff34a61319f68f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36: e7cd62086ec5a70cefb8b8b00964096692bfab36<br />
  xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82: b2817f6a1517bc9ecdef5229b84e8a44d983de82</p>

</body>
</html>

--===============5129018613740316175==--
