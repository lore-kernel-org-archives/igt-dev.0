Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61373C44520
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108A710E435;
	Fri, 17 Jul 2026 12:01:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF4710E43D;
 Fri, 17 Jul 2026 12:01:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8909322364496170239=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Feld=3A_Poll_for_a?=
 =?utf-8?q?sync_HDA_codec_probe_in_eld=5Fis=5Fsupported=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jul 2026 12:01:12 -0000
Message-ID: <178428967244.200513.1352377749630558395@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260717095110.4193078-1-uma.shankar@intel.com>
In-Reply-To: <20260717095110.4193078-1-uma.shankar@intel.com>
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

--===============8909322364496170239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_eld: Poll for async HDA codec probe in eld_is_supported()
URL   : https://patchwork.freedesktop.org/series/170629/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9012_BAT -> XEIGTPW_15553_BAT
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

  * IGT: IGT_9012 -> IGTPW_15553

  IGTPW_15553: 15553
  IGT_9012: d94a55886c7eec82a791728d3cc1c4a6aa945281 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5424-22852552aa1b7198931842ddf824af4dd09e2814: 22852552aa1b7198931842ddf824af4dd09e2814

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15553/index.html

--===============8909322364496170239==
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
<tr><td><b>Series:</b></td><td>lib/igt_eld: Poll for async HDA codec probe in eld_is_supported()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170629/">https://patchwork.freedesktop.org/series/170629/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15553/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15553/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9012_BAT -&gt; XEIGTPW_15553_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9012 -&gt; IGTPW_15553</li>
</ul>
<p>IGTPW_15553: 15553<br />
  IGT_9012: d94a55886c7eec82a791728d3cc1c4a6aa945281 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5424-22852552aa1b7198931842ddf824af4dd09e2814: 22852552aa1b7198931842ddf824af4dd09e2814</p>

</body>
</html>

--===============8909322364496170239==--
