Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16DEE77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 07:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F53710E264;
	Wed,  8 Jan 2025 07:23:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEA610E264;
 Wed,  8 Jan 2025 07:23:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4109839383661018190=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel=3A_Enhance_th?=
 =?utf-8?q?e_wedged=5Fmode_sysfs_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 Jan 2025 07:23:45 -0000
Message-ID: <173632102590.1218235.6949724799269368774@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108062826.908027-1-pravalika.gurram@intel.com>
In-Reply-To: <20250108062826.908027-1-pravalika.gurram@intel.com>
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

--===============4109839383661018190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Enhance the wedged_mode sysfs support (rev2)
URL   : https://patchwork.freedesktop.org/series/143094/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8179 -> IGTPW_12401
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12401 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12401, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12401/index.html

Participating hosts (38 -> 8)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_12401 prevented too many machines from booting.

  Missing    (30): fi-rkl-11600 fi-snb-2520m fi-pnv-d510 bat-adls-6 fi-blb-e6850 bat-mtlp-9 bat-dg2-8 fi-ilk-650 fi-hsw-4770 fi-ivb-3770 bat-rpls-4 bat-jsl-3 bat-rplp-1 fi-elk-e7500 bat-dg2-11 bat-arls-5 bat-twl-2 fi-kbl-7567u bat-dg1-7 bat-arlh-3 bat-adlp-9 fi-cfl-8700k bat-arls-6 bat-mtlp-8 bat-jsl-1 fi-tgl-1115g4 fi-cfl-guc fi-cfl-8109u bat-dg2-14 bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8179 -> IGTPW_12401
  * Linux: CI_DRM_15915 -> CI_DRM_15920

  CI-20190529: 20190529
  CI_DRM_15915: 89042e0bb417f4d67280e1d7fa9bbcca51734571 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15920: 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12401: 34cf1ce01867ff540a0c4fee759df7e3ca3ed92d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12401/index.html

--===============4109839383661018190==
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
<tr><td><b>Series:</b></td><td>tests/intel: Enhance the wedged_mode sysfs support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143094/">https://patchwork.freedesktop.org/series/143094/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12401/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12401/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8179 -&gt; IGTPW_12401</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12401 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12401, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12401/index.html</p>
<h2>Participating hosts (38 -&gt; 8)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_12401 prevented too many machines from booting.</p>
<p>Missing    (30): fi-rkl-11600 fi-snb-2520m fi-pnv-d510 bat-adls-6 fi-blb-e6850 bat-mtlp-9 bat-dg2-8 fi-ilk-650 fi-hsw-4770 fi-ivb-3770 bat-rpls-4 bat-jsl-3 bat-rplp-1 fi-elk-e7500 bat-dg2-11 bat-arls-5 bat-twl-2 fi-kbl-7567u bat-dg1-7 bat-arlh-3 bat-adlp-9 fi-cfl-8700k bat-arls-6 bat-mtlp-8 bat-jsl-1 fi-tgl-1115g4 fi-cfl-guc fi-cfl-8109u bat-dg2-14 bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8179 -&gt; IGTPW_12401</li>
<li>Linux: CI_DRM_15915 -&gt; CI_DRM_15920</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15915: 89042e0bb417f4d67280e1d7fa9bbcca51734571 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15920: 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12401: 34cf1ce01867ff540a0c4fee759df7e3ca3ed92d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4109839383661018190==--
