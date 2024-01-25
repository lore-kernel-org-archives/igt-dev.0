Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D393C48260
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 17:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46A110E2ED;
	Thu, 25 Jan 2024 17:46:53 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E06C10E2ED;
 Thu, 25 Jan 2024 17:46:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7982659951812882140=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib/kunit=3A_Support_writab?=
 =?utf-8?q?le_filter*_parameters_of_kunit_module?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Thu, 25 Jan 2024 17:46:52 -0000
Message-ID: <170620481225.727567.17081000367317950821@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============7982659951812882140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kunit: Support writable filter* parameters of kunit module
URL   : https://patchwork.freedesktop.org/series/129174/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14179 -> IGTPW_10590
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10590/index.html

Participating hosts (37 -> 33)
------------------------------

  Missing    (4): bat-dg2-8 bat-rpls-2 fi-snb-2520m fi-pnv-d510 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7692 -> IGTPW_10590

  CI-20190529: 20190529
  CI_DRM_14179: 38a58d4231067e1b548c12ee521b73ffc0ebb73a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10590: 10590
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_pm@d3-mmap-system
-igt@xe_pm@d3-mmap-vram

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10590/index.html

--===============7982659951812882140==
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
<tr><td><b>Series:</b></td><td>lib/kunit: Support writable filter* parameters of kunit module</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129174/">https://patchwork.freedesktop.org/series/129174/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10590/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10590/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14179 -&gt; IGTPW_10590</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10590/index.html</p>
<h2>Participating hosts (37 -&gt; 33)</h2>
<p>Missing    (4): bat-dg2-8 bat-rpls-2 fi-snb-2520m fi-pnv-d510 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7692 -&gt; IGTPW_10590</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14179: 38a58d4231067e1b548c12ee521b73ffc0ebb73a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10590: 10590<br />
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_pm@d3-mmap-system<br />
-igt@xe_pm@d3-mmap-vram</p>

</body>
</html>

--===============7982659951812882140==--
