Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C09DC9830D
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 12:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F88510FA3E;
	Fri, 25 Sep 2026 12:49:17 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95FC10E281;
 Fri, 25 Sep 2026 12:48:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3666632108097226398=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tools/gputop=3A_add_i915_?=
 =?utf-8?q?PMU_engine_monitoring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 25 Sep 2026 12:48:32 -0000
Message-ID: <179034051281.208168.8476464925345830766@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
In-Reply-To: <cover.1790331690.git.sebastian.brzezinka@intel.com>
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

--===============3666632108097226398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/gputop: add i915 PMU engine monitoring
URL   : https://patchwork.freedesktop.org/series/174991/
State : success

== Summary ==

CI Bug Log - changes from IGT_9112 -> IGTPW_15905
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/index.html

Participating hosts (27 -> 37)
------------------------------

  Additional (12): bat-dg1-6 bat-mtlp-9 fi-bsw-n3050 bat-dg2-8 bat-adlp-6 fi-ilk-650 bat-jsl-5 bat-arls-6 fi-pnv-d510 bat-dg2-14 bat-apl-1 fi-bsw-nick 
  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_15905 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-dg1-6:          NOTRUN -> [SKIP][1] ([i915#2582]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-dg1-6:          NOTRUN -> [SKIP][2] ([i915#1849] / [i915#2582])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@fbdev@info.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][3] ([i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-bsw-nick/igt@fbdev@info.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([i915#1849])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-pnv-d510/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-5:          NOTRUN -> [SKIP][5] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@gem_huc_copy@huc-copy.html
    - bat-apl-1:          NOTRUN -> [SKIP][6] +24 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-apl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][7] +24 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][8] ([i915#4613]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-arls-6:         NOTRUN -> [SKIP][9] ([i915#10213] / [i915#11671]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-jsl-5:          NOTRUN -> [SKIP][10] ([i915#4613]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - bat-adlp-6:         NOTRUN -> [SKIP][11] ([i915#4613]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap@basic:
    - bat-mtlp-9:         NOTRUN -> [SKIP][12] ([i915#4083])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_mmap@basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][13] ([i915#4083])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@gem_mmap@basic.html
    - bat-arls-6:         NOTRUN -> [SKIP][14] ([i915#4083])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_mmap@basic.html
    - bat-dg1-6:          NOTRUN -> [SKIP][15] ([i915#4083])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@gem_mmap@basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][16] ([i915#4083])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][17] ([i915#4077]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][18] ([i915#4079])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@gem_render_tiled_blits@basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][19] ([i915#4079])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@gem_render_tiled_blits@basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][20] ([i915#4079])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@gem_render_tiled_blits@basic.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][21] ([i915#4079])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html
    - bat-arls-6:         NOTRUN -> [SKIP][22] ([i915#10197] / [i915#10211] / [i915#4079])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-arls-6:         NOTRUN -> [SKIP][23] ([i915#12637] / [i915#4077]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][24] ([i915#4077]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][25] ([i915#4077]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@gem_tiled_fence_blits@basic.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][26] ([i915#4077]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][27] ([i915#15657])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@gem_tiled_pread_basic@basic.html
    - bat-adlp-6:         NOTRUN -> [SKIP][28] ([i915#15656])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@gem_tiled_pread_basic@basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][29] ([i915#15657])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@gem_tiled_pread_basic@basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][30] ([i915#15657])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@gem_tiled_pread_basic@basic.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][31] ([i915#15657])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_tiled_pread_basic@basic.html
    - bat-arls-6:         NOTRUN -> [SKIP][32] ([i915#15657])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-14:         NOTRUN -> [SKIP][33] ([i915#11681] / [i915#6621])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@i915_pm_rps@basic-api.html
    - bat-adlp-6:         NOTRUN -> [SKIP][34] ([i915#6621])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][35] ([i915#11681] / [i915#6621])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@i915_pm_rps@basic-api.html
    - bat-dg2-8:          NOTRUN -> [SKIP][36] ([i915#11681] / [i915#6621])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@i915_pm_rps@basic-api.html
    - bat-arls-6:         NOTRUN -> [SKIP][37] ([i915#10209] / [i915#11681])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@i915_pm_rps@basic-api.html
    - bat-dg1-6:          NOTRUN -> [SKIP][38] ([i915#11681] / [i915#6621])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@i915_pm_rps@basic-api.html

  * igt@intel_hwmon@hwmon-read:
    - bat-mtlp-9:         NOTRUN -> [SKIP][39] ([i915#7707]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html
    - bat-arls-6:         NOTRUN -> [SKIP][40] ([i915#7707]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@intel_hwmon@hwmon-read.html
    - bat-jsl-5:          NOTRUN -> [SKIP][41] ([i915#7707]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@intel_hwmon@hwmon-read.html
    - bat-adlp-6:         NOTRUN -> [SKIP][42] ([i915#7707]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - bat-dg1-6:          NOTRUN -> [SKIP][43] ([i915#12311] / [i915#4212]) +7 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][44] ([i915#5190])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][45] ([i915#5190])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-8:          NOTRUN -> [SKIP][46] ([i915#5190])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arls-6:         NOTRUN -> [SKIP][47] ([i915#10200] / [i915#12203])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-9:         NOTRUN -> [SKIP][48] ([i915#4212]) +8 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-arls-6:         NOTRUN -> [SKIP][49] ([i915#10200]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-8:          NOTRUN -> [SKIP][50] ([i915#4215] / [i915#5190])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-6:          NOTRUN -> [SKIP][51] ([i915#12311] / [i915#4215])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-14:         NOTRUN -> [SKIP][52] ([i915#4215] / [i915#5190])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-14:         NOTRUN -> [SKIP][53] ([i915#4212]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - bat-dg2-8:          NOTRUN -> [SKIP][54] ([i915#4212]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_busy@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][55] ([i915#11190] / [i915#12311] / [i915#4303])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-arls-6:         NOTRUN -> [SKIP][56] ([i915#10202]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][57] ([i915#4103]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][58] ([i915#16119] / [i915#4213]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-8:          NOTRUN -> [SKIP][59] ([i915#4103]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-5:          NOTRUN -> [SKIP][60] ([i915#4103]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adlp-6:         NOTRUN -> [SKIP][61] ([i915#4103]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-dg1-6:          NOTRUN -> [SKIP][62] ([i915#11190] / [i915#12311]) +15 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-5:          NOTRUN -> [SKIP][63] ([i915#16361])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_dsc@dsc-basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][64] ([i915#16361])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][65] ([i915#16361])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
    - bat-arls-6:         NOTRUN -> [SKIP][66] ([i915#16361])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-dg1-6:          NOTRUN -> [SKIP][67] ([i915#12311] / [i915#3637]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-plain-flip:
    - bat-dg1-6:          NOTRUN -> [SKIP][68] ([i915#12311]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-14:         NOTRUN -> [SKIP][69]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][70]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_force_connector_basic@force-load-detect.html
    - bat-arls-6:         NOTRUN -> [SKIP][71] ([i915#10207])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-8:          NOTRUN -> [SKIP][72]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-5:          NOTRUN -> [SKIP][73]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-6:         NOTRUN -> [SKIP][74]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][75] ([i915#12311] / [i915#4342])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-pnv-d510:        NOTRUN -> [SKIP][76] ([i915#11190]) +16 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        NOTRUN -> [SKIP][77] ([i915#11190]) +16 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-14:         NOTRUN -> [SKIP][78] ([i915#12343] / [i915#5354])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-8:          NOTRUN -> [SKIP][79] ([i915#12343] / [i915#5354])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
    - bat-arls-6:         NOTRUN -> [SKIP][80] ([i915#9812])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-jsl-5:          NOTRUN -> [SKIP][81] ([i915#15205])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-6:          NOTRUN -> [SKIP][82] ([i915#12311] / [i915#12343] / [i915#5354])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-ilk-650:         NOTRUN -> [SKIP][83] +25 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][84] +20 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][85] ([i915#4077] / [i915#9688]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-arls-6:         NOTRUN -> [SKIP][86] ([i915#9732]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][87] +31 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-jsl-5:          NOTRUN -> [SKIP][88] ([i915#1072]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html
    - bat-dg1-6:          NOTRUN -> [SKIP][89] ([i915#1072] / [i915#12311] / [i915#9732]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-14:         NOTRUN -> [SKIP][90] ([i915#1072] / [i915#9732]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-8:          NOTRUN -> [SKIP][91] ([i915#1072] / [i915#9732]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-5:          NOTRUN -> [SKIP][92] ([i915#3555])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-6:          NOTRUN -> [SKIP][93] ([i915#12311] / [i915#3555])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-14:         NOTRUN -> [SKIP][94] ([i915#3555])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adlp-6:         NOTRUN -> [SKIP][95] ([i915#3555])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][96] ([i915#3555] / [i915#8809])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-8:          NOTRUN -> [SKIP][97] ([i915#3555])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-arls-6:         NOTRUN -> [SKIP][98] ([i915#10208] / [i915#8809])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-14:         NOTRUN -> [SKIP][99] ([i915#3708])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-8:          NOTRUN -> [SKIP][100] ([i915#3708])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg1-6:          NOTRUN -> [SKIP][101] ([i915#3708] / [i915#4077]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arls-6:         NOTRUN -> [SKIP][102] ([i915#10212] / [i915#3708])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg2-14:         NOTRUN -> [SKIP][103] ([i915#3708] / [i915#4077]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@prime_vgem@basic-gtt.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][104] ([i915#3708] / [i915#4077]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@prime_vgem@basic-gtt.html
    - bat-arls-6:         NOTRUN -> [SKIP][105] ([i915#12637] / [i915#3708] / [i915#4077]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@prime_vgem@basic-gtt.html
    - bat-dg2-8:          NOTRUN -> [SKIP][106] ([i915#3708] / [i915#4077]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - bat-dg1-6:          NOTRUN -> [SKIP][107] ([i915#3708]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@prime_vgem@basic-read.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][108] ([i915#3708]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@prime_vgem@basic-read.html
    - bat-arls-6:         NOTRUN -> [SKIP][109] ([i915#10214] / [i915#3708])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-dg1-6:          NOTRUN -> [SKIP][110] ([i915#11723] / [i915#3708])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@prime_vgem@basic-write.html
    - bat-adlp-6:         NOTRUN -> [SKIP][111] ([i915#3291] / [i915#3708]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@prime_vgem@basic-write.html
    - bat-dg2-14:         NOTRUN -> [SKIP][112] ([i915#3291] / [i915#3708]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@prime_vgem@basic-write.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][113] ([i915#10216] / [i915#3708])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@prime_vgem@basic-write.html
    - bat-arls-6:         NOTRUN -> [SKIP][114] ([i915#10216] / [i915#3708])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@prime_vgem@basic-write.html
    - bat-dg2-8:          NOTRUN -> [SKIP][115] ([i915#3291] / [i915#3708]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [SKIP][116] ([i915#13030]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9112/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#10207]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#15205]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15205
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4303]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4303
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9112 -> IGTPW_15905
  * Linux: CI_DRM_19214 -> CI_DRM_19220

  CI-20190529: 20190529
  CI_DRM_19214: a61293e633b18c618fd2f7d508cf558db0f42227 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19220: f44eaea74cc54b667ac438cfda0c7ee39cfa556a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15905: 60777bbdd027a47d9c6cb3efd04064931a010648 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/index.html

--===============3666632108097226398==
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
<tr><td><b>Series:</b></td><td>tools/gputop: add i915 PMU engine monitoring</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174991/">https://patchwork.freedesktop.org/series/174991/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9112 -&gt; IGTPW_15905</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/index.html</p>
<h2>Participating hosts (27 -&gt; 37)</h2>
<p>Additional (12): bat-dg1-6 bat-mtlp-9 fi-bsw-n3050 bat-dg2-8 bat-adlp-6 fi-ilk-650 bat-jsl-5 bat-arls-6 fi-pnv-d510 bat-dg2-14 bat-apl-1 fi-bsw-nick <br />
  Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15905 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-bsw-nick/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-pnv-d510/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-apl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +24 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +8 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) +8 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4303">i915#4303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207">i915#10207</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15205">i915#15205</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +20 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) +3 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-jsl-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg1-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-adlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-14/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-mtlp-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-arls-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9112/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">i915#13030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15905/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9112 -&gt; IGTPW_15905</li>
<li>Linux: CI_DRM_19214 -&gt; CI_DRM_19220</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19214: a61293e633b18c618fd2f7d508cf558db0f42227 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19220: f44eaea74cc54b667ac438cfda0c7ee39cfa556a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15905: 60777bbdd027a47d9c6cb3efd04064931a010648 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3666632108097226398==--
