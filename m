Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDE1EA4FBA
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 13:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC57110E3A0;
	Mon, 23 Feb 2026 13:09:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E62410E39F;
 Mon, 23 Feb 2026 13:09:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2152618699232029224=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Add_helper_to_select_non-?=
 =?utf-8?q?joiner_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 23 Feb 2026 13:09:40 -0000
Message-ID: <177185218023.275505.12381168665805213794@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223093443.1797078-1-pranay.samala@intel.com>
In-Reply-To: <20260223093443.1797078-1-pranay.samala@intel.com>
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

--===============2152618699232029224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add helper to select non-joiner mode
URL   : https://patchwork.freedesktop.org/series/161951/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8765 -> IGTPW_14593
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14593 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14593, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14593:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@eof:
    - bat-jsl-5:          [PASS][1] -> [SKIP][2] +8 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@fbdev@eof.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@fbdev@eof.html

  
Known issues
------------

  Here are the changes found in IGTPW_14593 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-jsl-5:          [PASS][3] -> [SKIP][4] ([i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@fbdev@info.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [PASS][5] -> [DMESG-FAIL][6] ([i915#14204])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-atsm-1/igt@i915_selftest@live@mman.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-jsl-5:          [PASS][9] -> [SKIP][10] ([i915#11190]) +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-jsl-5:          [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@prime_vgem@basic-fence-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - fi-hsw-4770:        [SKIP][13] ([i915#1849] / [i915#2582]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@fbdev@info.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/fi-hsw-4770/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - fi-hsw-4770:        [SKIP][15] ([i915#2582]) -> [PASS][16] +3 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@fbdev@nullptr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/fi-hsw-4770/igt@fbdev@nullptr.html

  * igt@gem_softpin@safe-alignment:
    - fi-hsw-4770:        [FAIL][17] ([i915#15527]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@gem_softpin@safe-alignment.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/fi-hsw-4770/igt@gem_softpin@safe-alignment.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][19] ([i915#12061]) -> [DMESG-FAIL][20] ([i915#12061] / [i915#14204])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-atsm-1/igt@i915_selftest@live.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-atsm-1/igt@i915_selftest@live.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-5:          [SKIP][21] ([i915#4103]) -> [SKIP][22] ([i915#11190]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-5:          [SKIP][23] ([i915#3555] / [i915#9886]) -> [SKIP][24] ([i915#11190])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@kms_dsc@dsc-basic.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#15527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15527
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8765 -> IGTPW_14593
  * Linux: CI_DRM_18016 -> CI_DRM_18021

  CI-20190529: 20190529
  CI_DRM_18016: f8bde45966c329f3025862c5fc462e4b13f52ca8 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18021: 616fe8160929511b0679615cda09751043490b18 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14593: 8d4635225427fa6957f22f6d6fd5529c3a213295 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8765: 8765

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/index.html

--===============2152618699232029224==
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
<tr><td><b>Series:</b></td><td>Add helper to select non-joiner mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161951/">https://patchwork.freedesktop.org/series/161951/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8765 -&gt; IGTPW_14593</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14593 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14593, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14593:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@fbdev@eof:<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@fbdev@eof.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14593 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-atsm-1/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/fi-hsw-4770/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/fi-hsw-4770/igt@fbdev@nullptr.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@safe-alignment:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@gem_softpin@safe-alignment.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15527">i915#15527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/fi-hsw-4770/igt@gem_softpin@safe-alignment.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-jsl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14593/bat-jsl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8765 -&gt; IGTPW_14593</li>
<li>Linux: CI_DRM_18016 -&gt; CI_DRM_18021</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18016: f8bde45966c329f3025862c5fc462e4b13f52ca8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18021: 616fe8160929511b0679615cda09751043490b18 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14593: 8d4635225427fa6957f22f6d6fd5529c3a213295 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8765: 8765</p>

</body>
</html>

--===============2152618699232029224==--
