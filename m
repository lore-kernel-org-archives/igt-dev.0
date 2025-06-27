Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B66CC7EE31
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 03:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82D610E935;
	Fri, 27 Jun 2025 03:38:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95A010E935;
 Fri, 27 Jun 2025 03:38:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1858578614708731853=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fdma=5Fbuf?=
 =?utf-8?q?=5Fsync=2Ec=3A_Ensure_spinner_completion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Jun 2025 03:38:41 -0000
Message-ID: <175099552188.114422.6455412837267417120@1538d3639d33>
X-Patchwork-Hint: ignore
References: <a2c1172f61589220cb2ee5a5ece02bb3f9f722d3.1750963929.git.jagmeet.randhawa@intel.com>
In-Reply-To: <a2c1172f61589220cb2ee5a5ece02bb3f9f722d3.1750963929.git.jagmeet.randhawa@intel.com>
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

--===============1858578614708731853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_dma_buf_sync.c: Ensure spinner completion
URL   : https://patchwork.freedesktop.org/series/150837/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8430_BAT -> XEIGTPW_13361_BAT
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

  * IGT: IGT_8430 -> IGTPW_13361
  * Linux: xe-3317-98f015a92833e2d04fda89e1657a13d7290403e8 -> xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8

  IGTPW_13361: 13361
  IGT_8430: 4351ec818f4bd363ad0594a008d11ba3963e1f05 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3317-98f015a92833e2d04fda89e1657a13d7290403e8: 98f015a92833e2d04fda89e1657a13d7290403e8
  xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8: 0097539331ac0b7f5f0633992d34a8149f7246e8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13361/index.html

--===============1858578614708731853==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_dma_buf_sync.c: Ensure spinner completion</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150837/">https://patchwork.freedesktop.org/series/150837/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13361/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13361/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8430_BAT -&gt; XEIGTPW_13361_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8430 -&gt; IGTPW_13361</li>
<li>Linux: xe-3317-98f015a92833e2d04fda89e1657a13d7290403e8 -&gt; xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8</li>
</ul>
<p>IGTPW_13361: 13361<br />
  IGT_8430: 4351ec818f4bd363ad0594a008d11ba3963e1f05 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3317-98f015a92833e2d04fda89e1657a13d7290403e8: 98f015a92833e2d04fda89e1657a13d7290403e8<br />
  xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8: 0097539331ac0b7f5f0633992d34a8149f7246e8</p>

</body>
</html>

--===============1858578614708731853==--
