Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34272C5AE59
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 00:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC24B10E390;
	Tue, 27 May 2025 00:12:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F010010E408;
 Tue, 27 May 2025 00:12:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8352570034596119469=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Ffault=5Fi?=
 =?utf-8?q?njection=3A_Inject_errors_for_VF_provision?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 May 2025 00:12:04 -0000
Message-ID: <174830472497.22163.5901276315755963301@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526140134.21967-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250526140134.21967-1-satyanarayana.k.v.p@intel.com>
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

--===============8352570034596119469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Inject errors for VF provision
URL   : https://patchwork.freedesktop.org/series/149501/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8380_FULL -> XEIGTPW_13187_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13187_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13187_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_13187_FULL prevented too many machines from booting.

  Missing    (4): shard-bmg shard-dg2-set2 shard-adlp shard-lnl 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8380 -> IGTPW_13187
  * Linux: xe-3134-bf01fbfe3783179370355420b877619645103cae -> xe-3035-3e019cc3eaffcb7022b9de66871eabdefd6e06ff

  IGTPW_13187: 13187
  IGT_8380: 8380
  xe-3035-3e019cc3eaffcb7022b9de66871eabdefd6e06ff: 3e019cc3eaffcb7022b9de66871eabdefd6e06ff
  xe-3134-bf01fbfe3783179370355420b877619645103cae: bf01fbfe3783179370355420b877619645103cae

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13187/index.html

--===============8352570034596119469==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Inject errors for VF provision</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149501/">https://patchwork.freedesktop.org/series/149501/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13187/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13187/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8380_FULL -&gt; XEIGTPW_13187_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13187_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13187_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_13187_FULL prevented too many machines from booting.</p>
<p>Missing    (4): shard-bmg shard-dg2-set2 shard-adlp shard-lnl </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8380 -&gt; IGTPW_13187</li>
<li>Linux: xe-3134-bf01fbfe3783179370355420b877619645103cae -&gt; xe-3035-3e019cc3eaffcb7022b9de66871eabdefd6e06ff</li>
</ul>
<p>IGTPW_13187: 13187<br />
  IGT_8380: 8380<br />
  xe-3035-3e019cc3eaffcb7022b9de66871eabdefd6e06ff: 3e019cc3eaffcb7022b9de66871eabdefd6e06ff<br />
  xe-3134-bf01fbfe3783179370355420b877619645103cae: bf01fbfe3783179370355420b877619645103cae</p>

</body>
</html>

--===============8352570034596119469==--
