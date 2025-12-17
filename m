Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA79D66BA6
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 21:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B57A10E900;
	Wed, 17 Dec 2025 21:00:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B23A10E900;
 Wed, 17 Dec 2025 21:00:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8653372820586100251=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/kms=3A_Carve_up_igt?=
 =?utf-8?q?=5Fdisplay=5Frequire=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Dec 2025 21:00:50 -0000
Message-ID: <176600525042.98733.169081918930180699@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
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

--===============8653372820586100251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: Carve up igt_display_require()
URL   : https://patchwork.freedesktop.org/series/159165/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8670 -> IGTPW_14230
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14230 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14230, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/index.html

Participating hosts (42 -> 41)
------------------------------

  Additional (1): fi-elk-e7500 
  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14230:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-14:         [PASS][1] -> [FAIL][2] +32 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-nick:        [PASS][3] -> [FAIL][4] +17 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
    - bat-kbl-2:          [PASS][5] -> [FAIL][6] +18 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-kbl-2/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-kbl-2/igt@i915_pm_rpm@module-reload.html
    - bat-adlp-6:         [PASS][7] -> [FAIL][8] +44 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - fi-hsw-4770:        [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@i915_selftest@live.html
    - fi-ivb-3770:        [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ivb-3770/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ivb-3770/igt@i915_selftest@live.html
    - fi-elk-e7500:       NOTRUN -> [DMESG-WARN][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-elk-e7500/igt@i915_selftest@live.html
    - bat-jsl-1:          [PASS][14] -> [DMESG-WARN][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-1/igt@i915_selftest@live.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-1/igt@i915_selftest@live.html
    - fi-glk-j4005:       [PASS][16] -> [DMESG-WARN][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-glk-j4005/igt@i915_selftest@live.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-glk-j4005/igt@i915_selftest@live.html
    - bat-arls-5:         [PASS][18] -> [DMESG-WARN][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@i915_selftest@live.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@i915_selftest@live.html
    - fi-ilk-650:         [PASS][20] -> [DMESG-WARN][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ilk-650/igt@i915_selftest@live.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ilk-650/igt@i915_selftest@live.html
    - bat-arls-6:         [PASS][22] -> [DMESG-WARN][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@i915_selftest@live.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@i915_selftest@live.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-glk-j4005:       [PASS][24] -> [FAIL][25] +38 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-glk-j4005/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-glk-j4005/igt@kms_addfb_basic@addfb25-bad-modifier.html
    - bat-adlp-9:         [PASS][26] -> [FAIL][27] +38 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg1-6:          [PASS][28] -> [FAIL][29] +14 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - fi-ilk-650:         [PASS][30] -> [FAIL][31] +35 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-tgl-1115g4:      [PASS][32] -> [FAIL][33] +38 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - fi-hsw-4770:        [PASS][34] -> [FAIL][35] +38 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - bat-mtlp-8:         [PASS][36] -> [FAIL][37] +37 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-kbl-x1275:       [PASS][38] -> [FAIL][39] +18 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-adlp-11:        [PASS][40] -> [FAIL][41] +17 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-arlh-3:         [PASS][42] -> [FAIL][43] +37 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - fi-pnv-d510:        [PASS][44] -> [FAIL][45] +31 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-pnv-d510/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-pnv-d510/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-dg1-7:          [PASS][46] -> [FAIL][47] +33 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-arls-5:         [PASS][48] -> [FAIL][49] +33 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-arlh-2:         [PASS][50] -> [FAIL][51] +12 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - fi-bsw-n3050:       [PASS][52] -> [FAIL][53] +37 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-n3050/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-n3050/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - fi-rkl-11600:       [PASS][54] -> [FAIL][55] +18 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@small-bo:
    - bat-arls-6:         [PASS][56] -> [FAIL][57] +33 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_addfb_basic@small-bo.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_addfb_basic@small-bo.html

  * igt@kms_addfb_basic@too-high:
    - bat-rpls-4:         [PASS][58] -> [FAIL][59] +38 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_addfb_basic@too-high.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_addfb_basic@too-high.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-mtlp-9:         [PASS][60] -> [FAIL][61] +37 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-ivb-3770:        [PASS][62] -> [FAIL][63] +35 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][64] +46 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-8:          [PASS][65] -> [FAIL][66] +33 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-cfl-guc:         [PASS][67] -> [FAIL][68] +38 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-dg2-9:          [PASS][69] -> [FAIL][70] +33 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-cfl-8700k:       [PASS][71] -> [FAIL][72] +38 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adls-6:         [PASS][73] -> [FAIL][74] +38 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html
    - bat-jsl-1:          [PASS][75] -> [FAIL][76] +43 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-rplp-1:         [PASS][77] -> [FAIL][78] +38 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-twl-2:          [PASS][79] -> [FAIL][80] +43 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
    - bat-dg2-11:         [PASS][81] -> [FAIL][82] +32 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-twl-1:          [PASS][83] -> [FAIL][84] +43 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-8809g:       [PASS][85] -> [FAIL][86] +18 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-jsl-5:          [PASS][87] -> [FAIL][88] +38 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-apl-1:          [PASS][89] -> [FAIL][90] +36 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-skl-6600u:       [PASS][91] -> [FAIL][92] +42 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - bat-dg1-6:          [SKIP][93] ([i915#12311] / [i915#4212]) -> [FAIL][94] +3 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg2-11:         [SKIP][95] ([i915#4212]) -> [FAIL][96] +3 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - bat-dg2-14:         [SKIP][97] ([i915#4212]) -> [FAIL][98] +3 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - bat-mtlp-9:         [SKIP][99] ([i915#4212]) -> [FAIL][100] +3 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - bat-arls-6:         [SKIP][101] ([i915#10200]) -> [FAIL][102] +3 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - bat-mtlp-8:         [SKIP][103] ([i915#4212]) -> [FAIL][104] +3 other tests fail
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - bat-dg2-8:          [SKIP][105] ([i915#4212]) -> [FAIL][106] +3 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-9:          [SKIP][107] ([i915#5190]) -> [FAIL][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-11:         [SKIP][109] ([i915#5190]) -> [FAIL][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-14:         [SKIP][111] ([i915#5190]) -> [FAIL][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-9:         [SKIP][113] ([i915#5190]) -> [FAIL][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-hsw-4770:        [SKIP][115] ([i915#5190]) -> [FAIL][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-8:         [SKIP][117] ([i915#5190]) -> [FAIL][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-8:          [SKIP][119] ([i915#5190]) -> [FAIL][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arls-6:         [SKIP][121] ([i915#10200] / [i915#12203]) -> [FAIL][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arlh-3:         [SKIP][123] ([i915#11666] / [i915#12203]) -> [FAIL][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arls-5:         [SKIP][125] ([i915#10200] / [i915#12203]) -> [FAIL][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arlh-2:         [SKIP][127] ([i915#10200] / [i915#11346] / [i915#11666] / [i915#12203]) -> [FAIL][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-arls-6:         [SKIP][129] ([i915#10200]) -> [SKIP][130] +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-arlh-3:         [SKIP][131] ([i915#11666]) -> [SKIP][132] +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - bat-arlh-2:         [SKIP][133] ([i915#10200] / [i915#11346] / [i915#11666]) -> [FAIL][134] +3 other tests fail
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-arlh-3:         [SKIP][135] ([i915#11666]) -> [FAIL][136] +3 other tests fail
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg1-7:          [SKIP][137] ([i915#4212]) -> [FAIL][138] +3 other tests fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-arls-5:         [SKIP][139] ([i915#10200]) -> [FAIL][140] +3 other tests fail
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg2-9:          [SKIP][141] ([i915#4212]) -> [FAIL][142] +3 other tests fail
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - bat-arls-5:         [SKIP][143] ([i915#10200]) -> [SKIP][144] +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@too-high:
    - fi-kbl-7567u:       [DMESG-WARN][145] ([i915#13735]) -> [FAIL][146] +16 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_addfb_basic@too-high.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_addfb_basic@too-high.html

  * igt@kms_busy@basic:
    - bat-dg1-6:          [SKIP][147] ([i915#11190] / [i915#12311] / [i915#4303]) -> [FAIL][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_busy@basic.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-twl-2:          [SKIP][149] ([i915#11030] / [i915#11731]) -> [FAIL][150] +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-dg2-11:         [SKIP][151] ([i915#4103] / [i915#4213]) -> [FAIL][152] +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-arls-6:         [SKIP][153] ([i915#10202]) -> [FAIL][154] +1 other test fail
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      [SKIP][155] ([i915#4103]) -> [FAIL][156] +1 other test fail
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-14:         [SKIP][157] ([i915#4103] / [i915#4213]) -> [FAIL][158] +1 other test fail
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-mtlp-9:         [SKIP][159] ([i915#4213]) -> [FAIL][160] +1 other test fail
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-mtlp-8:         [SKIP][161] ([i915#4213]) -> [FAIL][162] +1 other test fail
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-8:          [SKIP][163] ([i915#4103] / [i915#4213]) -> [FAIL][164] +1 other test fail
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adls-6:         [SKIP][165] ([i915#4103]) -> [FAIL][166] +1 other test fail
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-1:          [SKIP][167] ([i915#4103]) -> [FAIL][168] +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-arlh-3:         [SKIP][169] ([i915#11731]) -> [FAIL][170] +1 other test fail
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg1-7:          [SKIP][171] ([i915#4103] / [i915#4213]) -> [FAIL][172] +1 other test fail
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adlp-9:         [SKIP][173] ([i915#4103]) -> [FAIL][174] +1 other test fail
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-rpls-4:         [SKIP][175] ([i915#4103]) -> [FAIL][176] +1 other test fail
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-twl-1:          [SKIP][177] ([i915#11030] / [i915#11731]) -> [FAIL][178] +1 other test fail
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-5:          [SKIP][179] ([i915#4103]) -> [FAIL][180] +1 other test fail
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-arls-5:         [SKIP][181] ([i915#10202]) -> [FAIL][182] +1 other test fail
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-rplp-1:         [SKIP][183] ([i915#4103] / [i915#4213]) -> [FAIL][184] +1 other test fail
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-9:          [SKIP][185] ([i915#4103] / [i915#4213]) -> [FAIL][186] +1 other test fail
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adlp-6:         [SKIP][187] ([i915#4103]) -> [FAIL][188] +1 other test fail
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-dg1-6:          [SKIP][189] ([i915#11190] / [i915#12311]) -> [FAIL][190] +15 other tests fail
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-rpls-4:         [SKIP][191] ([i915#3555] / [i915#3840] / [i915#9886]) -> [FAIL][192]
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_dsc@dsc-basic.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_dsc@dsc-basic.html
    - fi-kbl-7567u:       [SKIP][193] -> [FAIL][194] +7 other tests fail
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
    - bat-twl-1:          [SKIP][195] ([i915#9886]) -> [FAIL][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-1/igt@kms_dsc@dsc-basic.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-1/igt@kms_dsc@dsc-basic.html
    - fi-kbl-8809g:       [SKIP][197] ([i915#11190]) -> [FAIL][198] +16 other tests fail
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html
    - bat-jsl-5:          [SKIP][199] ([i915#3555] / [i915#9886]) -> [FAIL][200]
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_dsc@dsc-basic.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_dsc@dsc-basic.html
    - bat-apl-1:          [SKIP][201] -> [FAIL][202] +8 other tests fail
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-apl-1/igt@kms_dsc@dsc-basic.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-apl-1/igt@kms_dsc@dsc-basic.html
    - bat-arls-5:         [SKIP][203] ([i915#9886]) -> [FAIL][204]
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_dsc@dsc-basic.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_dsc@dsc-basic.html
    - bat-rplp-1:         [SKIP][205] ([i915#3555] / [i915#3840]) -> [FAIL][206]
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rplp-1/igt@kms_dsc@dsc-basic.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rplp-1/igt@kms_dsc@dsc-basic.html
    - fi-tgl-1115g4:      [SKIP][207] ([i915#3555] / [i915#3840]) -> [FAIL][208]
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
    - fi-skl-6600u:       [SKIP][209] -> [FAIL][210] +3 other tests fail
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-skl-6600u/igt@kms_dsc@dsc-basic.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-skl-6600u/igt@kms_dsc@dsc-basic.html
    - bat-twl-2:          [SKIP][211] ([i915#9886]) -> [FAIL][212]
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-2/igt@kms_dsc@dsc-basic.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-11:         [SKIP][213] ([i915#3555] / [i915#3840]) -> [FAIL][214]
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_dsc@dsc-basic.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_dsc@dsc-basic.html
    - bat-dg2-14:         [SKIP][215] ([i915#3555] / [i915#3840]) -> [FAIL][216]
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_dsc@dsc-basic.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-9:         [SKIP][217] ([i915#3555] / [i915#3840] / [i915#9159]) -> [FAIL][218]
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
    - bat-arls-6:         [SKIP][219] ([i915#9886]) -> [FAIL][220]
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_dsc@dsc-basic.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-8:         [SKIP][221] ([i915#3555] / [i915#3840] / [i915#9159]) -> [FAIL][222]
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         [SKIP][223] ([i915#3555] / [i915#3840]) -> [FAIL][224]
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_dsc@dsc-basic.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          [SKIP][225] ([i915#3555] / [i915#9886]) -> [FAIL][226]
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-1/igt@kms_dsc@dsc-basic.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-1/igt@kms_dsc@dsc-basic.html
    - bat-arlh-3:         [SKIP][227] ([i915#9886]) -> [FAIL][228]
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_dsc@dsc-basic.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          [SKIP][229] ([i915#3555] / [i915#3840]) -> [FAIL][230]
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_dsc@dsc-basic.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_dsc@dsc-basic.html
    - bat-adlp-9:         [SKIP][231] ([i915#3555] / [i915#3840]) -> [FAIL][232]
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_dsc@dsc-basic.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-11:        [SKIP][233] ([i915#3637]) -> [FAIL][234] +3 other tests fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-dg1-6:          [SKIP][235] ([i915#12311] / [i915#3637]) -> [FAIL][236] +2 other tests fail
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-nick:        [SKIP][237] -> [FAIL][238] +11 other tests fail
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-rkl-11600:       [SKIP][239] ([i915#3637]) -> [FAIL][240] +3 other tests fail
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - bat-dg1-6:          [SKIP][241] ([i915#12311]) -> [FAIL][242]
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_flip@basic-plain-flip.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-kbl-7567u:       [DMESG-WARN][243] ([i915#13735] / [i915#13890] / [i915#180]) -> [DMESG-FAIL][244]
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_force_connector_basic@force-connector-state.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-kbl-x1275:       [SKIP][245] -> [FAIL][246] +10 other tests fail
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-11:        [SKIP][247] ([i915#4342] / [i915#5354]) -> [FAIL][248]
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
    - fi-kbl-8809g:       [SKIP][249] -> [FAIL][250] +10 other tests fail
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg1-6:          [SKIP][251] ([i915#12311] / [i915#4342]) -> [FAIL][252]
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html
    - fi-rkl-11600:       [SKIP][253] ([i915#1849] / [i915#5354]) -> [FAIL][254]
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - fi-hsw-4770:        [SKIP][255] -> [FAIL][256] +2 other tests fail
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - fi-rkl-11600:       [SKIP][257] ([i915#11190]) -> [FAIL][258] +16 other tests fail
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arlh-2:         [SKIP][259] ([i915#11190] / [i915#11346]) -> [FAIL][260] +16 other tests fail
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-kbl-x1275:       [SKIP][261] ([i915#11190]) -> [FAIL][262] +16 other tests fail
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html
    - bat-adlp-11:        [SKIP][263] ([i915#11190]) -> [FAIL][264] +16 other tests fail
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        [SKIP][265] ([i915#11190]) -> [FAIL][266] +16 other tests fail
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
    - bat-kbl-2:          [SKIP][267] ([i915#11190]) -> [FAIL][268] +16 other tests fail
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-kbl-2:          [SKIP][269] -> [FAIL][270] +10 other tests fail
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-11:         [SKIP][271] ([i915#5354]) -> [FAIL][272]
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-14:         [SKIP][273] ([i915#5354]) -> [FAIL][274]
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-8:          [SKIP][275] ([i915#5354]) -> [FAIL][276]
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
    - bat-arls-6:         [SKIP][277] ([i915#9812]) -> [FAIL][278]
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlp-9:         [SKIP][279] ([i915#9812]) -> [FAIL][280]
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html
    - bat-adls-6:         [SKIP][281] ([i915#5354]) -> [FAIL][282]
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-arls-5:         [SKIP][283] ([i915#9812]) -> [FAIL][284]
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][285] ([i915#5354]) -> [FAIL][286]
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-7:          [SKIP][287] ([i915#5354]) -> [FAIL][288]
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
    - bat-rpls-4:         [SKIP][289] ([i915#5354]) -> [FAIL][290]
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html
    - bat-jsl-5:          [SKIP][291] ([i915#15205]) -> [FAIL][292]
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html
    - fi-tgl-1115g4:      [SKIP][293] ([i915#9812]) -> [FAIL][294]
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-9:          [SKIP][295] ([i915#5354]) -> [FAIL][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlp-11:        [SKIP][297] ([i915#9812]) -> [FAIL][298]
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-6:          [SKIP][299] ([i915#12311] / [i915#5354]) -> [FAIL][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][301] ([i915#13735] / [i915#13890] / [i915#180]) -> [FAIL][302] +20 other tests fail
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ilk-650:         [SKIP][303] -> [FAIL][304] +10 other tests fail
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - fi-ivb-3770:        [SKIP][305] -> [FAIL][306] +10 other tests fail
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ivb-3770/igt@kms_pm_rpm@basic-rte.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ivb-3770/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-cfl-guc:         [SKIP][307] -> [FAIL][308] +7 other tests fail
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-bsw-n3050:       [SKIP][309] -> [FAIL][310] +8 other tests fail
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-mtlp-9:         [SKIP][311] ([i915#4077] / [i915#9688]) -> [FAIL][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-arls-6:         [SKIP][313] ([i915#9732]) -> [FAIL][314] +3 other tests fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html
    - fi-pnv-d510:        [SKIP][315] -> [FAIL][316] +14 other tests fail
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-mtlp-8:         [SKIP][317] ([i915#4077] / [i915#9688]) -> [FAIL][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-adls-6:         [SKIP][319] ([i915#1072] / [i915#9732]) -> [FAIL][320] +3 other tests fail
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-arlh-3:         [SKIP][321] ([i915#12637] / [i915#9688]) -> [FAIL][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-dg1-7:          [SKIP][323] ([i915#1072] / [i915#9732]) -> [FAIL][324] +3 other tests fail
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
    - fi-glk-j4005:       [SKIP][325] -> [FAIL][326] +7 other tests fail
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
    - bat-adlp-9:         [SKIP][327] ([i915#1072] / [i915#9732]) -> [FAIL][328] +3 other tests fail
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html
    - bat-rpls-4:         [SKIP][329] ([i915#1072] / [i915#9732]) -> [FAIL][330] +3 other tests fail
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html
    - bat-jsl-5:          [SKIP][331] ([i915#1072]) -> [FAIL][332] +3 other tests fail
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html
    - bat-arls-5:         [SKIP][333] ([i915#9732]) -> [FAIL][334] +3 other tests fail
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html
    - bat-rplp-1:         [SKIP][335] ([i915#1072] / [i915#9732]) -> [FAIL][336] +3 other tests fail
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html
    - bat-arlh-2:         [SKIP][337] ([i915#11346]) -> [FAIL][338] +10 other tests fail
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html
    - fi-rkl-11600:       [SKIP][339] ([i915#1072] / [i915#9732]) -> [FAIL][340] +3 other tests fail
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html
    - bat-dg2-9:          [SKIP][341] ([i915#1072] / [i915#9732]) -> [FAIL][342] +3 other tests fail
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html
    - bat-adlp-11:        [SKIP][343] ([i915#1072] / [i915#9732]) -> [FAIL][344] +3 other tests fail
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html
    - bat-dg1-6:          [SKIP][345] ([i915#1072] / [i915#12311] / [i915#9732]) -> [FAIL][346] +3 other tests fail
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html
    - fi-tgl-1115g4:      [SKIP][347] ([i915#9732]) -> [FAIL][348] +3 other tests fail
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-11:         [SKIP][349] ([i915#1072] / [i915#9732]) -> [FAIL][350] +3 other tests fail
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-cfl-8700k:       [SKIP][351] -> [FAIL][352] +7 other tests fail
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-14:         [SKIP][353] ([i915#1072] / [i915#9732]) -> [FAIL][354] +3 other tests fail
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-hsw-4770:        [SKIP][355] ([i915#1072]) -> [FAIL][356] +3 other tests fail
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-8:          [SKIP][357] ([i915#1072] / [i915#9732]) -> [FAIL][358] +3 other tests fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-11:         [SKIP][359] ([i915#3708]) -> [FAIL][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-14:         [SKIP][361] ([i915#3708]) -> [FAIL][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-8:          [SKIP][363] ([i915#3708]) -> [FAIL][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
    - fi-rkl-11600:       [SKIP][365] ([i915#3708]) -> [FAIL][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
    - bat-dg1-7:          [SKIP][367] ([i915#3708]) -> [FAIL][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-9:          [SKIP][369] ([i915#3708]) -> [FAIL][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html
    - bat-adlp-11:        [SKIP][371] ([i915#3708]) -> [FAIL][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html
    - bat-dg1-6:          [SKIP][373] ([i915#3708]) -> [FAIL][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@prime_vgem@basic-fence-flip.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@prime_vgem@basic-fence-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_14230 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-elk-e7500:       NOTRUN -> [SKIP][375] +13 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-elk-e7500/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [PASS][376] -> [ABORT][377] ([i915#14365]) +1 other test abort
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [PASS][378] -> [DMESG-FAIL][379] ([i915#12061]) +1 other test dmesg-fail
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-twl-1:          [DMESG-FAIL][380] -> [PASS][381] +1 other test pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-1/igt@i915_selftest@live.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-1/igt@i915_selftest@live.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - fi-kbl-7567u:       [DMESG-WARN][382] ([i915#13735]) -> [PASS][383] +22 other tests pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop-any.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [FAIL][384] -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][386] ([i915#12061] / [i915#13929]) -> [DMESG-FAIL][387] ([i915#12061] / [i915#14204])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-atsm-1/igt@i915_selftest@live.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][388] ([i915#13929]) -> [DMESG-FAIL][389] ([i915#14204])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-atsm-1/igt@i915_selftest@live@mman.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - bat-arlh-2:         [SKIP][390] ([i915#10200] / [i915#11346] / [i915#11666]) -> [SKIP][391] ([i915#11346]) +4 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11731]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14365
  [i915#15205]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15205
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4303]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4303
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8670 -> IGTPW_14230

  CI-20190529: 20190529
  CI_DRM_17698: 605176fe40c828b491a1532367df157529895b87 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14230: 14230
  IGT_8670: 8670

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/index.html

--===============8653372820586100251==
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
<tr><td><b>Series:</b></td><td>lib/kms: Carve up igt_display_require()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159165/">https://patchwork.freedesktop.org/series/159165/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8670 -&gt; IGTPW_14230</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14230 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14230, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (1): fi-elk-e7500 <br />
  Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14230:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@i915_pm_rpm@module-reload.html">FAIL</a> +32 other tests fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">FAIL</a> +17 other tests fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-kbl-2/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-kbl-2/igt@i915_pm_rpm@module-reload.html">FAIL</a> +18 other tests fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">FAIL</a> +44 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@i915_selftest@live.html">DMESG-WARN</a></li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ivb-3770/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ivb-3770/igt@i915_selftest@live.html">DMESG-WARN</a></li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-elk-e7500/igt@i915_selftest@live.html">DMESG-WARN</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-1/igt@i915_selftest@live.html">DMESG-WARN</a></li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-glk-j4005/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-glk-j4005/igt@i915_selftest@live.html">DMESG-WARN</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@i915_selftest@live.html">DMESG-WARN</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ilk-650/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ilk-650/igt@i915_selftest@live.html">DMESG-WARN</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@i915_selftest@live.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-glk-j4005/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-glk-j4005/igt@kms_addfb_basic@addfb25-bad-modifier.html">FAIL</a> +38 other tests fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_addfb_basic@addfb25-bad-modifier.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +35 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +38 other tests fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +37 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a> +18 other tests fail</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +37 other tests fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-pnv-d510/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-pnv-d510/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +31 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +33 other tests fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +33 other tests fail</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-n3050/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-n3050/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +37 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_addfb_basic@small-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_addfb_basic@small-bo.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_addfb_basic@too-high.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +37 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +35 other tests fail</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +46 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +38 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +38 other tests fail</li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +43 other tests fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +43 other tests fail</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +18 other tests fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +38 other tests fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +42 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> +3 other tests fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> +3 other tests fail</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> +3 other tests fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> +4 other tests skip</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +3 other tests fail</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +3 other tests fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_addfb_basic@too-high.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_addfb_basic@too-high.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4303">i915#4303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_busy@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030">i915#11030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731">i915#11731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731">i915#11731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030">i915#11030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731">i915#11731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html">FAIL</a> +7 other tests fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-1/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">FAIL</a> +16 other tests fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-apl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-apl-1/igt@kms_dsc@dsc-basic.html">FAIL</a> +8 other tests fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rplp-1/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-skl-6600u/igt@kms_dsc@dsc-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-skl-6600u/igt@kms_dsc@dsc-basic.html">FAIL</a> +3 other tests fail</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-1/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +11 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_flip@basic-plain-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_force_connector_basic@force-connector-state.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +10 other tests fail</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +10 other tests fail</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +16 other tests fail</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> +16 other tests fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html">FAIL</a> +10 other tests fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15205">i915#15205</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +20 other tests fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-ivb-3770/igt@kms_pm_rpm@basic-rte.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-ivb-3770/igt@kms_pm_rpm@basic-rte.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +8 other tests fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +3 other tests fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +14 other tests fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +3 other tests fail</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +7 other tests fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +10 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +7 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg1-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg1-6/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14230 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-elk-e7500/igt@gem_lmem_swapping@basic.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-2/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-2/igt@i915_selftest@live@gt_mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14365">i915#14365</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-twl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-twl-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop-any.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop-any.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14230/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8670 -&gt; IGTPW_14230</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17698: 605176fe40c828b491a1532367df157529895b87 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14230: 14230<br />
  IGT_8670: 8670</p>

</body>
</html>

--===============8653372820586100251==--
