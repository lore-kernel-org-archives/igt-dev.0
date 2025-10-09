Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6723ECCA470
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 10:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ABD10E20C;
	Thu,  9 Oct 2025 10:45:30 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F93710E20C;
 Thu,  9 Oct 2025 10:45:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8450018541739013444=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2Cv15=2C1/2=5D_tests/kms=5Fprime=3A_Add_XE_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Oct 2025 10:45:28 -0000
Message-ID: <176000672844.22768.16744874496136317273@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009062243.617475-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251009062243.617475-1-santhosh.reddy.guddati@intel.com>
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

--===============8450018541739013444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v15,1/2] tests/kms_prime: Add XE support
URL   : https://patchwork.freedesktop.org/series/155653/
State : success

== Summary ==

CI Bug Log - changes from IGT_8580 -> IGTPW_13881
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/index.html

Participating hosts (43 -> 43)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13881 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][1] -> [ABORT][2] ([i915#12904]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-apl-1/igt@dmabuf@all-tests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [PASS][3] -> [ABORT][4] ([i915#12904]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@fbdev@info:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][5] ([i915#1849])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][6] ([i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live:
    - bat-jsl-1:          [PASS][8] -> [DMESG-FAIL][9] ([i915#14910]) +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-jsl-1/igt@i915_selftest@live.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-jsl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][10] -> [DMESG-FAIL][11] ([i915#12061]) +1 other test dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][12] ([i915#11190]) +16 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][13] +18 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][14] ([i915#12061]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [DMESG-FAIL][16] ([i915#12061]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][18] ([i915#12061] / [i915#14204]) -> [DMESG-FAIL][19] ([i915#12061] / [i915#13929])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-atsm-1/igt@i915_selftest@live.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][20] ([i915#14204]) -> [DMESG-FAIL][21] ([i915#13929])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-atsm-1/igt@i915_selftest@live@mman.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14910
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8580 -> IGTPW_13881
  * Linux: CI_DRM_17328 -> CI_DRM_17329

  CI-20190529: 20190529
  CI_DRM_17328: a7101e35f29e03562f24ce1220f08350260fc0fc @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17329: e4621fd776939016f32f5585b188429d68e5ae5b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13881: 13881
  IGT_8580: 8580

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/index.html

--===============8450018541739013444==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v15,1/2] tests/kms_prime: Add XE support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155653/">https://patchwork.freedesktop.org/series/155653/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8580 -&gt; IGTPW_13881</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/index.html</p>
<h2>Participating hosts (43 -&gt; 43)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13881 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-apl-1/igt@dmabuf@all-tests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-jsl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-jsl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14910">i915#14910</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8580/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13881/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8580 -&gt; IGTPW_13881</li>
<li>Linux: CI_DRM_17328 -&gt; CI_DRM_17329</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17328: a7101e35f29e03562f24ce1220f08350260fc0fc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17329: e4621fd776939016f32f5585b188429d68e5ae5b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13881: 13881<br />
  IGT_8580: 8580</p>

</body>
</html>

--===============8450018541739013444==--
