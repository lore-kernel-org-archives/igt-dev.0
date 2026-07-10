Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F724C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 04:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEABA10E127;
	Fri, 10 Jul 2026 04:56:51 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B272810E127;
 Fri, 10 Jul 2026 04:56:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8582392711196639191=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_Add_lockd?=
 =?utf-8?q?ep_false_positive_reproducer_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jul 2026 04:56:22 -0000
Message-ID: <178365938272.172905.13501817472752246791@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260710032510.215808-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260710032510.215808-1-vitaly.prosyak@amd.com>
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

--===============8582392711196639191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Add lockdep false positive reproducer test
URL   : https://patchwork.freedesktop.org/series/170161/
State : success

== Summary ==

CI Bug Log - changes from IGT_8997 -> IGTPW_15508
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15508/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8997 -> IGTPW_15508
  * Linux: CI_DRM_18797 -> CI_DRM_18799

  CI-20190529: 20190529
  CI_DRM_18797: e5af800f48075d6b249b979cc8bf210c051d86aa @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18799: 40a9450db040664b837f21ae4aeb5f9faecf7cd7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15508: 763b22d907661eee181f2b36f0c2b0e4efe8d391 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8997: 8997

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15508/index.html

--===============8582392711196639191==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Add lockdep false positive reproducer test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170161/">https://patchwork.freedesktop.org/series/170161/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15508/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15508/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8997 -&gt; IGTPW_15508</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15508/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8997 -&gt; IGTPW_15508</li>
<li>Linux: CI_DRM_18797 -&gt; CI_DRM_18799</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18797: e5af800f48075d6b249b979cc8bf210c051d86aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18799: 40a9450db040664b837f21ae4aeb5f9faecf7cd7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15508: 763b22d907661eee181f2b36f0c2b0e4efe8d391 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8997: 8997</p>

</body>
</html>

--===============8582392711196639191==--
