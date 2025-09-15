Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212BFCAC592
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 21:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC8110E368;
	Mon, 15 Sep 2025 21:43:20 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F166E10E368;
 Mon, 15 Sep 2025 21:43:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0508342257545525322=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_pat-index-madvise?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: pravalika.gurram@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 15 Sep 2025 21:43:19 -0000
Message-ID: <175797259998.335794.70983124022432621@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250915105057.1468276-1-pravalika.gurram@intel.com>
In-Reply-To: <20250915105057.1468276-1-pravalika.gurram@intel.com>
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

--===============0508342257545525322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add pat-index-madvise
URL   : https://patchwork.freedesktop.org/series/154523/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8540_BAT -> XEIGTPW_13746_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8540 -> IGTPW_13746
  * Linux: xe-3757-325312db02a25e7cc1302ca9ea520007adc05aba -> xe-3765-4b2a554c1553f8de414acede44c326055ae2833c

  IGTPW_13746: 6b2d858a23f58c4cea3908f60659415c4a15546a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8540: 8540
  xe-3757-325312db02a25e7cc1302ca9ea520007adc05aba: 325312db02a25e7cc1302ca9ea520007adc05aba
  xe-3765-4b2a554c1553f8de414acede44c326055ae2833c: 4b2a554c1553f8de414acede44c326055ae2833c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13746/index.html

--===============0508342257545525322==
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
<tr><td><b>Series:</b></td><td>Add pat-index-madvise</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154523/">https://patchwork.freedesktop.org/series/154523/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13746/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13746/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8540_BAT -&gt; XEIGTPW_13746_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8540 -&gt; IGTPW_13746</li>
<li>Linux: xe-3757-325312db02a25e7cc1302ca9ea520007adc05aba -&gt; xe-3765-4b2a554c1553f8de414acede44c326055ae2833c</li>
</ul>
<p>IGTPW_13746: 6b2d858a23f58c4cea3908f60659415c4a15546a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8540: 8540<br />
  xe-3757-325312db02a25e7cc1302ca9ea520007adc05aba: 325312db02a25e7cc1302ca9ea520007adc05aba<br />
  xe-3765-4b2a554c1553f8de414acede44c326055ae2833c: 4b2a554c1553f8de414acede44c326055ae2833c</p>

</body>
</html>

--===============0508342257545525322==--
