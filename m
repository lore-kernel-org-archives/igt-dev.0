Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117E3CA5FF5
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 23:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536FE10E27E;
	Mon,  5 Oct 2026 23:29:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B73210E27E;
 Mon,  5 Oct 2026 23:28:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2379497639974013690=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/xe=5Fpmu=3A_Do_not_?=
 =?utf-8?q?enable_VFs_in_unrelated_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Oct 2026 23:28:28 -0000
Message-ID: <179124290803.241880.12859856630405954032@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
In-Reply-To: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
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

--===============2379497639974013690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_pmu: Do not enable VFs in unrelated subtests
URL   : https://patchwork.freedesktop.org/series/175577/
State : success

== Summary ==

CI Bug Log - changes from IGT_9130 -> IGTPW_15942
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9130 -> IGTPW_15942
  * Linux: CI_DRM_19281 -> CI_DRM_19284

  CI-20190529: 20190529
  CI_DRM_19281: c1341b7b7cec27ca50f287ec497e41a8cc88f22b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19284: 8c3a206e2315b84f2d349b180c297a807d31b326 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15942: d940f78c96b6671a9a4100c003cb52304d064a6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9130: 9130

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/index.html

--===============2379497639974013690==
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
<tr><td><b>Series:</b></td><td>tests/xe_pmu: Do not enable VFs in unrelated subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175577/">https://patchwork.freedesktop.org/series/175577/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9130 -&gt; IGTPW_15942</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9130 -&gt; IGTPW_15942</li>
<li>Linux: CI_DRM_19281 -&gt; CI_DRM_19284</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19281: c1341b7b7cec27ca50f287ec497e41a8cc88f22b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19284: 8c3a206e2315b84f2d349b180c297a807d31b326 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15942: d940f78c96b6671a9a4100c003cb52304d064a6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9130: 9130</p>

</body>
</html>

--===============2379497639974013690==--
