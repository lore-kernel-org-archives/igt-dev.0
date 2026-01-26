Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28DCD1951B
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 23:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E2510E4C0;
	Mon, 26 Jan 2026 23:21:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA1C10E4C9;
 Mon, 26 Jan 2026 23:21:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2538169994273365647=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/kms=3A_More_pipe-=3Ecrt?=
 =?utf-8?q?c_renaming_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Jan 2026 23:21:20 -0000
Message-ID: <176946968006.193567.10851546766381061157@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
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

--===============2538169994273365647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: More pipe->crtc renaming (rev2)
URL   : https://patchwork.freedesktop.org/series/160493/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8718_BAT -> XEIGTPW_14419_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_14419_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8718/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14419/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8718 -> IGTPW_14419
  * Linux: xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc -> xe-4449-a1e0224c47409e3c48cfc55a7db0321d22dc343e

  IGTPW_14419: ee0c54fda51d2a02f6269deb15fa66c470f7a331 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8718: 8718
  xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc: 0f7122915dfd558c57f69c4f97ebd64707a721cc
  xe-4449-a1e0224c47409e3c48cfc55a7db0321d22dc343e: a1e0224c47409e3c48cfc55a7db0321d22dc343e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14419/index.html

--===============2538169994273365647==
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
<tr><td><b>Series:</b></td><td>lib/kms: More pipe-&gt;crtc renaming (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160493/">https://patchwork.freedesktop.org/series/160493/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14419/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14419/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8718_BAT -&gt; XEIGTPW_14419_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14419_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8718/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14419/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8718 -&gt; IGTPW_14419</li>
<li>Linux: xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc -&gt; xe-4449-a1e0224c47409e3c48cfc55a7db0321d22dc343e</li>
</ul>
<p>IGTPW_14419: ee0c54fda51d2a02f6269deb15fa66c470f7a331 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8718: 8718<br />
  xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc: 0f7122915dfd558c57f69c4f97ebd64707a721cc<br />
  xe-4449-a1e0224c47409e3c48cfc55a7db0321d22dc343e: a1e0224c47409e3c48cfc55a7db0321d22dc343e</p>

</body>
</html>

--===============2538169994273365647==--
