Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7D5D2F02C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 14:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851C10E581;
	Tue, 27 Jan 2026 14:15:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D01210E57A;
 Tue, 27 Jan 2026 14:15:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6965055420760364138=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Fpower=3A_Ensure_R?=
 =?utf-8?q?APL_reads_on_correct_CPU?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jan 2026 14:15:32 -0000
Message-ID: <176952333250.196152.199431332655654205@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260127095430.536088-4-sk.anirban@intel.com>
In-Reply-To: <20260127095430.536088-4-sk.anirban@intel.com>
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

--===============6965055420760364138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_power: Ensure RAPL reads on correct CPU
URL   : https://patchwork.freedesktop.org/series/160692/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8719_BAT -> XEIGTPW_14426_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8719 -> IGTPW_14426

  IGTPW_14426: 27e9c437bd73911e68e498fdbad2295eda5d5015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8719: 399f1e1cd9d38f0d0ab2c55a9ade415cc8248959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d: 81edc0e82197ad273a82b5da0a64c43d5c5a9a5d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14426/index.html

--===============6965055420760364138==
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
<tr><td><b>Series:</b></td><td>lib/igt_power: Ensure RAPL reads on correct CPU</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160692/">https://patchwork.freedesktop.org/series/160692/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14426/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14426/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8719_BAT -&gt; XEIGTPW_14426_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8719 -&gt; IGTPW_14426</li>
</ul>
<p>IGTPW_14426: 27e9c437bd73911e68e498fdbad2295eda5d5015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8719: 399f1e1cd9d38f0d0ab2c55a9ade415cc8248959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d: 81edc0e82197ad273a82b5da0a64c43d5c5a9a5d</p>

</body>
</html>

--===============6965055420760364138==--
