Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C3EC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 10:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9A910E09B;
	Wed, 26 Jun 2024 10:29:18 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1B510E09B;
 Wed, 26 Jun 2024 10:29:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3325753387467683433=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/gpu=5Fcmds=3A_Fix_hardcode?=
 =?utf-8?q?d_buffer_size_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Karol Piatkowski" <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jun 2024 10:29:17 -0000
Message-ID: <171939775724.160231.17353664223743341333@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626063018.2931-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20240626063018.2931-1-dominik.karol.piatkowski@intel.com>
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

--===============3325753387467683433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/gpu_cmds: Fix hardcoded buffer size (rev2)
URL   : https://patchwork.freedesktop.org/series/135294/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7901_BAT -> XEIGTPW_11316_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11316_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11316_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11316_BAT prevented too many machines from booting.

  Missing    (4): bat-adlp-7 bat-dg2-oem2 bat-lnl-1 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7901 -> IGTPW_11316
  * Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -> xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356

  IGTPW_11316: 11316
  IGT_7901: dceed442a14a0abd09065cbade94cefe11e00422 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1d172aa0f37511bbe4d
  xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356: 4e4d42f54537b821c3aea17ef8b669a36ac09356

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11316/index.html

--===============3325753387467683433==
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
<tr><td><b>Series:</b></td><td>lib/gpu_cmds: Fix hardcoded buffer size (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135294/">https://patchwork.freedesktop.org/series/135294/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11316/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11316/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7901_BAT -&gt; XEIGTPW_11316_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11316_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11316_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11316_BAT prevented too many machines from booting.</p>
<p>Missing    (4): bat-adlp-7 bat-dg2-oem2 bat-lnl-1 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7901 -&gt; IGTPW_11316</li>
<li>Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -&gt; xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356</li>
</ul>
<p>IGTPW_11316: 11316<br />
  IGT_7901: dceed442a14a0abd09065cbade94cefe11e00422 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1d172aa0f37511bbe4d<br />
  xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356: 4e4d42f54537b821c3aea17ef8b669a36ac09356</p>

</body>
</html>

--===============3325753387467683433==--
