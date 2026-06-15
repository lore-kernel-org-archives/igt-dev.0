Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5ABCD98CE
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 06:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB7810E1CB;
	Mon, 15 Jun 2026 06:15:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DFB10E1CB;
 Mon, 15 Jun 2026 06:15:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3367290360008944709=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib=3A_s/GEN=5FVER/GFX=5F?=
 =?utf-8?q?VER/_for_Intel_platform_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 15 Jun 2026 06:15:15 -0000
Message-ID: <178150411566.77510.14507730463606690348@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260615051321.544506-1-nakshtra.goyal@intel.com>
In-Reply-To: <20260615051321.544506-1-nakshtra.goyal@intel.com>
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

--===============3367290360008944709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: s/GEN_VER/GFX_VER/ for Intel platform (rev3)
URL   : https://patchwork.freedesktop.org/series/167245/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8962 -> IGTPW_15364
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15364 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15364, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15364/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15364:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8962/bat-arlh-3/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15364/bat-arlh-3/igt@i915_pm_rpm@module-reload.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8962 -> IGTPW_15364
  * Linux: CI_DRM_18670 -> CI_DRM_18677

  CI-20190529: 20190529
  CI_DRM_18670: 536f4e1338749a805ec4a7b82b1444dae2c6fe4d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18677: 8d9ce786158fecd617b66a0809f9f2e330328052 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15364: 15364
  IGT_8962: 8962

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15364/index.html

--===============3367290360008944709==
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
<tr><td><b>Series:</b></td><td>lib: s/GEN_VER/GFX_VER/ for Intel platform (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167245/">https://patchwork.freedesktop.org/series/167245/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15364/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15364/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8962 -&gt; IGTPW_15364</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15364 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15364, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15364/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15364:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8962/bat-arlh-3/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15364/bat-arlh-3/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8962 -&gt; IGTPW_15364</li>
<li>Linux: CI_DRM_18670 -&gt; CI_DRM_18677</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18670: 536f4e1338749a805ec4a7b82b1444dae2c6fe4d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18677: 8d9ce786158fecd617b66a0809f9f2e330328052 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15364: 15364<br />
  IGT_8962: 8962</p>

</body>
</html>

--===============3367290360008944709==--
