Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0ADC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 11:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA8210FC71;
	Tue,  2 Apr 2024 11:11:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A4510FC68;
 Tue,  2 Apr 2024 11:11:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0828700614968484539=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Fabm=3A_F?=
 =?utf-8?q?ix_ABM_level_setting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Apr 2024 11:11:17 -0000
Message-ID: <171205627794.1154279.5748731911959812457@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402075208.21223-1-chiahsuan.chung@amd.com>
In-Reply-To: <20240402075208.21223-1-chiahsuan.chung@amd.com>
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

--===============0828700614968484539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_abm: Fix ABM level setting
URL   : https://patchwork.freedesktop.org/series/131914/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14515 -> IGTPW_10963
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/index.html

Participating hosts (33 -> 32)
------------------------------

  Additional (2): bat-arls-1 fi-bsw-nick 
  Missing    (3): fi-blb-e6850 fi-cfl-8109u fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10963 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-arls-1:         NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][2] +19 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - bat-arls-1:         NOTRUN -> [SKIP][3] ([i915#10213]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap@basic:
    - bat-arls-1:         NOTRUN -> [SKIP][4] ([i915#4083])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arls-1:         NOTRUN -> [SKIP][5] ([i915#10197] / [i915#10211] / [i915#4079])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-arls-1:         NOTRUN -> [SKIP][6] ([i915#10196] / [i915#4077]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arls-1:         NOTRUN -> [SKIP][7] ([i915#10206] / [i915#4079])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-arls-1:         NOTRUN -> [SKIP][8] ([i915#10209])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-dg2-8:          [PASS][9] -> [ABORT][10] ([i915#10366])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14515/bat-dg2-8/igt@i915_selftest@live@gt_mocs.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-dg2-8/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-arls-1:         NOTRUN -> [SKIP][11] ([i915#10200]) +9 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arls-1:         NOTRUN -> [SKIP][12] ([i915#10202]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-1:         NOTRUN -> [SKIP][13] ([i915#9886])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-arls-1:         NOTRUN -> [SKIP][14] ([i915#10207])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-arls-1:         NOTRUN -> [SKIP][15] ([i915#9812])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-arls-1:         NOTRUN -> [SKIP][16] ([i915#10648]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-arls-1:         NOTRUN -> [SKIP][17] ([i915#9732]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arls-1:         NOTRUN -> [SKIP][18] ([i915#10208] / [i915#8809])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arls-1:         NOTRUN -> [SKIP][19] ([i915#10212] / [i915#3708])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-arls-1:         NOTRUN -> [SKIP][20] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - bat-arls-1:         NOTRUN -> [SKIP][21] ([i915#10214] / [i915#3708])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-arls-1:         NOTRUN -> [SKIP][22] ([i915#10216] / [i915#3708])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@prime_vgem@basic-write.html

  
#### Warnings ####

  * igt@i915_selftest@live@gem:
    - bat-atsm-1:         [INCOMPLETE][23] -> [ABORT][24] ([i915#10564])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14515/bat-atsm-1/igt@i915_selftest@live@gem.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-atsm-1/igt@i915_selftest@live@gem.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-mtlp-6:         [SKIP][25] ([i915#9792]) -> [SKIP][26] ([i915#10648] / [i915#9792]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14515/bat-mtlp-6/igt@kms_pm_rpm@basic-pci-d3-state.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-mtlp-6/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
  [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
  [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10564]: https://gitlab.freedesktop.org/drm/intel/issues/10564
  [i915#10648]: https://gitlab.freedesktop.org/drm/intel/issues/10648
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7794 -> IGTPW_10963

  CI-20190529: 20190529
  CI_DRM_14515: f54ea7473cd118eb39978f2e946b17558b5ff46d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10963: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/index.html
  IGT_7794: ea51cff570e13d7ced5409244af61a0690fbc8e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/index.html

--===============0828700614968484539==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_abm: Fix ABM level setting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131914/">https://patchwork.freedesktop.org/series/131914/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14515 -&gt; IGTPW_10963</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/index.html</p>
<h2>Participating hosts (33 -&gt; 32)</h2>
<p>Additional (2): bat-arls-1 fi-bsw-nick <br />
  Missing    (3): fi-blb-e6850 fi-cfl-8109u fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10963 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10213">i915#10213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10206">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10209">i915#10209</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14515/bat-dg2-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-dg2-8/igt@i915_selftest@live@gt_mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10200">i915#10200</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10202">i915#10202</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10207">i915#10207</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10648">i915#10648</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-arls-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14515/bat-atsm-1/igt@i915_selftest@live@gem.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-atsm-1/igt@i915_selftest@live@gem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10564">i915#10564</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14515/bat-mtlp-6/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/bat-mtlp-6/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10648">i915#10648</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7794 -&gt; IGTPW_10963</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14515: f54ea7473cd118eb39978f2e946b17558b5ff46d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10963: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/index.html<br />
  IGT_7794: ea51cff570e13d7ced5409244af61a0690fbc8e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0828700614968484539==--
