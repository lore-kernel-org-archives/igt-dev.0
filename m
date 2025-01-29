Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7F3C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 06:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E698110E03A;
	Wed, 29 Jan 2025 06:13:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8570410E03A;
 Wed, 29 Jan 2025 06:13:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6132542941705043049=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fwriteback=3A_Ad?=
 =?utf-8?q?d_clone_mode_subtest_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 29 Jan 2025 06:13:19 -0000
Message-ID: <173813119953.2231291.7232705470034617957@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
In-Reply-To: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
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

--===============6132542941705043049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_writeback: Add clone mode subtest (rev7)
URL   : https://patchwork.freedesktop.org/series/137933/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8214_BAT -> XEIGTPW_12511_BAT
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

  * IGT: IGT_8214 -> IGTPW_12511

  IGTPW_12511: 12511
  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79: 486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12511/index.html

--===============6132542941705043049==
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
<tr><td><b>Series:</b></td><td>tests/kms_writeback: Add clone mode subtest (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137933/">https://patchwork.freedesktop.org/series/137933/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12511/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12511/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8214_BAT -&gt; XEIGTPW_12511_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8214 -&gt; IGTPW_12511</li>
</ul>
<p>IGTPW_12511: 12511<br />
  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79: 486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79</p>

</body>
</html>

--===============6132542941705043049==--
