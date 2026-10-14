Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F277ECC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 06:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E37C10E3F5;
	Wed, 14 Oct 2026 06:22:56 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7668110E04B;
 Wed, 14 Oct 2026 06:22:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8752321763272828173=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_igt=5Frunner_hang_and_r?=
 =?utf-8?q?esource_leak_associated_with_pw-reserve_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Oct 2026 06:22:09 -0000
Message-ID: <179195892947.22107.5564269818052868083@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
In-Reply-To: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
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

--===============8752321763272828173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix igt_runner hang and resource leak associated with pw-reserve (rev2)
URL   : https://patchwork.freedesktop.org/series/175697/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9144_BAT -> XEIGTPW_15983_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9144 -> IGTPW_15983
  * Linux: xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d -> xe-5943-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6

  IGTPW_15983: 180fedff8aa854449d724487865a29f7ea3c13f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9144: aada5ae74aa135d2b448e25ec417f4f0dee9439c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d: 83b6bc1390606facc1c0426727905f9fcd75836d
  xe-5943-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15983/index.html

--===============8752321763272828173==
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
<tr><td><b>Series:</b></td><td>Fix igt_runner hang and resource leak associated with pw-reserve (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175697/">https://patchwork.freedesktop.org/series/175697/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15983/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15983/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9144_BAT -&gt; XEIGTPW_15983_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9144 -&gt; IGTPW_15983</li>
<li>Linux: xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d -&gt; xe-5943-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6</li>
</ul>
<p>IGTPW_15983: 180fedff8aa854449d724487865a29f7ea3c13f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9144: aada5ae74aa135d2b448e25ec417f4f0dee9439c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d: 83b6bc1390606facc1c0426727905f9fcd75836d<br />
  xe-5943-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6</p>

</body>
</html>

--===============8752321763272828173==--
