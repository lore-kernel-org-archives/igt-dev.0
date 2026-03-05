Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A590F513E9
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 23:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BAA10EC91;
	Thu,  5 Mar 2026 23:42:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194B210EC85;
 Thu,  5 Mar 2026 23:42:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1988842204500519885=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/kms=3A_convert_output?=
 =?utf-8?q?-=3Epending=5Fpipe_to_output-=3Epending=5Fcrtc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Mar 2026 23:42:00 -0000
Message-ID: <177275412007.323437.759279613959604977@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305140851.2318968-1-jani.nikula@intel.com>
In-Reply-To: <20260305140851.2318968-1-jani.nikula@intel.com>
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

--===============1988842204500519885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: convert output->pending_pipe to output->pending_crtc
URL   : https://patchwork.freedesktop.org/series/162679/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8782 -> IGTPW_14682
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14682 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14682, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14682:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-mtlp-9:         [PASS][1] -> [CRASH][2] +14 other tests crash
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - fi-hsw-4770:        [PASS][3] -> [CRASH][4] +14 other tests crash
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-mtlp-8:         [PASS][5] -> [CRASH][6] +14 other tests crash
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adls-6:         [PASS][7] -> [CRASH][8] +13 other tests crash
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-adlp-6:         [PASS][9] -> [CRASH][10] +18 other tests crash
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
    - fi-skl-6600u:       [PASS][11] -> [CRASH][12] +13 other tests crash
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-arls-6:         [PASS][13] -> [CRASH][14] +13 other tests crash
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-ivb-3770:        [PASS][15] -> [CRASH][16] +14 other tests crash
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-elk-e7500:       [PASS][17] -> [CRASH][18] +14 other tests crash
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-8:          [PASS][19] -> [CRASH][20] +17 other tests crash
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-bsw-n3050:       [PASS][21] -> [CRASH][22] +14 other tests crash
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-ilk-650:         [PASS][23] -> [CRASH][24] +14 other tests crash
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-9:          [PASS][25] -> [WARN][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-9/igt@kms_dsc@dsc-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-9/igt@kms_dsc@dsc-basic.html
    - bat-dg2-8:          [PASS][27] -> [WARN][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-8/igt@kms_dsc@dsc-basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-basic@pipe-a-dp-1:
    - bat-dg2-9:          [PASS][29] -> [CRASH][30] +17 other tests crash
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-9/igt@kms_dsc@dsc-basic@pipe-a-dp-1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-9/igt@kms_dsc@dsc-basic@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-rplp-1:         [PASS][31] -> [CRASH][32] +14 other tests crash
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html
    - fi-tgl-1115g4:      [PASS][33] -> [CRASH][34] +13 other tests crash
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html
    - fi-cfl-guc:         [PASS][35] -> [CRASH][36] +13 other tests crash
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-cfl-guc/igt@kms_pipe_crc_basic@hang-read-crc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-cfl-guc/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arlh-3:         [PASS][37] -> [CRASH][38] +14 other tests crash
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arlh-3/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arlh-3/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - fi-pnv-d510:        [PASS][39] -> [CRASH][40] +11 other tests crash
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-dg1-7:          [PASS][41] -> [CRASH][42] +13 other tests crash
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg1-7/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg1-7/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - fi-glk-j4005:       [PASS][43] -> [CRASH][44] +13 other tests crash
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-glk-j4005/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-glk-j4005/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-rpls-4:         [PASS][45] -> [CRASH][46] +13 other tests crash
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-twl-1:          [PASS][47] -> [CRASH][48] +14 other tests crash
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-twl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-twl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-jsl-5:          [PASS][49] -> [CRASH][50] +13 other tests crash
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-jsl-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-jsl-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-apl-1:          [PASS][51] -> [CRASH][52] +12 other tests crash
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-arls-5:         [PASS][53] -> [CRASH][54] +13 other tests crash
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-twl-2:          [PASS][55] -> [CRASH][56] +14 other tests crash
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
    - fi-cfl-8700k:       [PASS][57] -> [CRASH][58] +13 other tests crash
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-cfl-8700k/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-cfl-8700k/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [PASS][59] -> [CRASH][60] +13 other tests crash
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-14:         [PASS][61] -> [CRASH][62] +13 other tests crash
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adlp-6:         [PASS][63] -> [WARN][64] +1 other test warn
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html
    - fi-skl-6600u:       [PASS][65] -> [WARN][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-skl-6600u/igt@kms_pm_backlight@basic-brightness.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-skl-6600u/igt@kms_pm_backlight@basic-brightness.html
    - bat-twl-2:          [PASS][67] -> [WARN][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-twl-2/igt@kms_pm_backlight@basic-brightness.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-twl-2/igt@kms_pm_backlight@basic-brightness.html
    - bat-mtlp-9:         [PASS][69] -> [WARN][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-9/igt@kms_pm_backlight@basic-brightness.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-9/igt@kms_pm_backlight@basic-brightness.html
    - bat-mtlp-8:         [PASS][71] -> [WARN][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-8/igt@kms_pm_backlight@basic-brightness.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-8/igt@kms_pm_backlight@basic-brightness.html
    - bat-arlh-3:         [PASS][73] -> [WARN][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arlh-3/igt@kms_pm_backlight@basic-brightness.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arlh-3/igt@kms_pm_backlight@basic-brightness.html
    - bat-twl-1:          [PASS][75] -> [WARN][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-twl-1/igt@kms_pm_backlight@basic-brightness.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-twl-1/igt@kms_pm_backlight@basic-brightness.html
    - bat-rplp-1:         [PASS][77] -> [WARN][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-rplp-1/igt@kms_pm_backlight@basic-brightness.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-rplp-1/igt@kms_pm_backlight@basic-brightness.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - fi-hsw-4770:        [SKIP][79] -> [CRASH][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-ivb-3770:        [SKIP][81] -> [CRASH][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-elk-e7500:       [SKIP][83] -> [CRASH][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-bsw-n3050:       [SKIP][85] -> [CRASH][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-pnv-d510:        [SKIP][87] -> [CRASH][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - bat-apl-1:          [SKIP][89] -> [CRASH][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-ilk-650:         [SKIP][91] -> [CRASH][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-skl-6600u:       [SKIP][93] -> [CRASH][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-kbl-7567u:       [DMESG-WARN][95] ([i915#13735] / [i915#180]) -> [CRASH][96] +13 other tests crash
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
Known issues
------------

  Here are the changes found in IGTPW_14682 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][97] -> [DMESG-FAIL][98] ([i915#12061]) +1 other test dmesg-fail
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-8/igt@i915_selftest@live.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [PASS][99] -> [DMESG-FAIL][100] ([i915#14204])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-atsm-1/igt@i915_selftest@live@mman.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [PASS][101] -> [DMESG-FAIL][102] ([i915#12061]) +1 other test dmesg-fail
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [DMESG-FAIL][103] ([i915#12061]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-8/igt@i915_selftest@live.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [DMESG-FAIL][105] ([i915#12061]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [DMESG-FAIL][107] ([i915#12061]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][109] ([i915#12061]) -> [DMESG-FAIL][110] ([i915#12061] / [i915#14204])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-atsm-1/igt@i915_selftest@live.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-atsm-1/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8782 -> IGTPW_14682
  * Linux: CI_DRM_18100 -> CI_DRM_18101

  CI-20190529: 20190529
  CI_DRM_18100: ce63d46cc8fc3bb754efb93026b55acaa616cfa2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18101: 0173caacd7e64feb97afe9bd5dcd51ad20c9f77a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14682: 2f598f4edb1dc7709cd5ec998b64847f9bd87445 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/index.html

--===============1988842204500519885==
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
<tr><td><b>Series:</b></td><td>lib/kms: convert output-&gt;pending_pipe to output-&gt;pending_crtc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162679/">https://patchwork.freedesktop.org/series/162679/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8782 -&gt; IGTPW_14682</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14682 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14682, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14682:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">CRASH</a> +14 other tests crash</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">CRASH</a> +14 other tests crash</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">CRASH</a> +14 other tests crash</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">CRASH</a> +13 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">CRASH</a> +18 other tests crash</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">CRASH</a> +13 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">CRASH</a> +13 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">CRASH</a> +14 other tests crash</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">CRASH</a> +14 other tests crash</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">CRASH</a> +17 other tests crash</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">CRASH</a> +14 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-ilk-650/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">CRASH</a> +14 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-9/igt@kms_dsc@dsc-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-9/igt@kms_dsc@dsc-basic.html">WARN</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-8/igt@kms_dsc@dsc-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-8/igt@kms_dsc@dsc-basic.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-dp-1:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-9/igt@kms_dsc@dsc-basic@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-9/igt@kms_dsc@dsc-basic@pipe-a-dp-1.html">CRASH</a> +17 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html">CRASH</a> +14 other tests crash</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html">CRASH</a> +13 other tests crash</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-cfl-guc/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-cfl-guc/igt@kms_pipe_crc_basic@hang-read-crc.html">CRASH</a> +13 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arlh-3/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arlh-3/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +14 other tests crash</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +11 other tests crash</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg1-7/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg1-7/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +13 other tests crash</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-glk-j4005/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-glk-j4005/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +13 other tests crash</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +13 other tests crash</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-twl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-twl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +14 other tests crash</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-jsl-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-jsl-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +13 other tests crash</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +12 other tests crash</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +13 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-twl-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">CRASH</a> +14 other tests crash</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-cfl-8700k/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-cfl-8700k/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">CRASH</a> +13 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">CRASH</a> +13 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">CRASH</a> +13 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-adlp-6/igt@kms_pm_backlight@basic-brightness.html">WARN</a> +1 other test warn</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-skl-6600u/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-skl-6600u/igt@kms_pm_backlight@basic-brightness.html">WARN</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-twl-2/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-twl-2/igt@kms_pm_backlight@basic-brightness.html">WARN</a></li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-9/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-9/igt@kms_pm_backlight@basic-brightness.html">WARN</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-8/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-8/igt@kms_pm_backlight@basic-brightness.html">WARN</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arlh-3/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arlh-3/igt@kms_pm_backlight@basic-brightness.html">WARN</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-twl-1/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-twl-1/igt@kms_pm_backlight@basic-brightness.html">WARN</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-rplp-1/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-rplp-1/igt@kms_pm_backlight@basic-brightness.html">WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">CRASH</a></li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">CRASH</a></li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">CRASH</a></li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">CRASH</a></li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">CRASH</a></li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">CRASH</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">CRASH</a></li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +13 other tests crash</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14682 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-atsm-1/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8782/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14682/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8782 -&gt; IGTPW_14682</li>
<li>Linux: CI_DRM_18100 -&gt; CI_DRM_18101</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18100: ce63d46cc8fc3bb754efb93026b55acaa616cfa2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18101: 0173caacd7e64feb97afe9bd5dcd51ad20c9f77a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14682: 2f598f4edb1dc7709cd5ec998b64847f9bd87445 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1988842204500519885==--
