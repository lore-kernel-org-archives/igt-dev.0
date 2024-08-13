Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696DEC52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 15:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BC910E383;
	Tue, 13 Aug 2024 15:38:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4FA10E383;
 Tue, 13 Aug 2024 15:38:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8236616590888007043=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Clear_all_KMS_properties_on?=
 =?utf-8?q?_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Aug 2024 15:38:46 -0000
Message-ID: <172356352694.613595.10691613559136429454@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813131520.2715442-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240813131520.2715442-1-bhanuprakash.modem@intel.com>
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

--===============8236616590888007043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Clear all KMS properties on reset
URL   : https://patchwork.freedesktop.org/series/137236/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15224 -> IGTPW_11568
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11568 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11568, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/index.html

Participating hosts (40 -> 39)
------------------------------

  Additional (2): bat-kbl-2 bat-dg2-11 
  Missing    (3): bat-arlh-2 bat-arls-2 fi-kbl-8809g 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11568:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [PASS][1] -> [FAIL][2] +28 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-kbl-7567u/igt@kms_busy@basic@flip.html
    - fi-cfl-8700k:       [PASS][3] -> [FAIL][4] +28 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-cfl-8700k/igt@kms_busy@basic@flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-cfl-8700k/igt@kms_busy@basic@flip.html
    - bat-twl-1:          [PASS][5] -> [FAIL][6] +34 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-twl-1/igt@kms_busy@basic@flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-twl-1/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - bat-dg2-13:         [PASS][7] -> [FAIL][8] +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-bsw-n3050:       [PASS][9] -> [FAIL][10] +17 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
    - bat-adlp-6:         [PASS][11] -> [FAIL][12] +41 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-rplp-1:         [PASS][13] -> [FAIL][14] +36 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-glk-j4005:       [PASS][15] -> [FAIL][16] +29 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-mtlp-8:         [PASS][17] -> [FAIL][18] +40 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - fi-elk-e7500:       [PASS][19] -> [FAIL][20] +22 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2:
    - bat-dg2-11:         NOTRUN -> [FAIL][21] +27 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][22] -> [FAIL][23] +36 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2:
    - bat-dg2-14:         [PASS][24] -> [FAIL][25] +36 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-14/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-14/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1:
    - bat-adlp-9:         [PASS][26] -> [FAIL][27] +36 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-adlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-adlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html
    - bat-apl-1:          [PASS][28] -> [FAIL][29] +4 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2:
    - bat-arls-1:         [PASS][30] -> [FAIL][31] +36 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-arls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-arls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2:
    - fi-cfl-8109u:       [PASS][32] -> [FAIL][33] +28 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1:
    - fi-cfl-guc:         [PASS][34] -> [FAIL][35] +28 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:
    - fi-tgl-1115g4:      [PASS][36] -> [FAIL][37] +36 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:
    - bat-adls-6:         [PASS][38] -> [FAIL][39] +36 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-adls-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-adls-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:
    - bat-dg1-7:          [PASS][40] -> [FAIL][41] +36 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg1-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg1-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:
    - fi-ivb-3770:        [PASS][42] -> [FAIL][43] +28 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-ivb-3770/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-ivb-3770/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3:
    - bat-arls-5:         [PASS][44] -> [FAIL][45] +33 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:
    - fi-pnv-d510:        [PASS][46] -> [FAIL][47] +17 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3:
    - bat-arls-5:         NOTRUN -> [FAIL][48] +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:
    - bat-rpls-4:         [PASS][49] -> [FAIL][50] +36 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - bat-twl-2:          [PASS][51] -> [FAIL][52] +34 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-twl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-twl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:
    - fi-blb-e6850:       [PASS][53] -> [FAIL][54] +17 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
    - fi-rkl-11600:       [PASS][55] -> [FAIL][56] +29 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:
    - fi-ilk-650:         [PASS][57] -> [FAIL][58] +22 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:
    - bat-jsl-1:          [PASS][59] -> [FAIL][60] +34 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-jsl-1/igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-jsl-1/igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adlp-6:         NOTRUN -> [INCOMPLETE][61]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-twl-2:          NOTRUN -> [INCOMPLETE][62]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-twl-2/igt@kms_pm_backlight@basic-brightness.html
    - bat-twl-1:          NOTRUN -> [INCOMPLETE][63]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-twl-1/igt@kms_pm_backlight@basic-brightness.html
    - bat-rplp-1:         NOTRUN -> [INCOMPLETE][64]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-rplp-1/igt@kms_pm_backlight@basic-brightness.html
    - bat-mtlp-8:         NOTRUN -> [INCOMPLETE][65]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-mtlp-8/igt@kms_pm_backlight@basic-brightness.html
    - bat-jsl-1:          NOTRUN -> [INCOMPLETE][66]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-jsl-1/igt@kms_pm_backlight@basic-brightness.html

  
