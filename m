Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E555CC5AD49
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 00:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9683D10E126;
	Wed,  4 Jun 2025 00:22:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB1310E126;
 Wed,  4 Jun 2025 00:22:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8294414490458975549=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_tests/intel/xe=5Feu=5Fstall=3A_Close_any_open_EU_stal?=
 =?utf-8?q?l_fd_before_opening_a_new_one?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Jun 2025 00:22:06 -0000
Message-ID: <174899652661.46806.3639047441109905106@1538d3639d33>
X-Patchwork-Hint: ignore
References: <b5b8323fe6840bff949b8607480d57104b908a1f.1748994982.git.harish.chegondi@intel.com>
In-Reply-To: <b5b8323fe6840bff949b8607480d57104b908a1f.1748994982.git.harish.chegondi@intel.com>
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

--===============8294414490458975549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/intel/xe_eu_stall: Close any open EU stall fd before opening a new one
URL   : https://patchwork.freedesktop.org/series/149814/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8393_BAT -> XEIGTPW_13240_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8393 -> IGTPW_13240

  IGTPW_13240: 13240
  IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3186-1a8dc5c25521273300f881e23c7294453b015048: 1a8dc5c25521273300f881e23c7294453b015048

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13240/index.html

--===============8294414490458975549==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/intel/xe_eu_stall: Close any open EU stall fd before opening a new one</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149814/">https://patchwork.freedesktop.org/series/149814/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13240/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13240/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8393_BAT -&gt; XEIGTPW_13240_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8393 -&gt; IGTPW_13240</li>
</ul>
<p>IGTPW_13240: 13240<br />
  IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3186-1a8dc5c25521273300f881e23c7294453b015048: 1a8dc5c25521273300f881e23c7294453b015048</p>

</body>
</html>

--===============8294414490458975549==--
