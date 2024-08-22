Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB4FC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 10:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7C110E002;
	Thu, 22 Aug 2024 10:07:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BF010E002;
 Thu, 22 Aug 2024 10:07:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7428467486980094651=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fpm=3A_Add_tes?=
 =?utf-8?q?ts_for_suspend_without_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Aug 2024 10:07:33 -0000
Message-ID: <172432125319.724138.15642519161144022517@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
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

--===============7428467486980094651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm: Add tests for suspend without display
URL   : https://patchwork.freedesktop.org/series/137634/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7983_BAT -> XEIGTPW_11616_BAT
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

  Here are the changes found in XEIGTPW_11616_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#1069])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11616/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069


Build changes
-------------

  * IGT: IGT_7983 -> IGTPW_11616
  * Linux: xe-1809-e0f8b8a5d8c77e94683451085c62cc54a4d9079d -> xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8

  IGTPW_11616: a8131c9dde3f4532954bc93d33fb3ca9a91aeb68 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7983: b2e17acf37471073210221724a66d164328dee98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1809-e0f8b8a5d8c77e94683451085c62cc54a4d9079d: e0f8b8a5d8c77e94683451085c62cc54a4d9079d
  xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8: 6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11616/index.html

--===============7428467486980094651==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm: Add tests for suspend without display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137634/">https://patchwork.freedesktop.org/series/137634/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11616/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11616/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7983_BAT -&gt; XEIGTPW_11616_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11616_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11616/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7983 -&gt; IGTPW_11616</li>
<li>Linux: xe-1809-e0f8b8a5d8c77e94683451085c62cc54a4d9079d -&gt; xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8</li>
</ul>
<p>IGTPW_11616: a8131c9dde3f4532954bc93d33fb3ca9a91aeb68 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7983: b2e17acf37471073210221724a66d164328dee98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1809-e0f8b8a5d8c77e94683451085c62cc54a4d9079d: e0f8b8a5d8c77e94683451085c62cc54a4d9079d<br />
  xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8: 6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8</p>

</body>
</html>

--===============7428467486980094651==--
