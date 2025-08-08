Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4549AC87FD3
	for <igt-dev@archiver.kernel.org>; Fri,  8 Aug 2025 13:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC1F10E93A;
	Fri,  8 Aug 2025 13:38:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E6910E939;
 Fri,  8 Aug 2025 13:38:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8470115444263216146=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv9=2C1/2=5D_tests/kms=5Fprime=3A_Add_XE_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 08 Aug 2025 13:38:42 -0000
Message-ID: <175466032266.222611.417815644970338114@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808112050.987926-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250808112050.987926-1-santhosh.reddy.guddati@intel.com>
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

--===============8470115444263216146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v9,1/2] tests/kms_prime: Add XE support
URL   : https://patchwork.freedesktop.org/series/152688/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8489_BAT -> XEIGTPW_13562_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13562_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8489 -> IGTPW_13562
  * Linux: xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef -> xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b

  IGTPW_13562: 98cf03ef28ac53bb2fb2c4f8fddf14f94fdf8062 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef: c59a466c9c1d514e151d30f0a66ce76ce8d21aef
  xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b: 2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13562/index.html

--===============8470115444263216146==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v9,1/2] tests/kms_prime: Add XE support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152688/">https://patchwork.freedesktop.org/series/152688/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13562/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13562/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8489_BAT -&gt; XEIGTPW_13562_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13562_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8489 -&gt; IGTPW_13562</li>
<li>Linux: xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef -&gt; xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b</li>
</ul>
<p>IGTPW_13562: 98cf03ef28ac53bb2fb2c4f8fddf14f94fdf8062 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef: c59a466c9c1d514e151d30f0a66ce76ce8d21aef<br />
  xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b: 2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b</p>

</body>
</html>

--===============8470115444263216146==--
