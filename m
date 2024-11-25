Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B89ED3B7D5
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 04:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DB410E24E;
	Mon, 25 Nov 2024 04:29:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDD710E24E;
 Mon, 25 Nov 2024 04:29:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdsc=3A_?=
 =?utf-8?q?Add_meaningfull_skip_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 04:29:25 -0000
Message-ID: <173250896566.2698312.8937108026786105661@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125032420.1945935-1-pranay.samala@intel.com>
In-Reply-To: <20241125032420.1945935-1-pranay.samala@intel.com>
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

Series: tests/intel/kms_dsc: Add meaningfull skip message
URL   : https://patchwork.freedesktop.org/series/141738/
State : success

== Summary ==

CI Bug Log - changes from IGT_8123 -> IGTPW_12183
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/index.html

Participating hosts (45 -> 43)
------------------------------

  Missing    (2): fi-glk-j4005 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8123 and IGTPW_12183:

### New IGT tests (18) ###

  * igt@kms_dsc@dsc-basic@pipe-a-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12183 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-arls-5:         [PASS][1] -> [SKIP][2] ([i915#11191] / [i915#11345]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@fbdev@eof.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arls-5/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-arls-5:         [PASS][3] -> [SKIP][4] ([i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arls-5/igt@fbdev@info.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adls-6:         [PASS][5] -> [FAIL][6] ([i915#12903])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-adls-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][7] -> [ABORT][8] ([i915#12061]) +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-arls-5:         [PASS][9] -> [SKIP][10] ([i915#3637]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-5:         [PASS][11] -> [SKIP][12] ([i915#4342] / [i915#5354])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arls-5:         [PASS][13] -> [SKIP][14] ([i915#12732]) +13 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [PASS][15] -> [SKIP][16] ([i915#9197]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-arls-5:         [PASS][17] -> [SKIP][18] ([i915#12732] / [i915#3708])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@prime_vgem@basic-fence-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arls-5/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@gem_tiled_blits@basic:
    - fi-pnv-d510:        [SKIP][19] -> [PASS][20] +2 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-pnv-d510/igt@gem_tiled_blits@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/fi-pnv-d510/igt@gem_tiled_blits@basic.html

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [DMESG-WARN][21] ([i915#11621] / [i915#1982]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-cfl-8109u/igt@i915_module_load@reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/fi-cfl-8109u/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [FAIL][23] ([i915#12903]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - bat-rpls-4:         [FAIL][25] ([i915#12903]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][27] ([i915#12061]) -> [PASS][28] +1 other test pass
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-mtlp-8/igt@i915_selftest@live.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][29] ([i915#11621]) -> [PASS][30] +131 other tests pass
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_dsc@dsc-basic:
    - bat-rpls-4:         [SKIP][31] ([i915#3555] / [i915#3840] / [i915#9886]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-rpls-4/igt@kms_dsc@dsc-basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-rpls-4/igt@kms_dsc@dsc-basic.html
    - bat-rplp-1:         [SKIP][33] ([i915#3555] / [i915#3840]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-rplp-1/igt@kms_dsc@dsc-basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-rplp-1/igt@kms_dsc@dsc-basic.html
    - fi-rkl-11600:       [SKIP][35] ([i915#3555] / [i915#3840]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
    - fi-tgl-1115g4:      [SKIP][37] ([i915#3555] / [i915#3840]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
    - bat-adlp-6:         [SKIP][39] ([i915#3555] / [i915#3840]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-adlp-6/igt@kms_dsc@dsc-basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-adlp-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-3:          [SKIP][41] ([i915#3555] / [i915#9886]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-jsl-3/igt@kms_dsc@dsc-basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-jsl-3/igt@kms_dsc@dsc-basic.html
    - bat-twl-2:          [SKIP][43] ([i915#9886]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-twl-2/igt@kms_dsc@dsc-basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-twl-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-11:         [SKIP][45] ([i915#3555] / [i915#3840]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg2-11/igt@kms_dsc@dsc-basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-dg2-11/igt@kms_dsc@dsc-basic.html
    - bat-dg2-14:         [SKIP][47] ([i915#3555] / [i915#3840]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg2-14/igt@kms_dsc@dsc-basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - {bat-mtlp-9}:       [SKIP][49] ([i915#3555] / [i915#3840] / [i915#9159]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
    - {bat-arls-6}:       [SKIP][51] ([i915#9886]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-6/igt@kms_dsc@dsc-basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arls-6/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-8:         [SKIP][53] ([i915#3555] / [i915#3840] / [i915#9159]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         [SKIP][55] ([i915#3555] / [i915#3840]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-adls-6/igt@kms_dsc@dsc-basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          [SKIP][57] ([i915#3555] / [i915#9886]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-jsl-1/igt@kms_dsc@dsc-basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-jsl-1/igt@kms_dsc@dsc-basic.html
    - bat-arlh-3:         [SKIP][59] ([i915#9886]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arlh-3/igt@kms_dsc@dsc-basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arlh-3/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          [SKIP][61] ([i915#3555] / [i915#3840]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg1-7/igt@kms_dsc@dsc-basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-dg1-7/igt@kms_dsc@dsc-basic.html
    - bat-adlp-9:         [SKIP][63] ([i915#3555] / [i915#3840]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-adlp-9/igt@kms_dsc@dsc-basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-adlp-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-kbl-7567u:       [DMESG-WARN][65] -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arls-5:         [SKIP][67] ([i915#10202]) -> [SKIP][68] ([i915#12732]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-5:         [SKIP][69] ([i915#9886]) -> [SKIP][70] ([i915#12732])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_dsc@dsc-basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/bat-arls-5/igt@kms_dsc@dsc-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#11191]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11191
  [i915#11345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8123 -> IGTPW_12183
  * Linux: CI_DRM_15731 -> CI_DRM_15737

  CI-20190529: 20190529
  CI_DRM_15731: a381faddbfc974e7bd57efe953a738415afccd6a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15737: 4d723d57180a3aafc1a510bc08ef42f4b03671a7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12183: 12183
  IGT_8123: fb343db7fc59c760ef0a0c19303e7bcec177dbd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/index.html
