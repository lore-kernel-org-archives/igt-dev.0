Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F055C9830E
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 03:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE55910E222;
	Wed, 30 Sep 2026 03:20:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E1C10E222;
 Wed, 30 Sep 2026 03:20:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8413170929043460698=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Fcore=3A_Don=27t_r?=
 =?utf-8?q?ely_on_debugfs_for_tracefs_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Sep 2026 03:20:13 -0000
Message-ID: <179073841384.221784.11175142887557168833@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260929234700.1244647-2-matthew.d.roper@intel.com>
In-Reply-To: <20260929234700.1244647-2-matthew.d.roper@intel.com>
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

--===============8413170929043460698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_core: Don't rely on debugfs for tracefs access
URL   : https://patchwork.freedesktop.org/series/175255/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9116_BAT -> XEIGTPW_15925_BAT
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

  * IGT: IGT_9116 -> IGTPW_15925
  * Linux: xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2 -> xe-5845-e6a6d431be7101c5cdbb1b5d97caa9c1ea9cb493

  IGTPW_15925: b3546d6c628bc49be1cf374a31b23171e4e09ecf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2: ecc5a84be849c400af610cdc613a0274e3b101b2
  xe-5845-e6a6d431be7101c5cdbb1b5d97caa9c1ea9cb493: e6a6d431be7101c5cdbb1b5d97caa9c1ea9cb493

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15925/index.html

--===============8413170929043460698==
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
<tr><td><b>Series:</b></td><td>lib/igt_core: Don&#x27;t rely on debugfs for tracefs access</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175255/">https://patchwork.freedesktop.org/series/175255/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15925/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15925/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9116_BAT -&gt; XEIGTPW_15925_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9116 -&gt; IGTPW_15925</li>
<li>Linux: xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2 -&gt; xe-5845-e6a6d431be7101c5cdbb1b5d97caa9c1ea9cb493</li>
</ul>
<p>IGTPW_15925: b3546d6c628bc49be1cf374a31b23171e4e09ecf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2: ecc5a84be849c400af610cdc613a0274e3b101b2<br />
  xe-5845-e6a6d431be7101c5cdbb1b5d97caa9c1ea9cb493: e6a6d431be7101c5cdbb1b5d97caa9c1ea9cb493</p>

</body>
</html>

--===============8413170929043460698==--
