Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834D0C5B552
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 21:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AD110E6CE;
	Tue,  3 Jun 2025 21:05:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9775A10E6CB;
 Tue,  3 Jun 2025 21:05:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5691429030553712521=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Ffault=5Fin?=
 =?utf-8?q?jection=3A_Ignore_*ERROR*_dmesg_reports?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Jun 2025 21:05:20 -0000
Message-ID: <174898472061.45422.17583332915896998745@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603161804.283350-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250603161804.283350-1-jonathan.cavitt@intel.com>
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

--===============5691429030553712521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Ignore *ERROR* dmesg reports
URL   : https://patchwork.freedesktop.org/series/149783/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8393_BAT -> XEIGTPW_13235_BAT
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

  * IGT: IGT_8393 -> IGTPW_13235

  IGTPW_13235: 653d9379eebef01deb4643554614452104efe948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3186-1a8dc5c25521273300f881e23c7294453b015048: 1a8dc5c25521273300f881e23c7294453b015048

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13235/index.html

--===============5691429030553712521==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Ignore *ERROR* dmesg reports</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149783/">https://patchwork.freedesktop.org/series/149783/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13235/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13235/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8393_BAT -&gt; XEIGTPW_13235_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8393 -&gt; IGTPW_13235</li>
</ul>
<p>IGTPW_13235: 653d9379eebef01deb4643554614452104efe948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3186-1a8dc5c25521273300f881e23c7294453b015048: 1a8dc5c25521273300f881e23c7294453b015048</p>

</body>
</html>

--===============5691429030553712521==--
