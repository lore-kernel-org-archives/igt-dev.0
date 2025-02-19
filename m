Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA9EC021AD
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 00:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FAF10E186;
	Wed, 19 Feb 2025 00:46:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59E810E16F;
 Wed, 19 Feb 2025 00:46:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5972561067699049385=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Update_image_assets_=28re?=
 =?utf-8?q?v4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Feb 2025 00:46:31 -0000
Message-ID: <173992599167.3716902.5123984873836917303@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
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

--===============5972561067699049385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update image assets (rev4)
URL   : https://patchwork.freedesktop.org/series/141539/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8236 -> IGTPW_12629
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12629 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12629, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (2): fi-kbl-7567u fi-pnv-d510 
  Missing    (2): bat-apl-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12629:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_3d:
    - bat-rplp-1:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/bat-rplp-1/igt@kms_3d.html
    - bat-adlp-11:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/bat-adlp-11/igt@kms_3d.html

  
Known issues
------------

  Here are the changes found in IGTPW_12629 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#11621])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/fi-cfl-8109u/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/fi-cfl-8109u/igt@i915_module_load@load.html

  * igt@kms_3d:
    - fi-blb-e6850:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/fi-blb-e6850/igt@kms_3d.html
    - bat-arlh-2:         NOTRUN -> [SKIP][6] ([i915#11346])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/bat-arlh-2/igt@kms_3d.html
    - bat-atsm-1:         NOTRUN -> [SKIP][7] ([i915#6093])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/bat-atsm-1/igt@kms_3d.html
    - fi-cfl-8109u:       NOTRUN -> [DMESG-WARN][8] ([i915#11621])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/fi-cfl-8109u/igt@kms_3d.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/fi-pnv-d510/igt@kms_3d.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#6093]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8236 -> IGTPW_12629
  * Linux: CI_DRM_16149 -> CI_DRM_16153

  CI-20190529: 20190529
  CI_DRM_16149: 4587c05996666a92af63f86ba410bae1dc940794 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16153: 5496d2c9c90ad0d79dd25337bc2a43704a1e295e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12629: ccb315cdae0d8dc3a695ea352e2bb5d6283f962e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8236: 8236

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/index.html

--===============5972561067699049385==
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
<tr><td><b>Series:</b></td><td>Update image assets (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141539/">https://patchwork.freedesktop.org/series/141539/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8236 -&gt; IGTPW_12629</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12629 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12629, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (2): fi-kbl-7567u fi-pnv-d510 <br />
  Missing    (2): bat-apl-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12629:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_3d:<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/bat-rplp-1/igt@kms_3d.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/bat-adlp-11/igt@kms_3d.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12629 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/fi-cfl-8109u/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/fi-cfl-8109u/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/fi-blb-e6850/igt@kms_3d.html">SKIP</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/bat-arlh-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/bat-atsm-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093">i915#6093</a>)</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/fi-cfl-8109u/igt@kms_3d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>)</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12629/fi-pnv-d510/igt@kms_3d.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8236 -&gt; IGTPW_12629</li>
<li>Linux: CI_DRM_16149 -&gt; CI_DRM_16153</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16149: 4587c05996666a92af63f86ba410bae1dc940794 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16153: 5496d2c9c90ad0d79dd25337bc2a43704a1e295e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12629: ccb315cdae0d8dc3a695ea352e2bb5d6283f962e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8236: 8236</p>

</body>
</html>

--===============5972561067699049385==--
