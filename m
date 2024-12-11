Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171D6E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 18:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB58710E62A;
	Wed, 11 Dec 2024 18:25:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404B510E62A;
 Wed, 11 Dec 2024 18:25:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2997209402162147682=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Feudebug=3A?=
 =?utf-8?q?_Introduce_additional_ufence_testcases_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Dec 2024 18:25:04 -0000
Message-ID: <173394150425.1275968.14770429271117280411@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211135039.5853-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241211135039.5853-1-dominik.karol.piatkowski@intel.com>
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

--===============2997209402162147682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_eudebug: Introduce additional ufence testcases (rev2)
URL   : https://patchwork.freedesktop.org/series/142301/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8148_BAT -> XEIGTPW_12295_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8148 -> IGTPW_12295
  * Linux: xe-2351-03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b -> xe-2353-64679a558442b0191dff88abe841d13ee7e0b229

  IGTPW_12295: 27433cacf41772d3dd903cc23eb27bf680de6887 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8148: 5362e7ac965c3768c60848e266294a4c6172241c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2351-03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b: 03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b
  xe-2353-64679a558442b0191dff88abe841d13ee7e0b229: 64679a558442b0191dff88abe841d13ee7e0b229

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12295/index.html

--===============2997209402162147682==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_eudebug: Introduce additional ufence testcases (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142301/">https://patchwork.freedesktop.org/series/142301/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12295/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12295/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8148_BAT -&gt; XEIGTPW_12295_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8148 -&gt; IGTPW_12295</li>
<li>Linux: xe-2351-03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b -&gt; xe-2353-64679a558442b0191dff88abe841d13ee7e0b229</li>
</ul>
<p>IGTPW_12295: 27433cacf41772d3dd903cc23eb27bf680de6887 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8148: 5362e7ac965c3768c60848e266294a4c6172241c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2351-03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b: 03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b<br />
  xe-2353-64679a558442b0191dff88abe841d13ee7e0b229: 64679a558442b0191dff88abe841d13ee7e0b229</p>

</body>
</html>

--===============2997209402162147682==--
