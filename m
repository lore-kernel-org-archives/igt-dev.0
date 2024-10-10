Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C188DCEDDA9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 02:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB110E1BC;
	Thu, 10 Oct 2024 02:43:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA3B10E1BC;
 Thu, 10 Oct 2024 02:43:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4675553908614616394=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/xe=3A_Add_tests_to_valid?=
 =?utf-8?q?ate_GT_coarse_power_gating_status_and_toggle_coarse_power_gating_?=
 =?utf-8?q?states?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Oct 2024 02:43:26 -0000
Message-ID: <172852820643.1212968.14617370779769152958@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009183115.1981713-1-sk.anirban@intel.com>
In-Reply-To: <20241009183115.1981713-1-sk.anirban@intel.com>
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

--===============4675553908614616394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states
URL   : https://patchwork.freedesktop.org/series/139808/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8063_BAT -> XEIGTPW_11893_BAT
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

  Here are the changes found in XEIGTPW_11893_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#2754])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8063/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11893/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754


Build changes
-------------

  * IGT: IGT_8063 -> IGTPW_11893

  IGTPW_11893: 11893
  IGT_8063: 8063
  xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852: e1aba2bf4f79f2f8ae7ce538124d445fc91df852

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11893/index.html

--===============4675553908614616394==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139808/">https://patchwork.freedesktop.org/series/139808/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11893/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11893/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8063_BAT -&gt; XEIGTPW_11893_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11893_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8063/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11893/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8063 -&gt; IGTPW_11893</li>
</ul>
<p>IGTPW_11893: 11893<br />
  IGT_8063: 8063<br />
  xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852: e1aba2bf4f79f2f8ae7ce538124d445fc91df852</p>

</body>
</html>

--===============4675553908614616394==--
