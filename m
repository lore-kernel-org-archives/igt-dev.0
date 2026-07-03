Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC511C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 06:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7E310E58E;
	Fri,  3 Jul 2026 06:57:47 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364B410E586;
 Fri,  3 Jul 2026 06:57:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4833718377464640274=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Add_?=
 =?utf-8?q?oversubscribe_concurrent_bind_stress_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Jul 2026 06:57:19 -0000
Message-ID: <178306183921.146722.12832654974605818839@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260703060843.1137197-1-sobin.thomas@intel.com>
In-Reply-To: <20260703060843.1137197-1-sobin.thomas@intel.com>
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

--===============4833718377464640274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Add oversubscribe concurrent bind stress subtest
URL   : https://patchwork.freedesktop.org/series/169728/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8990_BAT -> XEIGTPW_15465_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-2 bat-bmg-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8990 -> IGTPW_15465
  * Linux: xe-5331-4343c63c6acc14ed4d48dddaa56057663651d9e3 -> xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5

  IGTPW_15465: 15465
  IGT_8990: 8990
  xe-5331-4343c63c6acc14ed4d48dddaa56057663651d9e3: 4343c63c6acc14ed4d48dddaa56057663651d9e3
  xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5: 2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15465/index.html

--===============4833718377464640274==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Add oversubscribe concurrent bind stress subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169728/">https://patchwork.freedesktop.org/series/169728/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15465/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15465/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8990_BAT -&gt; XEIGTPW_15465_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-bmg-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8990 -&gt; IGTPW_15465</li>
<li>Linux: xe-5331-4343c63c6acc14ed4d48dddaa56057663651d9e3 -&gt; xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5</li>
</ul>
<p>IGTPW_15465: 15465<br />
  IGT_8990: 8990<br />
  xe-5331-4343c63c6acc14ed4d48dddaa56057663651d9e3: 4343c63c6acc14ed4d48dddaa56057663651d9e3<br />
  xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5: 2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5</p>

</body>
</html>

--===============4833718377464640274==--
