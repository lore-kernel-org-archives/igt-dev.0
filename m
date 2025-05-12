Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3C6C3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 05:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059AE10E296;
	Mon, 12 May 2025 05:37:45 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DE710E144;
 Mon, 12 May 2025 05:37:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9189470860815647889=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Ftiled=5Fdispl?=
 =?utf-8?q?ay=3A_Skip_if_connectors_are_not_of_same_type_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 12 May 2025 05:37:44 -0000
Message-ID: <174702826425.67500.2044326870638367795@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512044543.1230985-1-pranay.samala@intel.com>
In-Reply-To: <20250512044543.1230985-1-pranay.samala@intel.com>
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

--===============9189470860815647889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_tiled_display: Skip if connectors are not of same type (rev3)
URL   : https://patchwork.freedesktop.org/series/148468/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8361 -> IGTPW_13108
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13108 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13108, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/index.html

Participating hosts (43 -> 43)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13108:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload:
    - bat-apl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-apl-1/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-apl-1/igt@i915_module_load@reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_13108 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][3] -> [DMESG-FAIL][4] ([i915#14243]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-arlh-3/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][5] ([i915#13929])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [PASS][6] -> [DMESG-FAIL][7] ([i915#12061]) +1 other test dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-dg2-11/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [PASS][8] -> [DMESG-FAIL][9] ([i915#12061]) +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-n3050:       [INCOMPLETE][10] ([i915#12904]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live@requests:
    - bat-atsm-1:         [INCOMPLETE][12] ([i915#14129]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-atsm-1/igt@i915_selftest@live@requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-atsm-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][14] ([i915#12061]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [DMESG-FAIL][16] ([i915#12061]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [DMESG-FAIL][18] ([i915#12061]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [INCOMPLETE][20] ([i915#14129]) -> [DMESG-FAIL][21] ([i915#12061] / [i915#13929])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-atsm-1/igt@i915_selftest@live.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-atsm-1/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14129]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14129
  [i915#14243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8361 -> IGTPW_13108
  * Linux: CI_DRM_16528 -> CI_DRM_16529

  CI-20190529: 20190529
  CI_DRM_16528: 444771877667dd9ad2ca695f4195dc4470644f39 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16529: e05492e926ff62470c03598c0ac0d7c3f353b8cf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13108: 13108
  IGT_8361: 8361

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/index.html

--===============9189470860815647889==
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
<tr><td><b>Series:</b></td><td>tests/kms_tiled_display: Skip if connectors are not of same type (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148468/">https://patchwork.freedesktop.org/series/148468/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8361 -&gt; IGTPW_13108</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13108 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13108, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/index.html</p>
<h2>Participating hosts (43 -&gt; 43)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13108:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-apl-1/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-apl-1/igt@i915_module_load@reload.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13108 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-atsm-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14129">i915#14129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-atsm-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-atsm-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14129">i915#14129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13108/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8361 -&gt; IGTPW_13108</li>
<li>Linux: CI_DRM_16528 -&gt; CI_DRM_16529</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16528: 444771877667dd9ad2ca695f4195dc4470644f39 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16529: e05492e926ff62470c03598c0ac0d7c3f353b8cf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13108: 13108<br />
  IGT_8361: 8361</p>

</body>
</html>

--===============9189470860815647889==--
