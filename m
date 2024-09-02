Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BE2CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 21:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A717810E062;
	Mon,  2 Sep 2024 21:05:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3E010E062;
 Mon,  2 Sep 2024 21:05:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1782730838424963643=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/3=5D_xe/oa=3A_Update_oa-lnl=2Exml?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Sep 2024 21:05:15 -0000
Message-ID: <172531111557.908488.17304272480497334070@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902192609.161056-1-jose.souza@intel.com>
In-Reply-To: <20240902192609.161056-1-jose.souza@intel.com>
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

--===============1782730838424963643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] xe/oa: Update oa-lnl.xml
URL   : https://patchwork.freedesktop.org/series/138112/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8001_BAT -> XEIGTPW_11680_BAT
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

  Here are the changes found in XEIGTPW_11680_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#1069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8001/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11680/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069


Build changes
-------------

  * IGT: IGT_8001 -> IGTPW_11680
  * Linux: xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5 -> xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30

  IGTPW_11680: 4e01db795d912bcc36a864f592fea60af5631547 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5: c689a348137cb6f8934a9be49438bafe413b97d5
  xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30: 0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11680/index.html

--===============1782730838424963643==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] xe/oa: Update oa-lnl.xml</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138112/">https://patchwork.freedesktop.org/series/138112/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11680/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11680/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8001_BAT -&gt; XEIGTPW_11680_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11680_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8001/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11680/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8001 -&gt; IGTPW_11680</li>
<li>Linux: xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5 -&gt; xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30</li>
</ul>
<p>IGTPW_11680: 4e01db795d912bcc36a864f592fea60af5631547 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5: c689a348137cb6f8934a9be49438bafe413b97d5<br />
  xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30: 0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30</p>

</body>
</html>

--===============1782730838424963643==--
