Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C12FF886F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 07:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A0210E00F;
	Thu, 30 Apr 2026 07:12:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD3910E00F;
 Thu, 30 Apr 2026 07:11:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6763916722896343841=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests=5Cintel=5Cxe=5Fconfig?=
 =?utf-8?q?fs=3A_Fix_ctx=5Frestore_BB_path_for_post_and_mid_variants_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramanyam, Smitha" <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Apr 2026 07:11:47 -0000
Message-ID: <177753310788.27582.12472210609924143367@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
In-Reply-To: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
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

--===============6763916722896343841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests\intel\xe_configfs: Fix ctx_restore BB path for post and mid variants (rev2)
URL   : https://patchwork.freedesktop.org/series/165621/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8879_BAT -> XEIGTPW_15087_BAT
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

  * IGT: IGT_8879 -> IGTPW_15087
  * Linux: xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a -> xe-4956-0ed5f88da70b2b2cc67bacb80d205cdd00a6a574

  IGTPW_15087: 3fe84f2c14c7797baf9b23b337842a2dc5478ffc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a: a53aafc879e9c52b2776089762591d2766a27f0a
  xe-4956-0ed5f88da70b2b2cc67bacb80d205cdd00a6a574: 0ed5f88da70b2b2cc67bacb80d205cdd00a6a574

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15087/index.html

--===============6763916722896343841==
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
<tr><td><b>Series:</b></td><td>tests\intel\xe_configfs: Fix ctx_restore BB path for post and mid variants (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165621/">https://patchwork.freedesktop.org/series/165621/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15087/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15087/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8879_BAT -&gt; XEIGTPW_15087_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8879 -&gt; IGTPW_15087</li>
<li>Linux: xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a -&gt; xe-4956-0ed5f88da70b2b2cc67bacb80d205cdd00a6a574</li>
</ul>
<p>IGTPW_15087: 3fe84f2c14c7797baf9b23b337842a2dc5478ffc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a: a53aafc879e9c52b2776089762591d2766a27f0a<br />
  xe-4956-0ed5f88da70b2b2cc67bacb80d205cdd00a6a574: 0ed5f88da70b2b2cc67bacb80d205cdd00a6a574</p>

</body>
</html>

--===============6763916722896343841==--
