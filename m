Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88167C0219B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 07:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B38410E4C1;
	Mon, 10 Feb 2025 07:53:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3B310E4C1;
 Mon, 10 Feb 2025 07:53:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8693855865683235062=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fdisplay=5Fmodes?=
 =?utf-8?q?=3A_Require_minimum_2_outputs_for_extended_mode_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 10 Feb 2025 07:53:32 -0000
Message-ID: <173917401230.175167.3987283439689715628@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210053551.1228000-1-jeevan.b@intel.com>
In-Reply-To: <20250210053551.1228000-1-jeevan.b@intel.com>
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

--===============8693855865683235062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_display_modes: Require minimum 2 outputs for extended mode test
URL   : https://patchwork.freedesktop.org/series/144569/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8227_BAT -> XEIGTPW_12566_BAT
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

  * IGT: IGT_8227 -> IGTPW_12566
  * Linux: xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7 -> xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe

  IGTPW_12566: 12566
  IGT_8227: 8227
  xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7: e886a5edb53ade13f69b5809cbe03d7aa73885a7
  xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe: 24a5696cb262c7829956cc708c7fc715fefc92fe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12566/index.html

--===============8693855865683235062==
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
<tr><td><b>Series:</b></td><td>tests/kms_display_modes: Require minimum 2 outputs for extended mode test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144569/">https://patchwork.freedesktop.org/series/144569/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12566/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12566/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8227_BAT -&gt; XEIGTPW_12566_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8227 -&gt; IGTPW_12566</li>
<li>Linux: xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7 -&gt; xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe</li>
</ul>
<p>IGTPW_12566: 12566<br />
  IGT_8227: 8227<br />
  xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7: e886a5edb53ade13f69b5809cbe03d7aa73885a7<br />
  xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe: 24a5696cb262c7829956cc708c7fc715fefc92fe</p>

</body>
</html>

--===============8693855865683235062==--
