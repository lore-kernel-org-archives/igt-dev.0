Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F894C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E447B10E727;
	Tue, 17 Jun 2025 14:33:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FB110E723;
 Tue, 17 Jun 2025 14:33:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8367258268237258720=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Update_image_assets_=28re?=
 =?utf-8?q?v7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jun 2025 14:33:24 -0000
Message-ID: <175017080490.87030.1269904914515822666@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250616210840.3335978-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250616210840.3335978-1-ramanaidu.naladala@intel.com>
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

--===============8367258268237258720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update image assets (rev7)
URL   : https://patchwork.freedesktop.org/series/141539/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8412 -> IGTPW_13305
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13305 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13305, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13305:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_3d:
    - bat-rplp-1:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/bat-rplp-1/igt@kms_3d.html
    - bat-adlp-11:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/bat-adlp-11/igt@kms_3d.html

  
Known issues
------------

  Here are the changes found in IGTPW_13305 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#13735] / [i915#13890])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/fi-cfl-8109u/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/fi-cfl-8109u/igt@i915_module_load@load.html

  * igt@kms_3d:
    - bat-apl-1:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/bat-apl-1/igt@kms_3d.html
    - bat-arlh-2:         NOTRUN -> [SKIP][6] ([i915#11346])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/bat-arlh-2/igt@kms_3d.html
    - fi-cfl-8109u:       NOTRUN -> [DMESG-WARN][7] ([i915#13735] / [i915#13890])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/fi-cfl-8109u/igt@kms_3d.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8412 -> IGTPW_13305
  * Linux: CI_DRM_16706 -> CI_DRM_16711

  CI-20190529: 20190529
  CI_DRM_16706: dea7240e83c9e58ec755a3d68e7db10068df6b76 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16711: 6f72990d9e0fe084afe257621edd730444a8bc52 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13305: 13305
  IGT_8412: 8412

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/index.html

--===============8367258268237258720==
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
<tr><td><b>Series:</b></td><td>Update image assets (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141539/">https://patchwork.freedesktop.org/series/141539/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8412 -&gt; IGTPW_13305</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13305 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13305, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13305:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_3d:<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/bat-rplp-1/igt@kms_3d.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/bat-adlp-11/igt@kms_3d.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13305 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/fi-cfl-8109u/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/fi-cfl-8109u/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/bat-apl-1/igt@kms_3d.html">SKIP</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/bat-arlh-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13305/fi-cfl-8109u/igt@kms_3d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8412 -&gt; IGTPW_13305</li>
<li>Linux: CI_DRM_16706 -&gt; CI_DRM_16711</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16706: dea7240e83c9e58ec755a3d68e7db10068df6b76 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16711: 6f72990d9e0fe084afe257621edd730444a8bc52 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13305: 13305<br />
  IGT_8412: 8412</p>

</body>
</html>

--===============8367258268237258720==--
