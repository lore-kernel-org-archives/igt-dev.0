Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21B1C02199
	for <igt-dev@archiver.kernel.org>; Sat,  8 Feb 2025 00:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ACF10E17E;
	Sat,  8 Feb 2025 00:43:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D99D10E17E;
 Sat,  8 Feb 2025 00:42:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5967427568221463599=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Ffault=5Fin?=
 =?utf-8?q?jection=3A_Inject_errors_during_xe=5Fguc=5Fct=5Fsend=5Frecv=28=29?=
 =?utf-8?q?_xe=5Fguc=5Fmmio=5Fsend=5Frecv=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 08 Feb 2025 00:42:32 -0000
Message-ID: <173897535243.2937553.8467973275168541790@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
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

--===============5967427568221463599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Inject errors during xe_guc_ct_send_recv() xe_guc_mmio_send_recv()
URL   : https://patchwork.freedesktop.org/series/144466/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8227_BAT -> XEIGTPW_12560_BAT
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

  * IGT: IGT_8227 -> IGTPW_12560
  * Linux: xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7 -> xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085

  IGTPW_12560: 2d2ff211e8802b5c5e511fe55e713bd6a48c4ddc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8227: 8227
  xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7: e886a5edb53ade13f69b5809cbe03d7aa73885a7
  xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085: 4f934139887fd60bd4ac9027b7eec3e86ade8085

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12560/index.html

--===============5967427568221463599==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Inject errors during xe_guc_ct_send_recv() xe_guc_mmio_send_recv()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144466/">https://patchwork.freedesktop.org/series/144466/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12560/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12560/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8227_BAT -&gt; XEIGTPW_12560_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8227 -&gt; IGTPW_12560</li>
<li>Linux: xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7 -&gt; xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085</li>
</ul>
<p>IGTPW_12560: 2d2ff211e8802b5c5e511fe55e713bd6a48c4ddc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8227: 8227<br />
  xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7: e886a5edb53ade13f69b5809cbe03d7aa73885a7<br />
  xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085: 4f934139887fd60bd4ac9027b7eec3e86ade8085</p>

</body>
</html>

--===============5967427568221463599==--
