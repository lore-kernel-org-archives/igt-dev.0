Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352D0C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 17:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F8F10E631;
	Mon, 14 Apr 2025 17:01:33 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444A610E62B;
 Mon, 14 Apr 2025 17:01:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8870820085283326586=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/xe=5Feudebug=5Fonli?=
 =?utf-8?q?ne=3A_Calculate_bb=5Fsize_from_shader_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 14 Apr 2025 17:01:33 -0000
Message-ID: <174465009327.2766.3898186474055427282@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414101714.18581-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20250414101714.18581-1-dominik.karol.piatkowski@intel.com>
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

--===============8870820085283326586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_eudebug_online: Calculate bb_size from shader (rev2)
URL   : https://patchwork.freedesktop.org/series/147215/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8318 -> IGTPW_12968
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12968 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12968, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12968:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-mtlp-8/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_12968 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-n3050:       [PASS][3] -> [INCOMPLETE][4] ([i915#12904]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - bat-arlh-2:         [INCOMPLETE][7] ([i915#14046]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arlh-2/igt@i915_selftest@live@gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-arlh-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][9] ([i915#12061]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-dg2-9:          [DMESG-FAIL][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-dg2-9/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [DMESG-FAIL][13] ([i915#12061]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [DMESG-WARN][17] ([i915#13400]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [INCOMPLETE][19] ([i915#14046]) -> [DMESG-FAIL][20] ([i915#12061])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arlh-2/igt@i915_selftest@live.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-arlh-2/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#14046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14046


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8318 -> IGTPW_12968
  * Linux: CI_DRM_16413 -> CI_DRM_16414

  CI-20190529: 20190529
  CI_DRM_16413: 7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16414: 24805f4111e68bf0f6f7a513d2145fe7debd7eea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12968: 12968
  IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/index.html

--===============8870820085283326586==
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
<tr><td><b>Series:</b></td><td>tests/xe_eudebug_online: Calculate bb_size from shader (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147215/">https://patchwork.freedesktop.org/series/147215/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8318 -&gt; IGTPW_12968</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12968 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12968, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12968:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-mtlp-8/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12968 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arlh-2/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14046">i915#14046</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-arlh-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8318/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14046">i915#14046</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12968/bat-arlh-2/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8318 -&gt; IGTPW_12968</li>
<li>Linux: CI_DRM_16413 -&gt; CI_DRM_16414</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16413: 7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16414: 24805f4111e68bf0f6f7a513d2145fe7debd7eea @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12968: 12968<br />
  IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8870820085283326586==--
