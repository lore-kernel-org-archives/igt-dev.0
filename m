Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88FDD5A6EA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 07:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB8510E130;
	Tue, 26 Nov 2024 07:24:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30C10E130;
 Tue, 26 Nov 2024 07:24:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6866064009863041937=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fdsc=3A_A?=
 =?utf-8?q?dd_meaningfull_skip_message_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Nov 2024 07:24:53 -0000
Message-ID: <173260589369.3241327.5287076169510978355@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126054658.1951121-1-pranay.samala@intel.com>
In-Reply-To: <20241126054658.1951121-1-pranay.samala@intel.com>
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

--===============6866064009863041937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dsc: Add meaningfull skip message (rev2)
URL   : https://patchwork.freedesktop.org/series/141738/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8125_full -> XEIGTPW_12197_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12197_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12197_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12197_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html

  * igt@kms_psr@psr2-primary-render:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-6/igt@kms_psr@psr2-primary-render.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-1/igt@kms_psr@psr2-primary-render.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  
#### Warnings ####

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [SKIP][15] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][17] ([Intel XE#3467]) -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_module_load@reload-no-display.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_module_load@reload-no-display.html

  
New tests
---------

  New tests have been introduced between XEIGT_8125_full and XEIGTPW_12197_full:

### New IGT tests (252) ###

  * igt@kms_dsc@dsc-basic@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-3-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-3-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-3-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-3-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-3-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-3-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-3-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-3-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-3-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-3-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-3-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-3-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb16161616f-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb16161616f-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb16161616f-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb2101010-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb2101010-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb2101010-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xyuv8888-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xyuv8888-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xyuv8888-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-yuyv-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-yuyv-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-yuyv-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb16161616f-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb16161616f-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb16161616f-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb2101010-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb2101010-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb2101010-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xyuv8888-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xyuv8888-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xyuv8888-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-yuyv-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-yuyv-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-yuyv-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb16161616f-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb16161616f-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb16161616f-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb2101010-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb2101010-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb2101010-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xyuv8888-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xyuv8888-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xyuv8888-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-yuyv-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-yuyv-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-yuyv-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb16161616f-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb16161616f-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb16161616f-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb2101010-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb2101010-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb2101010-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xyuv8888-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xyuv8888-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xyuv8888-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-yuyv-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-yuyv-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-yuyv-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb16161616f-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb16161616f-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb16161616f-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb2101010-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb2101010-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb2101010-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xyuv8888-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xyuv8888-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xyuv8888-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-yuyv-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-yuyv-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-yuyv-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-dp-2-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-dp-2-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-dp-2-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-dp-4-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-dp-4-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-edp-1-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-edp-1-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-3-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-3-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-6-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-6-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-dp-4-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-dp-4-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-edp-1-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-edp-1-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-3-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-3-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-6-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-6-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-dp-4-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-dp-4-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-edp-1-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-edp-1-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-3-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-3-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-6-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-6-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-dp-2-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-dp-2-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-dp-4-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-dp-4-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-3-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-3-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-6-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-6-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12197_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#1885])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@core_hotunplug@hotreplug.html
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] ([Intel XE#1885])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@core_hotunplug@hotreplug.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1885])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1885])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#3453])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@info:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2134]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2134]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@fbdev@nullptr.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@fbdev@nullptr.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#2134]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@fbdev@read.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@fbdev@read.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2423]) +35 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2550]) +23 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2327]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#2076])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#2136]) +24 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2136]) +23 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#316])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1124]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1124]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#610])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#367]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#367])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#787]) +124 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#3432])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2887]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#1727])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][53] ([Intel XE#1727] / [Intel XE#3113])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2724])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2325])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#373]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2252]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2341])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#308]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2321]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2291]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2423] / [i915#2575]) +50 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][64] ([Intel XE#877])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#2423]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_dp_aux_dev.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_dp_aux_dev.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#776])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][68] -> [DMESG-WARN][69] ([Intel XE#3468]) +21 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2316])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][71] ([Intel XE#3486])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#301]) +2 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#3321] / [Intel XE#3486])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#2316]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#2423] / [i915#2575]) +69 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@busy-flip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][78] ([Intel XE#3468]) +2 other tests dmesg-fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][79] -> [INCOMPLETE][80] ([Intel XE#2049] / [Intel XE#2597])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][81] -> [FAIL][82] ([Intel XE#3149] / [Intel XE#886])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - shard-lnl:          [PASS][83] -> [FAIL][84] ([Intel XE#886])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2293]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#455]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2312]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2136]) +47 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#651]) +7 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2311]) +14 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][94] ([Intel XE#2333]) +7 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2136] / [Intel XE#2351]) +15 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#658])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2136]) +34 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#653]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2313]) +14 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#346])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#3012])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#2571])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][104] ([Intel XE#2705])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2763]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2763] / [Intel XE#455])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2763]) +9 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#3309])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][109] ([Intel XE#1727] / [Intel XE#3468])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1439])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2446]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2446]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2446])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [PASS][115] -> [INCOMPLETE][116] ([Intel XE#1727] / [Intel XE#3468])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#2446]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_prop_blob@invalid-set-prop:
    - shard-bmg:          [PASS][119] -> [SKIP][120] ([Intel XE#2423]) +117 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_prop_blob@invalid-set-prop.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_prop_blob@invalid-set-prop.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#1489]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1489]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2387]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2234])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_psr@psr2-primary-render.html

  * igt@kms_sequence@get-busy@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][127] ([Intel XE#3468]) +15 other tests dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_sequence@get-busy@pipe-c-dp-2.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][128] -> [SKIP][129] ([Intel XE#1435])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][130] -> [FAIL][131] ([Intel XE#899])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][132] -> [DMESG-WARN][133] ([Intel XE#1727] / [Intel XE#3468]) +5 other tests dmesg-warn
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2168])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1499])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#1091] / [Intel XE#2849])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2423])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@testdisplay.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2905]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2905]) +7 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][140] ([Intel XE#1473])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [PASS][141] -> [TIMEOUT][142] ([Intel XE#1473])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [PASS][143] -> [SKIP][144] ([Intel XE#1130]) +143 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_balancer@many-execqueues-virtual-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1130]) +78 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          [PASS][146] -> [SKIP][147] ([Intel XE#1130]) +264 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2322]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-bmg:          [PASS][149] -> [DMESG-WARN][150] ([Intel XE#1727])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#288]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-imm.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [PASS][152] -> [DMESG-WARN][153] ([Intel XE#3343])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          NOTRUN -> [FAIL][154] ([Intel XE#3499])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-bmg:          [PASS][155] -> [SKIP][156] ([Intel XE#2229])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][157] -> [SKIP][158] ([Intel XE#1192]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#2229])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2229])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2457])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_module_load@load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#378])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_module_load@unload:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][163] ([Intel XE#3467])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_module_load@unload.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#3573]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-bmg:          [PASS][165] -> [FAIL][166] ([Intel XE#2514])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-bmg:          NOTRUN -> [FAIL][167] ([Intel XE#2514])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2284]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][169] ([Intel XE#3468] / [Intel XE#569])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#944])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#3342])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@bind-no-array-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#1130]) +70 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_vm@bind-no-array-conflict.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [ABORT][173] ([Intel XE#3421])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#2423]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@core_getstats.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@core_getstats.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][176] ([Intel XE#3440]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@core_getversion@all-cards.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@core_getversion@all-cards.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#2134]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@fbdev@unaligned-read.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@fbdev@unaligned-read.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [INCOMPLETE][180] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][181] +4 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][182] ([Intel XE#2291]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][184] ([Intel XE#877]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2351]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_dsc@dsc-basic.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][189] +5 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-lnl:          [SKIP][190] ([Intel XE#2244]) -> [PASS][191] +7 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][192] ([Intel XE#2244]) -> [PASS][193] +6 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][194] ([Intel XE#3321] / [Intel XE#3486]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#310]) -> [PASS][197] +1 other test pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][198] ([Intel XE#2316]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [FAIL][200] ([Intel XE#886]) -> [PASS][201] +5 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [DMESG-WARN][202] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][203] +5 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][204] -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2136]) -> [PASS][207] +19 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#656]) -> [PASS][209] +2 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [INCOMPLETE][210] ([Intel XE#1035] / [Intel XE#2566] / [Intel XE#3468]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [INCOMPLETE][212] -> [PASS][213] +2 other tests pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][214] ([Intel XE#718]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [DMESG-WARN][216] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][217] +1 other test pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_pm_rpm@basic-pci-d3-state.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#2446]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-bmg:          [DMESG-FAIL][220] ([Intel XE#3468]) -> [PASS][221] +9 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][222] ([Intel XE#1435]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2423] / [i915#2575]) -> [PASS][225] +80 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_vblank@wait-forked-busy-hang.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][226] ([Intel XE#2159]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue:
    - shard-lnl:          [FAIL][228] -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@xe_exec_basic@many-execqueues-bindexecqueue.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-1/igt@xe_exec_basic@many-execqueues-bindexecqueue.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1130]) -> [PASS][231] +127 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue:
    - shard-bmg:          [DMESG-WARN][232] ([Intel XE#1727]) -> [PASS][233] +2 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_exec_fault_mode@twice-bindexecqueue.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][234] ([Intel XE#3515]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr:
    - shard-dg2-set2:     [DMESG-WARN][236] ([Intel XE#1727]) -> [PASS][237] +2 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - shard-lnl:          [DMESG-WARN][238] -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-4/igt@xe_exec_threads@threads-mixed-basic.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-6/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][240] ([Intel XE#3343]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][242] ([Intel XE#3343] / [Intel XE#3468]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][244] ([Intel XE#2998]) -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          [SKIP][246] ([Intel XE#1192]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-5/igt@xe_live_ktest@xe_mocs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-bmg:          [DMESG-WARN][248] ([Intel XE#3468]) -> [PASS][249] +77 other tests pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_pat@display-vs-wb-transient.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [DMESG-FAIL][250] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][251] +1 other test pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@xe_pm@s3-basic-exec.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][252] ([Intel XE#958]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [DMESG-WARN][254] ([Intel XE#3468]) -> [SKIP][255] ([Intel XE#1885])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [INCOMPLETE][256] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][257] ([Intel XE#1885])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1885]) -> [DMESG-WARN][259] ([Intel XE#3468])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@write:
    - shard-bmg:          [DMESG-WARN][260] ([Intel XE#3468]) -> [SKIP][261] ([Intel XE#2134])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@fbdev@write.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#623]) -> [SKIP][263] ([Intel XE#2423] / [i915#2575])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2423] / [i915#2575]) -> [SKIP][265] ([Intel XE#873])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][266] ([Intel XE#2327]) -> [SKIP][267] ([Intel XE#2136]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][268] ([Intel XE#3468]) -> [INCOMPLETE][269] ([Intel XE#3225])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#316]) -> [SKIP][271] ([Intel XE#2136]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#316]) -> [SKIP][273] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#2136]) -> [SKIP][275] ([Intel XE#316]) +5 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][276] ([Intel XE#2705] / [Intel XE#3468]) -> [SKIP][277] ([Intel XE#2136])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1124]) -> [SKIP][279] ([Intel XE#2136]) +7 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][281] ([Intel XE#619])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][282] ([Intel XE#1124]) -> [SKIP][283] ([Intel XE#2136]) +20 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][285] ([Intel XE#1124]) +5 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2136]) -> [SKIP][287] ([Intel XE#1124]) +6 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#619]) -> [SKIP][289] ([Intel XE#2136] / [Intel XE#2351])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#1124]) -> [SKIP][291] ([Intel XE#2136] / [Intel XE#2351])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][292] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][293] ([Intel XE#2423]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#2423] / [i915#2575]) -> [SKIP][295] ([Intel XE#2191]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#2191]) -> [SKIP][297] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][298] ([Intel XE#367]) -> [SKIP][299] ([Intel XE#2423]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#367]) -> [SKIP][301] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][303] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][305] ([Intel XE#2136]) +9 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          [SKIP][306] ([Intel XE#2887]) -> [SKIP][307] ([Intel XE#2136]) +20 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2136]) -> [SKIP][309] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2136]) -> [SKIP][311] ([Intel XE#2907]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][313] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2907]) -> [SKIP][315] ([Intel XE#2136]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#3442]) -> [SKIP][317] ([Intel XE#2136])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][318] ([Intel XE#3432]) -> [SKIP][319] ([Intel XE#2136]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][320] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][321] ([Intel XE#2136])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][322] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][323] ([Intel XE#2136]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [FAIL][324] ([Intel XE#616]) -> [SKIP][325] ([Intel XE#2136])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][327] ([Intel XE#787])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][328] ([Intel XE#2724]) -> [SKIP][329] ([Intel XE#2136])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_cdclk@mode-transition.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#2423] / [i915#2575]) -> [SKIP][331] ([Intel XE#306]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][332] ([Intel XE#2325]) -> [SKIP][333] ([Intel XE#2423]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#306]) -> [SKIP][335] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_chamelium_color@gamma.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2423] / [i915#2575]) -> [SKIP][337] ([Intel XE#373]) +9 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][338] ([Intel XE#2252]) -> [SKIP][339] ([Intel XE#2423]) +17 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#373]) -> [SKIP][341] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][342] ([Intel XE#1178]) -> [SKIP][343] ([Intel XE#455])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_content_protection@atomic.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][344] ([Intel XE#1178]) -> [SKIP][345] ([Intel XE#2423])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#2423] / [i915#2575]) -> [SKIP][347] ([Intel XE#307]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][348] ([Intel XE#1178]) -> [SKIP][349] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [INCOMPLETE][350] ([Intel XE#2715]) -> [SKIP][351] ([Intel XE#2423])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_content_protection@srm.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128:
    - shard-bmg:          [DMESG-FAIL][352] ([Intel XE#3468]) -> [SKIP][353] ([Intel XE#2423]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-128x128.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-128x128.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2423] / [i915#2575]) -> [SKIP][355] ([Intel XE#308]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][356] ([Intel XE#2320]) -> [SKIP][357] ([Intel XE#2423]) +6 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][358] ([Intel XE#2321]) -> [SKIP][359] ([Intel XE#2423]) +2 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [INCOMPLETE][360] ([Intel XE#3468]) -> [SKIP][361] ([Intel XE#2423] / [i915#2575])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][362] ([Intel XE#2291]) -> [SKIP][363] ([Intel XE#2423]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#309]) -> [SKIP][365] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#323]) -> [SKIP][367] ([Intel XE#2423] / [i915#2575])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][368] ([Intel XE#2286]) -> [SKIP][369] ([Intel XE#2423]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][370] ([Intel XE#1508]) -> [SKIP][371] ([Intel XE#2136])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#307]) -> [SKIP][373] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-bmg:          [SKIP][374] ([Intel XE#2323]) -> [SKIP][375] ([Intel XE#2423])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#455]) -> [SKIP][377] ([Intel XE#2136]) +3 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#776]) -> [SKIP][379] ([Intel XE#2136])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][380] ([Intel XE#776]) -> [SKIP][381] ([Intel XE#2136])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][382] ([Intel XE#2373]) -> [SKIP][383] ([Intel XE#2423])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][384] ([Intel XE#1138]) -> [SKIP][385] ([Intel XE#2423])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_feature_discovery@display-4x.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#1137]) -> [SKIP][387] ([Intel XE#2423] / [i915#2575])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][388] ([Intel XE#2374]) -> [SKIP][389] ([Intel XE#2423]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_feature_discovery@psr1.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][390] ([Intel XE#2316]) -> [SKIP][391] ([Intel XE#2423])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#2423] / [i915#2575]) -> [SKIP][393] ([Intel XE#310]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#310]) -> [SKIP][395] ([Intel XE#2423] / [i915#2575])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [DMESG-FAIL][396] ([Intel XE#3468]) -> [FAIL][397] ([Intel XE#2882])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2423] / [i915#2575]) -> [FAIL][399] ([Intel XE#301])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][400] ([Intel XE#3468]) -> [FAIL][401] ([Intel XE#3321] / [Intel XE#3486])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [DMESG-WARN][402] ([Intel XE#3468]) -> [SKIP][403] ([Intel XE#2423]) +7 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-bmg:          [DMESG-FAIL][404] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][405] ([Intel XE#2423])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_flip@absolute-wf_vblank.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [DMESG-WARN][406] -> [SKIP][407] ([Intel XE#2423])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#455]) -> [SKIP][409] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
    - shard-bmg:          [INCOMPLETE][410] -> [SKIP][411] ([Intel XE#2293] / [Intel XE#2380])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][412] -> [SKIP][413] ([Intel XE#2293])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2136]) -> [SKIP][415] ([Intel XE#455])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][416] ([Intel XE#2380]) -> [SKIP][417] ([Intel XE#2136])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][418] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][419] ([Intel XE#2136]) +6 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][420] ([Intel XE#2311]) -> [SKIP][421] ([Intel XE#2136]) +44 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][423] ([Intel XE#651]) +4 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][424] ([Intel XE#2311]) -> [SKIP][425] ([Intel XE#2312]) +7 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#651]) -> [SKIP][427] ([Intel XE#2136]) +14 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#656]) -> [SKIP][429] ([Intel XE#651]) +2 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#2136]) -> [SKIP][431] ([Intel XE#651]) +11 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][432] ([Intel XE#2312]) -> [SKIP][433] ([Intel XE#2311]) +9 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][434] -> [SKIP][435] ([Intel XE#2136])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][436] ([Intel XE#3468]) -> [SKIP][437] ([Intel XE#2136]) +6 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][438] -> [FAIL][439] ([Intel XE#2333])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][441] ([Intel XE#656]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][442] ([Intel XE#2312]) -> [FAIL][443] ([Intel XE#2333])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][444] ([Intel XE#2333]) -> [SKIP][445] ([Intel XE#2312]) +3 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [DMESG-FAIL][446] ([Intel XE#3468]) -> [FAIL][447] ([Intel XE#2333]) +3 other tests fail
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [DMESG-FAIL][448] ([Intel XE#3468]) -> [SKIP][449] ([Intel XE#2312])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][450] ([Intel XE#2333]) -> [SKIP][451] ([Intel XE#2136]) +19 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][452] ([Intel XE#2312]) -> [SKIP][453] ([Intel XE#2136]) +5 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#651]) -> [SKIP][455] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#658]) -> [SKIP][457] ([Intel XE#2136] / [Intel XE#2351])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][458] ([Intel XE#2312]) -> [SKIP][459] ([Intel XE#2313]) +10 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#2136]) -> [SKIP][461] ([Intel XE#656])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#656]) -> [SKIP][463] ([Intel XE#653])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#2136]) -> [SKIP][465] ([Intel XE#1158])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][466] ([Intel XE#2313]) -> [SKIP][467] ([Intel XE#2136]) +47 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#2136]) -> [SKIP][469] ([Intel XE#653]) +17 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#653]) -> [SKIP][471] ([Intel XE#2136]) +23 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#653]) -> [SKIP][473] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#656]) -> [SKIP][475] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#656]) -> [SKIP][477] ([Intel XE#2136]) +8 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][479] ([Intel XE#653]) +10 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][480] ([Intel XE#2313]) -> [SKIP][481] ([Intel XE#2312]) +8 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#2423] / [i915#2575]) -> [SKIP][483] ([Intel XE#605])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [DMESG-WARN][484] ([Intel XE#3468]) -> [SKIP][485] ([Intel XE#2423] / [i915#2575])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][486] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][487] ([Intel XE#3544])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#455]) -> [SKIP][489] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [SKIP][490] ([Intel XE#1503]) -> [SKIP][491] ([Intel XE#2423])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#346]) -> [SKIP][493] ([Intel XE#2136])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#2136]) -> [SKIP][495] ([Intel XE#2925])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][496] ([Intel XE#2486]) -> [SKIP][497] ([Intel XE#2423]) +1 other test skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_panel_fitting@legacy.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][498] ([Intel XE#616]) -> [SKIP][499] ([Intel XE#2423] / [i915#2575])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@kms_plane_cursor@primary.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#2423] / [i915#2575]) -> [SKIP][501] ([Intel XE#455]) +6 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_plane_lowres@tiling-yf.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][502] ([Intel XE#2493]) -> [SKIP][503] ([Intel XE#2423]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#2423] / [i915#2575]) -> [SKIP][505] ([Intel XE#2763] / [Intel XE#455])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][506] ([Intel XE#2763]) -> [SKIP][507] ([Intel XE#2423]) +6 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][508] ([Intel XE#870]) -> [SKIP][509] ([Intel XE#2136]) +1 other test skip
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#2136]) -> [SKIP][511] ([Intel XE#870])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][512] ([Intel XE#2938]) -> [SKIP][513] ([Intel XE#2136])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#2938]) -> [SKIP][515] ([Intel XE#2136])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][516] ([Intel XE#2391]) -> [SKIP][517] ([Intel XE#2136])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][518] ([Intel XE#2392]) -> [SKIP][519] ([Intel XE#2136])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][520] ([Intel XE#2505]) -> [SKIP][521] ([Intel XE#2136])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#2446]) -> [INCOMPLETE][523] ([Intel XE#1727] / [Intel XE#3468])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [DMESG-WARN][524] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][525] ([Intel XE#2446])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#1489]) -> [SKIP][527] ([Intel XE#2136]) +6 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#2136]) -> [SKIP][529] ([Intel XE#1489]) +4 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][530] ([Intel XE#1489]) -> [SKIP][531] ([Intel XE#2136]) +15 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#2136]) -> [SKIP][533] ([Intel XE#1122]) +1 other test skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#1122]) -> [SKIP][535] ([Intel XE#2136])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@kms_psr2_su@page_flip-xrgb8888.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][537] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][539] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][540] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][541] ([Intel XE#2136]) +26 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#2136]) -> [SKIP][543] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][545] ([Intel XE#2136]) +9 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#2351]) -> [SKIP][547] ([Intel XE#2850] / [Intel XE#929])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][548] ([Intel XE#2414]) -> [SKIP][549] ([Intel XE#2136])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#2136]) -> [SKIP][551] ([Intel XE#2939])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#1127]) -> [SKIP][553] ([Intel XE#2423] / [i915#2575])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#2423] / [i915#2575]) -> [SKIP][555] ([Intel XE#3414])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][556] ([Intel XE#3414]) -> [SKIP][557] ([Intel XE#2423]) +2 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#3414]) -> [SKIP][559] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][560] ([Intel XE#2413]) -> [SKIP][561] ([Intel XE#2423])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][562] ([Intel XE#2426]) -> [SKIP][563] ([Intel XE#2423])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#1500]) -> [SKIP][565] ([Intel XE#362])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#2423] / [i915#2575]) -> [SKIP][567] ([Intel XE#330])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          [SKIP][568] ([Intel XE#2450]) -> [SKIP][569] ([Intel XE#2423])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][570] ([Intel XE#1499]) -> [SKIP][571] ([Intel XE#2423]) +1 other test skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_vrr@flip-dpms.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][572] ([Intel XE#2168]) -> [SKIP][573] ([Intel XE#2423])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_vrr@lobf.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#756]) -> [SKIP][575] ([Intel XE#2423] / [i915#2575])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#2423] / [i915#2575]) -> [SKIP][577] ([Intel XE#756])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][578] ([Intel XE#756]) -> [SKIP][579] ([Intel XE#2423]) +2 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#2423] / [i915#2575]) -> [SKIP][581] ([Intel XE#1091] / [Intel XE#2849])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][583] ([Intel XE#1130]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][584] ([Intel XE#2504]) -> [SKIP][585] ([Intel XE#1130])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          [SKIP][586] ([Intel XE#2905]) -> [SKIP][587] ([Intel XE#1130]) +20 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-dg2-set2:     [SKIP][588] -> [SKIP][589] ([Intel XE#1130])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_eudebug_online@pagefault-write.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#1130]) -> [SKIP][591] ([Intel XE#2905]) +9 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#2905]) -> [SKIP][593] ([Intel XE#1130]) +9 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-dg2-set2:     [DMESG-WARN][594] -> [SKIP][595] ([Intel XE#1130])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_evict@evict-beng-large-external.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][596] ([Intel XE#1600]) -> [SKIP][597] ([Intel XE#1130])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
    - shard-bmg:          [FAIL][598] ([Intel XE#2364]) -> [SKIP][599] ([Intel XE#1130]) +1 other test skip
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#1130]) -> [TIMEOUT][601] ([Intel XE#1473] / [Intel XE#402])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][602] ([Intel XE#1473]) -> [SKIP][603] ([Intel XE#1130])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_balancer@twice-cm-parallel-rebind:
    - shard-dg2-set2:     [DMESG-WARN][604] ([Intel XE#1727]) -> [SKIP][605] ([Intel XE#1130]) +1 other test skip
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_exec_balancer@twice-cm-parallel-rebind.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_exec_balancer@twice-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][606] ([Intel XE#2322]) -> [SKIP][607] ([Intel XE#1130]) +15 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][608] ([Intel XE#1727]) -> [SKIP][609] ([Intel XE#1130])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#1130]) -> [SKIP][611] ([Intel XE#288]) +28 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#288]) -> [SKIP][613] ([Intel XE#1130]) +25 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [DMESG-WARN][614] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][615] ([Intel XE#3467])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#1130]) -> [DMESG-WARN][617] ([Intel XE#3343]) +1 other test dmesg-warn
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          [DMESG-WARN][618] ([Intel XE#3467]) -> [SKIP][619] ([Intel XE#1130])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [DMESG-WARN][620] ([Intel XE#3343] / [Intel XE#3468]) -> [SKIP][621] ([Intel XE#1130])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-dg2-set2:     [DMESG-WARN][622] ([Intel XE#3467]) -> [SKIP][623] ([Intel XE#1130]) +3 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [DMESG-WARN][624] ([Intel XE#3343]) -> [SKIP][625] ([Intel XE#1130])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-dg2-set2:     [SKIP][626] ([Intel XE#1130]) -> [DMESG-WARN][627] ([Intel XE#3467])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-FAIL][628] ([Intel XE#3467]) -> [FAIL][629] ([Intel XE#3499])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [FAIL][630] ([Intel XE#3499]) -> [SKIP][631] ([Intel XE#1130])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][632] ([Intel XE#3467] / [Intel XE#3468]) -> [FAIL][633] ([Intel XE#3499])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][634] ([Intel XE#3467]) -> [DMESG-WARN][635] ([Intel XE#3468])
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][636] ([Intel XE#255]) -> [SKIP][637] ([Intel XE#1130])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][638] ([Intel XE#3573]) -> [SKIP][639] ([Intel XE#1130]) +2 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_oa@non-system-wide-paranoid.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][640] ([Intel XE#1130]) -> [SKIP][641] ([Intel XE#3573]) +6 other tests skip
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][642] ([Intel XE#1130]) -> [SKIP][643] ([Intel XE#1337])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][644] ([Intel XE#977]) -> [SKIP][645] ([Intel XE#1130])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_pat@pat-index-xe2.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][646] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][647] ([Intel XE#1130])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          [SKIP][648] ([Intel XE#1420]) -> [SKIP][649] ([Intel XE#1130])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#979]) -> [SKIP][651] ([Intel XE#1130])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][652] ([Intel XE#2284]) -> [SKIP][653] ([Intel XE#1130]) +1 other test skip
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_pm@d3cold-mocs.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-dg2-set2:     [DMESG-WARN][654] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][655] ([Intel XE#1130])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_pm@d3hot-mmap-vram.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][656] ([Intel XE#1130]) -> [SKIP][657] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][658] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) -> [SKIP][659] ([Intel XE#1130])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
    - shard-dg2-set2:     [SKIP][660] ([Intel XE#1130]) -> [ABORT][661] ([Intel XE#1694] / [Intel XE#1794])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][662] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [SKIP][663] ([Intel XE#1130])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-exec-after:
    - shard-dg2-set2:     [SKIP][664] ([Intel XE#1130]) -> [ABORT][665] ([Intel XE#1358])
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_pm@s4-exec-after.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#944]) -> [SKIP][667] ([Intel XE#1130]) +3 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][668] ([Intel XE#944]) -> [SKIP][669] ([Intel XE#1130]) +4 other tests skip
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
    - shard-dg2-set2:     [SKIP][670] ([Intel XE#1130]) -> [SKIP][671] ([Intel XE#944]) +1 other test skip
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][672] ([Intel XE#3342]) -> [SKIP][673] ([Intel XE#1130])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [DMESG-WARN][674] ([Intel XE#3468]) -> [SKIP][675] ([Intel XE#1130]) +8 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [ABORT][676] ([Intel XE#3421]) -> [SKIP][677] ([Intel XE#1130])
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][678] -> [SKIP][679] ([Intel XE#1130])
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2076
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8125 -> IGTPW_12197
  * Linux: xe-2275-6510562075d8541c218e72188f9ef339f8ba371f -> xe-2276-ae312905c5a9fc7ce599a74422f068725101c475

  IGTPW_12197: 12197
  IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2275-6510562075d8541c218e72188f9ef339f8ba371f: 6510562075d8541c218e72188f9ef339f8ba371f
  xe-2276-ae312905c5a9fc7ce599a74422f068725101c475: ae312905c5a9fc7ce599a74422f068725101c475

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/index.html

--===============6866064009863041937==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dsc: Add meaningfull skip message (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141738/">https://patchwork.freedesktop.org/series/141738/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8125_full -&gt; XEIGTPW_12197_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12197_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12197_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12197_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-6/igt@kms_psr@psr2-primary-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-1/igt@kms_psr@psr2-primary-render.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_eudebug_online@pagefault-write.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_module_load@reload-no-display.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8125_full and XEIGTPW_12197_full:</p>
<h3>New IGT tests (252)</h3>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-6-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-6-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-6-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-dp-2-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-6-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-dp-2-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-dp-2-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-dp-2-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr444-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr444-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-edp-1-ycbcr444-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr444-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr444-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr444-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr444-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr444-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-edp-1-ycbcr444-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr444-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr444-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr444-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr444-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr444-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-edp-1-ycbcr444-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr444-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr444-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr444-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr444-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr444-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-2-ycbcr444-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr444-10bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr444-12bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr444-8bpc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-dp-4-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-dp-4-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-edp-1-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-edp-1-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-3-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-3-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-6-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-6-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-dp-4-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-dp-4-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-edp-1-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-edp-1-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-3-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-3-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-6-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-6-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-dp-4-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-dp-4-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-edp-1-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-edp-1-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-3-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-3-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-6-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-6-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-dp-2-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-dp-2-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-dp-4-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-dp-4-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-3-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-3-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-6-ycbcr420:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-6-ycbcr444:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12197_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2076">Intel XE#2076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +124 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +21 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-set-prop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_prop_blob@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_prop_blob@invalid-set-prop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +117 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_sequence@get-busy@pipe-c-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +143 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +264 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-no-array-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_vm@bind-no-array-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@core_getstats.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_dsc@dsc-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">PASS</a> +5 other tests pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_flip@2x-plain-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_vblank@wait-forked-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_vblank@wait-forked-busy-hang.html">PASS</a> +80 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@xe_exec_basic@many-execqueues-bindexecqueue.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-1/igt@xe_exec_basic@many-execqueues-bindexecqueue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_exec_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@xe_exec_basic@once-userptr-invalidate-race.html">PASS</a> +127 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_exec_fault_mode@twice-bindexecqueue.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-4/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-6/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-5/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_pat@display-vs-wb-transient.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_pat@display-vs-wb-transient.html">PASS</a> +77 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@xe_pm@s3-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_pm@s3-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@fbdev@write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_content_protection@srm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-128x128.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-128x128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_flip@absolute-wf_vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_evict@evict-beng-large-external.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_evict@evict-beng-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_exec_balancer@twice-cm-parallel-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_exec_balancer@twice-cm-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-432/igt@xe_pm@d3hot-mmap-vram.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_pm@s4-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-432/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12197/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8125 -&gt; IGTPW_12197</li>
<li>Linux: xe-2275-6510562075d8541c218e72188f9ef339f8ba371f -&gt; xe-2276-ae312905c5a9fc7ce599a74422f068725101c475</li>
</ul>
<p>IGTPW_12197: 12197<br />
  IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2275-6510562075d8541c218e72188f9ef339f8ba371f: 6510562075d8541c218e72188f9ef339f8ba371f<br />
  xe-2276-ae312905c5a9fc7ce599a74422f068725101c475: ae312905c5a9fc7ce599a74422f068725101c475</p>

</body>
</html>

--===============6866064009863041937==--
