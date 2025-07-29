Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0567C87FC9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 06:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7767B10E5D2;
	Tue, 29 Jul 2025 06:50:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39CA10E1D1;
 Tue, 29 Jul 2025 06:50:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7487010218891731655=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Fvm=3A_Report_OOM?=
 =?utf-8?q?_for_vm=5Fbind_ioctl_under_memory_pressure_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 29 Jul 2025 06:50:16 -0000
Message-ID: <175377181692.195954.3674474921185493407@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729051622.3322969-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20250729051622.3322969-1-priyanka.dandamudi@intel.com>
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

--===============7487010218891731655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_vm: Report OOM for vm_bind ioctl under memory pressure (rev3)
URL   : https://patchwork.freedesktop.org/series/151704/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8477_BAT -> XEIGTPW_13532_BAT
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

  * IGT: IGT_8477 -> IGTPW_13532
  * Linux: xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09 -> xe-3481-91d0354204f2eb9c627499de521b4469330408b9

  IGTPW_13532: 13532
  IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09: 51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09
  xe-3481-91d0354204f2eb9c627499de521b4469330408b9: 91d0354204f2eb9c627499de521b4469330408b9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13532/index.html

--===============7487010218891731655==
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
<tr><td><b>Series:</b></td><td>tests/xe_vm: Report OOM for vm_bind ioctl under memory pressure (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151704/">https://patchwork.freedesktop.org/series/151704/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13532/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13532/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8477_BAT -&gt; XEIGTPW_13532_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8477 -&gt; IGTPW_13532</li>
<li>Linux: xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09 -&gt; xe-3481-91d0354204f2eb9c627499de521b4469330408b9</li>
</ul>
<p>IGTPW_13532: 13532<br />
  IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09: 51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09<br />
  xe-3481-91d0354204f2eb9c627499de521b4469330408b9: 91d0354204f2eb9c627499de521b4469330408b9</p>

</body>
</html>

--===============7487010218891731655==--
