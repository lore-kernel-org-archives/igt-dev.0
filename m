Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419B1C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 08:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E475110E16E;
	Thu, 27 Jun 2024 08:26:32 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC63710E16E;
 Thu, 27 Jun 2024 08:26:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2486839396329386911=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/gpgpu=3A_add_shader_suppor?=
 =?utf-8?q?t_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 27 Jun 2024 08:26:30 -0000
Message-ID: <171947679096.163598.3774570016466415886@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627-iga64_inline_ups-v8-0-08605c9360d3@intel.com>
In-Reply-To: <20240627-iga64_inline_ups-v8-0-08605c9360d3@intel.com>
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

--===============2486839396329386911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/gpgpu: add shader support (rev8)
URL   : https://patchwork.freedesktop.org/series/133020/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7905_BAT -> XEIGTPW_11325_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7905 -> IGTPW_11325

  IGTPW_11325: 18a185f5b22a16473e198ac7800dde3993031cf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7905: 7905
  xe-1537-6580bd2882edc6ea84200f2968d3d12b69b3ce40: 6580bd2882edc6ea84200f2968d3d12b69b3ce40

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11325/index.html

--===============2486839396329386911==
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
<tr><td><b>Series:</b></td><td>lib/gpgpu: add shader support (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133020/">https://patchwork.freedesktop.org/series/133020/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11325/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11325/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7905_BAT -&gt; XEIGTPW_11325_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7905 -&gt; IGTPW_11325</li>
</ul>
<p>IGTPW_11325: 18a185f5b22a16473e198ac7800dde3993031cf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7905: 7905<br />
  xe-1537-6580bd2882edc6ea84200f2968d3d12b69b3ce40: 6580bd2882edc6ea84200f2968d3d12b69b3ce40</p>

</body>
</html>

--===============2486839396329386911==--
