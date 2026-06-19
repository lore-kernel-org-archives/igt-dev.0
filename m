Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B095CCD98E6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 06:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD6E10E047;
	Fri, 19 Jun 2026 06:20:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8CB10E047;
 Fri, 19 Jun 2026 06:20:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7455459249658511059=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tools/xe-perf-recorder=3A_A?=
 =?utf-8?q?dd_mmio-trigger_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Jun 2026 06:20:16 -0000
Message-ID: <178185001637.95114.15803233385060869295@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260619050217.2112851-1-shekhar.chauhan@intel.com>
In-Reply-To: <20260619050217.2112851-1-shekhar.chauhan@intel.com>
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

--===============7455459249658511059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/xe-perf-recorder: Add mmio-trigger support
URL   : https://patchwork.freedesktop.org/series/168824/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8974_BAT -> XEIGTPW_15405_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8974 -> IGTPW_15405
  * Linux: xe-5280-24209d838338d162bb25aadfd637b11747a357ca -> xe-5281-1f50384666a6193297d506b8df628ca428a48d42

  IGTPW_15405: 395a4c8480ab56f8bf05152bc20537438c6427a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8974: 8974
  xe-5280-24209d838338d162bb25aadfd637b11747a357ca: 24209d838338d162bb25aadfd637b11747a357ca
  xe-5281-1f50384666a6193297d506b8df628ca428a48d42: 1f50384666a6193297d506b8df628ca428a48d42

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15405/index.html

--===============7455459249658511059==
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
<tr><td><b>Series:</b></td><td>tools/xe-perf-recorder: Add mmio-trigger support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168824/">https://patchwork.freedesktop.org/series/168824/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15405/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15405/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8974_BAT -&gt; XEIGTPW_15405_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8974 -&gt; IGTPW_15405</li>
<li>Linux: xe-5280-24209d838338d162bb25aadfd637b11747a357ca -&gt; xe-5281-1f50384666a6193297d506b8df628ca428a48d42</li>
</ul>
<p>IGTPW_15405: 395a4c8480ab56f8bf05152bc20537438c6427a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8974: 8974<br />
  xe-5280-24209d838338d162bb25aadfd637b11747a357ca: 24209d838338d162bb25aadfd637b11747a357ca<br />
  xe-5281-1f50384666a6193297d506b8df628ca428a48d42: 1f50384666a6193297d506b8df628ca428a48d42</p>

</body>
</html>

--===============7455459249658511059==--
