Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F85C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 22:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D89112653;
	Mon,  4 Mar 2024 22:11:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A699112652;
 Mon,  4 Mar 2024 22:11:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2336779934842336467=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_amdgpu/tests=3A_Fix_vce_enc_te?=
 =?utf-8?q?st_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Mar 2024 22:11:21 -0000
Message-ID: <170959028137.502968.15926945188820299793@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304211632.184249-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240304211632.184249-1-vitaly.prosyak@amd.com>
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

--===============2336779934842336467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: amdgpu/tests: Fix vce enc test failure
URL   : https://patchwork.freedesktop.org/series/130694/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7745_BAT -> XEIGTPW_10774_BAT
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

  * IGT: IGT_7745 -> IGTPW_10774
  * Linux: xe-890-1636103d7fa7ca9dedb181d611cd214af79b04d1 -> xe-892-e8bc216572501440efb20e112bb5aa60599f1863

  IGTPW_10774: 10774
  IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-890-1636103d7fa7ca9dedb181d611cd214af79b04d1: 1636103d7fa7ca9dedb181d611cd214af79b04d1
  xe-892-e8bc216572501440efb20e112bb5aa60599f1863: e8bc216572501440efb20e112bb5aa60599f1863

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10774/index.html

--===============2336779934842336467==
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
<tr><td><b>Series:</b></td><td>amdgpu/tests: Fix vce enc test failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130694/">https://patchwork.freedesktop.org/series/130694/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10774/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10774/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7745_BAT -&gt; XEIGTPW_10774_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7745 -&gt; IGTPW_10774</li>
<li>Linux: xe-890-1636103d7fa7ca9dedb181d611cd214af79b04d1 -&gt; xe-892-e8bc216572501440efb20e112bb5aa60599f1863</li>
</ul>
<p>IGTPW_10774: 10774<br />
  IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-890-1636103d7fa7ca9dedb181d611cd214af79b04d1: 1636103d7fa7ca9dedb181d611cd214af79b04d1<br />
  xe-892-e8bc216572501440efb20e112bb5aa60599f1863: e8bc216572501440efb20e112bb5aa60599f1863</p>

</body>
</html>

--===============2336779934842336467==--
