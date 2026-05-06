Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07842CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 22:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A18810EEE6;
	Wed,  6 May 2026 22:17:33 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E79F10EEE6;
 Wed,  6 May 2026 22:17:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5633673899845494365=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Fexec=5Fthreads?=
 =?utf-8?q?=3A_relax_data_check_in_multi-queue_hang_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 May 2026 22:17:18 -0000
Message-ID: <177810583824.45072.8299312710853902477@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260506205650.20503-1-x.wang@intel.com>
In-Reply-To: <20260506205650.20503-1-x.wang@intel.com>
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

--===============5633673899845494365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_threads: relax data check in multi-queue hang mode
URL   : https://patchwork.freedesktop.org/series/166081/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8894_BAT -> XEIGTPW_15118_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8894 -> IGTPW_15118
  * Linux: xe-4990-835de80ce9b34b618442ba91483170201b50b553 -> xe-5006-9d4d408c460848efac7cd10f041e7c0a12e7c584

  IGTPW_15118: 8a15f2d22b9c9c6a851c0692dbd793056acdd9e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8894: 044f2c8744a52317c4651b4ca9d3b12f5be51575 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4990-835de80ce9b34b618442ba91483170201b50b553: 835de80ce9b34b618442ba91483170201b50b553
  xe-5006-9d4d408c460848efac7cd10f041e7c0a12e7c584: 9d4d408c460848efac7cd10f041e7c0a12e7c584

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15118/index.html

--===============5633673899845494365==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_threads: relax data check in multi-queue hang mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166081/">https://patchwork.freedesktop.org/series/166081/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15118/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15118/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8894_BAT -&gt; XEIGTPW_15118_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8894 -&gt; IGTPW_15118</li>
<li>Linux: xe-4990-835de80ce9b34b618442ba91483170201b50b553 -&gt; xe-5006-9d4d408c460848efac7cd10f041e7c0a12e7c584</li>
</ul>
<p>IGTPW_15118: 8a15f2d22b9c9c6a851c0692dbd793056acdd9e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8894: 044f2c8744a52317c4651b4ca9d3b12f5be51575 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4990-835de80ce9b34b618442ba91483170201b50b553: 835de80ce9b34b618442ba91483170201b50b553<br />
  xe-5006-9d4d408c460848efac7cd10f041e7c0a12e7c584: 9d4d408c460848efac7cd10f041e7c0a12e7c584</p>

</body>
</html>

--===============5633673899845494365==--
