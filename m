Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205BDCCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 09:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66A610E040;
	Fri,  7 Nov 2025 09:24:26 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A51710E040;
 Fri,  7 Nov 2025 09:24:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4863826633734402379=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/dmabuf=3A_Avoid_sof?=
 =?utf-8?q?t_lockups_on_slow_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Nov 2025 09:24:25 -0000
Message-ID: <176250746503.28862.5122122817334794080@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104112116.432508-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20251104112116.432508-2-janusz.krzysztofik@linux.intel.com>
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

--===============4863826633734402379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/dmabuf: Avoid soft lockups on slow platforms
URL   : https://patchwork.freedesktop.org/series/156999/
State : success

== Summary ==

CI Bug Log - changes from IGT_8607 -> IGTPW_13989
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/index.html

Participating hosts (46 -> 44)
------------------------------

  Missing    (2): fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_13989 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - bat-twl-2:          [PASS][1] -> [SKIP][2] ([i915#15249])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-twl-2/igt@dmabuf@all-tests@dma_fence_chain.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-twl-2/igt@dmabuf@all-tests@dma_fence_chain.html
    - fi-elk-e7500:       [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence_chain.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence_chain.html
    - fi-bsw-nick:        [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
    - fi-bsw-n3050:       [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-glk-j4005/igt@dmabuf@all-tests@dma_fence_chain.html
    - bat-jsl-1:          [PASS][10] -> [SKIP][11] ([i915#15249])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-jsl-1/igt@dmabuf@all-tests@dma_fence_chain.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-jsl-1/igt@dmabuf@all-tests@dma_fence_chain.html
    - bat-apl-1:          [PASS][12] -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-apl-1/igt@dmabuf@all-tests@dma_fence_chain.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-apl-1/igt@dmabuf@all-tests@dma_fence_chain.html
    - fi-cfl-8109u:       [PASS][14] -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence_chain.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence_chain.html
    - bat-twl-1:          [PASS][16] -> [SKIP][17] ([i915#15249])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-twl-1/igt@dmabuf@all-tests@dma_fence_chain.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-twl-1/igt@dmabuf@all-tests@dma_fence_chain.html
    - bat-jsl-5:          [PASS][18] -> [SKIP][19] ([i915#15249])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-jsl-5/igt@dmabuf@all-tests@dma_fence_chain.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-jsl-5/igt@dmabuf@all-tests@dma_fence_chain.html
    - fi-tgl-1115g4:      [PASS][20] -> [SKIP][21] ([i915#15249])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-tgl-1115g4/igt@dmabuf@all-tests@dma_fence_chain.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-tgl-1115g4/igt@dmabuf@all-tests@dma_fence_chain.html
    - fi-skl-6600u:       [PASS][22] -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-skl-6600u/igt@dmabuf@all-tests@dma_fence_chain.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-skl-6600u/igt@dmabuf@all-tests@dma_fence_chain.html
    - bat-kbl-2:          [PASS][24] -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-kbl-2/igt@dmabuf@all-tests@dma_fence_chain.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-kbl-2/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][26] -> [DMESG-FAIL][27] ([i915#12061]) +1 other test dmesg-fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-mtlp-8/igt@i915_selftest@live.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [PASS][28] -> [DMESG-FAIL][29] ([i915#12061]) +1 other test dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [PASS][30] -> [DMESG-FAIL][31] ([i915#12061]) +1 other test dmesg-fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - fi-pnv-d510:        [ABORT][32] ([i915#12904]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-pnv-d510/igt@dmabuf@all-tests.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-pnv-d510/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live:
    - fi-glk-j4005:       [INCOMPLETE][34] ([i915#15198]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-glk-j4005/igt@i915_selftest@live.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-glk-j4005/igt@i915_selftest@live.html

  * igt@i915_selftest@live@requests:
    - fi-glk-j4005:       [INCOMPLETE][36] ([i915#15233]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-glk-j4005/igt@i915_selftest@live@requests.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-glk-j4005/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-pnv-d510:        [ABORT][38] ([i915#12904]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-pnv-d510/igt@dmabuf@all-tests@dma_fence_chain.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-pnv-d510/igt@dmabuf@all-tests@dma_fence_chain.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#15198]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15198
  [i915#15233]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15233
  [i915#15249]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15249


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8607 -> IGTPW_13989
  * Linux: CI_DRM_17483 -> CI_DRM_17486

  CI-20190529: 20190529
  CI_DRM_17483: 23a9835dc75d0a8ce54cce440a3e0b36c4cec6af @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17486: 957ab9ac657700dee50f42438ed79652dad939a0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13989: 13989
  IGT_8607: 8607

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/index.html

--===============4863826633734402379==
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
<tr><td><b>Series:</b></td><td>tests/dmabuf: Avoid soft lockups on slow platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156999/">https://patchwork.freedesktop.org/series/156999/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8607 -&gt; IGTPW_13989</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/index.html</p>
<h2>Participating hosts (46 -&gt; 44)</h2>
<p>Missing    (2): fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13989 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-twl-2/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-twl-2/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15249">i915#15249</a>)</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a></li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-glk-j4005/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-jsl-1/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-jsl-1/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15249">i915#15249</a>)</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-apl-1/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-apl-1/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a></li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-twl-1/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-twl-1/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15249">i915#15249</a>)</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-jsl-5/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-jsl-5/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15249">i915#15249</a>)</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-tgl-1115g4/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-tgl-1115g4/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15249">i915#15249</a>)</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-skl-6600u/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-skl-6600u/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-kbl-2/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-kbl-2/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-pnv-d510/igt@dmabuf@all-tests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-pnv-d510/igt@dmabuf@all-tests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-glk-j4005/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15198">i915#15198</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-glk-j4005/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-glk-j4005/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15233">i915#15233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-glk-j4005/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@dmabuf@all-tests@dma_fence_chain:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-pnv-d510/igt@dmabuf@all-tests@dma_fence_chain.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-pnv-d510/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8607 -&gt; IGTPW_13989</li>
<li>Linux: CI_DRM_17483 -&gt; CI_DRM_17486</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17483: 23a9835dc75d0a8ce54cce440a3e0b36c4cec6af @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17486: 957ab9ac657700dee50f42438ed79652dad939a0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13989: 13989<br />
  IGT_8607: 8607</p>

</body>
</html>

--===============4863826633734402379==--
