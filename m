Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4612EC3271E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 04:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D358010E24A;
	Thu, 11 Jul 2024 04:50:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBF010E24A;
 Thu, 11 Jul 2024 04:50:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4440467813858545427=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Runtime_alteration_of_debuglog?=
 =?utf-8?q?_level_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Jul 2024 04:50:46 -0000
Message-ID: <172067344604.106210.4753931806718159393@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711041355.749937-1-pranay.samala@intel.com>
In-Reply-To: <20240711041355.749937-1-pranay.samala@intel.com>
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

--===============4440467813858545427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Runtime alteration of debuglog level (rev3)
URL   : https://patchwork.freedesktop.org/series/135823/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7922_BAT -> XEIGTPW_11397_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11397_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11397_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11397_BAT prevented too many machines from booting.

  Missing    (7): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7922 -> IGTPW_11397
  * Linux: xe-1589-28c3b18581a110660a7c42bb988a12a3b1f6d402 -> xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13

  IGTPW_11397: 11397
  IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1589-28c3b18581a110660a7c42bb988a12a3b1f6d402: 28c3b18581a110660a7c42bb988a12a3b1f6d402
  xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13: 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11397/index.html

--===============4440467813858545427==
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
<tr><td><b>Series:</b></td><td>Runtime alteration of debuglog level (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135823/">https://patchwork.freedesktop.org/series/135823/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11397/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11397/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7922_BAT -&gt; XEIGTPW_11397_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11397_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11397_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11397_BAT prevented too many machines from booting.</p>
<p>Missing    (7): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7922 -&gt; IGTPW_11397</li>
<li>Linux: xe-1589-28c3b18581a110660a7c42bb988a12a3b1f6d402 -&gt; xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13</li>
</ul>
<p>IGTPW_11397: 11397<br />
  IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1589-28c3b18581a110660a7c42bb988a12a3b1f6d402: 28c3b18581a110660a7c42bb988a12a3b1f6d402<br />
  xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13: 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13</p>

</body>
</html>

--===============4440467813858545427==--
