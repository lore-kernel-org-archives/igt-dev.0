Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E732C44512
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 21:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAAB10F3E6;
	Thu, 16 Jul 2026 21:44:52 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B88510F3E6;
 Thu, 16 Jul 2026 21:44:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4838171434366250768=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fm?=
 =?utf-8?q?ulti=5Fqueue=3A_Check_PXP_is_rejected_on_multi-queue_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jul 2026 21:44:21 -0000
Message-ID: <178423826162.199043.2975860523139025023@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <82d8609cce6a2e22be972e9e917011b90c5e6f43.1784234143.git.jagmeet.randhawa@intel.com>
In-Reply-To: <82d8609cce6a2e22be972e9e917011b90c5e6f43.1784234143.git.jagmeet.randhawa@intel.com>
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

--===============4838171434366250768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_multi_queue: Check PXP is rejected on multi-queue (rev3)
URL   : https://patchwork.freedesktop.org/series/170148/
State : success

== Summary ==

CI Bug Log - changes from IGT_9010 -> IGTPW_15545
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15545/index.html

Participating hosts (42 -> 38)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9010 -> IGTPW_15545
  * Linux: CI_DRM_18836 -> CI_DRM_18837

  CI-20190529: 20190529
  CI_DRM_18836: 7fb776db50ccd72e7625c246c42157fa35274a24 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18837: 0fcee361fa4cf13207af78b95e71bbbaeb046319 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15545: 15545
  IGT_9010: 17413fe8bc1c3c9418d3d2359fc16531927ab42e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15545/index.html

--===============4838171434366250768==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_multi_queue: Check PXP is rejected on multi-queue (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170148/">https://patchwork.freedesktop.org/series/170148/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15545/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15545/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9010 -&gt; IGTPW_15545</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15545/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9010 -&gt; IGTPW_15545</li>
<li>Linux: CI_DRM_18836 -&gt; CI_DRM_18837</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18836: 7fb776db50ccd72e7625c246c42157fa35274a24 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18837: 0fcee361fa4cf13207af78b95e71bbbaeb046319 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15545: 15545<br />
  IGT_9010: 17413fe8bc1c3c9418d3d2359fc16531927ab42e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4838171434366250768==--
