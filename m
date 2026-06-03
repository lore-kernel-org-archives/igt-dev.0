Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF92ECD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 05:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EA410F898;
	Wed,  3 Jun 2026 05:58:14 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B851110F895;
 Wed,  3 Jun 2026 05:57:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7549424310162199081=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/xe/xe=5Fquery=3A_Add_?=
 =?utf-8?q?xe=5Ffor=5Feach=5Fgt=5Fwith=5Ftype_iterator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Jun 2026 05:57:52 -0000
Message-ID: <178046627274.38280.3401542790174700330@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602160149.971895-1-lukasz.laguna@intel.com>
In-Reply-To: <20260602160149.971895-1-lukasz.laguna@intel.com>
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

--===============7549424310162199081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/xe_query: Add xe_for_each_gt_with_type iterator
URL   : https://patchwork.freedesktop.org/series/167752/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8947 -> IGTPW_15291
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15291 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15291, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15291/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15291:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@workarounds:
    - fi-bsw-n3050:       [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-bsw-n3050/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15291/fi-bsw-n3050/igt@i915_selftest@live@workarounds.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8947 -> IGTPW_15291
  * Linux: CI_DRM_18611 -> CI_DRM_18613

  CI-20190529: 20190529
  CI_DRM_18611: f059886850b97ea5c089703ba3e566a4f847fa19 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18613: ab2d36ce7e67d2825cea19ea956947a21e932f70 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15291: 268d507cc4f9c8eb08c98a9fee3f803e2be288e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15291/index.html

--===============7549424310162199081==
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
<tr><td><b>Series:</b></td><td>lib/xe/xe_query: Add xe_for_each_gt_with_type iterator</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167752/">https://patchwork.freedesktop.org/series/167752/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15291/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15291/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8947 -&gt; IGTPW_15291</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15291 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15291, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15291/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15291:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-bsw-n3050/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15291/fi-bsw-n3050/igt@i915_selftest@live@workarounds.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8947 -&gt; IGTPW_15291</li>
<li>Linux: CI_DRM_18611 -&gt; CI_DRM_18613</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18611: f059886850b97ea5c089703ba3e566a4f847fa19 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18613: ab2d36ce7e67d2825cea19ea956947a21e932f70 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15291: 268d507cc4f9c8eb08c98a9fee3f803e2be288e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7549424310162199081==--
