Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF955CA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 03:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F20310E183;
	Sat, 23 Aug 2025 03:22:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C201D10E06C;
 Sat, 23 Aug 2025 03:22:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1937967285101882775=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Unigraf_integration_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 23 Aug 2025 03:22:23 -0000
Message-ID: <175591934375.263230.15014082148755074125@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
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

--===============1937967285101882775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Unigraf integration (rev2)
URL   : https://patchwork.freedesktop.org/series/151772/
State : success

== Summary ==

CI Bug Log - changes from IGT_8504 -> IGTPW_13623
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13623 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-n3050:       [PASS][1] -> [ABORT][2] ([i915#12904]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live@uncore:
    - bat-dg2-14:         [PASS][3] -> [ABORT][4] ([i915#14201])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-dg2-14/igt@i915_selftest@live@uncore.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-dg2-14/igt@i915_selftest@live@uncore.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [DMESG-WARN][5] ([i915#13494]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-mtlp-9/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-jsl-1:          [DMESG-FAIL][7] ([i915#14808]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-jsl-1/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-jsl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@client:
    - fi-kbl-7567u:       [DMESG-WARN][9] ([i915#13735]) -> [PASS][10] +13 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/fi-kbl-7567u/igt@i915_selftest@live@client.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/fi-kbl-7567u/igt@i915_selftest@live@client.html
    - bat-atsm-1:         [ABORT][11] ([i915#14201]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-atsm-1/igt@i915_selftest@live@client.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-atsm-1/igt@i915_selftest@live@client.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-dg2-14:         [DMESG-FAIL][13] ([i915#12061]) -> [ABORT][14] ([i915#14201])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-dg2-14/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-dg2-14/igt@i915_selftest@live.html
    - bat-atsm-1:         [ABORT][15] ([i915#14201]) -> [DMESG-FAIL][16] ([i915#12061] / [i915#13929])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-atsm-1/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][17] ([i915#14204]) -> [DMESG-FAIL][18] ([i915#13929])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-atsm-1/igt@i915_selftest@live@mman.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8504 -> IGTPW_13623
  * Linux: CI_DRM_17049 -> CI_DRM_17056

  CI-20190529: 20190529
  CI_DRM_17049: cca87ca63e2f5b8a785dc59c23e526987530b27f @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17056: 2bb5a1149bde0ca35d4b411de142ba6d136c6f9d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13623: 13623
  IGT_8504: 8504

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/index.html

--===============1937967285101882775==
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
<tr><td><b>Series:</b></td><td>Unigraf integration (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151772/">https://patchwork.freedesktop.org/series/151772/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8504 -&gt; IGTPW_13623</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13623 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@uncore:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-dg2-14/igt@i915_selftest@live@uncore.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-dg2-14/igt@i915_selftest@live@uncore.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-jsl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808">i915#14808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-jsl-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/fi-kbl-7567u/igt@i915_selftest@live@client.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/fi-kbl-7567u/igt@i915_selftest@live@client.html">PASS</a> +13 other tests pass</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-atsm-1/igt@i915_selftest@live@client.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-atsm-1/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-dg2-14/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-dg2-14/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-atsm-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8504/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13623/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8504 -&gt; IGTPW_13623</li>
<li>Linux: CI_DRM_17049 -&gt; CI_DRM_17056</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17049: cca87ca63e2f5b8a785dc59c23e526987530b27f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17056: 2bb5a1149bde0ca35d4b411de142ba6d136c6f9d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13623: 13623<br />
  IGT_8504: 8504</p>

</body>
</html>

--===============1937967285101882775==--
