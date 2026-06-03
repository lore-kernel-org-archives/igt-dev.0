Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0668DCD6E4A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 06:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DB210F91D;
	Wed,  3 Jun 2026 06:10:38 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34EF10F91D;
 Wed,  3 Jun 2026 06:10:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7666862312586275727=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpipe=5Fst?=
 =?utf-8?q?ress=3A_fix_plane_setup_and_cursor_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Jun 2026 06:10:16 -0000
Message-ID: <178046701666.38280.17316574185659616782@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602162422.3360253-1-sowmiya.s@intel.com>
In-Reply-To: <20260602162422.3360253-1-sowmiya.s@intel.com>
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

--===============7666862312586275727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pipe_stress: fix plane setup and cursor handling (rev2)
URL   : https://patchwork.freedesktop.org/series/167348/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8947_BAT -> XEIGTPW_15292_BAT
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

  * IGT: IGT_8947 -> IGTPW_15292
  * Linux: xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc -> xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70

  IGTPW_15292: 15292
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc: dae47e6a1cce1d19d56c27b48b2670d4094ecbdc
  xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70: ab2d36ce7e67d2825cea19ea956947a21e932f70

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15292/index.html

--===============7666862312586275727==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pipe_stress: fix plane setup and cursor handling (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167348/">https://patchwork.freedesktop.org/series/167348/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15292/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15292/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8947_BAT -&gt; XEIGTPW_15292_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8947 -&gt; IGTPW_15292</li>
<li>Linux: xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc -&gt; xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70</li>
</ul>
<p>IGTPW_15292: 15292<br />
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc: dae47e6a1cce1d19d56c27b48b2670d4094ecbdc<br />
  xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70: ab2d36ce7e67d2825cea19ea956947a21e932f70</p>

</body>
</html>

--===============7666862312586275727==--
