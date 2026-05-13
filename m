Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528EBCD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 07:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C23898C4;
	Wed, 13 May 2026 07:15:34 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850A710E1B8;
 Wed, 13 May 2026 07:15:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1676949228928304326=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_RFC=3A_Add_preferred_FB_m?=
 =?utf-8?q?odifier_helper_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 May 2026 07:15:16 -0000
Message-ID: <177865651653.65714.13712730557583403220@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260513061503.645278-1-jeevan.b@intel.com>
In-Reply-To: <20260513061503.645278-1-jeevan.b@intel.com>
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

--===============1676949228928304326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: Add preferred FB modifier helper (rev3)
URL   : https://patchwork.freedesktop.org/series/164817/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8909 -> IGTPW_15172
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15172 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15172, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/index.html

Participating hosts (41 -> 39)
------------------------------

  Additional (1): bat-adls-6 
  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15172:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-mtlp-9:         [PASS][1] -> [FAIL][2] +5 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-mtlp-8:         [PASS][3] -> [FAIL][4] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adls-6:         NOTRUN -> [FAIL][5] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-arlh-3:         [PASS][6] -> [FAIL][7] +5 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-dg1-7:          [PASS][8] -> [FAIL][9] +5 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adlp-9:         [PASS][10] -> [FAIL][11] +5 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-rpls-4:         [PASS][12] -> [FAIL][13] +5 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-twl-1:          [PASS][14] -> [FAIL][15] +5 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-jsl-5:          [PASS][16] -> [FAIL][17] +5 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-apl-1:          [PASS][18] -> [FAIL][19] +5 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-rplp-1:         [PASS][20] -> [FAIL][21] +5 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-dg2-9:          [PASS][22] -> [FAIL][23] +5 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-adlp-6:         [PASS][24] -> [FAIL][25] +5 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
    - fi-skl-6600u:       [PASS][26] -> [FAIL][27] +5 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-arls-6:         [PASS][28] -> [FAIL][29] +5 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-kbl-7567u:       [PASS][30] -> [FAIL][31] +5 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-cfl-guc:         [PASS][32] -> [FAIL][33] +5 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-cfl-8700k:       [PASS][34] -> [FAIL][35] +5 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-twl-2:          [PASS][36] -> [FAIL][37] +5 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-14:         [PASS][38] -> [FAIL][39] +5 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-8:          [PASS][40] -> [FAIL][41] +5 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-bsw-n3050:       [PASS][42] -> [FAIL][43] +7 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-arls-5:         [PASS][44] -> [FAIL][45] +5 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-cfl-8109u:       [PASS][46] -> [FAIL][47] +5 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-tgl-1115g4:      [PASS][48] -> [FAIL][49] +5 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
Known issues
------------

  Here are the changes found in IGTPW_15172 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-adls-6:         NOTRUN -> [SKIP][50] ([i915#15931])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@dmabuf@all-tests.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adls-6:         NOTRUN -> [SKIP][51] ([i915#4613]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-adls-6:         NOTRUN -> [SKIP][52] ([i915#15656])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [PASS][53] -> [DMESG-FAIL][54] ([i915#12061]) +1 other test dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  * igt@intel_hwmon@hwmon-read:
    - bat-adls-6:         NOTRUN -> [SKIP][55] ([i915#7707]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adls-6:         NOTRUN -> [SKIP][56] ([i915#4103]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adls-6:         NOTRUN -> [SKIP][57] ([i915#3555] / [i915#3840])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adls-6:         NOTRUN -> [SKIP][58]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adls-6:         NOTRUN -> [SKIP][59] ([i915#5354])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-adls-6:         NOTRUN -> [SKIP][60] ([i915#1072] / [i915#9732]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adls-6:         NOTRUN -> [SKIP][61] ([i915#3555])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adls-6:         NOTRUN -> [SKIP][62] ([i915#3291]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][63] ([i915#12061]) -> [PASS][64] +1 other test pass
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [DMESG-FAIL][65] ([i915#12061]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [DMESG-FAIL][67] ([i915#12061]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8909 -> IGTPW_15172

  CI-20190529: 20190529
  CI_DRM_18479: 8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15172: 67aa560240e1e020cb37cfd9bc56ddb63f773e0a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/index.html

--===============1676949228928304326==
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
<tr><td><b>Series:</b></td><td>RFC: Add preferred FB modifier helper (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164817/">https://patchwork.freedesktop.org/series/164817/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8909 -&gt; IGTPW_15172</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15172 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15172, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Additional (1): bat-adls-6 <br />
  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15172:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +7 other tests fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15172 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8909/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15172/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8909 -&gt; IGTPW_15172</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18479: 8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15172: 67aa560240e1e020cb37cfd9bc56ddb63f773e0a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1676949228928304326==--
