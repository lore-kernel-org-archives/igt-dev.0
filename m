Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B96C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 19:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30A91124EE;
	Mon,  4 Mar 2024 19:27:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15A61124EE;
 Mon,  4 Mar 2024 19:27:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8090011238169111789=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_HAX=3Alib/igt=5Ffb=3A_Fix_C?=
 =?utf-8?q?CS_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Mar 2024 19:27:55 -0000
Message-ID: <170958047572.503981.4883860646118548107@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304060903.3184524-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240304060903.3184524-1-bhanuprakash.modem@intel.com>
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

--===============8090011238169111789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: HAX:lib/igt_fb: Fix CCS tests
URL   : https://patchwork.freedesktop.org/series/130648/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14382 -> IGTPW_10767
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_10767 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10767, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/index.html

Participating hosts (41 -> 39)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (3): fi-cfl-8109u fi-snb-2520m bat-arls-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10767:

### IGT changes ###

#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arls-2:         [SKIP][1] ([i915#10202]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  
Known issues
------------

  Here are the changes found in IGTPW_10767 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][3] ([i915#9318])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1849])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][5] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][6] ([fdo#109271]) +43 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][8] -> [ABORT][9] ([i915#7911])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [PASS][10] -> [DMESG-FAIL][11] ([i915#9500])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - fi-elk-e7500:       NOTRUN -> [SKIP][12] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-elk-e7500/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - bat-adlm-1:         NOTRUN -> [SKIP][13] ([i915#9900])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlm-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-pnv-d510/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] ([i915#10295] / [i915#9792])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-mtlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-blb-e6850/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - bat-atsm-1:         NOTRUN -> [SKIP][17] ([i915#6078])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-atsm-1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-y-ccs:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][18] ([fdo#109271]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-kbl-7567u/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-y-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - bat-jsl-3:          NOTRUN -> [SKIP][19] ([i915#9596]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-jsl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-mc-ccs:
    - bat-adln-1:         NOTRUN -> [SKIP][20] ([i915#8709]) +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adln-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs:
    - bat-adlp-6:         NOTRUN -> [SKIP][21] ([i915#8709] / [i915#9596]) +11 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][22] ([i915#8709]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][23] ([fdo#109271]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-cfl-8700k/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs:
    - bat-dg2-11:         NOTRUN -> [SKIP][24] ([i915#8709]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs.html
    - bat-dg2-14:         NOTRUN -> [SKIP][25] ([i915#8709]) +11 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear:
    - fi-ilk-650:         NOTRUN -> [SKIP][26] ([fdo#109271]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-ilk-650/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-4-rc-ccs:
    - bat-dg2-9:          NOTRUN -> [SKIP][27] ([i915#8709]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-4-rc-ccs-cc:
    - bat-dg2-8:          NOTRUN -> [SKIP][28] ([i915#8709]) +11 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear:
    - fi-apl-guc:         NOTRUN -> [SKIP][29] ([fdo#109271]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-apl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-y-mc-ccs:
    - bat-adlp-9:         NOTRUN -> [SKIP][30] ([i915#8709] / [i915#9596]) +11 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-y-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs:
    - bat-mtlp-8:         NOTRUN -> [SKIP][31] ([i915#8709]) +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - fi-rkl-11600:       NOTRUN -> [SKIP][32] ([i915#8709]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-rkl-11600/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-ccs:
    - fi-skl-guc:         NOTRUN -> [SKIP][33] ([fdo#109271]) +13 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-skl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear:
    - fi-ivb-3770:        NOTRUN -> [SKIP][34] ([fdo#109271]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-ivb-3770/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y:
    - bat-rplp-1:         NOTRUN -> [DMESG-WARN][35] ([i915#2017]) +1 other test dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs:
    - bat-jsl-1:          NOTRUN -> [SKIP][36] ([i915#9596]) +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-jsl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:
    - fi-cfl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-cfl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-linear:
    - fi-glk-j4005:       NOTRUN -> [SKIP][38] ([fdo#109271]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-glk-j4005/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-linear.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][39] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-nick/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-linear.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][40] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-n3050/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs:
    - bat-dg1-7:          NOTRUN -> [SKIP][41] ([i915#8709]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg1-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs:
    - bat-arls-2:         NOTRUN -> [SKIP][42] ([i915#8709]) +11 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-arls-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc:
    - bat-rplp-1:         NOTRUN -> [SKIP][43] ([i915#8709]) +11 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - bat-arls-1:         NOTRUN -> [SKIP][44] ([i915#8709]) +11 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-arls-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][45] ([i915#4103]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][46] ([i915#3555] / [i915#3840])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - fi-kbl-guc:         NOTRUN -> [SKIP][47] ([fdo#109271]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-kbl-guc/igt@kms_flip_tiling@flip-change-tiling.html
    - bat-adlm-1:         NOTRUN -> [SKIP][48] ([i915#3555])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlm-1/igt@kms_flip_tiling@flip-change-tiling.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][49] ([i915#3555] / [i915#8828] / [i915#9792])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-mtlp-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-x-to-4:
    - bat-dg2-14:         NOTRUN -> [FAIL][50] ([i915#6199]) +29 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-14/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-x-to-4.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][51] ([fdo#109285])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_plane@pixel-format:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][52] ([fdo#109271]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-kbl-x1275/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format-source-clamping:
    - bat-mtlp-6:         NOTRUN -> [SKIP][53] ([i915#8825] / [i915#9792]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-mtlp-6/igt@kms_plane@pixel-format-source-clamping.html
    - bat-atsm-1:         NOTRUN -> [SKIP][54] ([i915#1836]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-atsm-1/igt@kms_plane@pixel-format-source-clamping.html
    - bat-adlm-1:         NOTRUN -> [SKIP][55] ([i915#8825]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlm-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-c:
    - fi-bsw-nick:        NOTRUN -> [DMESG-FAIL][56] ([i915#9535]) +1 other test dmesg-fail
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-nick/igt@kms_plane@pixel-format-source-clamping@pipe-c.html
    - fi-bsw-n3050:       NOTRUN -> [DMESG-FAIL][57] ([i915#9535])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-n3050/igt@kms_plane@pixel-format-source-clamping@pipe-c.html

  * igt@kms_plane@pixel-format@pipe-b:
    - fi-glk-j4005:       NOTRUN -> [DMESG-FAIL][58] ([i915#118])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-glk-j4005/igt@kms_plane@pixel-format@pipe-b.html

  * igt@kms_plane@pixel-format@pipe-c:
    - fi-bsw-n3050:       NOTRUN -> [DMESG-FAIL][59] ([i915#9535] / [i915#9970])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-n3050/igt@kms_plane@pixel-format@pipe-c.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][60] ([i915#9812])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][61] ([i915#9732]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][62] ([i915#3555])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#10026]: https://gitlab.freedesktop.org/drm/intel/issues/10026
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10295]: https://gitlab.freedesktop.org/drm/intel/issues/10295
  [i915#10307]: https://gitlab.freedesktop.org/drm/intel/issues/10307
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6199]: https://gitlab.freedesktop.org/drm/intel/issues/6199
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8825]: https://gitlab.freedesktop.org/drm/intel/issues/8825
  [i915#8828]: https://gitlab.freedesktop.org/drm/intel/issues/8828
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9500]: https://gitlab.freedesktop.org/drm/intel/issues/9500
  [i915#9535]: https://gitlab.freedesktop.org/drm/intel/issues/9535
  [i915#9596]: https://gitlab.freedesktop.org/drm/intel/issues/9596
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9900]: https://gitlab.freedesktop.org/drm/intel/issues/9900
  [i915#9970]: https://gitlab.freedesktop.org/drm/intel/issues/9970


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7745 -> IGTPW_10767

  CI-20190529: 20190529
  CI_DRM_14382: e8bc216572501440efb20e112bb5aa60599f1863 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10767: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/index.html
  IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/index.html

--===============8090011238169111789==
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
<tr><td><b>Series:</b></td><td>HAX:lib/igt_fb: Fix CCS tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130648/">https://patchwork.freedesktop.org/series/130648/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14382 -&gt; IGTPW_10767</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_10767 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10767, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (3): fi-cfl-8109u fi-snb-2520m bat-arls-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10767:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10202">i915#10202</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10767 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +43 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9500">i915#9500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-elk-e7500/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlm-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>)</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-pnv-d510/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-mtlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10295">i915#10295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-blb-e6850/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-atsm-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-y-ccs:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-kbl-7567u/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-y-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-jsl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9596">i915#9596</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-mc-ccs:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adln-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9596">i915#9596</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-cfl-8700k/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-ilk-650/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-4-rc-ccs:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-4-rc-ccs-cc:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-apl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-y-mc-ccs:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-y-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9596">i915#9596</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-rkl-11600/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-ccs:</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-skl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-ivb-3770/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-jsl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9596">i915#9596</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-cfl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-linear:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-glk-j4005/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-nick/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-n3050/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg1-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-arls-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-rc-ccs-cc:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-arls-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-kbl-guc/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlm-1/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-mtlp-6/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8828">i915#8828</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-x-to-4:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-dg2-14/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-x-to-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6199">i915#6199</a>) +29 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-kbl-x1275/igt@kms_plane@pixel-format.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-mtlp-6/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8825">i915#8825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +1 other test skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-atsm-1/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +2 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/bat-adlm-1/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-c:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-nick/igt@kms_plane@pixel-format-source-clamping@pipe-c.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9535">i915#9535</a>) +1 other test dmesg-fail</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-n3050/igt@kms_plane@pixel-format-source-clamping@pipe-c.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9535">i915#9535</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-glk-j4005/igt@kms_plane@pixel-format@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-c:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-bsw-n3050/igt@kms_plane@pixel-format@pipe-c.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9535">i915#9535</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9970">i915#9970</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7745 -&gt; IGTPW_10767</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14382: e8bc216572501440efb20e112bb5aa60599f1863 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10767: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10767/index.html<br />
  IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8090011238169111789==--
