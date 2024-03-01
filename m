Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AB9C5478C
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 22:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D214F10ED0F;
	Fri,  1 Mar 2024 22:04:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735FD10ED0E;
 Fri,  1 Mar 2024 22:04:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0363394495309435077=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Add_tests_for_solid_fill_pl?=
 =?utf-8?q?anes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 01 Mar 2024 22:04:40 -0000
Message-ID: <170933068046.453379.7408935229110145796@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
In-Reply-To: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
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

--===============0363394495309435077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tests for solid fill planes (rev3)
URL   : https://patchwork.freedesktop.org/series/127900/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14378 -> IGTPW_10765
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10765 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10765, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): bat-kbl-2 bat-jsl-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10765:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-14:         [PASS][1] -> [FAIL][2] +18 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-nick:        [PASS][3] -> [FAIL][4] +21 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
    - bat-adlp-6:         [PASS][5] -> [FAIL][6] +21 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
    - fi-rkl-11600:       [PASS][7] -> [FAIL][8] +21 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-dg2-9:          NOTRUN -> [ABORT][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@slpc:
    - bat-dg2-14:         NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@i915_selftest@live@slpc.html

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - fi-apl-guc:         [PASS][11] -> [FAIL][12] +20 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - bat-jsl-3:          [PASS][13] -> [FAIL][14] +21 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-jsl-3/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-jsl-3/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - bat-dg2-9:          [PASS][15] -> [FAIL][16] +15 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-kbl-x1275:       [PASS][17] -> [FAIL][18] +13 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - fi-pnv-d510:        [PASS][19] -> [FAIL][20] +15 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-pnv-d510/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-pnv-d510/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - fi-blb-e6850:       [PASS][21] -> [FAIL][22] +15 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-blb-e6850/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-blb-e6850/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@size-max:
    - fi-cfl-guc:         [PASS][23] -> [FAIL][24] +21 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-guc/igt@kms_addfb_basic@size-max.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-guc/igt@kms_addfb_basic@size-max.html

  * igt@kms_addfb_basic@small-bo:
    - fi-skl-6600u:       [PASS][25] -> [FAIL][26] +21 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-skl-6600u/igt@kms_addfb_basic@small-bo.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-6600u/igt@kms_addfb_basic@small-bo.html

  * igt@kms_addfb_basic@too-high:
    - fi-cfl-8109u:       [PASS][27] -> [FAIL][28] +21 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html
    - fi-cfl-8700k:       [PASS][29] -> [FAIL][30] +21 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-8700k/igt@kms_addfb_basic@too-high.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8700k/igt@kms_addfb_basic@too-high.html
    - fi-ivb-3770:        [PASS][31] -> [FAIL][32] +19 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-ivb-3770/igt@kms_addfb_basic@too-high.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ivb-3770/igt@kms_addfb_basic@too-high.html

  * igt@kms_addfb_basic@too-wide:
    - bat-arls-1:         [PASS][33] -> [FAIL][34] +18 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_addfb_basic@too-wide.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_addfb_basic@too-wide.html
    - bat-mtlp-6:         [PASS][35] -> [FAIL][36] +11 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_addfb_basic@too-wide.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_addfb_basic@too-wide.html

  * igt@kms_busy@basic:
    - fi-ivb-3770:        NOTRUN -> [FAIL][37] +11 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ivb-3770/igt@kms_busy@basic.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][38] +16 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_busy@basic.html
    - bat-dg2-8:          NOTRUN -> [FAIL][39] +12 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_busy@basic.html
    - fi-ilk-650:         NOTRUN -> [FAIL][40] +11 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ilk-650/igt@kms_busy@basic.html
    - bat-arls-1:         NOTRUN -> [FAIL][41] +11 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_busy@basic.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - bat-dg2-13:         [PASS][42] -> [FAIL][43] +3 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-rplp-1:         [PASS][44] -> [FAIL][45] +21 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-tgl-1115g4:      [PASS][46] -> [FAIL][47] +21 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-glk-j4005:       [PASS][48] -> [FAIL][49] +21 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-adlp-9:         [PASS][50] -> [FAIL][51] +21 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-skl-guc:         [PASS][52] -> [FAIL][53] +21 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-skl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-11:         [PASS][54] -> [FAIL][55] +18 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-mtlp-8:         [PASS][56] -> [FAIL][57] +19 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - fi-elk-e7500:       [PASS][58] -> [FAIL][59] +18 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - bat-dg2-8:          [PASS][60] -> [FAIL][61] +18 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-cfl-guc:         NOTRUN -> [FAIL][62] +11 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][63] +11 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][64] +11 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-blb-e6850/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - bat-jsl-3:          NOTRUN -> [FAIL][65] +16 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-jsl-3/igt@kms_flip@basic-plain-flip.html
    - bat-adln-1:         NOTRUN -> [FAIL][66] +16 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@kms_flip@basic-plain-flip.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][67] +11 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-elk-e7500/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adlm-1:         [PASS][68] -> [FAIL][69] +13 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html
    - fi-ilk-650:         [PASS][70] -> [FAIL][71] +19 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-ilk-650/igt@kms_force_connector_basic@force-connector-state.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ilk-650/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-2:         [PASS][72] -> [FAIL][73] +19 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - fi-rkl-11600:       NOTRUN -> [FAIL][74] +11 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][75] +16 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-rplp-1:         NOTRUN -> [FAIL][76] +12 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][77] +11 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-apl-guc:         NOTRUN -> [FAIL][78] +11 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][79] +11 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-dg1-7:          NOTRUN -> [FAIL][80] +11 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][81] +11 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-glk-j4005/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [FAIL][82] +11 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
    - fi-skl-guc:         NOTRUN -> [FAIL][83] +11 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
    - bat-dg2-11:         NOTRUN -> [FAIL][84] +11 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][85] +11 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       NOTRUN -> [FAIL][86] +11 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
    - bat-arls-2:         NOTRUN -> [FAIL][87] +16 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-14:         NOTRUN -> [FAIL][88] +11 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][89] +11 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adlp-6:         NOTRUN -> [FAIL][90] +16 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][91] -> [FAIL][92] +21 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-adln-1:         [PASS][93] -> [FAIL][94] +21 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-guc:         [PASS][95] -> [FAIL][96] +13 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-dg1-7:          [PASS][97] -> [FAIL][98] +19 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_pm_rpm@basic-rte.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_pm_rpm@basic-rte.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-9:          NOTRUN -> [FAIL][99] +19 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html

  * igt@vgem_basic@unload:
    - bat-arls-1:         [PASS][100] -> [INCOMPLETE][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@vgem_basic@unload.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@vgem_basic@unload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-blb-e6850:       [SKIP][102] ([fdo#109271]) -> [FAIL][103] +13 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-9:          [SKIP][104] ([i915#5190]) -> [FAIL][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arls-2:         [SKIP][106] ([i915#10200]) -> [FAIL][107] +1 other test fail
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-8:         [SKIP][108] ([i915#5190]) -> [FAIL][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-8:          [SKIP][110] ([i915#5190]) -> [FAIL][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arls-1:         [SKIP][112] ([i915#10200]) -> [FAIL][113] +1 other test fail
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-6:         [SKIP][114] ([i915#5190] / [i915#9792]) -> [FAIL][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-11:         [SKIP][116] ([i915#5190]) -> [FAIL][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-14:         [SKIP][118] ([i915#5190]) -> [FAIL][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - bat-dg1-7:          [SKIP][120] ([i915#4212]) -> [FAIL][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg2-11:         [SKIP][122] ([i915#4212]) -> [FAIL][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg2-14:         [SKIP][124] ([i915#4212]) -> [FAIL][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-mtlp-6:         [SKIP][126] ([i915#4212] / [i915#9792]) -> [FAIL][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg2-9:          [SKIP][128] ([i915#4212]) -> [FAIL][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-mtlp-8:         [SKIP][130] ([i915#4212]) -> [FAIL][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg2-8:          [SKIP][132] ([i915#4212]) -> [FAIL][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - bat-dg2-13:         [SKIP][134] ([Intel XE#484]) -> [FAIL][135] +2 other tests fail
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - bat-dg2-13:         [SKIP][136] ([Intel XE#484] / [i915#4550]) -> [FAIL][137] +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-glk-j4005:       [SKIP][138] ([fdo#109271]) -> [FAIL][139] +7 other tests fail
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-adlp-9:         [SKIP][140] ([i915#4103]) -> [FAIL][141] +1 other test fail
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-dg2-11:         [SKIP][142] ([i915#4103] / [i915#4213]) -> [FAIL][143] +1 other test fail
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-adln-1:         [SKIP][144] ([i915#4213]) -> [FAIL][145] +1 other test fail
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      [SKIP][146] ([i915#4103]) -> [FAIL][147] +1 other test fail
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-14:         [SKIP][148] ([i915#4103] / [i915#4213]) -> [FAIL][149] +1 other test fail
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-rplp-1:         [SKIP][150] ([i915#4103] / [i915#4213]) -> [FAIL][151] +1 other test fail
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-rkl-11600:       [SKIP][152] ([i915#4103]) -> [FAIL][153] +1 other test fail
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-3:          [SKIP][154] ([i915#4103]) -> [FAIL][155] +1 other test fail
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-9:          [SKIP][156] ([i915#4103] / [i915#4213]) -> [FAIL][157] +1 other test fail
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-arls-2:         [SKIP][158] ([i915#10202]) -> [FAIL][159] +1 other test fail
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-mtlp-8:         [SKIP][160] ([i915#4213]) -> [FAIL][161] +1 other test fail
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-8:          [SKIP][162] ([i915#4103] / [i915#4213]) -> [FAIL][163] +1 other test fail
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-arls-1:         [SKIP][164] ([i915#10202]) -> [FAIL][165] +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adlp-6:         [SKIP][166] ([i915#4103]) -> [FAIL][167] +1 other test fail
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-skl-6600u:       [SKIP][168] ([fdo#109271]) -> [FAIL][169] +2 other tests fail
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg1-7:          [SKIP][170] ([i915#4103] / [i915#4213]) -> [FAIL][171] +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-mtlp-6:         [SKIP][172] ([i915#10295] / [i915#9792]) -> [FAIL][173] +16 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlm-1:         [SKIP][174] ([i915#9875] / [i915#9900]) -> [FAIL][175] +16 other tests fail
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-kbl-guc:         [SKIP][176] ([fdo#109271]) -> [FAIL][177] +27 other tests fail
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - fi-skl-guc:         [SKIP][178] ([fdo#109271]) -> [FAIL][179] +7 other tests fail
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-skl-guc/igt@kms_dsc@dsc-basic.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-guc/igt@kms_dsc@dsc-basic.html
    - bat-dg2-11:         [SKIP][180] ([i915#3555] / [i915#3840]) -> [FAIL][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_dsc@dsc-basic.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_dsc@dsc-basic.html
    - fi-kbl-7567u:       [SKIP][182] ([fdo#109271]) -> [FAIL][183] +7 other tests fail
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
    - bat-adln-1:         [SKIP][184] ([i915#3555] / [i915#3840]) -> [FAIL][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adln-1/igt@kms_dsc@dsc-basic.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@kms_dsc@dsc-basic.html
    - fi-cfl-8700k:       [SKIP][186] ([fdo#109271]) -> [FAIL][187] +7 other tests fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-8700k/igt@kms_dsc@dsc-basic.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8700k/igt@kms_dsc@dsc-basic.html
    - bat-dg2-14:         [SKIP][188] ([i915#3555] / [i915#3840]) -> [FAIL][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_dsc@dsc-basic.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - fi-bsw-nick:        [SKIP][190] ([fdo#109271]) -> [FAIL][191] +7 other tests fail
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-bsw-nick/igt@kms_dsc@dsc-basic.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-bsw-nick/igt@kms_dsc@dsc-basic.html
    - bat-rplp-1:         [SKIP][192] ([i915#3555] / [i915#3840]) -> [FAIL][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rplp-1/igt@kms_dsc@dsc-basic.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_dsc@dsc-basic.html
    - fi-rkl-11600:       [SKIP][194] ([i915#3555] / [i915#3840]) -> [FAIL][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
    - fi-tgl-1115g4:      [SKIP][196] ([i915#3555] / [i915#3840]) -> [FAIL][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
    - bat-arls-2:         [SKIP][198] ([i915#9886]) -> [FAIL][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-2/igt@kms_dsc@dsc-basic.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-8:         [SKIP][200] ([i915#3555] / [i915#3840] / [i915#9159]) -> [FAIL][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
    - bat-arls-1:         [SKIP][202] ([i915#9886]) -> [FAIL][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_dsc@dsc-basic.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-6:         [SKIP][204] ([i915#3555] / [i915#3840]) -> [FAIL][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-6/igt@kms_dsc@dsc-basic.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-6/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          [SKIP][206] ([i915#3555] / [i915#3840]) -> [FAIL][207]
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_dsc@dsc-basic.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_dsc@dsc-basic.html
    - bat-jsl-3:          [SKIP][208] ([i915#3555] / [i915#9886]) -> [FAIL][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-jsl-3/igt@kms_dsc@dsc-basic.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-jsl-3/igt@kms_dsc@dsc-basic.html
    - bat-adlp-9:         [SKIP][210] ([i915#3555] / [i915#3840]) -> [FAIL][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_dsc@dsc-basic.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-mtlp-6:         [SKIP][212] ([i915#3637] / [i915#9792]) -> [FAIL][213] +3 other tests fail
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-plain-flip:
    - bat-adlm-1:         [SKIP][214] ([i915#3637]) -> [FAIL][215] +3 other tests fail
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_flip@basic-plain-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlm-1:         [SKIP][216] ([i915#1849] / [i915#4342]) -> [FAIL][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html
    - bat-mtlp-6:         [SKIP][218] ([i915#4342] / [i915#5354] / [i915#9792]) -> [FAIL][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-kbl-x1275:       [SKIP][220] ([fdo#109271]) -> [FAIL][221] +27 other tests fail
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-rkl-11600:       [SKIP][222] ([i915#5354]) -> [FAIL][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
    - fi-apl-guc:         [SKIP][224] ([fdo#109271]) -> [FAIL][225] +7 other tests fail
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-apl-guc/igt@kms_pm_backlight@basic-brightness.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-apl-guc/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-7:          [SKIP][226] ([i915#5354]) -> [FAIL][227]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-11:         [SKIP][228] ([i915#5354]) -> [FAIL][229]
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
    - fi-cfl-8109u:       [SKIP][230] ([fdo#109271]) -> [FAIL][231] +7 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-14:         [SKIP][232] ([i915#5354]) -> [FAIL][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-8:          [SKIP][234] ([i915#5354]) -> [FAIL][235]
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlm-1:         [SKIP][236] ([i915#5354]) -> [FAIL][237]
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html
    - fi-tgl-1115g4:      [SKIP][238] ([i915#9812]) -> [FAIL][239]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
    - bat-arls-1:         [SKIP][240] ([i915#9812]) -> [FAIL][241]
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_pm_backlight@basic-brightness.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_pm_backlight@basic-brightness.html
    - bat-mtlp-6:         [SKIP][242] ([i915#5354] / [i915#9792]) -> [FAIL][243]
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-9:          [SKIP][244] ([i915#5354]) -> [FAIL][245]
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlp-9:         [SKIP][246] ([i915#9812]) -> [FAIL][247]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-ivb-3770:        [SKIP][248] ([fdo#109271]) -> [FAIL][249] +9 other tests fail
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-elk-e7500:       [SKIP][250] ([fdo#109271]) -> [FAIL][251] +10 other tests fail
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ilk-650:         [SKIP][252] ([fdo#109271]) -> [FAIL][253] +9 other tests fail
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-dg2-9:          [ABORT][254] -> [FAIL][255]
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_pm_rpm@basic-pci-d3-state.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-cfl-guc:         [SKIP][256] ([fdo#109271]) -> [FAIL][257] +7 other tests fail
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
    - bat-mtlp-6:         [SKIP][258] ([i915#9673] / [i915#9732] / [i915#9792]) -> [FAIL][259] +3 other tests fail
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html
    - fi-pnv-d510:        [SKIP][260] ([fdo#109271]) -> [FAIL][261] +13 other tests fail
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-arls-1:         [SKIP][262] ([i915#9732]) -> [FAIL][263] +3 other tests fail
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_psr@psr-primary-mmap-gtt.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-dg1-7:          [SKIP][264] ([i915#9732]) -> [FAIL][265] +3 other tests fail
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-adlp-9:         [SKIP][266] ([i915#9673] / [i915#9732]) -> [FAIL][267] +3 other tests fail
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-11:         [SKIP][268] ([i915#9732]) -> [FAIL][269] +3 other tests fail
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-14:         [SKIP][270] ([i915#9732]) -> [FAIL][271] +3 other tests fail
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-rplp-1:         [SKIP][272] ([i915#9673] / [i915#9732]) -> [FAIL][273] +3 other tests fail
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-rkl-11600:       [SKIP][274] ([i915#9732]) -> [FAIL][275] +3 other tests fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-8:          [SKIP][276] ([i915#9673] / [i915#9732]) -> [FAIL][277] +3 other tests fail
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-adlm-1:         [SKIP][278] ([i915#9673] / [i915#9732]) -> [FAIL][279] +3 other tests fail
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-tgl-1115g4:      [SKIP][280] ([i915#9732]) -> [FAIL][281] +3 other tests fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg1-7:          [SKIP][282] ([i915#3708]) -> [FAIL][283]
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-11:         [SKIP][284] ([i915#3708]) -> [FAIL][285]
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-14:         [SKIP][286] ([i915#3708]) -> [FAIL][287]
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-8:          [SKIP][288] ([i915#3708]) -> [FAIL][289]
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
    - bat-adlm-1:         [SKIP][290] ([i915#3708] / [i915#9900]) -> [FAIL][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html
    - bat-mtlp-6:         [SKIP][292] ([i915#3708] / [i915#9792]) -> [FAIL][293]
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - {bat-arls-4}:       [SKIP][294] ([i915#10200]) -> [FAIL][295] +1 other test fail
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@small-bo:
    - {bat-rpls-3}:       [PASS][296] -> [FAIL][297] +21 other tests fail
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_addfb_basic@small-bo.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_addfb_basic@small-bo.html

  * igt@kms_busy@basic:
    - {bat-arls-4}:       NOTRUN -> [FAIL][298] +11 other tests fail
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_busy@basic.html
    - {bat-adls-6}:       NOTRUN -> [FAIL][299] +11 other tests fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {bat-arls-4}:       [SKIP][300] ([i915#10202]) -> [FAIL][301] +1 other test fail
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - {bat-adls-6}:       [SKIP][302] ([i915#4103]) -> [FAIL][303] +1 other test fail
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - {bat-rpls-3}:       [SKIP][304] ([i915#4103]) -> [FAIL][305] +1 other test fail
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - {bat-arls-4}:       [SKIP][306] ([i915#9886]) -> [FAIL][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_dsc@dsc-basic.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_dsc@dsc-basic.html
    - {bat-adls-6}:       [SKIP][308] ([i915#3555] / [i915#3840]) -> [FAIL][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_dsc@dsc-basic.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - {bat-rpls-3}:       [SKIP][310] ([i915#3555] / [i915#3840] / [i915#9886]) -> [FAIL][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_dsc@dsc-basic.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - {bat-rpls-3}:       NOTRUN -> [FAIL][312] +11 other tests fail
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - {bat-adls-6}:       [PASS][313] -> [FAIL][314] +21 other tests fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-arls-4}:       [PASS][315] -> [FAIL][316] +19 other tests fail
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_frontbuffer_tracking@basic.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pm_backlight@basic-brightness:
    - {bat-arls-4}:       [SKIP][317] ([i915#9812]) -> [FAIL][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_pm_backlight@basic-brightness.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_pm_backlight@basic-brightness.html
    - {bat-rpls-3}:       [SKIP][319] ([i915#5354]) -> [FAIL][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_pm_backlight@basic-brightness.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_pm_backlight@basic-brightness.html
    - {bat-adls-6}:       [SKIP][321] ([i915#5354]) -> [FAIL][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-cursor-plane-move:
    - {bat-rpls-3}:       [SKIP][323] ([i915#9673] / [i915#9732]) -> [FAIL][324] +3 other tests fail
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_psr@psr-cursor-plane-move.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - {bat-adls-6}:       [SKIP][325] ([i915#9732]) -> [FAIL][326] +3 other tests fail
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - {bat-arls-4}:       [SKIP][327] ([i915#9732]) -> [FAIL][328] +3 other tests fail
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_psr@psr-sprite-plane-onoff.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_psr@psr-sprite-plane-onoff.html

  
Known issues
------------

  Here are the changes found in IGTPW_10765 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-9:          NOTRUN -> [SKIP][329] ([i915#6621])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@i915_pm_rps@basic-api.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-9:          NOTRUN -> [SKIP][330] ([i915#3555])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-9:          NOTRUN -> [SKIP][331] ([i915#3708] / [i915#4077]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-9:          NOTRUN -> [SKIP][332] ([i915#3291] / [i915#3708]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-adln-1:         [INCOMPLETE][333] ([i915#10241] / [i915#9413]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adln-1/igt@i915_selftest@live@gt_lrc.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@perf:
    - bat-dg2-14:         [ABORT][335] -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@i915_selftest@live@perf.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@i915_selftest@live@perf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10241]: https://gitlab.freedesktop.org/drm/intel/issues/10241
  [i915#10295]: https://gitlab.freedesktop.org/drm/intel/issues/10295
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4550]: https://gitlab.freedesktop.org/drm/intel/issues/4550
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9875]: https://gitlab.freedesktop.org/drm/intel/issues/9875
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
  [i915#9900]: https://gitlab.freedesktop.org/drm/intel/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7742 -> IGTPW_10765

  CI-20190529: 20190529
  CI_DRM_14378: 5f60548dd58e2ad93005c933fd2633d98db60de4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10765: 10765
  IGT_7742: 7742


Testlist changes
----------------

+igt@kms_atomic@plane-cursor-solid-fill
+igt@kms_atomic@plane-primary-solid-fill

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/index.html

--===============0363394495309435077==
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
<tr><td><b>Series:</b></td><td>Add tests for solid fill planes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127900/">https://patchwork.freedesktop.org/series/127900/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14378 -&gt; IGTPW_10765</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10765 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10765, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): bat-kbl-2 bat-jsl-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10765:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@i915_pm_rpm@module-reload.html">FAIL</a> +18 other tests fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">FAIL</a> +21 other tests fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">FAIL</a> +21 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@i915_selftest@live@gt_mocs.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@i915_selftest@live@slpc.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-jsl-3/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-jsl-3/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +21 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-pnv-d510/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-pnv-d510/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-blb-e6850/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-blb-e6850/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-guc/igt@kms_addfb_basic@size-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-guc/igt@kms_addfb_basic@size-max.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-skl-6600u/igt@kms_addfb_basic@small-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-6600u/igt@kms_addfb_basic@small-bo.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html">FAIL</a> +21 other tests fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-8700k/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8700k/igt@kms_addfb_basic@too-high.html">FAIL</a> +21 other tests fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-ivb-3770/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ivb-3770/igt@kms_addfb_basic@too-high.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_addfb_basic@too-wide.html">FAIL</a> +18 other tests fail</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_addfb_basic@too-wide.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ivb-3770/igt@kms_busy@basic.html">FAIL</a> +11 other tests fail</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_busy@basic.html">FAIL</a> +16 other tests fail</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_busy@basic.html">FAIL</a> +12 other tests fail</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ilk-650/igt@kms_busy@basic.html">FAIL</a> +11 other tests fail</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_busy@basic.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +21 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +21 other tests fail</li>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-skl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +21 other tests fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +19 other tests fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +18 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +11 other tests fail</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-blb-e6850/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-jsl-3/igt@kms_flip@basic-plain-flip.html">FAIL</a> +16 other tests fail</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@kms_flip@basic-plain-flip.html">FAIL</a> +16 other tests fail</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-elk-e7500/igt@kms_flip@basic-plain-flip.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +13 other tests fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-ilk-650/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ilk-650/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +11 other tests fail</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html">FAIL</a> +12 other tests fail</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +11 other tests fail</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +11 other tests fail</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +11 other tests fail</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-glk-j4005/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +11 other tests fail</li>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +11 other tests fail</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +11 other tests fail</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +11 other tests fail</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> +11 other tests fail</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +21 other tests fail</li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +21 other tests fail</li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_pm_rpm@basic-rte.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@vgem_basic@unload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4550">i915#4550</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +7 other tests fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10202">i915#10202</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10202">i915#10202</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10295">i915#10295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9875">i915#9875</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-skl-guc/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-skl-guc/igt@kms_dsc@dsc-basic.html">FAIL</a> +7 other tests fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html">FAIL</a> +7 other tests fail</li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adln-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-8700k/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8700k/igt@kms_dsc@dsc-basic.html">FAIL</a> +7 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-bsw-nick/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-bsw-nick/igt@kms_dsc@dsc-basic.html">FAIL</a> +7 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9159">i915#9159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-6/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-jsl-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-jsl-3/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_flip@basic-plain-flip.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-apl-guc/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-apl-guc/igt@kms_pm_backlight@basic-brightness.html">FAIL</a> +7 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">FAIL</a> +7 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +9 other tests fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +10 other tests fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> +9 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-9/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +7 other tests fail</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-1/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-1/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>{bat-arls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10200">i915#10200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_addfb_basic@small-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_addfb_basic@small-bo.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_busy@basic.html">FAIL</a> +11 other tests fail</li>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_busy@basic.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{bat-arls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10202">i915#10202</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>{bat-arls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-arls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>{bat-arls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-rpls-3/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-rpls-3/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>{bat-arls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-arls-4/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-arls-4/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10765 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10241">i915#10241</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14378/bat-dg2-14/igt@i915_selftest@live@perf.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10765/bat-dg2-14/igt@i915_selftest@live@perf.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7742 -&gt; IGTPW_10765</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14378: 5f60548dd58e2ad93005c933fd2633d98db60de4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10765: 10765<br />
  IGT_7742: 7742</p>
<h2>Testlist changes</h2>
<p>+igt@kms_atomic@plane-cursor-solid-fill<br />
+igt@kms_atomic@plane-primary-solid-fill</p>

</body>
</html>

--===============0363394495309435077==--
