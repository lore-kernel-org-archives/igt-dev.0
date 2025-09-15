Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC41CAC58E
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 06:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E537D10E145;
	Mon, 15 Sep 2025 06:33:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4687810E145;
 Mon, 15 Sep 2025 06:33:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1572380968474473600=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fcompute=5F?=
 =?utf-8?q?preempt=3A_Compute_preemption_check_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 15 Sep 2025 06:33:12 -0000
Message-ID: <175791799227.332862.6601749918489970829@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250915053107.10980-1-sobin.thomas@intel.com>
In-Reply-To: <20250915053107.10980-1-sobin.thomas@intel.com>
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

--===============1572380968474473600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_compute_preempt: Compute preemption check (rev2)
URL   : https://patchwork.freedesktop.org/series/154338/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8539_BAT -> XEIGTPW_13744_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13744_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8539 -> IGTPW_13744
  * Linux: xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2 -> xe-3755-36a8f6b405f4a0def4462366cd17992897e1362b

  IGTPW_13744: 13744
  IGT_8539: 8539
  xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2: 6cb617616dbbd591f1f34fb95d55dd66cf43f2b2
  xe-3755-36a8f6b405f4a0def4462366cd17992897e1362b: 36a8f6b405f4a0def4462366cd17992897e1362b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13744/index.html

--===============1572380968474473600==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_compute_preempt: Compute preemption check (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154338/">https://patchwork.freedesktop.org/series/154338/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13744/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13744/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8539_BAT -&gt; XEIGTPW_13744_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13744_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8539 -&gt; IGTPW_13744</li>
<li>Linux: xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2 -&gt; xe-3755-36a8f6b405f4a0def4462366cd17992897e1362b</li>
</ul>
<p>IGTPW_13744: 13744<br />
  IGT_8539: 8539<br />
  xe-3737-6cb617616dbbd591f1f34fb95d55dd66cf43f2b2: 6cb617616dbbd591f1f34fb95d55dd66cf43f2b2<br />
  xe-3755-36a8f6b405f4a0def4462366cd17992897e1362b: 36a8f6b405f4a0def4462366cd17992897e1362b</p>

</body>
</html>

--===============1572380968474473600==--
