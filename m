Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B77FC43602
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 12:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A8910ECAE;
	Tue,  7 Jul 2026 12:23:32 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D526010E4BD;
 Tue,  7 Jul 2026 12:23:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1067321190522475823=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpm=5Fdc?=
 =?utf-8?q?=3A_Add_test_to_validate_YUV420_with_DC3CO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Jul 2026 12:23:00 -0000
Message-ID: <178342698086.158539.12489437584364874078@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707052028.4022700-1-jeevan.b@intel.com>
In-Reply-To: <20260707052028.4022700-1-jeevan.b@intel.com>
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

--===============1067321190522475823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Add test to validate YUV420 with DC3CO
URL   : https://patchwork.freedesktop.org/series/169908/
State : success

== Summary ==

CI Bug Log - changes from IGT_8991 -> IGTPW_15479
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15479/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8991 -> IGTPW_15479
  * Linux: CI_DRM_18772 -> CI_DRM_18774

  CI-20190529: 20190529
  CI_DRM_18772: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18774: 96e9ac36699d58791b67aea5e1d258074ea63165 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15479: 15479
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15479/index.html

--===============1067321190522475823==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Add test to validate YUV420 with DC3CO</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169908/">https://patchwork.freedesktop.org/series/169908/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15479/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15479/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8991 -&gt; IGTPW_15479</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15479/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8991 -&gt; IGTPW_15479</li>
<li>Linux: CI_DRM_18772 -&gt; CI_DRM_18774</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18772: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18774: 96e9ac36699d58791b67aea5e1d258074ea63165 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15479: 15479<br />
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1067321190522475823==--
