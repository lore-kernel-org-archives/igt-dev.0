Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD2C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 08:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B15310E13B;
	Fri, 14 Feb 2025 08:01:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145E110E13B;
 Fri, 14 Feb 2025 08:01:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6450553638289262337=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Fcompute=5Fsqu?=
 =?utf-8?q?are=5Fkernels=3A_Extend_compute_test_for_ptl_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 14 Feb 2025 08:01:38 -0000
Message-ID: <173952009807.1962008.7770285759286234169@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214070518.53840-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20250214070518.53840-1-sai.gowtham.ch@intel.com>
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

--===============6450553638289262337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_compute_square_kernels: Extend compute test for ptl (rev2)
URL   : https://patchwork.freedesktop.org/series/144820/
State : success

== Summary ==

CI Bug Log - changes from IGT_8229 -> IGTPW_12594
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/index.html

Participating hosts (42 -> 39)
------------------------------

  Additional (2): fi-hsw-4770 fi-pnv-d510 
  Missing    (5): bat-rplp-1 bat-mtlp-9 fi-snb-2520m bat-rpls-4 bat-twl-1 

Known issues
------------

  Here are the changes found in IGTPW_12594 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html

  * igt@gem_softpin@allocator-basic-reserve:
    - fi-hsw-4770:        NOTRUN -> [SKIP][2] +14 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][3] ([i915#5190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] +33 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][5] ([i915#1072]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-cfl-8700k:       [ABORT][6] ([i915#13508]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live:
    - bat-jsl-3:          [INCOMPLETE][8] ([i915#12445] / [i915#13241]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-jsl-3/igt@i915_selftest@live.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-jsl-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gem_contexts:
    - bat-jsl-3:          [INCOMPLETE][10] ([i915#12445]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html

  
#### Warnings ####

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [ABORT][12] ([i915#13465]) -> [ABORT][13] ([i915#13465] / [i915#13679]) +1 other test abort
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-atsm-1/igt@i915_selftest@live@mman.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-dg1-6:          [SKIP][14] ([i915#12311] / [i915#3637]) -> [SKIP][15] ([i915#12311] / [i915#13682] / [i915#3637]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-plain-flip:
    - bat-dg1-6:          [SKIP][16] ([i915#12311]) -> [SKIP][17] ([i915#12311] / [i915#13682])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-dg1-6/igt@kms_flip@basic-plain-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-dg1-6/igt@kms_flip@basic-plain-flip.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#13241]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241
  [i915#13465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465
  [i915#13508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13508
  [i915#13679]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13679
  [i915#13682]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13682
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8229 -> IGTPW_12594
  * Linux: CI_DRM_16123 -> CI_DRM_16133

  CI-20190529: 20190529
  CI_DRM_16123: 4af00c2e09da0269f3f329e660b6417037041bea @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16133: 33191a47b894d992caeab301fe3a110847cb0bac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12594: 12594
  IGT_8229: 8229

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/index.html

--===============6450553638289262337==
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
<tr><td><b>Series:</b></td><td>lib/intel_compute_square_kernels: Extend compute test for ptl (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144820/">https://patchwork.freedesktop.org/series/144820/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8229 -&gt; IGTPW_12594</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Additional (2): fi-hsw-4770 fi-pnv-d510 <br />
  Missing    (5): bat-rplp-1 bat-mtlp-9 fi-snb-2520m bat-rpls-4 bat-twl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12594 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13508">i915#13508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-jsl-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241">i915#13241</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-jsl-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-atsm-1/igt@i915_selftest@live@mman.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465">i915#13465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-atsm-1/igt@i915_selftest@live@mman.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465">i915#13465</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13679">i915#13679</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13682">i915#13682</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8229/bat-dg1-6/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12594/bat-dg1-6/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13682">i915#13682</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8229 -&gt; IGTPW_12594</li>
<li>Linux: CI_DRM_16123 -&gt; CI_DRM_16133</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16123: 4af00c2e09da0269f3f329e660b6417037041bea @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16133: 33191a47b894d992caeab301fe3a110847cb0bac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12594: 12594<br />
  IGT_8229: 8229</p>

</body>
</html>

--===============6450553638289262337==--
