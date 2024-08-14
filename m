Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C53AC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 03:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B9B10E32E;
	Wed, 14 Aug 2024 03:58:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA3F10E32E;
 Wed, 14 Aug 2024 03:58:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5566414531607053499=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Clear_all_KMS_properties_on?=
 =?utf-8?q?_reset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Aug 2024 03:58:35 -0000
Message-ID: <172360791518.615301.1091812356637746879@2413ebb6fbb6>
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

--===============5566414531607053499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Clear all KMS properties on reset (rev2)
URL   : https://patchwork.freedesktop.org/series/137236/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15228 -> IGTPW_11570
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11570 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11570, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/index.html

Participating hosts (41 -> 41)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11570:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [PASS][1] -> [FAIL][2] +28 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-kbl-7567u/igt@kms_busy@basic@flip.html
    - fi-cfl-8700k:       [PASS][3] -> [FAIL][4] +28 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-cfl-8700k/igt@kms_busy@basic@flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-cfl-8700k/igt@kms_busy@basic@flip.html
    - bat-twl-1:          [PASS][5] -> [FAIL][6] +34 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-twl-1/igt@kms_busy@basic@flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-twl-1/igt@kms_busy@basic@flip.html
    - bat-apl-1:          [PASS][7] -> [FAIL][8] +26 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-apl-1/igt@kms_busy@basic@flip.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-apl-1/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - bat-dg2-13:         [PASS][9] -> [FAIL][10] +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-bsw-n3050:       [PASS][11] -> [FAIL][12] +17 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
    - bat-adlp-6:         [PASS][13] -> [FAIL][14] +41 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-rplp-1:         [PASS][15] -> [FAIL][16] +36 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-glk-j4005:       [PASS][17] -> [FAIL][18] +29 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-mtlp-8:         [PASS][19] -> [FAIL][20] +40 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - fi-elk-e7500:       [PASS][21] -> [FAIL][22] +22 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2:
    - bat-dg2-11:         [PASS][23] -> [FAIL][24] +28 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][25] -> [FAIL][26] +36 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2:
    - bat-dg2-14:         [PASS][27] -> [FAIL][28] +36 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-14/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-14/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1:
    - bat-adlp-9:         [PASS][29] -> [FAIL][30] +36 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-adlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-adlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2:
    - bat-arls-1:         [PASS][31] -> [FAIL][32] +36 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2:
    - fi-cfl-8109u:       [PASS][33] -> [FAIL][34] +28 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1:
    - fi-cfl-guc:         [PASS][35] -> [FAIL][36] +28 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:
    - fi-tgl-1115g4:      [PASS][37] -> [FAIL][38] +36 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:
    - bat-adls-6:         [PASS][39] -> [FAIL][40] +36 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-adls-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-adls-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:
    - bat-dg1-7:          [PASS][41] -> [FAIL][42] +36 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg1-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg1-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:
    - fi-ivb-3770:        [PASS][43] -> [FAIL][44] +28 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-ivb-3770/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-ivb-3770/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:
    - fi-pnv-d510:        [PASS][45] -> [FAIL][46] +17 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3:
    - bat-arls-5:         [PASS][47] -> [FAIL][48] +36 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:
    - bat-rpls-4:         [PASS][49] -> [FAIL][50] +36 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - bat-twl-2:          [PASS][51] -> [FAIL][52] +34 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-twl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-twl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:
    - fi-blb-e6850:       [PASS][53] -> [FAIL][54] +17 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
    - fi-rkl-11600:       [PASS][55] -> [FAIL][56] +29 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:
    - fi-ilk-650:         [PASS][57] -> [FAIL][58] +22 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:
    - bat-jsl-1:          [PASS][59] -> [FAIL][60] +34 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-jsl-1/igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-jsl-1/igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:
    - bat-arls-2:         [PASS][61] -> [FAIL][62] +40 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-2/igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-2/igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adlp-6:         NOTRUN -> [INCOMPLETE][63]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-twl-2:          NOTRUN -> [INCOMPLETE][64]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-twl-2/igt@kms_pm_backlight@basic-brightness.html
    - bat-twl-1:          NOTRUN -> [INCOMPLETE][65]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-twl-1/igt@kms_pm_backlight@basic-brightness.html
    - bat-rplp-1:         NOTRUN -> [INCOMPLETE][66]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-rplp-1/igt@kms_pm_backlight@basic-brightness.html
    - bat-arls-2:         NOTRUN -> [INCOMPLETE][67]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-2/igt@kms_pm_backlight@basic-brightness.html
    - bat-mtlp-8:         NOTRUN -> [INCOMPLETE][68]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-mtlp-8/igt@kms_pm_backlight@basic-brightness.html
    - bat-jsl-1:          NOTRUN -> [INCOMPLETE][69]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-jsl-1/igt@kms_pm_backlight@basic-brightness.html

  
#### Warnings ####

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - bat-dg2-13:         [SKIP][70] ([Intel XE#484]) -> [FAIL][71] +2 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - bat-dg2-13:         [SKIP][72] ([Intel XE#484] / [i915#4550]) -> [FAIL][73] +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-elk-e7500:       [SKIP][74] -> [FAIL][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-arls-2:         [SKIP][76] ([i915#10196] / [i915#4077] / [i915#9688]) -> [FAIL][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
    - bat-mtlp-8:         [SKIP][78] ([i915#4077] / [i915#9688]) -> [FAIL][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_11570 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][80] ([i915#2190])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][81] ([i915#4613]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-1:         [PASS][82] -> [DMESG-WARN][83] ([i915#11349] / [i915#11378])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][84] +30 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         NOTRUN -> [SKIP][85] ([i915#9197]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [DMESG-WARN][86] ([i915#11349] / [i915#11378]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  
  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [i915#10196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7967 -> IGTPW_11570

  CI-20190529: 20190529
  CI_DRM_15228: 02c35fc4e126599bc57696d25d9b78d612a7a847 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11570: 1600e47be7cbb052fdc72699ff970780f4f6e7e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/index.html

--===============5566414531607053499==
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
<tr><td><b>Series:</b></td><td>Clear all KMS properties on reset (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137236/">https://patchwork.freedesktop.org/series/137236/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15228 -&gt; IGTPW_11570</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11570 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11570, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/index.html</p>
<h2>Participating hosts (41 -&gt; 41)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11570:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-kbl-7567u/igt@kms_busy@basic@flip.html">FAIL</a> +28 other tests fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-cfl-8700k/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-cfl-8700k/igt@kms_busy@basic@flip.html">FAIL</a> +28 other tests fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-twl-1/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-twl-1/igt@kms_busy@basic@flip.html">FAIL</a> +34 other tests fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-apl-1/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-apl-1/igt@kms_busy@basic@flip.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +17 other tests fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +41 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +40 other tests fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-14/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-14/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-2.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-adlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-adlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-adls-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-adls-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg1-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg1-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-ivb-3770/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-ivb-3770/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-twl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-twl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html">FAIL</a> +34 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-jsl-1/igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-jsl-1/igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1.html">FAIL</a> +34 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-2/igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-2/igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1.html">FAIL</a> +40 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-twl-2/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-twl-1/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-rplp-1/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-2/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-mtlp-8/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-jsl-1/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550">i915#4550</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">FAIL</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11570 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15228/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11570/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7967 -&gt; IGTPW_11570</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15228: 02c35fc4e126599bc57696d25d9b78d612a7a847 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11570: 1600e47be7cbb052fdc72699ff970780f4f6e7e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5566414531607053499==--
