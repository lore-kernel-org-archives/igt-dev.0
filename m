Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B54C71135
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 09:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E8D10E66D;
	Thu, 29 Aug 2024 09:30:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD6710E66D;
 Thu, 29 Aug 2024 09:30:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2924215969368739482=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Fcore=3A_Refactor_lib?=
 =?utf-8?q?pciaccess_init/cleanup_wrappers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Aug 2024 09:30:55 -0000
Message-ID: <172492385517.830567.17078914977527699249@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829075811.87076-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240829075811.87076-1-marcin.bernatowicz@linux.intel.com>
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

--===============2924215969368739482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_core: Refactor libpciaccess init/cleanup wrappers
URL   : https://patchwork.freedesktop.org/series/137949/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7997_BAT -> XEIGTPW_11661_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7997 -> IGTPW_11661
  * Linux: xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17 -> xe-1853-6d5d77a2ec2865053755f00bbdfc0d0bf765ee97

  IGTPW_11661: a1d77f356ed3e37577149361583b6052797cc13a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17: 6b66ec881f7ae385f90fe6ad8c6ebef112873a17
  xe-1853-6d5d77a2ec2865053755f00bbdfc0d0bf765ee97: 6d5d77a2ec2865053755f00bbdfc0d0bf765ee97

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11661/index.html

--===============2924215969368739482==
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
<tr><td><b>Series:</b></td><td>lib/igt_core: Refactor libpciaccess init/cleanup wrappers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137949/">https://patchwork.freedesktop.org/series/137949/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11661/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11661/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7997_BAT -&gt; XEIGTPW_11661_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7997 -&gt; IGTPW_11661</li>
<li>Linux: xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17 -&gt; xe-1853-6d5d77a2ec2865053755f00bbdfc0d0bf765ee97</li>
</ul>
<p>IGTPW_11661: a1d77f356ed3e37577149361583b6052797cc13a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17: 6b66ec881f7ae385f90fe6ad8c6ebef112873a17<br />
  xe-1853-6d5d77a2ec2865053755f00bbdfc0d0bf765ee97: 6d5d77a2ec2865053755f00bbdfc0d0bf765ee97</p>

</body>
</html>

--===============2924215969368739482==--
