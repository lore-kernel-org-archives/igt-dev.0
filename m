Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15298D1715D
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 04:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF92610E2E1;
	Tue, 22 Oct 2024 04:08:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD9310E2E1;
 Tue, 22 Oct 2024 04:08:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8972747108123269128=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fjoiner=3A?=
 =?utf-8?q?_switch_modeset_from_uj_to_bj_and_vice-versa_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 22 Oct 2024 04:08:45 -0000
Message-ID: <172957012551.1307930.3607581452619871733@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022022953.1422653-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241022022953.1422653-1-santhosh.reddy.guddati@intel.com>
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

--===============8972747108123269128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa (rev5)
URL   : https://patchwork.freedesktop.org/series/138525/
State : success

== Summary ==

CI Bug Log - changes from IGT_8080 -> IGTPW_11948
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/index.html

Participating hosts (43 -> 44)
------------------------------

  Additional (3): bat-apl-1 bat-dg2-9 fi-kbl-8809g 
  Missing    (2): fi-snb-2520m bat-dg1-6 

Known issues
------------

  Here are the changes found in IGTPW_11948 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-dg2-9:          NOTRUN -> [SKIP][1] ([i915#2582]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-dg2-9:          NOTRUN -> [SKIP][2] ([i915#1849] / [i915#2582])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
    - bat-apl-1:          NOTRUN -> [SKIP][4] +23 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-apl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][6] ([i915#4083])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][7] ([i915#4077]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@gem_mmap_gtt@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][8] ([i915#4079]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-9:          NOTRUN -> [SKIP][9] ([i915#11681] / [i915#6621])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-arlh-2:         NOTRUN -> [DMESG-FAIL][10] ([i915#9500])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-2/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][11] ([i915#4212] / [i915#5190])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][12] ([i915#4212] / [i915#4215] / [i915#5190])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-9:          NOTRUN -> [SKIP][13] ([i915#4212]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][14] +30 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-dg2-9:          NOTRUN -> [SKIP][15] ([i915#5354]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-9:          NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-9:          NOTRUN -> [SKIP][17] ([i915#5274])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-9:          NOTRUN -> [SKIP][18] ([i915#9197]) +16 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-dg2-9:          NOTRUN -> [SKIP][19] ([i915#1072] / [i915#9732]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-9:          NOTRUN -> [SKIP][20] ([i915#3555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-9:          NOTRUN -> [SKIP][21] ([i915#3708] / [i915#9197])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-9:          NOTRUN -> [SKIP][22] ([i915#3708] / [i915#4077]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-9:          NOTRUN -> [SKIP][23] ([i915#3291] / [i915#3708]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [ABORT][24] ([i915#12133]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-arlh-3/igt@i915_selftest@live.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][26] ([i915#12061]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arlh-2:         [ABORT][28] ([i915#12061]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [ABORT][30] ([i915#12133]) -> [DMESG-FAIL][31] ([i915#10341] / [i915#9500])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-arlh-2/igt@i915_selftest@live.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-2/igt@i915_selftest@live.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-6:         [SKIP][32] ([i915#5190] / [i915#9792]) -> [SKIP][33] ([i915#4212] / [i915#5190] / [i915#9792])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-11:         [SKIP][34] ([i915#5190]) -> [SKIP][35] ([i915#4212] / [i915#5190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-14:         [SKIP][36] ([i915#5190]) -> [SKIP][37] ([i915#4212] / [i915#5190])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-8:         [SKIP][38] ([i915#5190]) -> [SKIP][39] ([i915#4212] / [i915#5190])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-8:          [SKIP][40] ([i915#5190]) -> [SKIP][41] ([i915#4212] / [i915#5190])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          [SKIP][42] ([i915#4215] / [i915#5190]) -> [SKIP][43] ([i915#4212] / [i915#4215] / [i915#5190])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-7:          [SKIP][44] ([i915#4215]) -> [SKIP][45] ([i915#4212] / [i915#4215])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-11:         [SKIP][46] ([i915#4215] / [i915#5190]) -> [SKIP][47] ([i915#4212] / [i915#4215] / [i915#5190])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-14:         [SKIP][48] ([i915#4215] / [i915#5190]) -> [SKIP][49] ([i915#4212] / [i915#4215] / [i915#5190])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8080 -> IGTPW_11948
  * Linux: CI_DRM_15559 -> CI_DRM_15574

  CI-20190529: 20190529
  CI_DRM_15559: c1837d4e9af4e9df3109960341105c035b441667 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15574: aa0898115bcff3eda6d021cc66eb8a1c3b264c56 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11948: c989af852b4fd44ed6e7641579293daf5ecbe954 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/index.html

--===============8972747108123269128==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138525/">https://patchwork.freedesktop.org/series/138525/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8080 -&gt; IGTPW_11948</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/index.html</p>
<h2>Participating hosts (43 -&gt; 44)</h2>
<p>Additional (3): bat-apl-1 bat-dg2-9 fi-kbl-8809g <br />
  Missing    (2): fi-snb-2520m bat-dg1-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11948 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-apl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-2/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-arlh-3/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-arlh-3/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-arlh-2/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-arlh-2/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a>)</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8080/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11948/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8080 -&gt; IGTPW_11948</li>
<li>Linux: CI_DRM_15559 -&gt; CI_DRM_15574</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15559: c1837d4e9af4e9df3109960341105c035b441667 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15574: aa0898115bcff3eda6d021cc66eb8a1c3b264c56 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11948: c989af852b4fd44ed6e7641579293daf5ecbe954 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8972747108123269128==--
