Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA57CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 07:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9556310E982;
	Tue, 23 Jun 2026 07:25:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6B010E982;
 Tue, 23 Jun 2026 07:24:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1544129649185739870=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel=3A_ensure_sta?=
 =?utf-8?q?ble_GT_C6_for_residency_measurement?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gajendra Uttamchand" <gajendra.uttamchand@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Jun 2026 07:24:57 -0000
Message-ID: <178219949757.104613.6269417534543372701@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623063559.223470-2-gajendra.uttamchand@intel.com>
In-Reply-To: <20260623063559.223470-2-gajendra.uttamchand@intel.com>
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

--===============1544129649185739870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: ensure stable GT C6 for residency measurement
URL   : https://patchwork.freedesktop.org/series/168981/
State : success

== Summary ==

CI Bug Log - changes from IGT_8979 -> IGTPW_15423
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15423/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8979 -> IGTPW_15423

  CI-20190529: 20190529
  CI_DRM_18708: 31db6ef05be63e0074fc93685e48101ce1b15cd8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15423: 15423
  IGT_8979: 8979

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15423/index.html

--===============1544129649185739870==
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
<tr><td><b>Series:</b></td><td>tests/intel: ensure stable GT C6 for residency measurement</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168981/">https://patchwork.freedesktop.org/series/168981/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15423/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15423/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8979 -&gt; IGTPW_15423</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15423/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8979 -&gt; IGTPW_15423</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18708: 31db6ef05be63e0074fc93685e48101ce1b15cd8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15423: 15423<br />
  IGT_8979: 8979</p>

</body>
</html>

--===============1544129649185739870==--
