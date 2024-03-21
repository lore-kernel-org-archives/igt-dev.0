Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7884BC6FD1F
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 19:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE7F112088;
	Thu, 21 Mar 2024 19:51:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F530112088;
 Thu, 21 Mar 2024 19:51:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2730616468504368786=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib=3A_Inline_igt=5Fx86=5Ffeat?=
 =?utf-8?q?ures=28=29_into_ifunc_resolvers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Turner" <mattst88@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Mar 2024 19:51:13 -0000
Message-ID: <171105067318.940819.3217426561494761762@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304221800.1161896-1-mattst88@gmail.com>
In-Reply-To: <20240304221800.1161896-1-mattst88@gmail.com>
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

--===============2730616468504368786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: Inline igt_x86_features() into ifunc resolvers (rev2)
URL   : https://patchwork.freedesktop.org/series/130696/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7775_BAT -> XEIGTPW_10876_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7775 -> IGTPW_10876

  IGTPW_10876: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/index.html
  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10876/index.html

--===============2730616468504368786==
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
<tr><td><b>Series:</b></td><td>lib: Inline igt_x86_features() into ifunc resolvers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130696/">https://patchwork.freedesktop.org/series/130696/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10876/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10876/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7775_BAT -&gt; XEIGTPW_10876_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7775 -&gt; IGTPW_10876</li>
</ul>
<p>IGTPW_10876: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/index.html<br />
  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31</p>

</body>
</html>

--===============2730616468504368786==--
