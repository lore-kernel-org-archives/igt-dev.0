Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99231CCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 11:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BBF10E9B6;
	Thu, 16 Oct 2025 11:04:24 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8257210E9B6;
 Thu, 16 Oct 2025 11:04:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7754245577501566573=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tools/intel=5Fgpu=5Ftop=3A_?=
 =?utf-8?q?Add_iteration_option_-n?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Oct 2025 11:04:23 -0000
Message-ID: <176061266352.21516.3664726534719231470@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
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

--===============7754245577501566573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_gpu_top: Add iteration option -n
URL   : https://patchwork.freedesktop.org/series/156053/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8587_BAT -> XEIGTPW_13912_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8587 -> IGTPW_13912
  * Linux: xe-3927-69ca30df000b382e7657f300148be505083377f2 -> xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed

  IGTPW_13912: 13912
  IGT_8587: 8587
  xe-3927-69ca30df000b382e7657f300148be505083377f2: 69ca30df000b382e7657f300148be505083377f2
  xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed: aaaff197c9186f4959c2bcb18035725188b950ed

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13912/index.html

--===============7754245577501566573==
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
<tr><td><b>Series:</b></td><td>tools/intel_gpu_top: Add iteration option -n</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156053/">https://patchwork.freedesktop.org/series/156053/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13912/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13912/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8587_BAT -&gt; XEIGTPW_13912_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8587 -&gt; IGTPW_13912</li>
<li>Linux: xe-3927-69ca30df000b382e7657f300148be505083377f2 -&gt; xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed</li>
</ul>
<p>IGTPW_13912: 13912<br />
  IGT_8587: 8587<br />
  xe-3927-69ca30df000b382e7657f300148be505083377f2: 69ca30df000b382e7657f300148be505083377f2<br />
  xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed: aaaff197c9186f4959c2bcb18035725188b950ed</p>

</body>
</html>

--===============7754245577501566573==--
