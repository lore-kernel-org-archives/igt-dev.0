Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB71C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 17:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D744610E31D;
	Wed, 30 Apr 2025 17:25:22 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051A810E118;
 Wed, 30 Apr 2025 17:25:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6609779539205883049=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fdisplay=5Fmodes?=
 =?utf-8?q?=3A_Fit_modes_within_MST_bandwidth_constraints_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Apr 2025 17:25:22 -0000
Message-ID: <174603392201.31255.10253701246413076715@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250430094655.3926900-1-jeevan.b@intel.com>
In-Reply-To: <20250430094655.3926900-1-jeevan.b@intel.com>
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

--===============6609779539205883049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_display_modes: Fit modes within MST bandwidth constraints (rev5)
URL   : https://patchwork.freedesktop.org/series/146653/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8348_BAT -> XEIGTPW_13071_BAT
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

  * IGT: IGT_8348 -> IGTPW_13071

  IGTPW_13071: e63f2f40c4d9d523d7515aedb96da93e15929ecc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8348: b16e09d706d803fa61530a274b9443e1d542898f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3013-1351e9f42d757ef4ce7d2cf2401aa2b5fe36df6d: 1351e9f42d757ef4ce7d2cf2401aa2b5fe36df6d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13071/index.html

--===============6609779539205883049==
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
<tr><td><b>Series:</b></td><td>tests/kms_display_modes: Fit modes within MST bandwidth constraints (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146653/">https://patchwork.freedesktop.org/series/146653/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13071/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13071/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8348_BAT -&gt; XEIGTPW_13071_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8348 -&gt; IGTPW_13071</li>
</ul>
<p>IGTPW_13071: e63f2f40c4d9d523d7515aedb96da93e15929ecc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8348: b16e09d706d803fa61530a274b9443e1d542898f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3013-1351e9f42d757ef4ce7d2cf2401aa2b5fe36df6d: 1351e9f42d757ef4ce7d2cf2401aa2b5fe36df6d</p>

</body>
</html>

--===============6609779539205883049==--
