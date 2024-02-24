Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F20C5478C
	for <igt-dev@archiver.kernel.org>; Sat, 24 Feb 2024 00:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40A410ECE7;
	Sat, 24 Feb 2024 00:02:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF3810ECE7;
 Sat, 24 Feb 2024 00:02:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0478426875942848018=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/xe=5Fspin=5Fbatch=3A_?=
 =?utf-8?q?Miscellaneous_preempter_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 24 Feb 2024 00:02:26 -0000
Message-ID: <170873294663.265260.236416129864802816@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
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

--===============0478426875942848018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_spin_batch: Miscellaneous preempter fixes
URL   : https://patchwork.freedesktop.org/series/130341/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14330 -> IGTPW_10731
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10731/index.html

Participating hosts (36 -> 33)
------------------------------

  Missing    (3): fi-glk-j4005 fi-cfl-8109u fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7729 -> IGTPW_10731

  CI-20190529: 20190529
  CI_DRM_14330: 7291e2e67dff0ff573900266382c9c9248a7dea5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10731: 10731
  IGT_7729: 7729

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10731/index.html

--===============0478426875942848018==
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
<tr><td><b>Series:</b></td><td>tests/xe_spin_batch: Miscellaneous preempter fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130341/">https://patchwork.freedesktop.org/series/130341/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10731/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10731/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14330 -&gt; IGTPW_10731</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10731/index.html</p>
<h2>Participating hosts (36 -&gt; 33)</h2>
<p>Missing    (3): fi-glk-j4005 fi-cfl-8109u fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7729 -&gt; IGTPW_10731</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14330: 7291e2e67dff0ff573900266382c9c9248a7dea5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10731: 10731<br />
  IGT_7729: 7729</p>

</body>
</html>

--===============0478426875942848018==--
