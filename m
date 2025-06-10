Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72291C5B543
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 13:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2401789369;
	Tue, 10 Jun 2025 13:43:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A77289369;
 Tue, 10 Jun 2025 13:43:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7495112123130370679=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/i915/pm=5Frc6=5Fres?=
 =?utf-8?q?idency=3A_Use_sysfs_to_achieve_peak_frequency_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Jun 2025 13:43:13 -0000
Message-ID: <174956299362.64248.2077780037416104205@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610122645.2088257-5-sk.anirban@intel.com>
In-Reply-To: <20250610122645.2088257-5-sk.anirban@intel.com>
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

--===============7495112123130370679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev11)
URL   : https://patchwork.freedesktop.org/series/148054/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8402 -> IGTPW_13262
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13262 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13262, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/index.html

Participating hosts (40 -> 39)
------------------------------

  Additional (1): bat-dg2-11 
  Missing    (2): bat-arlh-2 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13262:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-tgl-1115g4/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-adls-6:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-adls-6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@live@hangcheck:
    - bat-twl-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/bat-twl-2/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-twl-2/igt@i915_selftest@live@hangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_13262 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap@basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][5] ([i915#4083])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][6] ([i915#4079]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][7] ([i915#4077]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - fi-cfl-guc:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-cfl-guc/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-kbl-x1275/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-kbl-2:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-kbl-2/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-skl-6600u/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-cfl-8700k/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-ivb-3770/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-bsw-nick/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-kbl-guc/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-bsw-n3050/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-hsw-4770/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-pnv-d510/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-cfl-8109u/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-kbl-8809g/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-ilk-650:         NOTRUN -> [SKIP][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-11:         NOTRUN -> [SKIP][25] ([i915#11681] / [i915#6621])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live:
    - bat-twl-2:          [PASS][26] -> [ABORT][27] ([i915#14357])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/bat-twl-2/igt@i915_selftest@live.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-twl-1:          [PASS][28] -> [INCOMPLETE][29] ([i915#14096]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/bat-twl-1/igt@i915_selftest@live@guc_multi_lrc.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-twl-1/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][30] ([i915#4212]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][31] ([i915#5190])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][32] ([i915#4215] / [i915#5190])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-dg2-11:         NOTRUN -> [SKIP][33] ([i915#4103] / [i915#4213]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][34] ([i915#3555] / [i915#3840])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-11:         NOTRUN -> [SKIP][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-11:         NOTRUN -> [SKIP][36] ([i915#5354])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-11:         NOTRUN -> [SKIP][37] ([i915#1072] / [i915#9732]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-11:         NOTRUN -> [SKIP][38] ([i915#3555])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-11:         NOTRUN -> [SKIP][39] ([i915#3708])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg2-11:         NOTRUN -> [SKIP][40] ([i915#3708] / [i915#4077]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-11:         NOTRUN -> [SKIP][41] ([i915#3291] / [i915#3708]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-n3050:       [INCOMPLETE][42] ([i915#12904]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [DMESG-FAIL][44] ([i915#12061]) -> [PASS][45] +1 other test pass
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#14096]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096
  [i915#14357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14357
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8402 -> IGTPW_13262

  CI-20190529: 20190529
  CI_DRM_16676: 52ecbb6a68785860c776b29f58792d9807243979 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13262: 090f0b4ded38d4daf71e63efafe272010d82c41a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8402: ad7a9182bc87a1fe9875de9956b620f9d25485df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/index.html

--===============7495112123130370679==
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
<tr><td><b>Series:</b></td><td>tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148054/">https://patchwork.freedesktop.org/series/148054/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8402 -&gt; IGTPW_13262</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13262 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13262, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Additional (1): bat-dg2-11 <br />
  Missing    (2): bat-arlh-2 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13262:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-tgl-1115g4/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-adls-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/bat-twl-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-twl-2/igt@i915_selftest@live@hangcheck.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13262 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-cfl-guc/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-kbl-x1275/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-kbl-2/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-skl-6600u/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-cfl-8700k/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-ivb-3770/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-bsw-nick/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-kbl-guc/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-bsw-n3050/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-hsw-4770/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-pnv-d510/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-cfl-8109u/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-kbl-8809g/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/bat-twl-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-twl-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14357">i915#14357</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/bat-twl-1/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-twl-1/igt@i915_selftest@live@guc_multi_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096">i915#14096</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-11/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8402/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13262/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8402 -&gt; IGTPW_13262</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16676: 52ecbb6a68785860c776b29f58792d9807243979 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13262: 090f0b4ded38d4daf71e63efafe272010d82c41a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8402: ad7a9182bc87a1fe9875de9956b620f9d25485df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7495112123130370679==--
