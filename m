Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA51AC5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 20:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D31210ED21;
	Mon, 26 Feb 2024 20:22:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8991810ED1C;
 Mon, 26 Feb 2024 20:22:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8556125923450309981=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_benchmarks/kms=5Ffb=5Fstress?=
 =?utf-8?q?=3A_Add_command-line_options_to_change_the_planes_and_writeback_f?=
 =?utf-8?q?ormats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arthur Grillo" <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Feb 2024 20:22:30 -0000
Message-ID: <170897895056.318338.18204653523625137876@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
In-Reply-To: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
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

--===============8556125923450309981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: benchmarks/kms_fb_stress: Add command-line options to change the planes and writeback formats
URL   : https://patchwork.freedesktop.org/series/130399/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7731_BAT -> XEIGTPW_10737_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10737_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10737_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_10737_BAT prevented too many machines from booting.

  Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7731 -> IGTPW_10737
  * Linux: xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5 -> xe-854-c815c7fa9257eb8ff4433c43058dd292b16347eb

  IGTPW_10737: 10737
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5: 3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5
  xe-854-c815c7fa9257eb8ff4433c43058dd292b16347eb: c815c7fa9257eb8ff4433c43058dd292b16347eb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10737/index.html

--===============8556125923450309981==
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
<tr><td><b>Series:</b></td><td>benchmarks/kms_fb_stress: Add command-line options to change the planes and writeback formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130399/">https://patchwork.freedesktop.org/series/130399/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10737/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10737/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7731_BAT -&gt; XEIGTPW_10737_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10737_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10737_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_10737_BAT prevented too many machines from booting.</p>
<p>Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7731 -&gt; IGTPW_10737</li>
<li>Linux: xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5 -&gt; xe-854-c815c7fa9257eb8ff4433c43058dd292b16347eb</li>
</ul>
<p>IGTPW_10737: 10737<br />
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5: 3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5<br />
  xe-854-c815c7fa9257eb8ff4433c43058dd292b16347eb: c815c7fa9257eb8ff4433c43058dd292b16347eb</p>

</body>
</html>

--===============8556125923450309981==--
