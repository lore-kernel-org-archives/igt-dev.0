Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06FDC5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 18:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E2810E141;
	Fri, 14 Aug 2026 18:57:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6B510E141;
 Fri, 14 Aug 2026 18:56:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0301951380618074106=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fplane=3A_Skip_C?=
 =?utf-8?q?RC_frame_sequence_check_on_MediaTek?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason-JH Lin" <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 14 Aug 2026 18:56:39 -0000
Message-ID: <178673379949.54464.16983590138115480665@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814172940.3190510-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260814172940.3190510-1-jason-jh.lin@mediatek.com>
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

--===============0301951380618074106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Skip CRC frame sequence check on MediaTek
URL   : https://patchwork.freedesktop.org/series/172241/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9057_BAT -> XEIGTPW_15685_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9057 -> IGTPW_15685

  IGTPW_15685: 55c4949b69f0dec52e7d20ed7a2b2c57042bf6ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9057: 8f7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5599-9832bc7a458a4a67e68dcf96927588859c1994f3: 9832bc7a458a4a67e68dcf96927588859c1994f3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15685/index.html

--===============0301951380618074106==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Skip CRC frame sequence check on MediaTek</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172241/">https://patchwork.freedesktop.org/series/172241/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15685/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15685/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9057_BAT -&gt; XEIGTPW_15685_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9057 -&gt; IGTPW_15685</li>
</ul>
<p>IGTPW_15685: 55c4949b69f0dec52e7d20ed7a2b2c57042bf6ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9057: 8f7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5599-9832bc7a458a4a67e68dcf96927588859c1994f3: 9832bc7a458a4a67e68dcf96927588859c1994f3</p>

</body>
</html>

--===============0301951380618074106==--
