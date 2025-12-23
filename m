Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F189E6B26B
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 01:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32F610E0BB;
	Tue, 23 Dec 2025 01:32:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C439510E02E;
 Tue, 23 Dec 2025 01:32:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4247665594846411678=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Add_plane_color_pipeline_?=
 =?utf-8?q?tests_for_Intel_hardware_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Dec 2025 01:32:24 -0000
Message-ID: <176645354479.111846.4315775247178355653@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
In-Reply-To: <20251219112606.1330425-1-swati2.sharma@intel.com>
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

--===============4247665594846411678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add plane color pipeline tests for Intel hardware (rev8)
URL   : https://patchwork.freedesktop.org/series/150455/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8674 -> IGTPW_14264
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14264 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14264, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/index.html

Participating hosts (43 -> 41)
------------------------------

  Additional (1): fi-cfl-8109u 
  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14264:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload:
    - bat-jsl-5:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-jsl-5/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-jsl-5/igt@i915_module_load@reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_14264 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live:
    - bat-jsl-1:          [PASS][5] -> [DMESG-FAIL][6] ([i915#15394]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-jsl-1/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-jsl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_dsc@dsc-basic:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][9] +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/fi-cfl-8109u/igt@kms_dsc@dsc-basic.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [PASS][10] -> [DMESG-WARN][11] ([i915#13400])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][12] ([i915#12061]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-8/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-apl-1:          [DMESG-WARN][14] ([i915#13735]) -> [PASS][15] +77 other tests pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-apl-1:          [DMESG-WARN][16] ([i915#13735] / [i915#180]) -> [PASS][17] +49 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15394
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8674 -> IGTPW_14264
  * Linux: CI_DRM_17706 -> CI_DRM_17732

  CI-20190529: 20190529
  CI_DRM_17706: e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17732: f101d56dc32350daa45c130ff7a6d46512f614a9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14264: 50b88b71a71950b095cf8e4ef831d8bc80497726 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/index.html

--===============4247665594846411678==
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
<tr><td><b>Series:</b></td><td>Add plane color pipeline tests for Intel hardware (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150455/">https://patchwork.freedesktop.org/series/150455/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8674 -&gt; IGTPW_14264</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14264 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14264, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Additional (1): fi-cfl-8109u <br />
  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14264:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-jsl-5/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-jsl-5/igt@i915_module_load@reload.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14264 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-jsl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-jsl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15394">i915#15394</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/fi-cfl-8109u/igt@kms_dsc@dsc-basic.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> +77 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14264/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8674 -&gt; IGTPW_14264</li>
<li>Linux: CI_DRM_17706 -&gt; CI_DRM_17732</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17706: e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17732: f101d56dc32350daa45c130ff7a6d46512f614a9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14264: 50b88b71a71950b095cf8e4ef831d8bc80497726 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4247665594846411678==--
