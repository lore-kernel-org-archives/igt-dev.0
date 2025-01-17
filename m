Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E243CC02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 11:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EE910E238;
	Fri, 17 Jan 2025 11:44:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEDC10E1BA;
 Fri, 17 Jan 2025 11:44:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6593345080254271843=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Fvrr=5F?=
 =?utf-8?q?range=3A_Fix_panel_cannot_light_up_after_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jan 2025 11:44:30 -0000
Message-ID: <173711427070.682686.6714253092192226241@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117100101.4282-1-chiahsuan.chung@amd.com>
In-Reply-To: <20250117100101.4282-1-chiahsuan.chung@amd.com>
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

--===============6593345080254271843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_vrr_range: Fix panel cannot light up after test (rev2)
URL   : https://patchwork.freedesktop.org/series/143059/
State : success

== Summary ==

CI Bug Log - changes from IGT_8196 -> IGTPW_12455
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/index.html

Participating hosts (42 -> 43)
------------------------------

  Additional (2): bat-dg2-14 bat-dg1-7 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12455 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][1] -> [INCOMPLETE][2] ([i915#12904]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-apl-1/igt@dmabuf@all-tests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@gem_mmap@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][3] ([i915#4083])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@gem_mmap@basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][4] ([i915#4083])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][5] ([i915#4079]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][6] ([i915#4077]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][7] ([i915#4077]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][8] ([i915#4079]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@gem_tiled_pread_basic.html

  * igt@i915_module_load@load:
    - fi-pnv-d510:        [PASS][9] -> [ABORT][10] ([i915#13203])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/fi-pnv-d510/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/fi-pnv-d510/igt@i915_module_load@load.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-14:         NOTRUN -> [SKIP][11] ([i915#11681] / [i915#6621])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@i915_pm_rps@basic-api.html
    - bat-dg1-7:          NOTRUN -> [SKIP][12] ([i915#11681] / [i915#6621])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live:
    - bat-adlp-6:         [PASS][13] -> [ABORT][14] ([i915#13399]) +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-adlp-6/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-adlp-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][15] -> [DMESG-FAIL][16] ([i915#12061]) +1 other test dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][17] ([i915#5190])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-7:          NOTRUN -> [SKIP][18] ([i915#4215])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-14:         NOTRUN -> [SKIP][19] ([i915#4215] / [i915#5190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - bat-dg1-7:          NOTRUN -> [SKIP][20] ([i915#4212]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-14:         NOTRUN -> [SKIP][21] ([i915#4212]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][22] ([i915#4103] / [i915#4213]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg1-7:          NOTRUN -> [SKIP][23] ([i915#4103] / [i915#4213]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][24] ([i915#3555] / [i915#3840])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][25] ([i915#3555] / [i915#3840])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-14:         NOTRUN -> [SKIP][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg1-7:          NOTRUN -> [SKIP][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-14:         NOTRUN -> [SKIP][28] ([i915#5274])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-14:         NOTRUN -> [SKIP][29] ([i915#5354])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-7:          NOTRUN -> [SKIP][30] ([i915#5354])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-dg1-7:          NOTRUN -> [SKIP][31] ([i915#1072] / [i915#9732]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-14:         NOTRUN -> [SKIP][32] ([i915#1072] / [i915#9732]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-14:         NOTRUN -> [SKIP][33] ([i915#3555])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-7:          NOTRUN -> [SKIP][34] ([i915#3555])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-14:         NOTRUN -> [SKIP][35] ([i915#3708])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg1-7:          NOTRUN -> [SKIP][36] ([i915#3708] / [i915#4077]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-dg1-7:          NOTRUN -> [SKIP][37] ([i915#3708]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg2-14:         NOTRUN -> [SKIP][38] ([i915#3708] / [i915#4077]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-14:         NOTRUN -> [SKIP][39] ([i915#3291] / [i915#3708]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][40] ([i915#12061]) -> [PASS][41] +1 other test pass
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [DMESG-FAIL][42] ([i915#12061]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@kms_busy@basic@flip:
    - fi-cfl-8109u:       [DMESG-WARN][44] ([i915#11621]) -> [DMESG-WARN][45] ([i915#11621] / [i915#1982]) +1 other test dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/fi-cfl-8109u/igt@kms_busy@basic@flip.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/fi-cfl-8109u/igt@kms_busy@basic@flip.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13203
  [i915#13399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13399
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
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
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8196 -> IGTPW_12455
  * Linux: CI_DRM_15973 -> CI_DRM_15974

  CI-20190529: 20190529
  CI_DRM_15973: a15d2a84505eed8dbb58911147e44752734f3a88 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15974: 48e8781781323a28fabb378bcc79b3f48c1bcae0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12455: 5885393e3cf3c5e6bc77566baf9056af5a04192d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8196: 824553d05138bbfa48b9e60e9c2a741497c7c627 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/index.html

--===============6593345080254271843==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_vrr_range: Fix panel cannot light up after test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143059/">https://patchwork.freedesktop.org/series/143059/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8196 -&gt; IGTPW_12455</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/index.html</p>
<h2>Participating hosts (42 -&gt; 43)</h2>
<p>Additional (2): bat-dg2-14 bat-dg1-7 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12455 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/fi-pnv-d510/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/fi-pnv-d510/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13203">i915#13203</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-adlp-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-adlp-6/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13399">i915#13399</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg1-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-dg2-14/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_busy@basic@flip:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8196/fi-cfl-8109u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12455/fi-cfl-8109u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8196 -&gt; IGTPW_12455</li>
<li>Linux: CI_DRM_15973 -&gt; CI_DRM_15974</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15973: a15d2a84505eed8dbb58911147e44752734f3a88 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15974: 48e8781781323a28fabb378bcc79b3f48c1bcae0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12455: 5885393e3cf3c5e6bc77566baf9056af5a04192d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8196: 824553d05138bbfa48b9e60e9c2a741497c7c627 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6593345080254271843==--
