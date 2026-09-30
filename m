Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46391CA5FA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 00:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F6F10E236;
	Wed, 30 Sep 2026 00:30:33 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E4B10E236;
 Wed, 30 Sep 2026 00:29:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1118855265952564916=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/i915=5Fpm=5Frc6?=
 =?utf-8?q?=5Fresidency=3A_make_residency_ratio_tolerance_symmetric?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Sep 2026 00:29:49 -0000
Message-ID: <179072818921.221285.10105873570015990913@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260929172810.2077612-2-sk.anirban@intel.com>
In-Reply-To: <20260929172810.2077612-2-sk.anirban@intel.com>
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

--===============1118855265952564916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_pm_rc6_residency: make residency ratio tolerance symmetric
URL   : https://patchwork.freedesktop.org/series/175236/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9116_BAT -> XEIGTPW_15921_BAT
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

  * IGT: IGT_9116 -> IGTPW_15921
  * Linux: xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2 -> xe-5844-268539e75898afc1b1f6d39fae4f34f3faf24313

  IGTPW_15921: 1b8f130eb2583c9bd135798dd5e88bba5a1da3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2: ecc5a84be849c400af610cdc613a0274e3b101b2
  xe-5844-268539e75898afc1b1f6d39fae4f34f3faf24313: 268539e75898afc1b1f6d39fae4f34f3faf24313

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15921/index.html

--===============1118855265952564916==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_pm_rc6_residency: make residency ratio tolerance symmetric</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175236/">https://patchwork.freedesktop.org/series/175236/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15921/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15921/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9116_BAT -&gt; XEIGTPW_15921_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9116 -&gt; IGTPW_15921</li>
<li>Linux: xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2 -&gt; xe-5844-268539e75898afc1b1f6d39fae4f34f3faf24313</li>
</ul>
<p>IGTPW_15921: 1b8f130eb2583c9bd135798dd5e88bba5a1da3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2: ecc5a84be849c400af610cdc613a0274e3b101b2<br />
  xe-5844-268539e75898afc1b1f6d39fae4f34f3faf24313: 268539e75898afc1b1f6d39fae4f34f3faf24313</p>

</body>
</html>

--===============1118855265952564916==--
