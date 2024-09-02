Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760CFCA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 21:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0018F10E3C3;
	Mon,  2 Sep 2024 21:58:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB9E10E3C3;
 Mon,  2 Sep 2024 21:58:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2348056924277945400=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fproperties=3A_r?=
 =?utf-8?q?ework_immutability_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Sep 2024 21:58:01 -0000
Message-ID: <172531428130.908592.4521693336517808157@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902210755.480638-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240902210755.480638-1-dmitry.baryshkov@linaro.org>
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

--===============2348056924277945400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_properties: rework immutability checks
URL   : https://patchwork.freedesktop.org/series/138114/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15344 -> IGTPW_11681
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11681/index.html

Participating hosts (40 -> 34)
------------------------------

  Missing    (6): fi-kbl-7567u bat-arlh-3 fi-snb-2520m fi-cfl-8109u fi-elk-e7500 bat-arls-1 

Known issues
------------

  Here are the changes found in IGTPW_11681 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-1:          [INCOMPLETE][1] ([i915#10886] / [i915#9413]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15344/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11681/bat-twl-1/igt@i915_selftest@live@gt_lrc.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-9:         [DMESG-WARN][3] ([i915#12119]) -> [DMESG-WARN][4] ([i915#12119] / [i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15344/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11681/bat-adlp-9/igt@i915_pm_rpm@module-reload.html

  
  [i915#10886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886
  [i915#12119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12119
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8001 -> IGTPW_11681

  CI-20190529: 20190529
  CI_DRM_15344: 0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11681: 11681
  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11681/index.html

--===============2348056924277945400==
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
<tr><td><b>Series:</b></td><td>tests/kms_properties: rework immutability checks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138114/">https://patchwork.freedesktop.org/series/138114/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11681/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11681/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15344 -&gt; IGTPW_11681</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11681/index.html</p>
<h2>Participating hosts (40 -&gt; 34)</h2>
<p>Missing    (6): fi-kbl-7567u bat-arlh-3 fi-snb-2520m fi-cfl-8109u fi-elk-e7500 bat-arls-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11681 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_lrc:<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15344/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886">i915#10886</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11681/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15344/bat-adlp-9/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12119">i915#12119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11681/bat-adlp-9/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12119">i915#12119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8001 -&gt; IGTPW_11681</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15344: 0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11681: 11681<br />
  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2348056924277945400==--
