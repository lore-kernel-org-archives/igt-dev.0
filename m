Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE00C02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 19:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3217510E16E;
	Wed,  5 Feb 2025 19:14:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDFD10E16E;
 Wed,  5 Feb 2025 19:13:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7261819253812237217=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fsriov=5Ffl?=
 =?utf-8?q?r=3A_Add_parallel_FLR_subtest_for_SR-IOV_VFs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Feb 2025 19:13:41 -0000
Message-ID: <173878282156.1588790.15126810254524758961@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205171819.2485976-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250205171819.2485976-1-marcin.bernatowicz@linux.intel.com>
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

--===============7261819253812237217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sriov_flr: Add parallel FLR subtest for SR-IOV VFs (rev4)
URL   : https://patchwork.freedesktop.org/series/142042/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8224_BAT -> XEIGTPW_12548_BAT
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

  * IGT: IGT_8224 -> IGTPW_12548
  * Linux: xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380 -> xe-2604-9831501a0c70f94565d0874560e61718edc3b8a4

  IGTPW_12548: 57bed37c12b70280013ab91f59901946a251454c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380: a7df3eccb725a8d72f8f3ed87ee7ad9419b17380
  xe-2604-9831501a0c70f94565d0874560e61718edc3b8a4: 9831501a0c70f94565d0874560e61718edc3b8a4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/index.html

--===============7261819253812237217==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sriov_flr: Add parallel FLR subtest for SR-IOV VFs (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142042/">https://patchwork.freedesktop.org/series/142042/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8224_BAT -&gt; XEIGTPW_12548_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8224 -&gt; IGTPW_12548</li>
<li>Linux: xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380 -&gt; xe-2604-9831501a0c70f94565d0874560e61718edc3b8a4</li>
</ul>
<p>IGTPW_12548: 57bed37c12b70280013ab91f59901946a251454c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380: a7df3eccb725a8d72f8f3ed87ee7ad9419b17380<br />
  xe-2604-9831501a0c70f94565d0874560e61718edc3b8a4: 9831501a0c70f94565d0874560e61718edc3b8a4</p>

</body>
</html>

--===============7261819253812237217==--