#### Warnings ####

  * igt@kms_busy@basic@flip:
    - bat-apl-1:          [DMESG-WARN][67] ([i915#180] / [i915#1982]) -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_busy@basic@flip.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - bat-dg2-13:         [SKIP][69] ([Intel XE#484]) -> [FAIL][70] +2 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - bat-dg2-13:         [SKIP][71] ([Intel XE#484] / [i915#4550]) -> [FAIL][72] +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-elk-e7500:       [SKIP][73] -> [FAIL][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html
    - bat-apl-1:          [DMESG-WARN][75] ([i915#11621]) -> [FAIL][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - bat-apl-1:          [DMESG-WARN][77] ([i915#11888] / [i915#180]) -> [FAIL][78] +19 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-mtlp-8:         [SKIP][79] ([i915#4077] / [i915#9688]) -> [FAIL][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_11568 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][81] ([i915#1849])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][82] +39 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][83] ([i915#4083])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@gem_mmap@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][84] ([i915#4077]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][85] ([i915#4079]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@gem_tiled_pread_basic.html

  * igt@i915_module_load@load:
    - bat-dg2-9:          [PASS][86] -> [DMESG-WARN][87] ([i915#11548])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-9/igt@i915_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-9/igt@i915_module_load@load.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-11:         NOTRUN -> [SKIP][88] ([i915#11681] / [i915#6621])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][89] ([i915#4212]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][90] ([i915#5190])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][91] ([i915#4215] / [i915#5190])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-dg2-11:         NOTRUN -> [SKIP][92] ([i915#4103] / [i915#4213]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][93] ([i915#3555] / [i915#3840])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-11:         NOTRUN -> [SKIP][94]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-11:         NOTRUN -> [SKIP][95] ([i915#5274])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         NOTRUN -> [SKIP][96] ([i915#9197]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-11:         NOTRUN -> [SKIP][97] ([i915#5354])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-11:         NOTRUN -> [SKIP][98] ([i915#1072] / [i915#9732]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-11:         NOTRUN -> [SKIP][99] ([i915#3555])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-11:         NOTRUN -> [SKIP][100] ([i915#3708])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-11:         NOTRUN -> [SKIP][101] ([i915#3708] / [i915#4077]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - bat-dg2-11:         NOTRUN -> [SKIP][102] ([i915#3291] / [i915#3708]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-apl-1:          [DMESG-WARN][103] ([i915#180] / [i915#1982]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@reload:
    - bat-apl-1:          [DMESG-WARN][105] ([i915#180]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@i915_module_load@reload.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@requests:
    - bat-apl-1:          [DMESG-WARN][107] ([i915#11621]) -> [PASS][108] +57 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@i915_selftest@live@requests.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-apl-1:          [DMESG-WARN][109] ([i915#11378] / [i915#11621]) -> [PASS][110] +19 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - bat-apl-1:          [DMESG-WARN][111] ([i915#11888] / [i915#180]) -> [PASS][112] +13 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - bat-apl-1:          [DMESG-WARN][113] ([i915#11888] / [i915#180] / [i915#1982]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  
  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
  [i915#11548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11548
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11888
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
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
  [i915#4550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7967 -> IGTPW_11568

  CI-20190529: 20190529
  CI_DRM_15224: 924db73e261b7bfd4b70b14db61197f48bf09426 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11568: 11568
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/index.html

--===============8236616590888007043==
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
<tr><td><b>Series:</b></td><td>Clear all KMS properties on reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137236/">https://patchwork.freedesktop.org/series/137236/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15224 -&gt; IGTPW_11568</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11568 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11568, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Additional (2): bat-kbl-2 bat-dg2-11 <br />
  Missing    (3): bat-arlh-2 bat-arls-2 fi-kbl-8809g </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11568:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-kbl-7567u/igt@kms_busy@basic@flip.html">FAIL</a> +28 other tests fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-cfl-8700k/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-cfl-8700k/igt@kms_busy@basic@flip.html">FAIL</a> +28 other tests fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-twl-1/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-twl-1/igt@kms_busy@basic@flip.html">FAIL</a> +34 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +17 other tests fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +41 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +40 other tests fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-14/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-14/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-adlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-adlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html">FAIL</a> +36 other tests fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-arls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-arls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-adls-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-adls-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg1-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg1-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-ivb-3770/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-ivb-3770/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-twl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-twl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html">FAIL</a> +34 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-jsl-1/igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-jsl-1/igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1.html">FAIL</a> +34 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-twl-2/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-twl-1/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-rplp-1/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-mtlp-8/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-jsl-1/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_busy@basic@flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550">i915#4550</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11888">i915#11888</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11568 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-dg2-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11548">i915#11548</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-dg2-11/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@i915_module_load@reload.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@i915_selftest@live@requests.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@i915_selftest@live@requests.html">PASS</a> +57 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11888">i915#11888</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11888">i915#11888</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11568/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7967 -&gt; IGTPW_11568</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15224: 924db73e261b7bfd4b70b14db61197f48bf09426 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11568: 11568<br />
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8236616590888007043==--
