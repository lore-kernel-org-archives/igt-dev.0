Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E3BC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 20:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1311366A;
	Tue, 23 Apr 2024 20:09:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065EB11366A;
 Tue, 23 Apr 2024 20:09:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0128059610268214255=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Intel_blitter_framebuffer_copy?=
 =?utf-8?q?ing_sanitizing_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Apr 2024 20:09:14 -0000
Message-ID: <171390295401.1607644.6594821789574499553@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
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

--===============0128059610268214255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel blitter framebuffer copying sanitizing (rev4)
URL   : https://patchwork.freedesktop.org/series/132733/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7819_BAT -> XEIGTPW_11058_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11058_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11058_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11058_BAT prevented too many machines from booting.

  Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7819 -> IGTPW_11058

  IGTPW_11058: 2b6f2b0f7a4d4b5159c71a987abd3b1b62d625f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf: e1dc9638bb47a28181fee1a9a180445ca2a8b9cf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11058/index.html

--===============0128059610268214255==
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
<tr><td><b>Series:</b></td><td>Intel blitter framebuffer copying sanitizing (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132733/">https://patchwork.freedesktop.org/series/132733/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11058/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11058/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7819_BAT -&gt; XEIGTPW_11058_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11058_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11058_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11058_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7819 -&gt; IGTPW_11058</li>
</ul>
<p>IGTPW_11058: 2b6f2b0f7a4d4b5159c71a987abd3b1b62d625f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf: e1dc9638bb47a28181fee1a9a180445ca2a8b9cf</p>

</body>
</html>

--===============0128059610268214255==--
