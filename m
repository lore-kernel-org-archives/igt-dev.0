Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F4AC5DF71
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 07:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9594510ECF9;
	Tue,  2 Jun 2026 07:48:11 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D28910ECF7;
 Tue,  2 Jun 2026 07:47:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0698530602787366520=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_kms=5Fcursor=5Flegacy=3A_av?=
 =?utf-8?q?oid_AMD_Panel_Replay_interference?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ray Wu" <ray.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Jun 2026 07:47:50 -0000
Message-ID: <178038647057.34290.17679896866186620652@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602064543.58586-1-ray.wu@amd.com>
In-Reply-To: <20260602064543.58586-1-ray.wu@amd.com>
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

--===============0698530602787366520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_cursor_legacy: avoid AMD Panel Replay interference
URL   : https://patchwork.freedesktop.org/series/167713/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8945_BAT -> XEIGTPW_15282_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15282_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-ptl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8945/bat-ptl-1/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15282/bat-ptl-1/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8945 -> IGTPW_15282

  IGTPW_15282: 15282
  IGT_8945: d34395a7ede75d0b83edac965e27c0512bc0fe6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5177-a980196655477a8f5067112946401fe52e510664: a980196655477a8f5067112946401fe52e510664

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15282/index.html

--===============0698530602787366520==
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
<tr><td><b>Series:</b></td><td>kms_cursor_legacy: avoid AMD Panel Replay interference</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167713/">https://patchwork.freedesktop.org/series/167713/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15282/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15282/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8945_BAT -&gt; XEIGTPW_15282_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15282_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8945/bat-ptl-1/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15282/bat-ptl-1/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8945 -&gt; IGTPW_15282</li>
</ul>
<p>IGTPW_15282: 15282<br />
  IGT_8945: d34395a7ede75d0b83edac965e27c0512bc0fe6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5177-a980196655477a8f5067112946401fe52e510664: a980196655477a8f5067112946401fe52e510664</p>

</body>
</html>

--===============0698530602787366520==--
