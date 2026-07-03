Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E6BC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 03:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098FC10E32D;
	Fri,  3 Jul 2026 03:59:55 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6E810E32D;
 Fri,  3 Jul 2026 03:59:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1626368884206357011=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fdefrag?=
 =?utf-8?q?=3A_Exercise_the_Xe_page-defragmentation_worker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Jul 2026 03:59:27 -0000
Message-ID: <178305116737.146722.11029634633974344684@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260703023953.4117748-1-matthew.brost@intel.com>
In-Reply-To: <20260703023953.4117748-1-matthew.brost@intel.com>
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

--===============1626368884206357011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_defrag: Exercise the Xe page-defragmentation worker
URL   : https://patchwork.freedesktop.org/series/169723/
State : success

== Summary ==

CI Bug Log - changes from IGT_8990 -> IGTPW_15463
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15463/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8990 -> IGTPW_15463
  * Linux: CI_DRM_18751 -> CI_DRM_18755

  CI-20190529: 20190529
  CI_DRM_18751: 4343c63c6acc14ed4d48dddaa56057663651d9e3 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18755: 2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15463: 15463
  IGT_8990: 8990

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15463/index.html

--===============1626368884206357011==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_defrag: Exercise the Xe page-defragmentation worker</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169723/">https://patchwork.freedesktop.org/series/169723/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15463/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15463/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8990 -&gt; IGTPW_15463</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15463/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8990 -&gt; IGTPW_15463</li>
<li>Linux: CI_DRM_18751 -&gt; CI_DRM_18755</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18751: 4343c63c6acc14ed4d48dddaa56057663651d9e3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18755: 2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15463: 15463<br />
  IGT_8990: 8990</p>

</body>
</html>

--===============1626368884206357011==--
