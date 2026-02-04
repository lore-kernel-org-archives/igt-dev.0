Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578CFE9D3F9
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 15:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F397D10E177;
	Wed,  4 Feb 2026 15:09:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1E410E177;
 Wed,  4 Feb 2026 15:09:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2921731364574090322=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Faux=3A_Protect_?=
 =?utf-8?q?expressions_from_premature_casting_in_aux_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Feb 2026 15:09:44 -0000
Message-ID: <177021778481.225032.10460716224105792607@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
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

--===============2921731364574090322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_aux: Protect expressions from premature casting in aux macros
URL   : https://patchwork.freedesktop.org/series/161144/
State : success

== Summary ==

CI Bug Log - changes from IGT_8735 -> IGTPW_14489
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/index.html

Participating hosts (42 -> 39)
------------------------------

  Additional (1): bat-atsm-1 
  Missing    (4): fi-ilk-650 bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_14489 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-atsm-1:         NOTRUN -> [SKIP][1] ([i915#1849] / [i915#2582])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@fbdev@info.html

  * igt@fbdev@read:
    - bat-atsm-1:         NOTRUN -> [SKIP][2] ([i915#2582]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@fbdev@read.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-rpls-4:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][4] ([i915#4083])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][5] ([i915#4079]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][6] ([i915#4077]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-rpls-4:         NOTRUN -> [SKIP][7] ([i915#3282])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-atsm-1:         NOTRUN -> [SKIP][8] ([i915#6621])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live:
    - bat-dg2-8:          [PASS][9] -> [DMESG-FAIL][10] ([i915#12061]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-dg2-8/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][11] ([i915#12061]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [PASS][12] -> [DMESG-FAIL][13] ([i915#12061]) +1 other test dmesg-fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@intel_hwmon@hwmon-read:
    - bat-rpls-4:         NOTRUN -> [SKIP][14] ([i915#7707]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@size-max:
    - bat-atsm-1:         NOTRUN -> [SKIP][15] ([i915#6077]) +37 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-rpls-4:         NOTRUN -> [SKIP][16] ([i915#4103]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-1:         NOTRUN -> [SKIP][17] ([i915#6078]) +22 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-rpls-4:         NOTRUN -> [SKIP][18] ([i915#3555] / [i915#3840] / [i915#9886])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-atsm-1:         NOTRUN -> [SKIP][19] ([i915#6093]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html
    - bat-rpls-4:         NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-atsm-1:         NOTRUN -> [SKIP][21] ([i915#1836]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-rpls-4:         NOTRUN -> [SKIP][22] ([i915#5354])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][23] ([i915#7357])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-rpls-4:         NOTRUN -> [SKIP][24] ([i915#1072] / [i915#9732]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rpls-4:         NOTRUN -> [SKIP][25] ([i915#3555])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-atsm-1:         NOTRUN -> [SKIP][26] ([i915#6094])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-read:
    - bat-rpls-4:         NOTRUN -> [SKIP][27] ([i915#3708]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-atsm-1:         NOTRUN -> [SKIP][28] +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-rpls-4:         [ABORT][29] -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-rpls-4/igt@i915_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][31] ([i915#12061]) -> [PASS][32] +1 other test pass
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-mtlp-8/igt@i915_selftest@live.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [DMESG-FAIL][33] ([i915#12061]) -> [PASS][34] +1 other test pass
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6094
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7357
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8735 -> IGTPW_14489

  CI-20190529: 20190529
  CI_DRM_17930: 241994730989320c926da9f2d0a5ec80b48f993d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14489: 14489
  IGT_8735: 8735

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/index.html

--===============2921731364574090322==
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
<tr><td><b>Series:</b></td><td>lib/igt_aux: Protect expressions from premature casting in aux macros</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161144/">https://patchwork.freedesktop.org/series/161144/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8735 -&gt; IGTPW_14489</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Additional (1): bat-atsm-1 <br />
  Missing    (4): fi-ilk-650 bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14489 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093">i915#6093</a>) +4 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7357">i915#7357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6094">i915#6094</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-rpls-4/igt@i915_module_load@load.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-rpls-4/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8735/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8735 -&gt; IGTPW_14489</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17930: 241994730989320c926da9f2d0a5ec80b48f993d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14489: 14489<br />
  IGT_8735: 8735</p>

</body>
</html>

--===============2921731364574090322==--
