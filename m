Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB83C54FC6
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 04:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D8610E1F0;
	Mon,  2 Sep 2024 04:00:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB54910E1FD;
 Mon,  2 Sep 2024 04:00:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4614163478759006039=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amd=5Fqueue=5Freset=3A_a?=
 =?utf-8?q?dd_sdma_test_in_queue_reset_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Sep 2024 04:00:15 -0000
Message-ID: <172524961576.888264.9531761880973798217@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902033453.362229-1-jesse.zhang@amd.com>
In-Reply-To: <20240902033453.362229-1-jesse.zhang@amd.com>
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

--===============4614163478759006039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_queue_reset: add sdma test in queue reset (rev3)
URL   : https://patchwork.freedesktop.org/series/137948/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8000_BAT -> XEIGTPW_11672_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8000 -> IGTPW_11672
  * Linux: xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758 -> xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5

  IGTPW_11672: 11672
  IGT_8000: fba44baafa5d79b6eed52fa24234781e8e47beb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758: 876db6b8ef45d285316cc53b5cf44cbc39aa8758
  xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5: c689a348137cb6f8934a9be49438bafe413b97d5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11672/index.html

--===============4614163478759006039==
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
<tr><td><b>Series:</b></td><td>tests/amd_queue_reset: add sdma test in queue reset (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137948/">https://patchwork.freedesktop.org/series/137948/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11672/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11672/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8000_BAT -&gt; XEIGTPW_11672_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8000 -&gt; IGTPW_11672</li>
<li>Linux: xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758 -&gt; xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5</li>
</ul>
<p>IGTPW_11672: 11672<br />
  IGT_8000: fba44baafa5d79b6eed52fa24234781e8e47beb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758: 876db6b8ef45d285316cc53b5cf44cbc39aa8758<br />
  xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5: c689a348137cb6f8934a9be49438bafe413b97d5</p>

</body>
</html>

--===============4614163478759006039==--
