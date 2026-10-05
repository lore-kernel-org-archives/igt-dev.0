Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA48ACA5FF0
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 09:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5485D10E1E8;
	Mon,  5 Oct 2026 09:44:16 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85DD10E1E8;
 Mon,  5 Oct 2026 09:43:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6748253386378096481=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=3A_fix_mis?=
 =?utf-8?q?sing_resource_cleanup_in_several_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Oct 2026 09:43:31 -0000
Message-ID: <179119341168.239574.3291248125317751998@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005085943.3176069-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20261005085943.3176069-2-priyanka.dandamudi@intel.com>
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

--===============6748253386378096481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe: fix missing resource cleanup in several tests
URL   : https://patchwork.freedesktop.org/series/175548/
State : success

== Summary ==

CI Bug Log - changes from IGT_9127 -> IGTPW_15939
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15939/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9127 -> IGTPW_15939

  CI-20190529: 20190529
  CI_DRM_19279: b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15939: 2deeba2de081b32377c6b07462ad8317dcaf3e18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9127: 9127

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15939/index.html

--===============6748253386378096481==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe: fix missing resource cleanup in several tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175548/">https://patchwork.freedesktop.org/series/175548/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15939/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15939/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9127 -&gt; IGTPW_15939</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15939/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9127 -&gt; IGTPW_15939</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19279: b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15939: 2deeba2de081b32377c6b07462ad8317dcaf3e18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9127: 9127</p>

</body>
</html>

--===============6748253386378096481==--
