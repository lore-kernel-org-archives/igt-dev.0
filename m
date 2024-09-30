Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDD5CE8375
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 17:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A4310E579;
	Mon, 30 Sep 2024 17:17:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF5710E574;
 Mon, 30 Sep 2024 17:17:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1912820962182445686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib/igt=5Ffb=3A_Fix_intel?=
 =?utf-8?q?=5Fbuf_surface_init_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 30 Sep 2024 17:17:41 -0000
Message-ID: <172771666196.1138037.8792553770502109960@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923213620.12369-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240923213620.12369-1-ville.syrjala@linux.intel.com>
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

--===============1912820962182445686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_fb: Fix intel_buf surface init (rev3)
URL   : https://patchwork.freedesktop.org/series/139012/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15460 -> IGTPW_11836
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11836/index.html

Participating hosts (42 -> 41)
------------------------------

  Additional (1): bat-dg2-13 
  Missing    (2): bat-rpls-4 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_11836 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-dg2-13:         NOTRUN -> [FAIL][1] ([i915#12292])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11836/bat-dg2-13/igt@runner@aborted.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [DMESG-WARN][2] ([i915#11621] / [i915#180] / [i915#1982]) -> [DMESG-WARN][3] ([i915#11621] / [i915#180])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15460/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11836/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12292
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8043 -> IGTPW_11836

  CI-20190529: 20190529
  CI_DRM_15460: 2a8d54969ceeb99f139f89f49e8fc25f71fa5bed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11836: 26f61625fa50ad49787ad96e30845e60414b0eda @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8043: 8043

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11836/index.html

--===============1912820962182445686==
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
<tr><td><b>Series:</b></td><td>lib/igt_fb: Fix intel_buf surface init (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139012/">https://patchwork.freedesktop.org/series/139012/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11836/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11836/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15460 -&gt; IGTPW_11836</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11836/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (1): bat-dg2-13 <br />
  Missing    (2): bat-rpls-4 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11836 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-dg2-13:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11836/bat-dg2-13/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12292">i915#12292</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15460/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11836/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8043 -&gt; IGTPW_11836</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15460: 2a8d54969ceeb99f139f89f49e8fc25f71fa5bed @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11836: 26f61625fa50ad49787ad96e30845e60414b0eda @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8043: 8043</p>

</body>
</html>

--===============1912820962182445686==--
