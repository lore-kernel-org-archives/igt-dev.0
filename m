Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13EDF531DC
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 00:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681110E138;
	Tue, 14 Apr 2026 00:48:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D90510E03A;
 Tue, 14 Apr 2026 00:48:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1926884142748186522=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_RFC=3A_Add_preferred_FB_m?=
 =?utf-8?q?odifier_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 14 Apr 2026 00:48:07 -0000
Message-ID: <177612768755.458495.2857168016301531388@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260413165006.46987-1-jeevan.b@intel.com>
In-Reply-To: <20260413165006.46987-1-jeevan.b@intel.com>
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

--===============1926884142748186522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: Add preferred FB modifier helper
URL   : https://patchwork.freedesktop.org/series/164817/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8854 -> IGTPW_14972
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14972 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14972, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14972:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-mtlp-9:         [PASS][1] -> [FAIL][2] +5 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - fi-hsw-4770:        [PASS][3] -> [FAIL][4] +7 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-mtlp-8:         [PASS][5] -> [FAIL][6] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adls-6:         [PASS][7] -> [FAIL][8] +5 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-arlh-3:         [PASS][9] -> [FAIL][10] +5 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-dg1-7:          [PASS][11] -> [FAIL][12] +5 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-rpls-4:         [PASS][13] -> [FAIL][14] +5 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-twl-1:          [PASS][15] -> [FAIL][16] +5 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-jsl-5:          [PASS][17] -> [FAIL][18] +5 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-apl-1:          [PASS][19] -> [FAIL][20] +5 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-rplp-1:         [PASS][21] -> [FAIL][22] +5 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-dg2-9:          [PASS][23] -> [FAIL][24] +5 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-adlp-6:         [PASS][25] -> [FAIL][26] +5 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
    - fi-skl-6600u:       [PASS][27] -> [FAIL][28] +5 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-arls-6:         [PASS][29] -> [FAIL][30] +5 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-pnv-d510:        [PASS][31] -> [FAIL][32] +4 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-kbl-7567u:       [PASS][33] -> [DMESG-FAIL][34] +5 other tests dmesg-fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-cfl-guc:         [PASS][35] -> [FAIL][36] +5 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-cfl-8700k:       [PASS][37] -> [FAIL][38] +5 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-twl-2:          [PASS][39] -> [FAIL][40] +5 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-ivb-3770:        [PASS][41] -> [FAIL][42] +7 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-14:         [PASS][43] -> [FAIL][44] +5 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-elk-e7500:       [PASS][45] -> [FAIL][46] +7 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-8:          [PASS][47] -> [FAIL][48] +5 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-bsw-n3050:       [PASS][49] -> [FAIL][50] +7 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-arls-5:         [PASS][51] -> [FAIL][52] +5 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-cfl-8109u:       [PASS][53] -> [FAIL][54] +5 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-ilk-650:         [PASS][55] -> [FAIL][56] +7 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - fi-tgl-1115g4:      [PASS][57] -> [FAIL][58] +5 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-adlp-9:         [DMESG-WARN][59] ([i915#15673]) -> [FAIL][60] +5 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in IGTPW_14972 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][61] -> [DMESG-FAIL][62] ([i915#12061]) +1 other test dmesg-fail
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-mtlp-8/igt@i915_selftest@live.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-dg2-8:          [PASS][63] -> [DMESG-FAIL][64] ([i915#12061]) +1 other test dmesg-fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg2-8/igt@i915_selftest@live.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [PASS][65] -> [DMESG-WARN][66] ([i915#13735]) +79 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][67] -> [DMESG-FAIL][68] ([i915#12061]) +1 other test dmesg-fail
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-arlh-2:         [PASS][69] -> [DMESG-FAIL][70] ([i915#12061]) +1 other test dmesg-fail
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][71] -> [DMESG-WARN][72] ([i915#13735] / [i915#180]) +47 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [DMESG-FAIL][73] ([i915#12061]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8854 -> IGTPW_14972
  * Linux: CI_DRM_18313 -> CI_DRM_18326

  CI-20190529: 20190529
  CI_DRM_18313: 3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18326: c8bad7becc008716c8475847328c549e178c813c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14972: 174a5975f340be712e859c6bfb20a63f0687899e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/index.html

--===============1926884142748186522==
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
<tr><td><b>Series:</b></td><td>RFC: Add preferred FB modifier helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164817/">https://patchwork.freedesktop.org/series/164817/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8854 -&gt; IGTPW_14972</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14972 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14972, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14972:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +7 other tests fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +4 other tests fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-FAIL</a> +5 other tests dmesg-fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +7 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +7 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +7 other tests fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +7 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14972 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +79 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +47 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8854/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14972/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8854 -&gt; IGTPW_14972</li>
<li>Linux: CI_DRM_18313 -&gt; CI_DRM_18326</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18313: 3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18326: c8bad7becc008716c8475847328c549e178c813c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14972: 174a5975f340be712e859c6bfb20a63f0687899e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1926884142748186522==--
