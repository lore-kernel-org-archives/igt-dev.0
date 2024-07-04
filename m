Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF1EC30653
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 22:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ACA10E077;
	Thu,  4 Jul 2024 22:18:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E04710E21C;
 Thu,  4 Jul 2024 22:18:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1015179573866194181=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_Add_per-client_engine_utiliza?=
 =?utf-8?q?tion_tests_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jul 2024 22:18:04 -0000
Message-ID: <172013148417.29931.10172422878705962996@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
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

--===============1015179573866194181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add per-client engine utilization tests (rev4)
URL   : https://patchwork.freedesktop.org/series/135204/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7916_full -> XEIGTPW_11367_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11367_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_getfb} (NEW):
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-1/igt@kms_getfb.html

  * {igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle} (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][2] +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html

  * {igt@xe_drm_fdinfo@drm-most-busy-idle-check-all} (NEW):
    - {shard-lnl}:        NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-8/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - {shard-lnl}:        [SKIP][4] ([Intel XE#373]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-5/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-7/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  
New tests
---------

  New tests have been introduced between XEIGT_7916_full and XEIGTPW_11367_full:

### New IGT tests (18) ###

  * igt@kms_getfb:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_drm_fdinfo@basic-engine-utilization:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_drm_fdinfo@basic-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_drm_fdinfo@drm-all-busy-idle-check-all:
    - Statuses : 2 pass(s)
    - Exec time: [0.51] s

  * igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle:
    - Statuses : 1 fail(s)
    - Exec time: [0.53] s

  * igt@xe_drm_fdinfo@drm-busy-idle:
    - Statuses : 2 pass(s)
    - Exec time: [2.54, 3.54] s

  * igt@xe_drm_fdinfo@drm-busy-idle-check-all:
    - Statuses : 2 pass(s)
    - Exec time: [2.55, 3.55] s

  * igt@xe_drm_fdinfo@drm-busy-idle-isolation:
    - Statuses : 1 pass(s)
    - Exec time: [3.54] s

  * igt@xe_drm_fdinfo@drm-idle:
    - Statuses : 2 pass(s)
    - Exec time: [2.51, 3.52] s

  * igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:
    - Statuses : 2 fail(s)
    - Exec time: [1.04, 1.56] s

  * igt@xe_drm_fdinfo@drm-parallel-all-busy-idle-check-all:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@xe_drm_fdinfo@drm-parallel-busy-idle:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 1.01] s

  * igt@xe_drm_fdinfo@drm-parallel-busy-idle-isolation:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@xe_drm_fdinfo@drm-parallel-idle:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 1.00] s

  * igt@xe_drm_fdinfo@drm-virtual-all-busy-idle-check-all:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@xe_drm_fdinfo@drm-virtual-busy-idle:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 1.01] s

  * igt@xe_drm_fdinfo@drm-virtual-busy-idle-isolation:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 1.01] s

  * igt@xe_drm_fdinfo@drm-virtual-idle:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 1.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11367_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1162] / [Intel XE#1214])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-dg2-set2:     [PASS][8] -> [INCOMPLETE][9] ([Intel XE#1150] / [Intel XE#1195])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-x:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1195]) +2 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-x.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-x.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#306])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#373])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-466/igt@kms_cursor_legacy@torture-move.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#870])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#1489])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#327])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#756])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][31] -> [TIMEOUT][32] ([Intel XE#1473] / [Intel XE#392])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) +1 other test incomplete
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@xe_evict@evict-threads-large.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#1192] / [Intel XE#1201])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][38] -> [DMESG-WARN][39] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_vm@mixed-userptr-binds-1611661312:
    - shard-dg2-set2:     [PASS][42] -> [DMESG-WARN][43] ([Intel XE#1214]) +4 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-436/igt@xe_vm@mixed-userptr-binds-1611661312.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@xe_vm@mixed-userptr-binds-1611661312.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - {shard-lnl}:        [FAIL][44] ([Intel XE#1659]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][46] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * {igt@kms_plane@plane-position-covered@pipe-a-plane-1}:
    - {shard-lnl}:        [DMESG-FAIL][48] ([Intel XE#324]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][50] ([Intel XE#771] / [Intel XE#899]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][52] ([Intel XE#899]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][54] ([Intel XE#1473]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][56] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind:
    - {shard-lnl}:        [FAIL][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-5/igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-4/igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - {shard-lnl}:        [SKIP][60] ([Intel XE#1192]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-4/igt@xe_live_ktest@xe_bo.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [DMESG-WARN][62] ([Intel XE#1214]) -> [PASS][63] +7 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_module_load@reload.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#1694]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-userptr.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][66] ([Intel XE#1214] / [Intel XE#569]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [INCOMPLETE][68] ([Intel XE#1195]) -> [FAIL][69] ([Intel XE#1204]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_content_protection@lic-type-0.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][70] ([Intel XE#1551]) -> [FAIL][71] ([Intel XE#616]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][72] ([Intel XE#1473] / [Intel XE#392]) -> [DMESG-FAIL][73] ([Intel XE#482])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][74] ([Intel XE#1999]) -> [SKIP][75] ([Intel XE#1192] / [Intel XE#1201])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][77] ([Intel XE#1760])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_7916 -> IGTPW_11367
  * Linux: xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6 -> xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6

  IGTPW_11367: 11367
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6: 2bf4c5214910654a6a50082c90f0f4596ea6b0c6
  xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6: 55e18f9be7b75c5226a57eff4a3b3eb6110815c6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/index.html

--===============1015179573866194181==
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
<tr><td><b>Series:</b></td><td>Add per-client engine utilization tests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135204/">https://patchwork.freedesktop.org/series/135204/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7916_full -&gt; XEIGTPW_11367_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11367_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_getfb} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-1/igt@kms_getfb.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_drm_fdinfo@drm-most-busy-idle-check-all} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-8/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_chamelium_frames@hdmi-cmp-planes-random:<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-5/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-7/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7916_full and XEIGTPW_11367_full:</p>
<h3>New IGT tests (18)</h3>
<ul>
<li>
<p>igt@kms_getfb:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@basic-engine-utilization:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@basic-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-all-busy-idle-check-all:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-busy-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.54, 3.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-busy-idle-check-all:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.55, 3.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-busy-idle-isolation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.51, 3.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.04, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-parallel-all-busy-idle-check-all:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-parallel-busy-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-parallel-busy-idle-isolation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-parallel-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-virtual-all-busy-idle-check-all:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-virtual-busy-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-virtual-busy-idle-isolation:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-virtual-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 1.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11367_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-x.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-466/igt@kms_cursor_legacy@torture-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-binds-1611661312:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-436/igt@xe_vm@mixed-userptr-binds-1611661312.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@xe_vm@mixed-userptr-binds-1611661312.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-covered@pipe-a-plane-1}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-5/igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-4/igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-4/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-lnl-6/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-435/igt@xe_module_load@reload.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11367/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7916 -&gt; IGTPW_11367</li>
<li>Linux: xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6 -&gt; xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6</li>
</ul>
<p>IGTPW_11367: 11367<br />
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6: 2bf4c5214910654a6a50082c90f0f4596ea6b0c6<br />
  xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6: 55e18f9be7b75c5226a57eff4a3b3eb6110815c6</p>

</body>
</html>

--===============1015179573866194181==--
