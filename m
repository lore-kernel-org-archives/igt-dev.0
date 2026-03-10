Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD799FD2D62
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 12:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBCE10E6FD;
	Tue, 10 Mar 2026 12:00:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5508910E27F;
 Tue, 10 Mar 2026 12:00:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3075203676233804810=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/chamelium/audio=3A_Fi?=
 =?utf-8?q?x_resource_leaks_in_audio_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Bilal" <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Mar 2026 12:00:35 -0000
Message-ID: <177314403526.337956.15216805534642844297@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260310091956.3171295-1-mohammed.bilal@intel.com>
In-Reply-To: <20260310091956.3171295-1-mohammed.bilal@intel.com>
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

--===============3075203676233804810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/chamelium/audio: Fix resource leaks in audio tests (rev3)
URL   : https://patchwork.freedesktop.org/series/162565/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8789_BAT -> XEIGTPW_14713_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8789 -> IGTPW_14713

  IGTPW_14713: 6e767c0d1d76325aa6cf5eb6e02092905745637a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8789: 8789
  xe-4686-77e176657e782bb81270c230d1cfec91f7707162: 77e176657e782bb81270c230d1cfec91f7707162

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14713/index.html

--===============3075203676233804810==
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
<tr><td><b>Series:</b></td><td>tests/chamelium/audio: Fix resource leaks in audio tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162565/">https://patchwork.freedesktop.org/series/162565/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14713/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14713/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8789_BAT -&gt; XEIGTPW_14713_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8789 -&gt; IGTPW_14713</li>
</ul>
<p>IGTPW_14713: 6e767c0d1d76325aa6cf5eb6e02092905745637a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8789: 8789<br />
  xe-4686-77e176657e782bb81270c230d1cfec91f7707162: 77e176657e782bb81270c230d1cfec91f7707162</p>

</body>
</html>

--===============3075203676233804810==--
