Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BAFC5AE59
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 22:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1491C10E3A3;
	Mon, 26 May 2025 22:59:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784FA10E3A3;
 Mon, 26 May 2025 22:59:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1657715009933388340=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/kms=5Fgetfb=3A_repla?=
 =?utf-8?q?ce_CCS_with_NV12_and_use_libigt_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 May 2025 22:59:58 -0000
Message-ID: <174830039847.21444.2016865327374282370@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526122039.50519-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250526122039.50519-1-juhapekka.heikkila@gmail.com>
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

--===============1657715009933388340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_getfb: replace CCS with NV12 and use libigt functions
URL   : https://patchwork.freedesktop.org/series/149491/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8380_FULL -> XEIGTPW_13185_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13185_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13185_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_13185_FULL prevented too many machines from booting.

  Missing    (4): shard-bmg shard-dg2-set2 shard-adlp shard-lnl 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8380 -> IGTPW_13185
  * Linux: xe-3134-bf01fbfe3783179370355420b877619645103cae -> xe-3035-3e019cc3eaffcb7022b9de66871eabdefd6e06ff

  IGTPW_13185: 13185
  IGT_8380: 8380
  xe-3035-3e019cc3eaffcb7022b9de66871eabdefd6e06ff: 3e019cc3eaffcb7022b9de66871eabdefd6e06ff
  xe-3134-bf01fbfe3783179370355420b877619645103cae: bf01fbfe3783179370355420b877619645103cae

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13185/index.html

--===============1657715009933388340==
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
<tr><td><b>Series:</b></td><td>tests/kms_getfb: replace CCS with NV12 and use libigt functions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149491/">https://patchwork.freedesktop.org/series/149491/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13185/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13185/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8380_FULL -&gt; XEIGTPW_13185_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13185_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13185_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_13185_FULL prevented too many machines from booting.</p>
<p>Missing    (4): shard-bmg shard-dg2-set2 shard-adlp shard-lnl </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8380 -&gt; IGTPW_13185</li>
<li>Linux: xe-3134-bf01fbfe3783179370355420b877619645103cae -&gt; xe-3035-3e019cc3eaffcb7022b9de66871eabdefd6e06ff</li>
</ul>
<p>IGTPW_13185: 13185<br />
  IGT_8380: 8380<br />
  xe-3035-3e019cc3eaffcb7022b9de66871eabdefd6e06ff: 3e019cc3eaffcb7022b9de66871eabdefd6e06ff<br />
  xe-3134-bf01fbfe3783179370355420b877619645103cae: bf01fbfe3783179370355420b877619645103cae</p>

</body>
</html>

--===============1657715009933388340==--
