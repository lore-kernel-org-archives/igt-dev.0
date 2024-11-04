Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B4FD11183
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 06:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9321810E07F;
	Mon,  4 Nov 2024 06:29:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6410310E07F;
 Mon,  4 Nov 2024 06:29:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7482863089591306136=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_scripts/generate=5Figa64=5Fcod?=
 =?utf-8?q?es=3A_prevent_objcopy_from_modifying_the_input_file?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeff Dagenais" <jeff.dagenais@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Nov 2024 06:29:13 -0000
Message-ID: <173070175340.1390299.8655255901573711108@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030184054.73065-1-jdagenais@tesla.com>
In-Reply-To: <20241030184054.73065-1-jdagenais@tesla.com>
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

--===============7482863089591306136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: scripts/generate_iga64_codes: prevent objcopy from modifying the input file
URL   : https://patchwork.freedesktop.org/series/140771/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8091_BAT -> XEIGTPW_12015_BAT
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

  Here are the changes found in XEIGTPW_12015_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#2754])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754


Build changes
-------------

  * IGT: IGT_8091 -> IGTPW_12015
  * Linux: xe-2149-54ceaf112b111612f3a7430132b2395fcce62414 -> xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932

  IGTPW_12015: 12015
  IGT_8091: 8091
  xe-2149-54ceaf112b111612f3a7430132b2395fcce62414: 54ceaf112b111612f3a7430132b2395fcce62414
  xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932: 9c4962db90300e1d8daca8ed54195bc31d0ee932

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/index.html

--===============7482863089591306136==
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
<tr><td><b>Series:</b></td><td>scripts/generate_iga64_codes: prevent objcopy from modifying the input file</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140771/">https://patchwork.freedesktop.org/series/140771/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8091_BAT -&gt; XEIGTPW_12015_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12015_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8091 -&gt; IGTPW_12015</li>
<li>Linux: xe-2149-54ceaf112b111612f3a7430132b2395fcce62414 -&gt; xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932</li>
</ul>
<p>IGTPW_12015: 12015<br />
  IGT_8091: 8091<br />
  xe-2149-54ceaf112b111612f3a7430132b2395fcce62414: 54ceaf112b111612f3a7430132b2395fcce62414<br />
  xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932: 9c4962db90300e1d8daca8ed54195bc31d0ee932</p>

</body>
</html>

--===============7482863089591306136==--
