Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073F8CA5FD4
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 23:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8894C10E2FB;
	Thu,  1 Oct 2026 23:13:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D3610E242;
 Thu,  1 Oct 2026 23:12:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4044661045308222199=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tools/gputop=3A_add_i915_PM?=
 =?utf-8?q?U_engine_monitoring_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Oct 2026 23:12:28 -0000
Message-ID: <179089634806.231456.13947030720894964967@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
In-Reply-To: <cover.1790853076.git.sebastian.brzezinka@intel.com>
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

--===============4044661045308222199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/gputop: add i915 PMU engine monitoring (rev3)
URL   : https://patchwork.freedesktop.org/series/174991/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9123_BAT -> XEIGTPW_15933_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9123 -> IGTPW_15933

  IGTPW_15933: 08c305bababb34c63c1341e99c4f35317b58194e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9123: afd8cfb7aa15906974dd979b6dc739ed17ab9e33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5868-a064e93fc25c7d4600c0ff802918395291087517: a064e93fc25c7d4600c0ff802918395291087517

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15933/index.html

--===============4044661045308222199==
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
<tr><td><b>Series:</b></td><td>tools/gputop: add i915 PMU engine monitoring (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174991/">https://patchwork.freedesktop.org/series/174991/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15933/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15933/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9123_BAT -&gt; XEIGTPW_15933_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9123 -&gt; IGTPW_15933</li>
</ul>
<p>IGTPW_15933: 08c305bababb34c63c1341e99c4f35317b58194e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9123: afd8cfb7aa15906974dd979b6dc739ed17ab9e33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5868-a064e93fc25c7d4600c0ff802918395291087517: a064e93fc25c7d4600c0ff802918395291087517</p>

</body>
</html>

--===============4044661045308222199==--
