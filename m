Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3DACA5FA1
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 22:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A137C10E17B;
	Mon, 28 Sep 2026 22:36:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A5B10E17B;
 Mon, 28 Sep 2026 22:35:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2641775843965805737=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpmu=3A_F?=
 =?utf-8?q?ix_test_to_accept_single_VF_configs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 28 Sep 2026 22:35:46 -0000
Message-ID: <179063494628.215487.7969238061634523395@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260928185717.2846223-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260928185717.2846223-2-umesh.nerlige.ramappa@intel.com>
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

--===============2641775843965805737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pmu: Fix test to accept single VF configs
URL   : https://patchwork.freedesktop.org/series/175142/
State : success

== Summary ==

CI Bug Log - changes from IGT_9114 -> IGTPW_15912
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15912/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 fi-pnv-d510 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9114 -> IGTPW_15912

  CI-20190529: 20190529
  CI_DRM_19232: 972eeb850a4ca07aba05ccb805db28a33eab2c9a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15912: 15912
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15912/index.html

--===============2641775843965805737==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pmu: Fix test to accept single VF configs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175142/">https://patchwork.freedesktop.org/series/175142/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15912/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15912/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9114 -&gt; IGTPW_15912</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15912/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 fi-pnv-d510 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9114 -&gt; IGTPW_15912</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19232: 972eeb850a4ca07aba05ccb805db28a33eab2c9a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15912: 15912<br />
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2641775843965805737==--
