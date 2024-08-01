Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9E3C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 14:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387F610E99B;
	Thu,  1 Aug 2024 14:46:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0546C10E99A;
 Thu,  1 Aug 2024 14:46:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0508036875506239835=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fcreate=3A_?=
 =?utf-8?q?Remove_the_elapsed_time_validation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Aug 2024 14:46:04 -0000
Message-ID: <172252356401.488231.5479489370626607742@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801123312.1539769-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240801123312.1539769-1-balasubramani.vivekanandan@intel.com>
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

--===============0508036875506239835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_create: Remove the elapsed time validation
URL   : https://patchwork.freedesktop.org/series/136799/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15168 -> IGTPW_11515
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-11 fi-snb-2520m fi-bsw-n3050 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7950 -> IGTPW_11515

  CI-20190529: 20190529
  CI_DRM_15168: e6b1e3660d0168d9860e7cef487aba2bc21611bd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11515: 11515
  IGT_7950: 7950

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/index.html

--===============0508036875506239835==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_create: Remove the elapsed time validation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136799/">https://patchwork.freedesktop.org/series/136799/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15168 -&gt; IGTPW_11515</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-11 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7950 -&gt; IGTPW_11515</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15168: e6b1e3660d0168d9860e7cef487aba2bc21611bd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11515: 11515<br />
  IGT_7950: 7950</p>

</body>
</html>

--===============0508036875506239835==--
