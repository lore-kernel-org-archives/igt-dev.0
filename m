Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670D4D7308B
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 02:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC410E3B5;
	Fri,  3 Apr 2026 02:42:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532F310E3B5;
 Fri,  3 Apr 2026 02:42:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2299451473640885030=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/xe=3A_query_engine_clas?=
 =?utf-8?q?s_capabilities_from_debugfs_info?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Apr 2026 02:42:30 -0000
Message-ID: <177518415027.430198.1739604916887497697@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260403014040.310758-1-x.wang@intel.com>
In-Reply-To: <20260403014040.310758-1-x.wang@intel.com>
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

--===============2299451473640885030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe: query engine class capabilities from debugfs info
URL   : https://patchwork.freedesktop.org/series/164327/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8846_BAT -> XEIGTPW_14924_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8846 -> IGTPW_14924
  * Linux: xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b -> xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62

  IGTPW_14924: 14924
  IGT_8846: 8846
  xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b: dba2251b00d3faac3be7fc15431ffb9c4d60232b
  xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62: 76f07a8a9c761686987cba92056f78c1d3cd1c62

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14924/index.html

--===============2299451473640885030==
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
<tr><td><b>Series:</b></td><td>lib/xe: query engine class capabilities from debugfs info</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164327/">https://patchwork.freedesktop.org/series/164327/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14924/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14924/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8846_BAT -&gt; XEIGTPW_14924_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8846 -&gt; IGTPW_14924</li>
<li>Linux: xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b -&gt; xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62</li>
</ul>
<p>IGTPW_14924: 14924<br />
  IGT_8846: 8846<br />
  xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b: dba2251b00d3faac3be7fc15431ffb9c4d60232b<br />
  xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62: 76f07a8a9c761686987cba92056f78c1d3cd1c62</p>

</body>
</html>

--===============2299451473640885030==--
