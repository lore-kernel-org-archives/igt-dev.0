Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20B9CA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 20:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CED10E20A;
	Fri, 29 Aug 2025 20:30:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C7210E20A;
 Fri, 29 Aug 2025 20:30:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1181545862816607567=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Updates_for_OA_media?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Aug 2025 20:30:40 -0000
Message-ID: <175649944035.286104.14933278504219043289@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
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

--===============1181545862816607567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Updates for OA media
URL   : https://patchwork.freedesktop.org/series/153725/
State : success

== Summary ==

CI Bug Log - changes from IGT_8517 -> IGTPW_13663
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/index.html

Participating hosts (43 -> 43)
------------------------------

  Additional (1): bat-twl-1 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13663 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-twl-1:          NOTRUN -> [SKIP][1] ([i915#10213] / [i915#11671]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic:
    - bat-twl-1:          NOTRUN -> [SKIP][2] ([i915#11031])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-twl-1:          NOTRUN -> [SKIP][3] ([i915#10209] / [i915#11681])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][4] -> [DMESG-FAIL][5] ([i915#12061]) +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-mtlp-8/igt@i915_selftest@live.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][6] -> [DMESG-FAIL][7] ([i915#12061]) +1 other test dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@intel_hwmon@hwmon-read:
    - bat-twl-1:          NOTRUN -> [SKIP][8] ([i915#7707]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-twl-1:          NOTRUN -> [SKIP][9] ([i915#11030] / [i915#11731]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-twl-1:          NOTRUN -> [SKIP][10] ([i915#9886])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-twl-1:          NOTRUN -> [SKIP][11] ([i915#11032])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-twl-1:          NOTRUN -> [SKIP][12] ([i915#8809])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-twl-1:          NOTRUN -> [SKIP][13] ([i915#10212] / [i915#3708])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - bat-twl-1:          NOTRUN -> [SKIP][14] ([i915#10214] / [i915#3708])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-twl-1:          NOTRUN -> [SKIP][15] ([i915#10216] / [i915#3708])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [ABORT][16] ([i915#12904]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-apl-1/igt@dmabuf@all-tests.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [DMESG-WARN][18] ([i915#13494]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-mtlp-9/igt@i915_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-mtlp-9/igt@i915_module_load@load.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][20] ([i915#12061] / [i915#13929]) -> [DMESG-FAIL][21] ([i915#12061] / [i915#14204])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-atsm-1/igt@i915_selftest@live.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][22] ([i915#13929]) -> [DMESG-FAIL][23] ([i915#14204])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-atsm-1/igt@i915_selftest@live@mman.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#11030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030
  [i915#11031]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11031
  [i915#11032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11032
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11731]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8517 -> IGTPW_13663
  * Linux: CI_DRM_17092 -> CI_DRM_17093

  CI-20190529: 20190529
  CI_DRM_17092: 73ec1b82fc684756350c4bb8ee675158ef439bba @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17093: 94efba53a792987b3649b6370e69f772c2210412 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13663: d56723fb37014baf5906047ea34d2340f6d65a61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8517: 8517

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/index.html

--===============1181545862816607567==
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
<tr><td><b>Series:</b></td><td>Updates for OA media</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153725/">https://patchwork.freedesktop.org/series/153725/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8517 -&gt; IGTPW_13663</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/index.html</p>
<h2>Participating hosts (43 -&gt; 43)</h2>
<p>Additional (1): bat-twl-1 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13663 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11031">i915#11031</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030">i915#11030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731">i915#11731</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11032">i915#11032</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-twl-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-apl-1/igt@dmabuf@all-tests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13663/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8517 -&gt; IGTPW_13663</li>
<li>Linux: CI_DRM_17092 -&gt; CI_DRM_17093</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17092: 73ec1b82fc684756350c4bb8ee675158ef439bba @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17093: 94efba53a792987b3649b6370e69f772c2210412 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13663: d56723fb37014baf5906047ea34d2340f6d65a61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8517: 8517</p>

</body>
</html>

--===============1181545862816607567==--
