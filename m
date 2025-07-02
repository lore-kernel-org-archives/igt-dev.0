Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C9AC83F04
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 15:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D659A10E332;
	Wed,  2 Jul 2025 15:57:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CC310E72C;
 Wed,  2 Jul 2025 15:57:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6857760244353134012=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fcursor=5Fcrc=3A?=
 =?utf-8?q?_optimise_cursor_crc_on_simulation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 02 Jul 2025 15:57:28 -0000
Message-ID: <175147184847.128711.931947142156239939@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702091643.967483-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250702091643.967483-1-santhosh.reddy.guddati@intel.com>
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

--===============6857760244353134012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: optimise cursor crc on simulation (rev3)
URL   : https://patchwork.freedesktop.org/series/150628/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8434_BAT -> XEIGTPW_13389_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8434 -> IGTPW_13389

  IGTPW_13389: 4eb96cbe45dd83d6016bb25838d5677813b68c2f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3335-e46fcd77ceacb06a5411cb77b7344d6b82e1ab72: e46fcd77ceacb06a5411cb77b7344d6b82e1ab72

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13389/index.html

--===============6857760244353134012==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: optimise cursor crc on simulation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150628/">https://patchwork.freedesktop.org/series/150628/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13389/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13389/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8434_BAT -&gt; XEIGTPW_13389_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8434 -&gt; IGTPW_13389</li>
</ul>
<p>IGTPW_13389: 4eb96cbe45dd83d6016bb25838d5677813b68c2f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3335-e46fcd77ceacb06a5411cb77b7344d6b82e1ab72: e46fcd77ceacb06a5411cb77b7344d6b82e1ab72</p>

</body>
</html>

--===============6857760244353134012==--
