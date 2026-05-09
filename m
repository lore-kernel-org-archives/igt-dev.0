Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0C2CD3445
	for <igt-dev@archiver.kernel.org>; Sat,  9 May 2026 00:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002BB10E372;
	Sat,  9 May 2026 00:00:42 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF2B10E372;
 Sat,  9 May 2026 00:00:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8926539590881147323=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fblt=3A_Replace_?=
 =?utf-8?q?CANONICAL=28=29_with_xe=5Fcanonical=5Fva=28=29_for_Xe_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 09 May 2026 00:00:25 -0000
Message-ID: <177828482550.53706.7454544460810711617@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508123534.819730-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260508123534.819730-1-dnyaneshwar.bhadane@intel.com>
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

--===============8926539590881147323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_blt: Replace CANONICAL() with xe_canonical_va() for Xe driver
URL   : https://patchwork.freedesktop.org/series/166213/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8901_BAT -> XEIGTPW_15137_BAT
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

  * IGT: IGT_8901 -> IGTPW_15137
  * Linux: xe-5031-18d2011d95002966c64980ab06f36ee9211d496c -> xe-5032-7943b2aad82f5e3fc862b58eef12469abf4e4b86

  IGTPW_15137: 652fd8a731d9350aa63f2b42846db41e66337f82 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8901: 0a391e6b79fd6c6c7a55f75ea4769f31529821c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5031-18d2011d95002966c64980ab06f36ee9211d496c: 18d2011d95002966c64980ab06f36ee9211d496c
  xe-5032-7943b2aad82f5e3fc862b58eef12469abf4e4b86: 7943b2aad82f5e3fc862b58eef12469abf4e4b86

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15137/index.html

--===============8926539590881147323==
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
<tr><td><b>Series:</b></td><td>lib/intel_blt: Replace CANONICAL() with xe_canonical_va() for Xe driver</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166213/">https://patchwork.freedesktop.org/series/166213/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15137/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15137/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8901_BAT -&gt; XEIGTPW_15137_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8901 -&gt; IGTPW_15137</li>
<li>Linux: xe-5031-18d2011d95002966c64980ab06f36ee9211d496c -&gt; xe-5032-7943b2aad82f5e3fc862b58eef12469abf4e4b86</li>
</ul>
<p>IGTPW_15137: 652fd8a731d9350aa63f2b42846db41e66337f82 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8901: 0a391e6b79fd6c6c7a55f75ea4769f31529821c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5031-18d2011d95002966c64980ab06f36ee9211d496c: 18d2011d95002966c64980ab06f36ee9211d496c<br />
  xe-5032-7943b2aad82f5e3fc862b58eef12469abf4e4b86: 7943b2aad82f5e3fc862b58eef12469abf4e4b86</p>

</body>
</html>

--===============8926539590881147323==--
