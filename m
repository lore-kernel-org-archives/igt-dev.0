Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFD9D116E8
	for <igt-dev@archiver.kernel.org>; Sun, 27 Oct 2024 12:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF9210E1F2;
	Sun, 27 Oct 2024 12:56:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45F710E1F2;
 Sun, 27 Oct 2024 12:56:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4423938662299456089=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/oa=3A_Tests_for_O?=
 =?utf-8?q?A_syncs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 27 Oct 2024 12:56:43 -0000
Message-ID: <173003380392.1352737.14285973415170600159@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
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

--===============4423938662299456089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/oa: Tests for OA syncs (rev4)
URL   : https://patchwork.freedesktop.org/series/137482/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8086_full -> XEIGTPW_11987_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11987_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11987_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11987_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@wait-busy:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-463/igt@kms_vblank@wait-busy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_vblank@wait-busy.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +6 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - shard-lnl:          [PASS][6] -> [DMESG-WARN][7] +7 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@xe_exec_fault_mode@many-invalid-fault.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-2/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +2 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][10] -> [FAIL][11] +4 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html

  * {igt@xe_oa@syncs-ufence-cfg@rcs-0} (NEW):
    - shard-lnl:          NOTRUN -> [DMESG-WARN][12] +3 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@xe_oa@syncs-ufence-cfg@rcs-0.html

  * {igt@xe_oa@syncs-ufence-none@rcs-0} (NEW):
    - shard-bmg:          NOTRUN -> [DMESG-WARN][13] +3 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_oa@syncs-ufence-none@rcs-0.html

  * igt@xe_oa@syncs-userptr-cfg (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] +9 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_oa@syncs-userptr-cfg.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][15] ([Intel XE#1473]) -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][17] ([Intel XE#1130]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#455]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@xe_live_ktest@xe_eudebug.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_live_ktest@xe_eudebug.html

  
New tests
---------

  New tests have been introduced between XEIGT_8086_full and XEIGTPW_11987_full:

### New IGT tests (24) ###

  * igt@xe_oa@syncs-syncobj-cfg:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@syncs-syncobj-cfg@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_oa@syncs-syncobj-none:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@syncs-syncobj-none@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@syncs-syncobj-wait:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_oa@syncs-syncobj-wait-cfg@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_oa@syncs-syncobj-wait@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_oa@syncs-ufence-cfg:
    - Statuses : 2 dmesg-warn(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@syncs-ufence-cfg@rcs-0:
    - Statuses : 2 dmesg-warn(s)
    - Exec time: [0.02] s

  * igt@xe_oa@syncs-ufence-none:
    - Statuses : 2 dmesg-warn(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@syncs-ufence-none@rcs-0:
    - Statuses : 2 dmesg-warn(s)
    - Exec time: [0.01] s

  * igt@xe_oa@syncs-ufence-wait:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_oa@syncs-ufence-wait-cfg@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_oa@syncs-ufence-wait@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_oa@syncs-userptr-cfg:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@syncs-userptr-cfg@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@syncs-userptr-none:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@syncs-userptr-none@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@syncs-userptr-wait:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_oa@syncs-userptr-wait-cfg@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_oa@syncs-userptr-wait@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11987_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#1701]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][23] -> [DMESG-WARN][24] ([Intel XE#877])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2231])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#616]) +8 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1195] / [Intel XE#1727]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1195] / [Intel XE#3113]) +1 other test incomplete
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +20 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_color@ctm-0-75@pipe-a-edp-1:
    - shard-lnl:          [PASS][37] -> [DMESG-WARN][38] ([Intel XE#2929]) +1 other test dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_color@ctm-0-75@pipe-a-edp-1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-a-edp-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][39] ([Intel XE#3177])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1178])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#776])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1137])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][43] -> [FAIL][44] ([Intel XE#301]) +6 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#3149] / [Intel XE#886])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#886]) +7 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#301]) +4 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][51] -> [INCOMPLETE][52] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#1195] / [Intel XE#2049]) +1 other test incomplete
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#651]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#653]) +9 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-435/igt@kms_invalid_mode@bad-vsync-start.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#3007]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-5/igt@kms_plane_lowres@tiling-none.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][61] -> [FAIL][62] ([Intel XE#361])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][63] ([Intel XE#3177]) +3 other tests dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#870])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#718]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#1430])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1489]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#2948]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#327])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][74] -> [FAIL][75] ([Intel XE#899]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#2159]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#2443]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#756])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_writeback@writeback-check-output.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#1050])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1123])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][83] -> [FAIL][84] ([Intel XE#2667])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2905]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][86] -> [FAIL][87] ([Intel XE#1600])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [PASS][88] -> [INCOMPLETE][89] ([Intel XE#1473])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-lnl:          [PASS][90] -> [DMESG-WARN][91] ([Intel XE#3230])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-7/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#288]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2360])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - shard-dg2-set2:     [PASS][94] -> [DMESG-WARN][95] ([Intel XE#3230])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-dg2-set2:     [PASS][96] -> [DMESG-WARN][97] ([Intel XE#358]) +2 other tests dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-466/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2229])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][99] ([Intel XE#1173])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][100] -> [ABORT][101] ([Intel XE#1794])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#958])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#944])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@xe_query@multigpu-query-config.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-536870912:
    - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#1130]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_vm@large-userptr-split-misaligned-binds-536870912.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@xe_vm@large-userptr-split-misaligned-binds-536870912.html
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#1130]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@xe_vm@large-userptr-split-misaligned-binds-536870912.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@xe_vm@large-userptr-split-misaligned-binds-536870912.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][109] ([Intel XE#911]) -> [PASS][110] +3 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][111] ([Intel XE#1701]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][113] ([Intel XE#1426]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][115] ([Intel XE#2231]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][117] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][119] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][121] ([Intel XE#877]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [FAIL][123] ([Intel XE#1541]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_fb_coherency@memset-crc.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][127] ([Intel XE#2882]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][129] ([Intel XE#301]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][131] ([Intel XE#886]) -> [PASS][132] +5 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-lnl:          [FAIL][133] ([Intel XE#3097]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-6/igt@kms_flip@dpms-vs-vblank-race.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-2/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][135] ([Intel XE#301]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_lease@lease-invalid-connector:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#2423] / [i915#2575]) -> [PASS][138] +14 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_lease@lease-invalid-connector.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@kms_lease@lease-invalid-connector.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][139] ([Intel XE#361]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [SKIP][141] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][142] +5 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_pm_dc@dc5-dpms-negative.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_pm_dc@dc5-dpms-negative.html
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#2890]) -> [PASS][144] +6 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_pm_dc@dc5-dpms-negative.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][145] ([Intel XE#2042]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          [FAIL][147] ([Intel XE#2948]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          [SKIP][149] ([Intel XE#3007]) -> [PASS][150] +14 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_sequence@get-busy.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@kms_sequence@get-busy.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][151] ([Intel XE#2883]) -> [PASS][152] +2 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][153] ([Intel XE#2443]) -> [PASS][154] +3 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_vrr@flip-basic.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_vrr@flip-basic.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#2423]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@testdisplay.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@testdisplay.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][157] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1130]) -> [PASS][160] +17 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - shard-dg2-set2:     [DMESG-WARN][161] -> [PASS][162] +5 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][163] -> [PASS][164] +3 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][165] ([Intel XE#3160]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-invalid-fault:
    - shard-lnl:          [DMESG-WARN][167] -> [PASS][168] +5 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@xe_exec_fault_mode@once-invalid-fault.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-5/igt@xe_exec_fault_mode@once-invalid-fault.html

  * igt@xe_exec_reset@parallel-close-fd:
    - shard-bmg:          [FAIL][169] ([Intel XE#1081]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-7/igt@xe_exec_reset@parallel-close-fd.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_exec_reset@parallel-close-fd.html
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#1081]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-435/igt@xe_exec_reset@parallel-close-fd.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_exec_reset@parallel-close-fd.html

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#358]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-rebind.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-rebind.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][175] -> [PASS][176] +4 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-7/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-bmg:          [DMESG-WARN][177] ([Intel XE#3230]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-4/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_intel_bb@lot-of-buffers:
    - shard-bmg:          [SKIP][179] ([Intel XE#1130]) -> [PASS][180] +27 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_intel_bb@lot-of-buffers.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@xe_intel_bb@lot-of-buffers.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1192]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@oa-exponents@rcs-0:
    - shard-lnl:          [FAIL][183] ([Intel XE#2976]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-7/igt@xe_oa@oa-exponents@rcs-0.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@xe_oa@oa-exponents@rcs-0.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [DMESG-WARN][185] ([Intel XE#3184]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-4/igt@xe_pm@d3hot-multiple-execs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@xe_pm@d3hot-multiple-execs.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][187] ([Intel XE#2231]) -> [SKIP][188] ([Intel XE#2327])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][190] ([Intel XE#316])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][191] ([Intel XE#1124]) -> [SKIP][192] ([Intel XE#2231] / [Intel XE#2890])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1124]) -> [SKIP][194] ([Intel XE#2890])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][195] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][196] ([Intel XE#1124]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2890]) -> [SKIP][198] ([Intel XE#1124]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][199] ([Intel XE#2231]) -> [SKIP][200] ([Intel XE#2887])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][201] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][202] ([Intel XE#2887])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2890]) -> [SKIP][204] ([Intel XE#455] / [Intel XE#787])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2907]) -> [SKIP][206] ([Intel XE#2890])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][207] ([Intel XE#3007]) -> [SKIP][208] ([Intel XE#2325]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2423] / [i915#2575]) -> [SKIP][210] ([Intel XE#306]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          [SKIP][211] ([Intel XE#3007]) -> [SKIP][212] ([Intel XE#2252])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2423] / [i915#2575]) -> [SKIP][214] ([Intel XE#373])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          [SKIP][215] ([Intel XE#2252]) -> [SKIP][216] ([Intel XE#3007])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#373]) -> [SKIP][218] ([Intel XE#2423] / [i915#2575])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][219] ([Intel XE#3007]) -> [DMESG-FAIL][220] ([Intel XE#3177])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_content_protection@srm.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_content_protection@srm.html
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2423] / [i915#2575]) -> [FAIL][222] ([Intel XE#1178])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_content_protection@srm.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          [SKIP][223] ([Intel XE#3007]) -> [SKIP][224] ([Intel XE#2320])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2423] / [i915#2575]) -> [SKIP][226] ([Intel XE#308])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-bmg:          [SKIP][227] ([Intel XE#3007]) -> [SKIP][228] ([Intel XE#2321])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][229] ([Intel XE#1504]) -> [TIMEOUT][230] ([Intel XE#1504]) +1 other test timeout
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][231] ([Intel XE#2231]) -> [SKIP][232] ([Intel XE#2311]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][234] ([Intel XE#651])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][235] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][236] ([Intel XE#2333])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2890]) -> [SKIP][238] ([Intel XE#651]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
    - shard-bmg:          [SKIP][239] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][240] ([Intel XE#2311])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][241] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][242] ([Intel XE#2313]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2890]) -> [SKIP][244] ([Intel XE#653]) +5 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][245] ([Intel XE#2231]) -> [SKIP][246] ([Intel XE#2313])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-bmg:          [SKIP][247] ([Intel XE#3007]) -> [DMESG-WARN][248] ([Intel XE#2566] / [Intel XE#3177])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][249] ([Intel XE#2231]) -> [SKIP][250] ([Intel XE#1489])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2890]) -> [SKIP][252] ([Intel XE#1489])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][254] ([Intel XE#2850] / [Intel XE#929])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2890]) -> [SKIP][256] ([Intel XE#2850] / [Intel XE#929])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html
    - shard-bmg:          [SKIP][257] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][258] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_psr@pr-sprite-blt.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1500]) -> [SKIP][260] ([Intel XE#362])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          [SKIP][261] ([Intel XE#3007]) -> [SKIP][262] ([Intel XE#756])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2423] / [i915#2575]) -> [SKIP][264] ([Intel XE#756])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1130]) -> [SKIP][266] ([Intel XE#1126])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          [SKIP][267] ([Intel XE#1130]) -> [SKIP][268] ([Intel XE#2905])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1130]) -> [SKIP][270] ([Intel XE#2905])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][271] ([Intel XE#1473]) -> [INCOMPLETE][272] ([Intel XE#1195] / [Intel XE#1473])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [DMESG-FAIL][273] -> [FAIL][274] ([Intel XE#2364])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [SKIP][275] ([Intel XE#1130]) -> [SKIP][276] ([Intel XE#2322])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][277] -> [SKIP][278] ([Intel XE#1130])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1130]) -> [SKIP][280] ([Intel XE#288]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#288]) -> [SKIP][282] ([Intel XE#1130]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1130]) -> [SKIP][284] ([Intel XE#2360])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][285] ([Intel XE#1999]) -> [SKIP][286] ([Intel XE#1192])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1130]) -> [SKIP][288] ([Intel XE#2541]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][289] ([Intel XE#2557]) -> [SKIP][290] ([Intel XE#2427])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_peer2peer@write.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@xe_peer2peer@write.html
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1061]) -> [FAIL][292] ([Intel XE#1173])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_peer2peer@write.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8086 -> IGTPW_11987
  * Linux: xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e -> xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306

  IGTPW_11987: 690bba0c6a9a345ec062cba6ba7b6e1e4f71f6b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e: 263b21a91964ddc599f4f85cf3511b0aafd2028e
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/index.html

--===============4423938662299456089==
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
<tr><td><b>Series:</b></td><td>tests/intel/oa: Tests for OA syncs (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137482/">https://patchwork.freedesktop.org/series/137482/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8086_full -&gt; XEIGTPW_11987_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11987_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11987_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11987_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vblank@wait-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-463/igt@kms_vblank@wait-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_vblank@wait-busy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-2/igt@xe_exec_fault_mode@many-invalid-fault.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@syncs-ufence-cfg@rcs-0} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@xe_oa@syncs-ufence-cfg@rcs-0.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@syncs-ufence-none@rcs-0} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_oa@syncs-ufence-none@rcs-0.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-cfg (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_oa@syncs-userptr-cfg.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_live_ktest@xe_eudebug.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8086_full and XEIGTPW_11987_full:</p>
<h3>New IGT tests (24)</h3>
<ul>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-cfg:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-cfg@rcs-0:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-none:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-none@rcs-0:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-cfg:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-cfg@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-none:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-none@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11987_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_color@ctm-0-75@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-435/igt@kms_invalid_mode@bad-vsync-start.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_invalid_mode@bad-vsync-start.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-5/igt@kms_plane_lowres@tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-7/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-466/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-536870912:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_vm@large-userptr-split-misaligned-binds-536870912.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@xe_vm@large-userptr-split-misaligned-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@xe_vm@large-userptr-split-misaligned-binds-536870912.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@xe_vm@large-userptr-split-misaligned-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_fb_coherency@memset-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-6/igt@kms_flip@dpms-vs-vblank-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097">Intel XE#3097</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-2/igt@kms_flip@dpms-vs-vblank-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_lease@lease-invalid-connector.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@kms_lease@lease-invalid-connector.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> +5 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_sequence@get-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@kms_sequence@get-busy.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-8/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-3/igt@kms_vrr@flip-basic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@xe_exec_fault_mode@once-invalid-fault.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-5/igt@xe_exec_fault_mode@once-invalid-fault.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-7/igt@xe_exec_reset@parallel-close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_exec_reset@parallel-close-fd.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-435/igt@xe_exec_reset@parallel-close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_exec_reset@parallel-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-7/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-4/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@lot-of-buffers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_intel_bb@lot-of-buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@xe_intel_bb@lot-of-buffers.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-7/igt@xe_oa@oa-exponents@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976">Intel XE#2976</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@xe_oa@oa-exponents@rcs-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-4/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-1/igt@xe_pm@d3hot-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_content_protection@srm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-464/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-435/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557">Intel XE#2557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-bmg-7/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/shard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8086 -&gt; IGTPW_11987</li>
<li>Linux: xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e -&gt; xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306</li>
</ul>
<p>IGTPW_11987: 690bba0c6a9a345ec062cba6ba7b6e1e4f71f6b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e: 263b21a91964ddc599f4f85cf3511b0aafd2028e<br />
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306</p>

</body>
</html>

--===============4423938662299456089==--
