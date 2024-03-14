Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D23C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 21:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8BA10FE0C;
	Thu, 14 Mar 2024 21:57:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F6A10FE10;
 Thu, 14 Mar 2024 21:57:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6051665667113376156=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fcompute=5Fpre?=
 =?utf-8?q?empt=3A_Add_compute_threadgroup_preempt_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 14 Mar 2024 21:57:09 -0000
Message-ID: <171045342909.756215.10741865733499537642@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314210026.2463551-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240314210026.2463551-1-janga.rahul.kumar@intel.com>
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

--===============6051665667113376156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_compute_preempt: Add compute threadgroup preempt test (rev2)
URL   : https://patchwork.freedesktop.org/series/131092/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7765_BAT -> XEIGTPW_10837_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7765 -> IGTPW_10837
  * Linux: xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99 -> xe-943-c44e29a7b62293355744fd857aad93cbf43e5126

  IGTPW_10837: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10837/index.html
  IGT_7765: 67615901aedcc79d8d1523c6484c67c11ba0e316 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99: 6ef6a88b113169e4637be283b2514cfed22f8d99
  xe-943-c44e29a7b62293355744fd857aad93cbf43e5126: c44e29a7b62293355744fd857aad93cbf43e5126

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10837/index.html

--===============6051665667113376156==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_compute_preempt: Add compute threadgroup preempt test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131092/">https://patchwork.freedesktop.org/series/131092/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10837/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10837/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7765_BAT -&gt; XEIGTPW_10837_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7765 -&gt; IGTPW_10837</li>
<li>Linux: xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99 -&gt; xe-943-c44e29a7b62293355744fd857aad93cbf43e5126</li>
</ul>
<p>IGTPW_10837: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10837/index.html<br />
  IGT_7765: 67615901aedcc79d8d1523c6484c67c11ba0e316 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99: 6ef6a88b113169e4637be283b2514cfed22f8d99<br />
  xe-943-c44e29a7b62293355744fd857aad93cbf43e5126: c44e29a7b62293355744fd857aad93cbf43e5126</p>

</body>
</html>

--===============6051665667113376156==--
