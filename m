Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E591ECD6E57
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 11:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7906410E0F1;
	Thu,  4 Jun 2026 11:01:27 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C706C10E0F1;
 Thu,  4 Jun 2026 11:01:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1636769146856895002=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/xe=5Fdebugfs=3A_Add?=
 =?utf-8?q?_debugfs_entry_read/write_validation_in_root-dir?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jun 2026 11:01:04 -0000
Message-ID: <178057086480.43098.9487046130083247270@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604073740.332572-1-sobin.thomas@intel.com>
In-Reply-To: <20260604073740.332572-1-sobin.thomas@intel.com>
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

--===============1636769146856895002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_debugfs: Add debugfs entry read/write validation in root-dir
URL   : https://patchwork.freedesktop.org/series/167863/
State : success

== Summary ==

CI Bug Log - changes from IGT_8948 -> IGTPW_15302
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15302/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m fi-elk-e7500 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8948 -> IGTPW_15302

  CI-20190529: 20190529
  CI_DRM_18625: 70c7b363fab8198549bb9b82134bda0f6bda9452 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15302: 15302
  IGT_8948: 8948

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15302/index.html

--===============1636769146856895002==
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
<tr><td><b>Series:</b></td><td>tests/xe_debugfs: Add debugfs entry read/write validation in root-dir</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167863/">https://patchwork.freedesktop.org/series/167863/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15302/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15302/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8948 -&gt; IGTPW_15302</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15302/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m fi-elk-e7500 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8948 -&gt; IGTPW_15302</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18625: 70c7b363fab8198549bb9b82134bda0f6bda9452 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15302: 15302<br />
  IGT_8948: 8948</p>

</body>
</html>

--===============1636769146856895002==--
