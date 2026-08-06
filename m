Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6829EC55ABF
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 09:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E87110E2B8;
	Thu,  6 Aug 2026 09:58:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD38C10E2DF;
 Thu,  6 Aug 2026 09:58:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4745707886590227541=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_platform_filtering_fram?=
 =?utf-8?q?ework_for_IGT_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Aug 2026 09:58:06 -0000
Message-ID: <178601028670.24443.10853970922561102499@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805203608.148375-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260805203608.148375-1-vitaly.prosyak@amd.com>
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

--===============4745707886590227541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add platform filtering framework for IGT tests (rev2)
URL   : https://patchwork.freedesktop.org/series/171674/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9039_BAT -> XEIGTPW_15637_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-wcl-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9039 -> IGTPW_15637
  * Linux: xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5 -> xe-5552-8d11ccdc98daac5e969243b42907fd060a650091

  IGTPW_15637: 365e30dec476d65df9017d4262c8f818d1cf4a32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9039: 9039
  xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5: 4cbb5eb24c6169972847aa946c5206f97c4880a5
  xe-5552-8d11ccdc98daac5e969243b42907fd060a650091: 8d11ccdc98daac5e969243b42907fd060a650091

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15637/index.html

--===============4745707886590227541==
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
<tr><td><b>Series:</b></td><td>Add platform filtering framework for IGT tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171674/">https://patchwork.freedesktop.org/series/171674/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15637/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15637/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9039_BAT -&gt; XEIGTPW_15637_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-wcl-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9039 -&gt; IGTPW_15637</li>
<li>Linux: xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5 -&gt; xe-5552-8d11ccdc98daac5e969243b42907fd060a650091</li>
</ul>
<p>IGTPW_15637: 365e30dec476d65df9017d4262c8f818d1cf4a32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9039: 9039<br />
  xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5: 4cbb5eb24c6169972847aa946c5206f97c4880a5<br />
  xe-5552-8d11ccdc98daac5e969243b42907fd060a650091: 8d11ccdc98daac5e969243b42907fd060a650091</p>

</body>
</html>

--===============4745707886590227541==--
