Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7503C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F7410E7EB;
	Tue, 28 Jul 2026 07:29:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBE610E7EA;
 Tue, 28 Jul 2026 07:28:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2854399378844267062=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fdebugfs?=
 =?utf-8?q?=3A_add_GT-level_debugfs_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Smitha Balasubramanyam" <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jul 2026 07:28:52 -0000
Message-ID: <178522373250.229879.13930546754366765609@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260728061730.1296399-1-smitha.balasubramanyam@intel.com>
In-Reply-To: <20260728061730.1296399-1-smitha.balasubramanyam@intel.com>
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

--===============2854399378844267062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_debugfs: add GT-level debugfs coverage
URL   : https://patchwork.freedesktop.org/series/171149/
State : success

== Summary ==

CI Bug Log - changes from IGT_9027 -> IGTPW_15598
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15598/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9027 -> IGTPW_15598
  * Linux: CI_DRM_18902 -> CI_DRM_18909

  CI-20190529: 20190529
  CI_DRM_18902: 3cbfb56ee0481aaabc9369045a4b120a20dfccc4 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18909: 28e3f47d47a61b5e28e7566944479e9c9715d41d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15598: 15598
  IGT_9027: 9027

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15598/index.html

--===============2854399378844267062==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_debugfs: add GT-level debugfs coverage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171149/">https://patchwork.freedesktop.org/series/171149/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15598/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15598/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9027 -&gt; IGTPW_15598</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15598/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9027 -&gt; IGTPW_15598</li>
<li>Linux: CI_DRM_18902 -&gt; CI_DRM_18909</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18902: 3cbfb56ee0481aaabc9369045a4b120a20dfccc4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18909: 28e3f47d47a61b5e28e7566944479e9c9715d41d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15598: 15598<br />
  IGT_9027: 9027</p>

</body>
</html>

--===============2854399378844267062==--
