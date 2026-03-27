Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D80410BA426
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 04:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F1410E2DA;
	Fri, 27 Mar 2026 04:46:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867BA10E2DA;
 Fri, 27 Mar 2026 04:45:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3353449041682183339=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fcontent=5Fprote?=
 =?utf-8?q?ction=3A_Optimize_framebuffer_management_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason-JH Lin" <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Mar 2026 04:45:59 -0000
Message-ID: <177458675952.404868.13273131416668058011@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327035405.3151190-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260327035405.3151190-1-jason-jh.lin@mediatek.com>
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

--===============3353449041682183339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_content_protection: Optimize framebuffer management (rev3)
URL   : https://patchwork.freedesktop.org/series/163255/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8834_BAT -> XEIGTPW_14869_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8834 -> IGTPW_14869
  * Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -> xe-4802-113d411a9890a805edaffd3c3dd2cf436a868b68

  IGTPW_14869: 8fbaa114ec8c8c1890c7d32fc5f7dc4d273ba011 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8834: 8834
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf
  xe-4802-113d411a9890a805edaffd3c3dd2cf436a868b68: 113d411a9890a805edaffd3c3dd2cf436a868b68

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14869/index.html

--===============3353449041682183339==
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
<tr><td><b>Series:</b></td><td>tests/kms_content_protection: Optimize framebuffer management (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163255/">https://patchwork.freedesktop.org/series/163255/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14869/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14869/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8834_BAT -&gt; XEIGTPW_14869_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8834 -&gt; IGTPW_14869</li>
<li>Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -&gt; xe-4802-113d411a9890a805edaffd3c3dd2cf436a868b68</li>
</ul>
<p>IGTPW_14869: 8fbaa114ec8c8c1890c7d32fc5f7dc4d273ba011 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8834: 8834<br />
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf<br />
  xe-4802-113d411a9890a805edaffd3c3dd2cf436a868b68: 113d411a9890a805edaffd3c3dd2cf436a868b68</p>

</body>
</html>

--===============3353449041682183339==--
