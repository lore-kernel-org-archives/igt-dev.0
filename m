Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D37C4829D
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 00:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F082A10E761;
	Tue, 13 Feb 2024 00:26:57 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBD410E7EC;
 Tue, 13 Feb 2024 00:26:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3082116541038562536=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/gem=5Fwatchdog=3A_?=
 =?utf-8?q?Reduced_timeouts_for_worst_case_scenario?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Feb 2024 00:26:56 -0000
Message-ID: <170778401644.1201024.7069863765556930741@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240212212328.3794573-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240212212328.3794573-1-John.C.Harrison@Intel.com>
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

--===============3082116541038562536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_watchdog: Reduced timeouts for worst case scenario
URL   : https://patchwork.freedesktop.org/series/129800/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7710_BAT -> XEIGTPW_10663_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7710 -> IGTPW_10663
  * Linux: xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb -> xe-765-bd80d96780e6c0ce95fa6e69b2616388a1397ce9

  IGTPW_10663: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10663/index.html
  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb: 6a21fc66f5c81c19baa24407cd7e8d2720edd2eb
  xe-765-bd80d96780e6c0ce95fa6e69b2616388a1397ce9: bd80d96780e6c0ce95fa6e69b2616388a1397ce9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10663/index.html

--===============3082116541038562536==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_watchdog: Reduced timeouts for worst case scenario</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129800/">https://patchwork.freedesktop.org/series/129800/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10663/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10663/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7710_BAT -&gt; XEIGTPW_10663_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7710 -&gt; IGTPW_10663</li>
<li>Linux: xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb -&gt; xe-765-bd80d96780e6c0ce95fa6e69b2616388a1397ce9</li>
</ul>
<p>IGTPW_10663: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10663/index.html<br />
  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-753-6a21fc66f5c81c19baa24407cd7e8d2720edd2eb: 6a21fc66f5c81c19baa24407cd7e8d2720edd2eb<br />
  xe-765-bd80d96780e6c0ce95fa6e69b2616388a1397ce9: bd80d96780e6c0ce95fa6e69b2616388a1397ce9</p>

</body>
</html>

--===============3082116541038562536==--
