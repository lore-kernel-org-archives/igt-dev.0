Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4BCC021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 12:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261E410E968;
	Thu, 20 Feb 2025 12:28:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFAD10E95C;
 Thu, 20 Feb 2025 12:28:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0936096959908036959=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Add_PMU_tests_to_validate?=
 =?utf-8?q?_engine_activity_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Feb 2025 12:28:45 -0000
Message-ID: <174005452590.183089.3271297856251007940@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250220112556.1585555-1-riana.tauro@intel.com>
In-Reply-To: <20250220112556.1585555-1-riana.tauro@intel.com>
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

--===============0936096959908036959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add PMU tests to validate engine activity (rev4)
URL   : https://patchwork.freedesktop.org/series/144711/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8242 -> IGTPW_12639
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12639 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12639, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/index.html

Participating hosts (41 -> 42)
------------------------------

  Additional (2): fi-rkl-11600 bat-adls-6 
  Missing    (1): fi-tgl-1115g4 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12639:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@vma:
    - bat-mtlp-9:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/bat-mtlp-9/igt@i915_selftest@live@vma.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-mtlp-9/igt@i915_selftest@live@vma.html

  
Known issues
------------

  Here are the changes found in IGTPW_12639 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-adls-6:         NOTRUN -> [SKIP][3] ([i915#9318])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@debugfs_test@basic-hwmon.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] ([i915#9318])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html

  * igt@dmabuf@all-tests:
    - fi-bsw-n3050:       [PASS][5] -> [INCOMPLETE][6] ([i915#13652])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/fi-bsw-n3050/igt@dmabuf@all-tests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-bsw-n3050/igt@dmabuf@all-tests.html

  * igt@gem_huc_copy@huc-copy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][7] ([i915#2190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][8] ([i915#4613]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#4613]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][10] ([i915#3282])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@gem_tiled_pread_basic.html
    - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#3282])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@gem_tiled_pread_basic.html

  * igt@i915_selftest@live:
    - bat-twl-2:          NOTRUN -> [ABORT][12] ([i915#12919] / [i915#13503])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_engines:
    - bat-twl-2:          NOTRUN -> [ABORT][13] ([i915#12919])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-twl-2/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][14] -> [DMESG-FAIL][15] ([i915#12061]) +1 other test dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-arls-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adls-6:         NOTRUN -> [SKIP][16] ([i915#4103]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][17] ([i915#4103]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] ([i915#3555] / [i915#3840])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         NOTRUN -> [SKIP][19] ([i915#3555] / [i915#3840])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adls-6:         NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adls-6:         NOTRUN -> [SKIP][22] ([i915#5354])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][23] ([i915#5354])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-adls-6:         NOTRUN -> [SKIP][24] ([i915#1072] / [i915#9732]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-rkl-11600:       NOTRUN -> [SKIP][25] ([i915#1072] / [i915#9732]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-11600:       NOTRUN -> [SKIP][26] ([i915#3555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adls-6:         NOTRUN -> [SKIP][27] ([i915#3555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adls-6:         NOTRUN -> [SKIP][28] ([i915#3291]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - fi-rkl-11600:       NOTRUN -> [SKIP][29] ([i915#3291] / [i915#3708]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - bat-jsl-1:          [DMESG-WARN][30] ([i915#1982]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/bat-jsl-1/igt@i915_module_load@reload.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-jsl-1/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][32] ([i915#12061]) -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503
  [i915#13652]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13652
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8242 -> IGTPW_12639

  CI-20190529: 20190529
  CI_DRM_16162: 1d579c3706d3698c87fddca8cf001e46e22efe0c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12639: 12639
  IGT_8242: 71a996406ffd67de1201f2a3e3553748dbb20ede @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/index.html

--===============0936096959908036959==
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
<tr><td><b>Series:</b></td><td>Add PMU tests to validate engine activity (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144711/">https://patchwork.freedesktop.org/series/144711/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8242 -&gt; IGTPW_12639</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12639 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12639, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/index.html</p>
<h2>Participating hosts (41 -&gt; 42)</h2>
<p>Additional (2): fi-rkl-11600 bat-adls-6 <br />
  Missing    (1): fi-tgl-1115g4 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12639:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@vma:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/bat-mtlp-9/igt@i915_selftest@live@vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-mtlp-9/igt@i915_selftest@live@vma.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12639 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/fi-bsw-n3050/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-bsw-n3050/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13652">i915#13652</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-twl-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503">i915#13503</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-twl-2/igt@i915_selftest@live@gt_engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/bat-jsl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-jsl-1/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8242/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12639/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8242 -&gt; IGTPW_12639</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16162: 1d579c3706d3698c87fddca8cf001e46e22efe0c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12639: 12639<br />
  IGT_8242: 71a996406ffd67de1201f2a3e3553748dbb20ede @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0936096959908036959==--
