Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF48BC19F32
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 05:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9024910EACB;
	Fri,  7 Mar 2025 05:44:01 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5BE10EACB;
 Fri,  7 Mar 2025 05:44:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5971576410194815715=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpm=3A_Add_?=
 =?utf-8?q?a_check_for_power_management_capability?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Mar 2025 05:44:00 -0000
Message-ID: <174132624063.71300.17105409341887360556@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306190621.260153-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20250306190621.260153-1-jakub1.kolakowski@intel.com>
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

--===============5971576410194815715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm: Add a check for power management capability
URL   : https://patchwork.freedesktop.org/series/145939/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8264_BAT -> XEIGTPW_12722_BAT
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

  * IGT: IGT_8264 -> IGTPW_12722
  * Linux: xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3 -> xe-2771-f02ab9f6e182046bd0df9b5e50e968bd57ed290f

  IGTPW_12722: 12722
  IGT_8264: 8264
  xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3: 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3
  xe-2771-f02ab9f6e182046bd0df9b5e50e968bd57ed290f: f02ab9f6e182046bd0df9b5e50e968bd57ed290f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12722/index.html

--===============5971576410194815715==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm: Add a check for power management capability</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145939/">https://patchwork.freedesktop.org/series/145939/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12722/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12722/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8264_BAT -&gt; XEIGTPW_12722_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8264 -&gt; IGTPW_12722</li>
<li>Linux: xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3 -&gt; xe-2771-f02ab9f6e182046bd0df9b5e50e968bd57ed290f</li>
</ul>
<p>IGTPW_12722: 12722<br />
  IGT_8264: 8264<br />
  xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3: 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3<br />
  xe-2771-f02ab9f6e182046bd0df9b5e50e968bd57ed290f: f02ab9f6e182046bd0df9b5e50e968bd57ed290f</p>

</body>
</html>

--===============5971576410194815715==--
