Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B012E94627
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 00:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C0010E39D;
	Tue, 10 Feb 2026 00:58:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523D910E39D;
 Tue, 10 Feb 2026 00:58:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2930597888729249962=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fcompute=3A_Add_?=
 =?utf-8?q?compute_and_preemption_support_for_NVL-P?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Feb 2026 00:58:11 -0000
Message-ID: <177068509131.239579.11627554997075859841@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260209120622.235501-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260209120622.235501-2-zbigniew.kempczynski@intel.com>
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

--===============2930597888729249962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_compute: Add compute and preemption support for NVL-P
URL   : https://patchwork.freedesktop.org/series/161353/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8746_BAT -> XEIGTPW_14518_BAT
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

  * IGT: IGT_8746 -> IGTPW_14518
  * Linux: xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2 -> xe-4532-d2a98b98376b6a16c835a131b12f295848c656db

  IGTPW_14518: a3cf2db28f4ef9388182b6046c14a99b919fc7f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8746: 8746
  xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2
  xe-4532-d2a98b98376b6a16c835a131b12f295848c656db: d2a98b98376b6a16c835a131b12f295848c656db

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14518/index.html

--===============2930597888729249962==
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
<tr><td><b>Series:</b></td><td>lib/intel_compute: Add compute and preemption support for NVL-P</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161353/">https://patchwork.freedesktop.org/series/161353/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14518/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14518/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8746_BAT -&gt; XEIGTPW_14518_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8746 -&gt; IGTPW_14518</li>
<li>Linux: xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2 -&gt; xe-4532-d2a98b98376b6a16c835a131b12f295848c656db</li>
</ul>
<p>IGTPW_14518: a3cf2db28f4ef9388182b6046c14a99b919fc7f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8746: 8746<br />
  xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2<br />
  xe-4532-d2a98b98376b6a16c835a131b12f295848c656db: d2a98b98376b6a16c835a131b12f295848c656db</p>

</body>
</html>

--===============2930597888729249962==--
