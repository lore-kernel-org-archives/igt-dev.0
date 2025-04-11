Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31873C369A2
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 19:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E0F10EC5F;
	Fri, 11 Apr 2025 19:15:45 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2702B10EC5F;
 Fri, 11 Apr 2025 19:15:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4491446702350781746=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Foa=3A_Chec?=
 =?utf-8?q?k_for_DRM=5FXE=5FOA=5FCAPS=5FOA=5FBUFFER=5FSIZE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Apr 2025 19:15:44 -0000
Message-ID: <174439894415.5701.1189416849825671590@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250411180314.1095215-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250411180314.1095215-1-ashutosh.dixit@intel.com>
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

--===============4491446702350781746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Check for DRM_XE_OA_CAPS_OA_BUFFER_SIZE
URL   : https://patchwork.freedesktop.org/series/147609/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8316_BAT -> XEIGTPW_12963_BAT
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

  * IGT: IGT_8316 -> IGTPW_12963
  * Linux: xe-2940-aa93855f3cf22ec61e9bea644affac003537f887 -> xe-2941-95956f65403ec2f6784fca383eecbb54431ddebc

  IGTPW_12963: 12963
  IGT_8316: 8bdb573f8f9a2fffdc26356caebe032370b6d480 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2940-aa93855f3cf22ec61e9bea644affac003537f887: aa93855f3cf22ec61e9bea644affac003537f887
  xe-2941-95956f65403ec2f6784fca383eecbb54431ddebc: 95956f65403ec2f6784fca383eecbb54431ddebc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12963/index.html

--===============4491446702350781746==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Check for DRM_XE_OA_CAPS_OA_BUFFER_SIZE</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147609/">https://patchwork.freedesktop.org/series/147609/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12963/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12963/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8316_BAT -&gt; XEIGTPW_12963_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8316 -&gt; IGTPW_12963</li>
<li>Linux: xe-2940-aa93855f3cf22ec61e9bea644affac003537f887 -&gt; xe-2941-95956f65403ec2f6784fca383eecbb54431ddebc</li>
</ul>
<p>IGTPW_12963: 12963<br />
  IGT_8316: 8bdb573f8f9a2fffdc26356caebe032370b6d480 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2940-aa93855f3cf22ec61e9bea644affac003537f887: aa93855f3cf22ec61e9bea644affac003537f887<br />
  xe-2941-95956f65403ec2f6784fca383eecbb54431ddebc: 95956f65403ec2f6784fca383eecbb54431ddebc</p>

</body>
</html>

--===============4491446702350781746==--
