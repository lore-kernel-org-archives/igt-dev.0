Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C512EE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 10:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8352B10E490;
	Thu, 19 Dec 2024 10:36:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8594F10E490;
 Thu, 19 Dec 2024 10:36:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2Cv1=2C1/2=5D_lib/igt=5Fkms=3A_Add_support_to_retrieve_async?=
 =?utf-8?q?_modifiers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Dec 2024 10:36:29 -0000
Message-ID: <173460458953.387451.2371034275257530631@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217064413.2301301-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241217064413.2301301-1-santhosh.reddy.guddati@intel.com>
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

== Series Details ==

Series: series starting with [i-g-t,v1,1/2] lib/igt_kms: Add support to retrieve async modifiers (rev2)
URL   : https://patchwork.freedesktop.org/series/142693/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8165 -> IGTPW_12352
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12352 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12352, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12352:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-14:         [PASS][1] -> [FAIL][2] +30 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-14/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-14/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-nick:        [PASS][3] -> [FAIL][4] +12 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
    - bat-kbl-2:          [PASS][5] -> [FAIL][6] +13 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-kbl-2/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-kbl-2/igt@i915_pm_rpm@module-reload.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - bat-jsl-3:          [PASS][7] -> [FAIL][8] +38 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-jsl-3/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-jsl-3/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - fi-hsw-4770:        [PASS][9] -> [FAIL][10] +33 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - bat-mtlp-8:         [PASS][11] -> [FAIL][12] +35 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - fi-kbl-guc:         [PASS][13] -> [FAIL][14] +13 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-kbl-guc/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-kbl-guc/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-kbl-x1275:       [PASS][15] -> [FAIL][16] +13 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-adlp-11:        [PASS][17] -> [FAIL][18] +12 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg1-6:          [PASS][19] -> [FAIL][20] +12 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-arlh-3:         [PASS][21] -> [FAIL][22] +35 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-dg1-7:          [PASS][23] -> [FAIL][24] +31 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - fi-glk-j4005:       [PASS][25] -> [FAIL][26] +33 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-glk-j4005/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-glk-j4005/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-adlp-9:         [PASS][27] -> [FAIL][28] +33 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-9/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-9/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-arls-5:         [PASS][29] -> [FAIL][30] +11 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-arlh-2:         [PASS][31] -> [FAIL][32] +10 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-high:
    - bat-rpls-4:         [PASS][33] -> [FAIL][34] +33 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-rpls-4/igt@kms_addfb_basic@too-high.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-rpls-4/igt@kms_addfb_basic@too-high.html
    - fi-cfl-8109u:       [PASS][35] -> [FAIL][36] +33 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html

  * igt@kms_addfb_basic@too-wide:
    - bat-mtlp-6:         [PASS][37] -> [FAIL][38] +11 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@kms_addfb_basic@too-wide.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@kms_addfb_basic@too-wide.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - bat-dg2-13:         [PASS][39] -> [FAIL][40] +5 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-blb-e6850:       [PASS][41] -> [FAIL][42] +26 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-ivb-3770:        [PASS][43] -> [FAIL][44] +30 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-elk-e7500:       [PASS][45] -> [FAIL][46] +30 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-8:          [PASS][47] -> [FAIL][48] +31 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-ilk-650:         [PASS][49] -> [FAIL][50] +30 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-cfl-guc:         [PASS][51] -> [FAIL][52] +33 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-cfl-8700k:       [PASS][53] -> [FAIL][54] +33 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adls-6:         [PASS][55] -> [FAIL][56] +33 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html
    - bat-adlm-1:         [PASS][57] -> [FAIL][58] +13 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html
    - bat-jsl-1:          [PASS][59] -> [FAIL][60] +38 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-jsl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - fi-rkl-11600:       [PASS][61] -> [FAIL][62] +33 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-rplp-1:         [PASS][63] -> [FAIL][64] +33 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html
    - fi-tgl-1115g4:      [PASS][65] -> [FAIL][66] +33 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-twl-2:          [PASS][67] -> [FAIL][68] +38 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
    - bat-dg2-11:         [PASS][69] -> [FAIL][70] +30 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][71] -> [FAIL][72] +33 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-twl-1:          [PASS][73] -> [FAIL][74] +38 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-8809g:       [PASS][75] -> [FAIL][76] +13 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-apl-1:          [PASS][77] -> [FAIL][78] +31 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-skl-6600u:       [PASS][79] -> [FAIL][80] +37 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-blb-e6850:       [SKIP][81] -> [FAIL][82] +14 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-6:         [SKIP][83] ([i915#5190] / [i915#9792]) -> [FAIL][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-11:         [SKIP][85] ([i915#5190]) -> [FAIL][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-14:         [SKIP][87] ([i915#5190]) -> [FAIL][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-hsw-4770:        [SKIP][89] ([i915#5190]) -> [FAIL][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-8:         [SKIP][91] ([i915#5190]) -> [FAIL][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-8:          [SKIP][93] ([i915#5190]) -> [FAIL][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arlh-3:         [SKIP][95] ([i915#11666] / [i915#12203]) -> [FAIL][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arls-5:         [SKIP][97] ([i915#10200] / [i915#12203]) -> [FAIL][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arlh-2:         [SKIP][99] ([i915#10200] / [i915#11346] / [i915#11666] / [i915#12203]) -> [FAIL][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - bat-arlh-2:         [SKIP][101] ([i915#10200] / [i915#11346] / [i915#11666]) -> [FAIL][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-arlh-3:         [SKIP][103] ([i915#11666]) -> [FAIL][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg1-7:          [SKIP][105] ([i915#4212]) -> [FAIL][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-arls-5:         [SKIP][107] ([i915#10200]) -> [FAIL][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-mtlp-6:         [SKIP][109] ([i915#4212] / [i915#9792]) -> [FAIL][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg1-6:          [SKIP][111] ([i915#12311] / [i915#4212]) -> [FAIL][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg2-11:         [SKIP][113] ([i915#4212]) -> [FAIL][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg2-14:         [SKIP][115] ([i915#4212]) -> [FAIL][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-mtlp-8:         [SKIP][117] ([i915#4212]) -> [FAIL][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg2-8:          [SKIP][119] ([i915#4212]) -> [FAIL][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_busy@basic:
    - bat-dg1-6:          [SKIP][121] ([i915#12311] / [i915#4303]) -> [FAIL][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-6/igt@kms_busy@basic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-6/igt@kms_busy@basic.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - bat-dg2-13:         [SKIP][123] ([Intel XE#484] / [i915#4550]) -> [FAIL][124] +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-13/igt@kms_chamelium_edid@vga-edid-read.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-13/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - bat-dg2-13:         [FAIL][125] ([i915#12440]) -> [FAIL][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-twl-2:          [SKIP][127] ([i915#11030] / [i915#11731]) -> [FAIL][128] +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-dg2-11:         [SKIP][129] ([i915#4103] / [i915#4213]) -> [FAIL][130] +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      [SKIP][131] ([i915#4103]) -> [FAIL][132] +1 other test fail
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-14:         [SKIP][133] ([i915#4103] / [i915#4213]) -> [FAIL][134] +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-3:          [SKIP][135] ([i915#4103]) -> [FAIL][136] +1 other test fail
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-mtlp-8:         [SKIP][137] ([i915#4213]) -> [FAIL][138] +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-8:          [SKIP][139] ([i915#4103] / [i915#4213]) -> [FAIL][140] +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adls-6:         [SKIP][141] ([i915#4103]) -> [FAIL][142] +1 other test fail
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-1:          [SKIP][143] ([i915#4103]) -> [FAIL][144] +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-arlh-3:         [SKIP][145] ([i915#11731]) -> [FAIL][146] +1 other test fail
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg1-7:          [SKIP][147] ([i915#4103] / [i915#4213]) -> [FAIL][148] +1 other test fail
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adlp-9:         [SKIP][149] ([i915#4103]) -> [FAIL][150] +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-rpls-4:         [SKIP][151] ([i915#4103]) -> [FAIL][152] +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-twl-1:          [SKIP][153] ([i915#11030] / [i915#11731]) -> [FAIL][154] +1 other test fail
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-rplp-1:         [SKIP][155] ([i915#4103] / [i915#4213]) -> [FAIL][156] +1 other test fail
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-rkl-11600:       [SKIP][157] ([i915#4103]) -> [FAIL][158] +1 other test fail
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-mtlp-6:         [SKIP][159] ([i915#9792]) -> [FAIL][160] +16 other tests fail
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlm-1:         [SKIP][161] ([i915#9900]) -> [FAIL][162] +16 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-kbl-guc:         [SKIP][163] -> [FAIL][164] +27 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-dg1-6:          [SKIP][165] ([i915#12311]) -> [FAIL][166] +16 other tests fail
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-rpls-4:         [SKIP][167] ([i915#3555] / [i915#3840] / [i915#9886]) -> [FAIL][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-rpls-4/igt@kms_dsc@dsc-basic.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-rpls-4/igt@kms_dsc@dsc-basic.html
    - fi-kbl-7567u:       [SKIP][169] -> [FAIL][170] +7 other tests fail
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
    - bat-twl-1:          [SKIP][171] ([i915#9886]) -> [FAIL][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-twl-1/igt@kms_dsc@dsc-basic.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-twl-1/igt@kms_dsc@dsc-basic.html
    - fi-kbl-8809g:       [SKIP][173] -> [FAIL][174] +27 other tests fail
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html
    - bat-apl-1:          [SKIP][175] -> [FAIL][176] +8 other tests fail
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-apl-1/igt@kms_dsc@dsc-basic.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-apl-1/igt@kms_dsc@dsc-basic.html
    - bat-arls-5:         [SKIP][177] ([i915#12732]) -> [FAIL][178] +16 other tests fail
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@kms_dsc@dsc-basic.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@kms_dsc@dsc-basic.html
    - bat-rplp-1:         [SKIP][179] ([i915#3555] / [i915#3840]) -> [FAIL][180]
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-rplp-1/igt@kms_dsc@dsc-basic.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-rplp-1/igt@kms_dsc@dsc-basic.html
    - fi-rkl-11600:       [SKIP][181] ([i915#3555] / [i915#3840]) -> [FAIL][182]
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
    - fi-tgl-1115g4:      [SKIP][183] ([i915#3555] / [i915#3840]) -> [FAIL][184]
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
    - fi-cfl-8109u:       [SKIP][185] -> [FAIL][186] +7 other tests fail
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-cfl-8109u/igt@kms_dsc@dsc-basic.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-cfl-8109u/igt@kms_dsc@dsc-basic.html
    - fi-skl-6600u:       [SKIP][187] -> [FAIL][188] +3 other tests fail
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-skl-6600u/igt@kms_dsc@dsc-basic.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-skl-6600u/igt@kms_dsc@dsc-basic.html
    - bat-jsl-3:          [SKIP][189] ([i915#3555] / [i915#9886]) -> [FAIL][190]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-jsl-3/igt@kms_dsc@dsc-basic.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-jsl-3/igt@kms_dsc@dsc-basic.html
    - bat-twl-2:          [SKIP][191] ([i915#9886]) -> [FAIL][192]
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-twl-2/igt@kms_dsc@dsc-basic.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-twl-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-11:         [SKIP][193] ([i915#3555] / [i915#3840]) -> [FAIL][194]
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-11/igt@kms_dsc@dsc-basic.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-11/igt@kms_dsc@dsc-basic.html
    - bat-dg2-14:         [SKIP][195] ([i915#3555] / [i915#3840]) -> [FAIL][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-14/igt@kms_dsc@dsc-basic.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-8:         [SKIP][197] ([i915#3555] / [i915#3840] / [i915#9159]) -> [FAIL][198]
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         [SKIP][199] ([i915#3555] / [i915#3840]) -> [FAIL][200]
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adls-6/igt@kms_dsc@dsc-basic.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          [SKIP][201] ([i915#3555] / [i915#9886]) -> [FAIL][202]
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-jsl-1/igt@kms_dsc@dsc-basic.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-jsl-1/igt@kms_dsc@dsc-basic.html
    - bat-arlh-3:         [SKIP][203] ([i915#9886]) -> [FAIL][204]
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-3/igt@kms_dsc@dsc-basic.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-3/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          [SKIP][205] ([i915#3555] / [i915#3840]) -> [FAIL][206]
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-7/igt@kms_dsc@dsc-basic.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-7/igt@kms_dsc@dsc-basic.html
    - bat-adlp-9:         [SKIP][207] ([i915#3555] / [i915#3840]) -> [FAIL][208]
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-9/igt@kms_dsc@dsc-basic.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-mtlp-6:         [SKIP][209] ([i915#3637] / [i915#9792]) -> [FAIL][210] +3 other tests fail
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-adlp-11:        [SKIP][211] ([i915#3637]) -> [FAIL][212] +3 other tests fail
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-dg1-6:          [SKIP][213] ([i915#12311] / [i915#3637]) -> [FAIL][214] +2 other tests fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlm-1:         [SKIP][215] ([i915#3637] / [i915#9900]) -> [FAIL][216] +3 other tests fail
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlm-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlm-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-arls-5:         [SKIP][217] ([i915#3637]) -> [FAIL][218] +3 other tests fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-11:        [SKIP][219] ([i915#4342] / [i915#5354]) -> [FAIL][220]
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg1-6:          [SKIP][221] ([i915#12311] / [i915#4342]) -> [FAIL][222]
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html
    - bat-mtlp-6:         [SKIP][223] ([i915#4342] / [i915#5354] / [i915#9792]) -> [FAIL][224]
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlm-1:         [SKIP][225] ([i915#1849] / [i915#4342] / [i915#9900]) -> [FAIL][226]
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html
    - bat-arls-5:         [SKIP][227] ([i915#4342] / [i915#5354]) -> [FAIL][228]
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - fi-hsw-4770:        [SKIP][229] -> [FAIL][230] +2 other tests fail
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-kbl-x1275:       [SKIP][231] -> [FAIL][232] +27 other tests fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html
    - bat-adlp-11:        [SKIP][233] ([i915#10470]) -> [FAIL][234] +16 other tests fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        [SKIP][235] -> [FAIL][236] +28 other tests fail
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-kbl-2:          [SKIP][237] -> [FAIL][238] +27 other tests fail
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-11:         [SKIP][239] ([i915#5354]) -> [FAIL][240]
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-14:         [SKIP][241] ([i915#5354]) -> [FAIL][242]
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-8:          [SKIP][243] ([i915#5354]) -> [FAIL][244]
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlm-1:         [SKIP][245] ([i915#5354] / [i915#9900]) -> [FAIL][246]
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlp-9:         [SKIP][247] ([i915#9812]) -> [FAIL][248]
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html
    - bat-adls-6:         [SKIP][249] ([i915#5354]) -> [FAIL][250]
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-arls-5:         [SKIP][251] ([i915#9812]) -> [FAIL][252]
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][253] ([i915#5354]) -> [FAIL][254]
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-7:          [SKIP][255] ([i915#5354]) -> [FAIL][256]
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
    - bat-rpls-4:         [SKIP][257] ([i915#5354]) -> [FAIL][258]
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html
    - fi-tgl-1115g4:      [SKIP][259] ([i915#9812]) -> [FAIL][260]
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
    - bat-mtlp-6:         [SKIP][261] ([i915#5354] / [i915#9792]) -> [FAIL][262]
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlp-11:        [SKIP][263] ([i915#9812]) -> [FAIL][264]
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-6:          [SKIP][265] ([i915#12311] / [i915#5354]) -> [FAIL][266]
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-ilk-650:         [SKIP][267] -> [FAIL][268] +10 other tests fail
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - fi-ivb-3770:        [SKIP][269] -> [FAIL][270] +10 other tests fail
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-ivb-3770/igt@kms_pm_rpm@basic-rte.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-ivb-3770/igt@kms_pm_rpm@basic-rte.html
    - fi-elk-e7500:       [SKIP][271] -> [FAIL][272] +10 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-elk-e7500/igt@kms_pm_rpm@basic-rte.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-elk-e7500/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-cfl-guc:         [SKIP][273] -> [FAIL][274] +7 other tests fail
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
    - bat-mtlp-6:         [SKIP][275] ([i915#1072] / [i915#9732] / [i915#9792]) -> [FAIL][276] +3 other tests fail
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-mtlp-8:         [SKIP][277] ([i915#4077] / [i915#9688]) -> [FAIL][278]
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-adls-6:         [SKIP][279] ([i915#1072] / [i915#9732]) -> [FAIL][280] +3 other tests fail
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-arlh-3:         [SKIP][281] ([i915#12637]) -> [FAIL][282]
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-dg1-7:          [SKIP][283] ([i915#1072] / [i915#9732]) -> [FAIL][284] +3 other tests fail
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
    - fi-glk-j4005:       [SKIP][285] -> [FAIL][286] +7 other tests fail
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
    - bat-adlp-9:         [SKIP][287] ([i915#1072] / [i915#9732]) -> [FAIL][288] +3 other tests fail
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html
    - bat-rpls-4:         [SKIP][289] ([i915#1072] / [i915#9732]) -> [FAIL][290] +3 other tests fail
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html
    - bat-arls-5:         [SKIP][291] ([i915#9732]) -> [FAIL][292] +3 other tests fail
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html
    - bat-rplp-1:         [SKIP][293] ([i915#1072] / [i915#9732]) -> [FAIL][294] +3 other tests fail
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html
    - bat-arlh-2:         [SKIP][295] ([i915#11346]) -> [FAIL][296] +27 other tests fail
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html
    - fi-rkl-11600:       [SKIP][297] ([i915#1072] / [i915#9732]) -> [FAIL][298] +3 other tests fail
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html
    - bat-adlp-11:        [SKIP][299] ([i915#1072] / [i915#9732]) -> [FAIL][300] +3 other tests fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html
    - bat-dg1-6:          [SKIP][301] ([i915#1072] / [i915#12311] / [i915#9732]) -> [FAIL][302] +3 other tests fail
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html
    - fi-tgl-1115g4:      [SKIP][303] ([i915#9732]) -> [FAIL][304] +3 other tests fail
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-11:         [SKIP][305] ([i915#1072] / [i915#9732]) -> [FAIL][306] +3 other tests fail
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-cfl-8700k:       [SKIP][307] -> [FAIL][308] +7 other tests fail
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-14:         [SKIP][309] ([i915#1072] / [i915#9732]) -> [FAIL][310] +3 other tests fail
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-hsw-4770:        [SKIP][311] ([i915#1072]) -> [FAIL][312] +3 other tests fail
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-8:          [SKIP][313] ([i915#1072] / [i915#9732]) -> [FAIL][314] +3 other tests fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-adlm-1:         [SKIP][315] ([i915#1072] / [i915#9732] / [i915#9900]) -> [FAIL][316] +3 other tests fail
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-11:         [SKIP][317] ([i915#3708]) -> [FAIL][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-14:         [SKIP][319] ([i915#3708]) -> [FAIL][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-8:          [SKIP][321] ([i915#3708]) -> [FAIL][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
    - bat-adlm-1:         [SKIP][323] ([i915#3708] / [i915#9900]) -> [FAIL][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html
    - bat-arls-5:         [SKIP][325] ([i915#12732] / [i915#3708]) -> [FAIL][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@prime_vgem@basic-fence-flip.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@prime_vgem@basic-fence-flip.html
    - bat-dg1-7:          [SKIP][327] ([i915#3708]) -> [FAIL][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
    - bat-mtlp-6:         [SKIP][329] ([i915#3708] / [i915#9792]) -> [FAIL][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html
    - bat-adlp-11:        [SKIP][331] ([i915#10470] / [i915#3708]) -> [FAIL][332]
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html
    - bat-dg1-6:          [SKIP][333] ([i915#12311] / [i915#3708]) -> [FAIL][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-dg1-6/igt@prime_vgem@basic-fence-flip.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-dg1-6/igt@prime_vgem@basic-fence-flip.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - {bat-mtlp-9}:       [SKIP][335] ([i915#5190]) -> [FAIL][336]
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - {bat-arls-6}:       [SKIP][337] ([i915#10200] / [i915#12203]) -> [FAIL][338]
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - {bat-mtlp-9}:       [SKIP][339] ([i915#4212]) -> [FAIL][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - {bat-arls-6}:       [SKIP][341] ([i915#10200]) -> [FAIL][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@small-bo:
    - {bat-arls-6}:       [PASS][343] -> [FAIL][344] +31 other tests fail
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-6/igt@kms_addfb_basic@small-bo.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-6/igt@kms_addfb_basic@small-bo.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - {bat-arls-6}:       [SKIP][345] ([i915#10202]) -> [FAIL][346] +1 other test fail
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {bat-mtlp-9}:       [SKIP][347] ([i915#4213]) -> [FAIL][348] +1 other test fail
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - {bat-mtlp-9}:       [PASS][349] -> [FAIL][350] +35 other tests fail
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - {bat-mtlp-9}:       [SKIP][351] ([i915#3555] / [i915#3840] / [i915#9159]) -> [FAIL][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
    - {bat-arls-6}:       [SKIP][353] ([i915#9886]) -> [FAIL][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-6/igt@kms_dsc@dsc-basic.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_pm_backlight@basic-brightness:
    - {bat-arls-6}:       [SKIP][355] ([i915#9812]) -> [FAIL][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - {bat-mtlp-9}:       [SKIP][357] ([i915#4077] / [i915#9688]) -> [FAIL][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html
    - {bat-arls-6}:       [SKIP][359] ([i915#9732]) -> [FAIL][360] +3 other tests fail
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_12352 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][361] -> [ABORT][362] ([i915#12061]) +1 other test abort
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-8/igt@i915_selftest@live.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-arls-5:         NOTRUN -> [ABORT][363] ([i915#12061])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][364] -> [ABORT][365] ([i915#12061])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][366] ([i915#12904]) -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-apl-1/igt@dmabuf@all-tests.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [ABORT][368] ([i915#12061]) -> [PASS][369] +1 other test pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8165/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11731]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12440]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12440
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#12732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
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
  [i915#4550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8165 -> IGTPW_12352
  * Linux: CI_DRM_15867 -> CI_DRM_15868

  CI-20190529: 20190529
  CI_DRM_15867: f0dab21571bf17512904e5c395817305acaa351a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15868: 4d485df56628d613cca2abc4b8043e9b3bc2b5be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12352: abfecf75e0b6c6d358c0ccb213533a8f2debe44d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8165: 4d630db8b8cfbccd2b871e5084e5c039c374fb14 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12352/index.html
