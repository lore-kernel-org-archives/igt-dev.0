Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC1BC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 16:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0B10E2CD;
	Wed, 15 May 2024 16:00:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D7310E2CD;
 Wed, 15 May 2024 16:00:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2717800988928992314=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fwedged=3A_?=
 =?utf-8?q?Force_a_rebind_before_exit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 May 2024 16:00:53 -0000
Message-ID: <171578885368.2118035.13824244313656615956@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515151555.70885-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240515151555.70885-1-rodrigo.vivi@intel.com>
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

--===============2717800988928992314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_wedged: Force a rebind before exit
URL   : https://patchwork.freedesktop.org/series/133659/
State : success

== Summary ==

CI Bug Log - changes from IGT_7855 -> IGTPW_11147
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/index.html

Participating hosts (42 -> 38)
------------------------------

  Additional (1): fi-kbl-7567u 
  Missing    (5): bat-dg1-7 bat-mtlp-9 fi-snb-2520m fi-elk-e7500 bat-mtlp-8 

Known issues
------------

  Here are the changes found in IGTPW_11147 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][3] +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-9:          [FAIL][4] ([i915#10378]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7855/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#8585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7855 -> IGTPW_11147

  CI-20190529: 20190529
  CI_DRM_14767: d98c9eae84056cb2d86293c145234017681f09f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11147: 11147
  IGT_7855: 7855

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/index.html

--===============2717800988928992314==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_wedged: Force a rebind before exit</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133659/">https://patchwork.freedesktop.org/series/133659/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7855 -&gt; IGTPW_11147</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Additional (1): fi-kbl-7567u <br />
  Missing    (5): bat-dg1-7 bat-mtlp-9 fi-snb-2520m fi-elk-e7500 bat-mtlp-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11147 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_lmem_swapping@basic@lmem0:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7855/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7855 -&gt; IGTPW_11147</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14767: d98c9eae84056cb2d86293c145234017681f09f4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11147: 11147<br />
  IGT_7855: 7855</p>

</body>
</html>

--===============2717800988928992314==--
