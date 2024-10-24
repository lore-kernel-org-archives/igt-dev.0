Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E13D1038E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 22:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF50510E3CF;
	Thu, 24 Oct 2024 22:47:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0295110E3CF;
 Thu, 24 Oct 2024 22:47:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6986817320257159508=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_Move_backlight_read=2C_write_?=
 =?utf-8?q?to_lib_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 24 Oct 2024 22:47:22 -0000
Message-ID: <172981004200.1328167.5091858062472075174@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
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

--===============6986817320257159508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Move backlight read, write to lib (rev4)
URL   : https://patchwork.freedesktop.org/series/140013/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8082_full -> XEIGTPW_11969_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8082_full and XEIGTPW_11969_full:

### New IGT tests (1) ###

  * igt@kms_hdr@brightness-with-hdr:
    - Statuses :
    - Exec time: [None] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8082 -> IGTPW_11969
  * Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-2109-cef44d6820e61ebf180bd771e78f162b4bae4a6f

  IGTPW_11969: b9f25761f2a3afdefe9893c10426cb796deca8dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
  xe-2109-cef44d6820e61ebf180bd771e78f162b4bae4a6f: cef44d6820e61ebf180bd771e78f162b4bae4a6f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11969/index.html

--===============6986817320257159508==
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
<tr><td><b>Series:</b></td><td>Move backlight read, write to lib (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140013/">https://patchwork.freedesktop.org/series/140013/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11969/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11969/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8082_full -&gt; XEIGTPW_11969_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8082_full and XEIGTPW_11969_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_hdr@brightness-with-hdr:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8082 -&gt; IGTPW_11969</li>
<li>Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -&gt; xe-2109-cef44d6820e61ebf180bd771e78f162b4bae4a6f</li>
</ul>
<p>IGTPW_11969: b9f25761f2a3afdefe9893c10426cb796deca8dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52<br />
  xe-2109-cef44d6820e61ebf180bd771e78f162b4bae4a6f: cef44d6820e61ebf180bd771e78f162b4bae4a6f</p>

</body>
</html>

--===============6986817320257159508==--
