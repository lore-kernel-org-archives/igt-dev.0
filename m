Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFCDCF0450
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 11:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BC010E6D5;
	Wed,  9 Oct 2024 11:06:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C405410E6D5;
 Wed,  9 Oct 2024 11:06:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2335465613853286458=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fpm=5Fdc=3A_A?=
 =?utf-8?q?dd_DC5_retention_flops_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 09 Oct 2024 11:06:18 -0000
Message-ID: <172847197879.1209043.2560645486265176460@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20230327181202.6797-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230327181202.6797-1-mohammed.thasleem@intel.com>
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

--===============2335465613853286458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Add DC5 retention flops test
URL   : https://patchwork.freedesktop.org/series/139766/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8061_BAT -> XEIGTPW_11889_BAT
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

  Here are the changes found in XEIGTPW_11889_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8061/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11889/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] ([Intel XE#2754])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8061/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11889/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754


Build changes
-------------

  * IGT: IGT_8061 -> IGTPW_11889
  * Linux: xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34 -> xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff

  IGTPW_11889: 11889
  IGT_8061: 8061
  xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34: 8752b50cc6ea4e90f3caa68dd1cc169112ac4b34
  xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff: 97b4690ecb1eafab876fe8be401d0d45bb5eb5ff

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11889/index.html

--===============2335465613853286458==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Add DC5 retention flops test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139766/">https://patchwork.freedesktop.org/series/139766/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11889/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11889/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8061_BAT -&gt; XEIGTPW_11889_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11889_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8061/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11889/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8061/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11889/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8061 -&gt; IGTPW_11889</li>
<li>Linux: xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34 -&gt; xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff</li>
</ul>
<p>IGTPW_11889: 11889<br />
  IGT_8061: 8061<br />
  xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34: 8752b50cc6ea4e90f3caa68dd1cc169112ac4b34<br />
  xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff: 97b4690ecb1eafab876fe8be401d0d45bb5eb5ff</p>

</body>
</html>

--===============2335465613853286458==--
