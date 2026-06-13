Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB5CD8CA8
	for <igt-dev@archiver.kernel.org>; Sat, 13 Jun 2026 20:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542AA10E197;
	Sat, 13 Jun 2026 20:56:19 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AACF10E197;
 Sat, 13 Jun 2026 20:55:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8104487533108954089=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Ffeature=5Fdis?=
 =?utf-8?q?covery=3A_add_HDR=2C_VRR_and_DSC_discovery?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 13 Jun 2026 20:55:55 -0000
Message-ID: <178138415536.76509.13549954675665124463@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260613195901.2675666-1-swati2.sharma@intel.com>
In-Reply-To: <20260613195901.2675666-1-swati2.sharma@intel.com>
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

--===============8104487533108954089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_feature_discovery: add HDR, VRR and DSC discovery
URL   : https://patchwork.freedesktop.org/series/168477/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8962 -> IGTPW_15361
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15361 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15361, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15361/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15361:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8962/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15361/bat-arlh-3/igt@i915_selftest@live.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8962 -> IGTPW_15361
  * Linux: CI_DRM_18670 -> CI_DRM_18675

  CI-20190529: 20190529
  CI_DRM_18670: 536f4e1338749a805ec4a7b82b1444dae2c6fe4d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18675: 5fc0f82c971ea3b4e1c58602c0be573a802a8670 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15361: 15361
  IGT_8962: 8962

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15361/index.html

--===============8104487533108954089==
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
<tr><td><b>Series:</b></td><td>tests/kms_feature_discovery: add HDR, VRR and DSC discovery</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168477/">https://patchwork.freedesktop.org/series/168477/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15361/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15361/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8962 -&gt; IGTPW_15361</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15361 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15361, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15361/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15361:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8962/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15361/bat-arlh-3/igt@i915_selftest@live.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8962 -&gt; IGTPW_15361</li>
<li>Linux: CI_DRM_18670 -&gt; CI_DRM_18675</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18670: 536f4e1338749a805ec4a7b82b1444dae2c6fe4d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18675: 5fc0f82c971ea3b4e1c58602c0be573a802a8670 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15361: 15361<br />
  IGT_8962: 8962</p>

</body>
</html>

--===============8104487533108954089==--
