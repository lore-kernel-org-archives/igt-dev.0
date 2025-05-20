Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A940BC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 20:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F40110E5C5;
	Tue, 20 May 2025 20:26:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DBA10E5CD;
 Tue, 20 May 2025 20:26:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0344497361786087413=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Fpmu=3A_Ensure_co?=
 =?utf-8?q?nsistent_GPU_frequency_comparison?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 May 2025 20:26:47 -0000
Message-ID: <174777280706.6224.12146217463061850682@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520171641.2421623-1-sk.anirban@intel.com>
In-Reply-To: <20250520171641.2421623-1-sk.anirban@intel.com>
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

--===============0344497361786087413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_pmu: Ensure consistent GPU frequency comparison
URL   : https://patchwork.freedesktop.org/series/149273/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8371_BAT -> XEIGTPW_13153_BAT
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

  * IGT: IGT_8371 -> IGTPW_13153
  * Linux: xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320 -> xe-3116-45abc70af791052c25beeb400aece4dab51020cd

  IGTPW_13153: 13153
  IGT_8371: 8371
  xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320: 45c2c8c74ab88c8fb741ea8349b051f5aec87320
  xe-3116-45abc70af791052c25beeb400aece4dab51020cd: 45abc70af791052c25beeb400aece4dab51020cd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/index.html

--===============0344497361786087413==
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
<tr><td><b>Series:</b></td><td>tests/xe_pmu: Ensure consistent GPU frequency comparison</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149273/">https://patchwork.freedesktop.org/series/149273/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8371_BAT -&gt; XEIGTPW_13153_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8371 -&gt; IGTPW_13153</li>
<li>Linux: xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320 -&gt; xe-3116-45abc70af791052c25beeb400aece4dab51020cd</li>
</ul>
<p>IGTPW_13153: 13153<br />
  IGT_8371: 8371<br />
  xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320: 45c2c8c74ab88c8fb741ea8349b051f5aec87320<br />
  xe-3116-45abc70af791052c25beeb400aece4dab51020cd: 45abc70af791052c25beeb400aece4dab51020cd</p>

</body>
</html>

--===============0344497361786087413==--
