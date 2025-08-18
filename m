Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A96ACA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 15:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E3910E494;
	Mon, 18 Aug 2025 15:51:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637CB10E494;
 Mon, 18 Aug 2025 15:51:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2986528330532153144=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2C1/3=5D_lib/intel=5Fcompute=3A_loop=5Fkernel=5Fduration_in_?=
 =?utf-8?q?Pipeline?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Aug 2025 15:51:41 -0000
Message-ID: <175553230139.243875.8068939943806098688@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818075447.15230-1-nishit.sharma@intel.com>
In-Reply-To: <20250818075447.15230-1-nishit.sharma@intel.com>
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

--===============2986528330532153144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/intel_compute: loop_kernel_duration in Pipeline
URL   : https://patchwork.freedesktop.org/series/153046/
State : success

== Summary ==

CI Bug Log - changes from IGT_8495 -> IGTPW_13589
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-jsl-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13589 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-glk-j4005:       NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][2] -> [DMESG-FAIL][3] ([i915#12061]) +1 other test dmesg-fail
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-mtlp-8/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [PASS][4] -> [DMESG-FAIL][5] ([i915#12061]) +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-glk-j4005:       NOTRUN -> [SKIP][6] +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@client:
    - bat-dg2-9:          [ABORT][7] ([i915#14201]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-dg2-9/igt@i915_selftest@live@client.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-dg2-9/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][9] ([i915#12061]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [DMESG-FAIL][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:
    - fi-glk-j4005:       [ABORT][13] ([i915#14804]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/fi-glk-j4005/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/fi-glk-j4005/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-dg2-9:          [ABORT][15] ([i915#12061] / [i915#14201]) -> [DMESG-FAIL][16] ([i915#12061])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-dg2-9/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-dg2-9/igt@i915_selftest@live.html
    - bat-atsm-1:         [DMESG-FAIL][17] ([i915#12061] / [i915#13929]) -> [DMESG-FAIL][18] ([i915#12061] / [i915#14204])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-atsm-1/igt@i915_selftest@live.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][19] ([i915#13929]) -> [DMESG-FAIL][20] ([i915#14204])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-atsm-1/igt@i915_selftest@live@mman.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14804
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8495 -> IGTPW_13589
  * Linux: CI_DRM_17006 -> CI_DRM_17023

  CI-20190529: 20190529
  CI_DRM_17006: 7582d01b3cb80604bd700c37237effb7b5c6fe6e @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17023: edead24a80ae92312f75626eb92f2771ec5a7697 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13589: 13589
  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/index.html

--===============2986528330532153144==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] lib/intel_compute: loop_kernel_duration in Pipeline</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153046/">https://patchwork.freedesktop.org/series/153046/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8495 -&gt; IGTPW_13589</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-jsl-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13589 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-dg2-9/igt@i915_selftest@live@client.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-dg2-9/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/fi-glk-j4005/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14804">i915#14804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/fi-glk-j4005/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-dg2-9/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-dg2-9/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8495/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13589/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8495 -&gt; IGTPW_13589</li>
<li>Linux: CI_DRM_17006 -&gt; CI_DRM_17023</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17006: 7582d01b3cb80604bd700c37237effb7b5c6fe6e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17023: edead24a80ae92312f75626eb92f2771ec5a7697 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13589: 13589<br />
  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2986528330532153144==--
