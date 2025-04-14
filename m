Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C223DC369B4
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 17:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ACA10E251;
	Mon, 14 Apr 2025 17:39:53 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8987C10E251;
 Mon, 14 Apr 2025 17:39:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7348521645434363528=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_prime=5Fmmap=3A_Limit_ape?=
 =?utf-8?q?rture_testing_to_machines_with_an_aperture?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 14 Apr 2025 17:39:52 -0000
Message-ID: <174465239255.3024.5453960531890176746@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414102640.755085-1-pravalika.gurram@intel.com>
In-Reply-To: <20250414102640.755085-1-pravalika.gurram@intel.com>
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

--===============7348521645434363528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: prime_mmap: Limit aperture testing to machines with an aperture
URL   : https://patchwork.freedesktop.org/series/147667/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8318 -> IGTPW_12969
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12969 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12969, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12969:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_softpin@safe-alignment:
    - fi-hsw-4770:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/fi-hsw-4770/igt@gem_softpin@safe-alignment.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/fi-hsw-4770/igt@gem_softpin@safe-alignment.html

  
Known issues
------------

  Here are the changes found in IGTPW_12969 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-rpls-4:         [PASS][3] -> [DMESG-WARN][4] ([i915#13400])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@info:
    - fi-hsw-4770:        [PASS][5] -> [SKIP][6] ([i915#1849] / [i915#2582])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/fi-hsw-4770/igt@fbdev@info.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/fi-hsw-4770/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - fi-hsw-4770:        [PASS][7] -> [SKIP][8] ([i915#2582]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/fi-hsw-4770/igt@fbdev@nullptr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/fi-hsw-4770/igt@fbdev@nullptr.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][9] -> [DMESG-FAIL][10] ([i915#12061]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-dg2-9:          [DMESG-FAIL][13] ([i915#12061]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-dg2-9/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [DMESG-FAIL][17] ([i915#12061]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [DMESG-WARN][19] ([i915#13400]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8318 -> IGTPW_12969
  * Linux: CI_DRM_16413 -> CI_DRM_16414

  CI-20190529: 20190529
  CI_DRM_16413: 7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16414: 24805f4111e68bf0f6f7a513d2145fe7debd7eea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12969: 12969
  IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/index.html

--===============7348521645434363528==
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
<tr><td><b>Series:</b></td><td>prime_mmap: Limit aperture testing to machines with an aperture</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147667/">https://patchwork.freedesktop.org/series/147667/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8318 -&gt; IGTPW_12969</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12969 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12969, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12969:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_softpin@safe-alignment:<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/fi-hsw-4770/igt@gem_softpin@safe-alignment.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/fi-hsw-4770/igt@gem_softpin@safe-alignment.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12969 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/fi-hsw-4770/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/fi-hsw-4770/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/fi-hsw-4770/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/fi-hsw-4770/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12969/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8318 -&gt; IGTPW_12969</li>
<li>Linux: CI_DRM_16413 -&gt; CI_DRM_16414</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16413: 7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16414: 24805f4111e68bf0f6f7a513d2145fe7debd7eea @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12969: 12969<br />
  IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7348521645434363528==--
