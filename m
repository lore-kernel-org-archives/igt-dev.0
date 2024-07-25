Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062D0C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 13:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2210E7F6;
	Thu, 25 Jul 2024 13:38:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9F010E7F6;
 Thu, 25 Jul 2024 13:38:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7533268775716437317=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_benchmarks/gem=5Fwsim=3A_suppo?=
 =?utf-8?q?rt_gens_without_relocations_and_mmap_fix_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 25 Jul 2024 13:38:16 -0000
Message-ID: <172191469631.381723.10946587175744517191@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725122612.1290090-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240725122612.1290090-1-marcin.bernatowicz@linux.intel.com>
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

--===============7533268775716437317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: benchmarks/gem_wsim: support gens without relocations and mmap fix (rev2)
URL   : https://patchwork.freedesktop.org/series/127840/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7937_BAT -> XEIGTPW_11458_BAT
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

  * IGT: IGT_7937 -> IGTPW_11458
  * Linux: xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2 -> xe-1666-e8874cead8c9d93afcd62d5dc7aaf3f28a64c60f

  IGTPW_11458: 214f86eddcf78ead49c8e429510f37d9d0fa0090 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2
  xe-1666-e8874cead8c9d93afcd62d5dc7aaf3f28a64c60f: e8874cead8c9d93afcd62d5dc7aaf3f28a64c60f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11458/index.html

--===============7533268775716437317==
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
<tr><td><b>Series:</b></td><td>benchmarks/gem_wsim: support gens without relocations and mmap fix (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127840/">https://patchwork.freedesktop.org/series/127840/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11458/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11458/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7937_BAT -&gt; XEIGTPW_11458_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7937 -&gt; IGTPW_11458</li>
<li>Linux: xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2 -&gt; xe-1666-e8874cead8c9d93afcd62d5dc7aaf3f28a64c60f</li>
</ul>
<p>IGTPW_11458: 214f86eddcf78ead49c8e429510f37d9d0fa0090 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2<br />
  xe-1666-e8874cead8c9d93afcd62d5dc7aaf3f28a64c60f: e8874cead8c9d93afcd62d5dc7aaf3f28a64c60f</p>

</body>
</html>

--===============7533268775716437317==--
