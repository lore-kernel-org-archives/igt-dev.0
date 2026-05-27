Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A364BCD5BDE
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 07:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E20910E73B;
	Wed, 27 May 2026 07:30:35 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81AD10E73B;
 Wed, 27 May 2026 07:30:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5357400672087225189=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpipe=5Fst?=
 =?utf-8?q?ress=3A_fix_plane_setup_and_cursor_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 May 2026 07:30:14 -0000
Message-ID: <177986701479.14032.3230875549007875280@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
In-Reply-To: <20260527071940.3285269-1-sowmiya.s@intel.com>
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

--===============5357400672087225189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pipe_stress: fix plane setup and cursor handling
URL   : https://patchwork.freedesktop.org/series/167348/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8938_BAT -> XEIGTPW_15253_BAT
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

  * IGT: IGT_8938 -> IGTPW_15253
  * Linux: xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33 -> xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85

  IGTPW_15253: 15253
  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33: ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33
  xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85: 14d3e29c36bea707856f5c03dbf7b0ef73fdeb85

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15253/index.html

--===============5357400672087225189==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pipe_stress: fix plane setup and cursor handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167348/">https://patchwork.freedesktop.org/series/167348/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15253/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15253/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8938_BAT -&gt; XEIGTPW_15253_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8938 -&gt; IGTPW_15253</li>
<li>Linux: xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33 -&gt; xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85</li>
</ul>
<p>IGTPW_15253: 15253<br />
  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33: ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33<br />
  xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85: 14d3e29c36bea707856f5c03dbf7b0ef73fdeb85</p>

</body>
</html>

--===============5357400672087225189==--
