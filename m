Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3004C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8889610E3BB;
	Tue, 21 Jul 2026 19:49:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0634110EB24;
 Tue, 21 Jul 2026 19:49:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6490357088507233370=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fthr?=
 =?utf-8?q?eads=3A_whitelist_expected_multi-queue_hang_dmesg_warns?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jul 2026 19:49:19 -0000
Message-ID: <178466335902.212455.12751940240090015849@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721130405.25573-1-himanshu.girotra@intel.com>
In-Reply-To: <20260721130405.25573-1-himanshu.girotra@intel.com>
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

--===============6490357088507233370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_threads: whitelist expected multi-queue hang dmesg warns
URL   : https://patchwork.freedesktop.org/series/170821/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9017_BAT -> XEIGTPW_15573_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9017 -> IGTPW_15573
  * Linux: xe-5448-15b41fd8ef085dbf5b64fe5819415f20bd61983e -> xe-5451-80b509f6e34a01edfccc01a05e3e7062a934bcf9

  IGTPW_15573: 15573
  IGT_9017: 9017
  xe-5448-15b41fd8ef085dbf5b64fe5819415f20bd61983e: 15b41fd8ef085dbf5b64fe5819415f20bd61983e
  xe-5451-80b509f6e34a01edfccc01a05e3e7062a934bcf9: 80b509f6e34a01edfccc01a05e3e7062a934bcf9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15573/index.html

--===============6490357088507233370==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_threads: whitelist expected multi-queue hang dmesg warns</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170821/">https://patchwork.freedesktop.org/series/170821/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15573/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15573/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9017_BAT -&gt; XEIGTPW_15573_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9017 -&gt; IGTPW_15573</li>
<li>Linux: xe-5448-15b41fd8ef085dbf5b64fe5819415f20bd61983e -&gt; xe-5451-80b509f6e34a01edfccc01a05e3e7062a934bcf9</li>
</ul>
<p>IGTPW_15573: 15573<br />
  IGT_9017: 9017<br />
  xe-5448-15b41fd8ef085dbf5b64fe5819415f20bd61983e: 15b41fd8ef085dbf5b64fe5819415f20bd61983e<br />
  xe-5451-80b509f6e34a01edfccc01a05e3e7062a934bcf9: 80b509f6e34a01edfccc01a05e3e7062a934bcf9</p>

</body>
</html>

--===============6490357088507233370==--
