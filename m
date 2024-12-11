Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9836E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 17:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763AC10E3F2;
	Wed, 11 Dec 2024 17:02:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816B110E3F2;
 Wed, 11 Dec 2024 17:02:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5278995156937167604=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdirtyfb?=
 =?utf-8?q?=3A_Add_skip_condition_for_bmg_platform_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Dec 2024 17:02:57 -0000
Message-ID: <173393657752.1270341.7600349318496208258@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241113174118.158849-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113174118.158849-1-mohammed.thasleem@intel.com>
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

--===============5278995156937167604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dirtyfb: Add skip condition for bmg platform (rev2)
URL   : https://patchwork.freedesktop.org/series/141312/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8148_BAT -> XEIGTPW_12293_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8148 -> IGTPW_12293
  * Linux: xe-2351-03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b -> xe-2352-78bd7a249aa021c89d651d8dc7defcbff0295f68

  IGTPW_12293: 601b1c00e39d629fd6db73d6198ee5d919b3609b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8148: 5362e7ac965c3768c60848e266294a4c6172241c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2351-03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b: 03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b
  xe-2352-78bd7a249aa021c89d651d8dc7defcbff0295f68: 78bd7a249aa021c89d651d8dc7defcbff0295f68

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12293/index.html

--===============5278995156937167604==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dirtyfb: Add skip condition for bmg platform (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141312/">https://patchwork.freedesktop.org/series/141312/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12293/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12293/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8148_BAT -&gt; XEIGTPW_12293_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8148 -&gt; IGTPW_12293</li>
<li>Linux: xe-2351-03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b -&gt; xe-2352-78bd7a249aa021c89d651d8dc7defcbff0295f68</li>
</ul>
<p>IGTPW_12293: 601b1c00e39d629fd6db73d6198ee5d919b3609b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8148: 5362e7ac965c3768c60848e266294a4c6172241c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2351-03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b: 03abf2f5f12e0f13a3a28bf70ccf2d88ec2a707b<br />
  xe-2352-78bd7a249aa021c89d651d8dc7defcbff0295f68: 78bd7a249aa021c89d651d8dc7defcbff0295f68</p>

</body>
</html>

--===============5278995156937167604==--
