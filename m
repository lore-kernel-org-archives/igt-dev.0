Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E5AD46621
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 20:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A08710E09D;
	Thu, 15 Jan 2026 20:27:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9B810E09D;
 Thu, 15 Jan 2026 20:27:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8989061087092658065=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Runner=3A_Use_Jansson_inste?=
 =?utf-8?q?ad_of_json-c?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jan 2026 20:27:38 -0000
Message-ID: <176850885850.159376.4888272043531230762@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
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

--===============8989061087092658065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Runner: Use Jansson instead of json-c
URL   : https://patchwork.freedesktop.org/series/160154/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8704_BAT -> XEIGTPW_14351_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14351_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14351_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_14351_BAT prevented too many machines from booting.

  Missing    (11): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-2 bat-ptl-vm bat-ptl-1 bat-atsm-2 bat-bmg-3 bat-bmg-2 bat-adlp-vm bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8704 -> IGTPW_14351
  * Linux: xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d -> xe-4387-e11a5aad7dae203adfba9554480c058eeb890a1b

  IGTPW_14351: 14351
  IGT_8704: 8704
  xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d
  xe-4387-e11a5aad7dae203adfba9554480c058eeb890a1b: e11a5aad7dae203adfba9554480c058eeb890a1b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14351/index.html

--===============8989061087092658065==
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
<tr><td><b>Series:</b></td><td>Runner: Use Jansson instead of json-c</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160154/">https://patchwork.freedesktop.org/series/160154/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14351/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14351/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8704_BAT -&gt; XEIGTPW_14351_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14351_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14351_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_14351_BAT prevented too many machines from booting.</p>
<p>Missing    (11): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-2 bat-ptl-vm bat-ptl-1 bat-atsm-2 bat-bmg-3 bat-bmg-2 bat-adlp-vm bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8704 -&gt; IGTPW_14351</li>
<li>Linux: xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d -&gt; xe-4387-e11a5aad7dae203adfba9554480c058eeb890a1b</li>
</ul>
<p>IGTPW_14351: 14351<br />
  IGT_8704: 8704<br />
  xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d<br />
  xe-4387-e11a5aad7dae203adfba9554480c058eeb890a1b: e11a5aad7dae203adfba9554480c058eeb890a1b</p>

</body>
</html>

--===============8989061087092658065==--
