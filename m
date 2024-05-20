Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FE7C25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 21:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713DF10E07E;
	Mon, 20 May 2024 21:44:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0DE10E123;
 Mon, 20 May 2024 21:44:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8376417373378384325=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/6=5D_tests/intel/xe=5Fpm=3A_Update_runtime_pm_conditions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 20 May 2024 21:44:04 -0000
Message-ID: <171624144412.2160912.743097729175336536@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240520190347.242249-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240520190347.242249-1-rodrigo.vivi@intel.com>
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

--===============8376417373378384325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/6] tests/intel/xe_pm: Update runtime pm conditions
URL   : https://patchwork.freedesktop.org/series/133829/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14786 -> IGTPW_11164
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11164/index.html

Participating hosts (41 -> 40)
------------------------------

  Missing    (1): fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_11164 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - bat-arls-3:         [PASS][1] -> [ABORT][2] ([i915#11041])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14786/bat-arls-3/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11164/bat-arls-3/igt@i915_module_load@load.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-11:         [FAIL][3] ([i915#10378]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14786/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11164/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html

  
  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#11041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11041


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7864 -> IGTPW_11164

  CI-20190529: 20190529
  CI_DRM_14786: 3addfb8584a4fcbff8123461682e5bdfd8785bde @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11164: 11164
  IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11164/index.html

--===============8376417373378384325==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/6] tests/intel/xe_pm: Update runtime pm conditions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133829/">https://patchwork.freedesktop.org/series/133829/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11164/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11164/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14786 -&gt; IGTPW_11164</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11164/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Missing    (1): fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11164 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14786/bat-arls-3/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11164/bat-arls-3/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11041">i915#11041</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_lmem_swapping@basic@lmem0:<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14786/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11164/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7864 -&gt; IGTPW_11164</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14786: 3addfb8584a4fcbff8123461682e5bdfd8785bde @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11164: 11164<br />
  IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8376417373378384325==--
