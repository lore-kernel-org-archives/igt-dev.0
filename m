Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B3CC83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 13:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A63C10E80F;
	Thu, 17 Jul 2025 13:56:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C9C10E049;
 Thu, 17 Jul 2025 13:56:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3729525174061776004=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Validate_VF_accesses_to_VRA?=
 =?utf-8?q?M_via_BAR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 17 Jul 2025 13:56:28 -0000
Message-ID: <175276058801.169458.3357667170765225422@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250717090812.28628-1-lukasz.laguna@intel.com>
In-Reply-To: <20250717090812.28628-1-lukasz.laguna@intel.com>
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

--===============3729525174061776004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Validate VF accesses to VRAM via BAR
URL   : https://patchwork.freedesktop.org/series/151749/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8463_BAT -> XEIGTPW_13490_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8463 -> IGTPW_13490

  IGTPW_13490: 805d41a0659c90488f137596c82b92b8b4336882 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8463: 348dbef0314ccb588cbe83492444afc215965982 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f: 32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13490/index.html

--===============3729525174061776004==
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
<tr><td><b>Series:</b></td><td>Validate VF accesses to VRAM via BAR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151749/">https://patchwork.freedesktop.org/series/151749/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13490/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13490/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8463_BAT -&gt; XEIGTPW_13490_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8463 -&gt; IGTPW_13490</li>
</ul>
<p>IGTPW_13490: 805d41a0659c90488f137596c82b92b8b4336882 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8463: 348dbef0314ccb588cbe83492444afc215965982 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3430-32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f: 32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f</p>

</body>
</html>

--===============3729525174061776004==--
