Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A0CC7EE30
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 15:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BE510E2C9;
	Thu, 26 Jun 2025 15:42:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBFA10E2C9;
 Thu, 26 Jun 2025 15:42:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5279787729322196093=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_per-device_engine_activ?=
 =?utf-8?q?ity_stats_in_GPUTOP_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Jun 2025 15:42:24 -0000
Message-ID: <175095254497.112774.3982796640229906271@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250626091626.3760324-1-soham.purkait@intel.com>
In-Reply-To: <20250626091626.3760324-1-soham.purkait@intel.com>
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

--===============5279787729322196093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add per-device engine activity stats in GPUTOP (rev12)
URL   : https://patchwork.freedesktop.org/series/146756/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8429_BAT -> XEIGTPW_13357_BAT
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

  * IGT: IGT_8429 -> IGTPW_13357
  * Linux: xe-3309-d76821a5677456269831568238080f923bc4bf49 -> xe-3310-fe48f853476e486b51253327196c227e0481f1d9

  IGTPW_13357: 20ca35a644061a22f70bb1948904b8c21ea0c486 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8429: 8429
  xe-3309-d76821a5677456269831568238080f923bc4bf49: d76821a5677456269831568238080f923bc4bf49
  xe-3310-fe48f853476e486b51253327196c227e0481f1d9: fe48f853476e486b51253327196c227e0481f1d9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13357/index.html

--===============5279787729322196093==
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
<tr><td><b>Series:</b></td><td>Add per-device engine activity stats in GPUTOP (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146756/">https://patchwork.freedesktop.org/series/146756/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13357/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13357/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8429_BAT -&gt; XEIGTPW_13357_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8429 -&gt; IGTPW_13357</li>
<li>Linux: xe-3309-d76821a5677456269831568238080f923bc4bf49 -&gt; xe-3310-fe48f853476e486b51253327196c227e0481f1d9</li>
</ul>
<p>IGTPW_13357: 20ca35a644061a22f70bb1948904b8c21ea0c486 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8429: 8429<br />
  xe-3309-d76821a5677456269831568238080f923bc4bf49: d76821a5677456269831568238080f923bc4bf49<br />
  xe-3310-fe48f853476e486b51253327196c227e0481f1d9: fe48f853476e486b51253327196c227e0481f1d9</p>

</body>
</html>

--===============5279787729322196093==--
