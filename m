Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1967FCCD183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 16:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE67610E190;
	Mon, 13 Oct 2025 16:45:10 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C9510E190;
 Mon, 13 Oct 2025 16:45:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8721959558848462264=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fcompute=5F?=
 =?utf-8?q?preempt=3A_Compute_preemption_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 Oct 2025 16:45:09 -0000
Message-ID: <176037390928.7102.3570185170303801552@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013133439.543393-1-sobin.thomas@intel.com>
In-Reply-To: <20251013133439.543393-1-sobin.thomas@intel.com>
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

--===============8721959558848462264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_compute_preempt: Compute preemption check
URL   : https://patchwork.freedesktop.org/series/155832/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8582_BAT -> XEIGTPW_13891_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8582 -> IGTPW_13891
  * Linux: xe-3900-06342be0412e879eaede7e6932e651f8cb630203 -> xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626

  IGTPW_13891: 13891
  IGT_8582: 8582
  xe-3900-06342be0412e879eaede7e6932e651f8cb630203: 06342be0412e879eaede7e6932e651f8cb630203
  xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626: 61b16793c3bbb8e740cf9afb36258dee61346626

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13891/index.html

--===============8721959558848462264==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_compute_preempt: Compute preemption check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155832/">https://patchwork.freedesktop.org/series/155832/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13891/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13891/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8582_BAT -&gt; XEIGTPW_13891_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8582 -&gt; IGTPW_13891</li>
<li>Linux: xe-3900-06342be0412e879eaede7e6932e651f8cb630203 -&gt; xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626</li>
</ul>
<p>IGTPW_13891: 13891<br />
  IGT_8582: 8582<br />
  xe-3900-06342be0412e879eaede7e6932e651f8cb630203: 06342be0412e879eaede7e6932e651f8cb630203<br />
  xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626: 61b16793c3bbb8e740cf9afb36258dee61346626</p>

</body>
</html>

--===============8721959558848462264==--
