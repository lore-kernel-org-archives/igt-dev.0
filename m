Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC160C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 22:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8100410E21B;
	Wed, 28 Feb 2024 22:07:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A089910E1F4;
 Wed, 28 Feb 2024 22:07:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6471512837090923977=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_amdgpu/tests=3A_Fix_uvd_encode?=
 =?utf-8?q?r_test_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Feb 2024 22:07:54 -0000
Message-ID: <170915807465.375728.16596730265330713055@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228205454.274430-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240228205454.274430-1-vitaly.prosyak@amd.com>
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

--===============6471512837090923977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: amdgpu/tests: Fix uvd encoder test failure
URL   : https://patchwork.freedesktop.org/series/130524/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7734_BAT -> XEIGTPW_10751_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7734 -> IGTPW_10751
  * Linux: xe-870-3bdccc6629ee909a167daedd6a8b75f6967ab726 -> xe-871-d065fff9dbb7f86e50ac789f6eb112eefd66dc93

  IGTPW_10751: 10751
  IGT_7734: 7734
  xe-870-3bdccc6629ee909a167daedd6a8b75f6967ab726: 3bdccc6629ee909a167daedd6a8b75f6967ab726
  xe-871-d065fff9dbb7f86e50ac789f6eb112eefd66dc93: d065fff9dbb7f86e50ac789f6eb112eefd66dc93

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10751/index.html

--===============6471512837090923977==
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
<tr><td><b>Series:</b></td><td>amdgpu/tests: Fix uvd encoder test failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130524/">https://patchwork.freedesktop.org/series/130524/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10751/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10751/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7734_BAT -&gt; XEIGTPW_10751_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7734 -&gt; IGTPW_10751</li>
<li>Linux: xe-870-3bdccc6629ee909a167daedd6a8b75f6967ab726 -&gt; xe-871-d065fff9dbb7f86e50ac789f6eb112eefd66dc93</li>
</ul>
<p>IGTPW_10751: 10751<br />
  IGT_7734: 7734<br />
  xe-870-3bdccc6629ee909a167daedd6a8b75f6967ab726: 3bdccc6629ee909a167daedd6a8b75f6967ab726<br />
  xe-871-d065fff9dbb7f86e50ac789f6eb112eefd66dc93: d065fff9dbb7f86e50ac789f6eb112eefd66dc93</p>

</body>
</html>

--===============6471512837090923977==--
