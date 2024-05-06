Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D43C25B4F
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 16:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B140510FF35;
	Mon,  6 May 2024 16:55:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3148B10FF35;
 Mon,  6 May 2024 16:55:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0213380898371790645=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Fccs=3A_Test_XRGB21?=
 =?utf-8?q?01010?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 06 May 2024 16:55:11 -0000
Message-ID: <171501451119.1941770.13387051830944282658@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506133748.30321-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240506133748.30321-1-ville.syrjala@linux.intel.com>
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

--===============0213380898371790645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_ccs: Test XRGB2101010
URL   : https://patchwork.freedesktop.org/series/133235/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7834_BAT -> XEIGTPW_11103_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7834 -> IGTPW_11103

  IGTPW_11103: 2f319edb85e92ec97149805753eafaccdbf31c7e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7834: 008178acd533c33910d41fefc80462b3915c89fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1240-a2e658aa302af6359a47b5758bce1c9018a068df: a2e658aa302af6359a47b5758bce1c9018a068df

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11103/index.html

--===============0213380898371790645==
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
<tr><td><b>Series:</b></td><td>tests/kms_ccs: Test XRGB2101010</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133235/">https://patchwork.freedesktop.org/series/133235/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11103/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11103/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7834_BAT -&gt; XEIGTPW_11103_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7834 -&gt; IGTPW_11103</li>
</ul>
<p>IGTPW_11103: 2f319edb85e92ec97149805753eafaccdbf31c7e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7834: 008178acd533c33910d41fefc80462b3915c89fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1240-a2e658aa302af6359a47b5758bce1c9018a068df: a2e658aa302af6359a47b5758bce1c9018a068df</p>

</body>
</html>

--===============0213380898371790645==--
