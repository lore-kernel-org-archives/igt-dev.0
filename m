Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55819FF886F
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 03:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0636C10E0C8;
	Wed, 29 Apr 2026 03:16:42 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4A510E0C8;
 Wed, 29 Apr 2026 03:16:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3554514424995562881=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fmul?=
 =?utf-8?q?ti=5Fqueue=3A_Replace_sleep_with_deterministic_wait?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 29 Apr 2026 03:16:27 -0000
Message-ID: <177743258795.23496.2775902818488815118@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
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

--===============3554514424995562881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_multi_queue: Replace sleep with deterministic wait
URL   : https://patchwork.freedesktop.org/series/165673/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8877_BAT -> XEIGTPW_15078_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8877 -> IGTPW_15078
  * Linux: xe-4947-41542c1ef015c1907cd9a9785c8c2453f4fa2877 -> xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a

  IGTPW_15078: dc51a2f859cf0dae0498243600cc4bc75c957376 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8877: 1749e432cd72ef2c99f1b4e9d6f24411f1161901 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4947-41542c1ef015c1907cd9a9785c8c2453f4fa2877: 41542c1ef015c1907cd9a9785c8c2453f4fa2877
  xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a: a53aafc879e9c52b2776089762591d2766a27f0a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15078/index.html

--===============3554514424995562881==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_multi_queue: Replace sleep with deterministic wait</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165673/">https://patchwork.freedesktop.org/series/165673/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15078/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15078/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8877_BAT -&gt; XEIGTPW_15078_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8877 -&gt; IGTPW_15078</li>
<li>Linux: xe-4947-41542c1ef015c1907cd9a9785c8c2453f4fa2877 -&gt; xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a</li>
</ul>
<p>IGTPW_15078: dc51a2f859cf0dae0498243600cc4bc75c957376 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8877: 1749e432cd72ef2c99f1b4e9d6f24411f1161901 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4947-41542c1ef015c1907cd9a9785c8c2453f4fa2877: 41542c1ef015c1907cd9a9785c8c2453f4fa2877<br />
  xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a: a53aafc879e9c52b2776089762591d2766a27f0a</p>

</body>
</html>

--===============3554514424995562881==--
