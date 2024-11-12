Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F79D42BA2
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 16:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E3710E032;
	Tue, 12 Nov 2024 16:11:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF5110E032;
 Tue, 12 Nov 2024 16:11:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5271947258424391381=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_xe=5Ffault=5Finjection_improv?=
 =?utf-8?q?ements_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 Nov 2024 16:11:12 -0000
Message-ID: <173142787202.3103693.16124183565382200067@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112133034.1919573-1-francois.dugast@intel.com>
In-Reply-To: <20241112133034.1919573-1-francois.dugast@intel.com>
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

--===============5271947258424391381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_fault_injection improvements (rev3)
URL   : https://patchwork.freedesktop.org/series/139777/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8103_full -> XEIGTPW_12079_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12079_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12079_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12079_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@core_getversion@all-cards.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init (NEW):
    - shard-bmg:          NOTRUN -> [DMESG-WARN][7] +5 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init (NEW):
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][8] +3 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * {igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc} (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][9] +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * {igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch} (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][10] +7 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][13] ([Intel XE#3309]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html

  
New tests
---------

  New tests have been introduced between XEIGT_8103_full and XEIGTPW_12079_full:

### New IGT tests (21) ###

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - Statuses : 2 dmesg-warn(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - Statuses : 2 dmesg-warn(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [0.06] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - Statuses : 2 dmesg-warn(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - Statuses : 2 dmesg-warn(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - Statuses : 1 dmesg-warn(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - Statuses : 2 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - Statuses : 2 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - Statuses : 2 fail(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12079_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#1885]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@core_hotunplug@hotrebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][17] -> [FAIL][18] ([Intel XE#3339])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2134])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@fbdev@info.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2423] / [i915#2575]) +110 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [PASS][22] -> [FAIL][23] ([Intel XE#1426]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2327])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#607])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#607])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1124]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2191]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +112 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1195] / [Intel XE#3113])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][40] ([Intel XE#3113])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][41] ([Intel XE#1195])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2320]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#455]) +8 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#323])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][48] ([Intel XE#877]) +1 other test dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([i915#3804])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#2423])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_dp_aux_dev.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#2351])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][53] ([Intel XE#1695])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2373])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#301]) +6 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][57] -> [FAIL][58] ([Intel XE#301]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2293]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#2136]) +28 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#2351])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_frontbuffer_tracking@basic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2136]) +28 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2311]) +9 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#2333]) +3 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#651]) +15 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2313]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#653]) +13 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#455])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2423] / [i915#2575]) +33 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#361])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2938])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2938])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#2446])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#2446]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1489]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1489]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1499])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1091] / [Intel XE#2849])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2905]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2905]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#2364])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][92] -> [TIMEOUT][93] ([Intel XE#1473] / [Intel XE#2472])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#1130]) +214 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@xe_exec_balancer@twice-virtual-basic.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2322]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-bmg:          [PASS][97] -> [FAIL][98] ([Intel XE#1630]) +3 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#288]) +8 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1130]) +42 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2229]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2541]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_oa@map-oa-buffer.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][103] ([Intel XE#1173])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#944]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#944]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_tlb@basic-tlb:
    - shard-bmg:          [PASS][106] -> [CRASH][107] ([Intel XE#3212])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-5/igt@xe_tlb@basic-tlb.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@xe_tlb@basic-tlb.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#2134]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@fbdev@write.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@fbdev@write.html

  * igt@kms_3d:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#2423]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_3d.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_3d.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#2890]) -> [PASS][113] +23 other tests pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][114] ([Intel XE#877]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-bmg:          [INCOMPLETE][116] ([Intel XE#2635]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][118] -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-dp2-hdmi-a3.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][120] ([Intel XE#301]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#2423] / [i915#2575]) -> [PASS][123] +63 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_flip@bo-too-big-interruptible.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][125] +4 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#2446]) -> [PASS][127] +3 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][128] ([Intel XE#1473]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1130]) -> [PASS][131] +137 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][132] ([Intel XE#1630]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][134] ([Intel XE#2998]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][136] ([Intel XE#2136]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_module_load@reload.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][138] ([Intel XE#877]) -> [SKIP][139] ([Intel XE#2136] / [Intel XE#2351])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#316]) -> [SKIP][141] ([Intel XE#2136]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#2890]) -> [SKIP][143] ([Intel XE#316]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1124]) -> [SKIP][145] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1124]) -> [SKIP][147] ([Intel XE#2136]) +11 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#2890]) -> [SKIP][149] ([Intel XE#1124]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][151] ([Intel XE#1124]) +6 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#2423] / [i915#2575]) -> [SKIP][153] ([Intel XE#367]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#367]) -> [SKIP][155] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#2191]) -> [SKIP][157] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][159] ([Intel XE#2136]) +10 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][161] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#2890]) -> [SKIP][163] ([Intel XE#2907]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][164] -> [SKIP][165] ([Intel XE#455] / [Intel XE#787])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#2907]) -> [SKIP][167] ([Intel XE#2136]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#2890]) -> [INCOMPLETE][169] ([Intel XE#1195] / [Intel XE#1727])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#2890]) -> [SKIP][171] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][173] ([Intel XE#2136] / [Intel XE#2351])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#2423] / [i915#2575]) -> [SKIP][175] ([Intel XE#306]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#306]) -> [SKIP][177] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_chamelium_color@gamma.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#373]) -> [SKIP][179] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#2423] / [i915#2575]) -> [SKIP][181] ([Intel XE#373]) +9 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#2423] / [i915#2575]) -> [FAIL][183] ([Intel XE#1178])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#2423] / [i915#2575]) -> [SKIP][185] ([Intel XE#307])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#307]) -> [SKIP][187] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][188] ([Intel XE#1195] / [Intel XE#2715]) -> [FAIL][189] ([Intel XE#1178]) +1 other test fail
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#455]) -> [SKIP][191] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_content_protection@lic-type-1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][192] ([Intel XE#1178]) -> [SKIP][193] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_content_protection@srm.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#2423] / [i915#2575]) -> [SKIP][195] ([Intel XE#308]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#308]) -> [SKIP][197] ([Intel XE#2423] / [i915#2575])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#455]) -> [SKIP][199] ([Intel XE#2136]) +6 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#776]) -> [SKIP][201] ([Intel XE#2136])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#2423] / [i915#2575]) -> [SKIP][203] ([Intel XE#701])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2423] / [i915#2575]) -> [SKIP][205] ([Intel XE#703])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2423] / [i915#2575]) -> [SKIP][207] ([Intel XE#1138])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#455]) -> [SKIP][209] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2890]) -> [SKIP][211] ([Intel XE#455]) +4 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#651]) -> [SKIP][213] ([Intel XE#2136] / [Intel XE#2351]) +16 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#651]) -> [SKIP][215] ([Intel XE#2136]) +27 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][217] ([Intel XE#651]) +9 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#2890]) -> [SKIP][219] ([Intel XE#651]) +15 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#2890]) -> [SKIP][221] ([Intel XE#2136]) +66 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2890]) -> [SKIP][223] ([Intel XE#653]) +16 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][225] ([Intel XE#653]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1158]) -> [SKIP][227] ([Intel XE#2136])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#653]) -> [SKIP][229] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#653]) -> [SKIP][231] ([Intel XE#2136]) +30 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2423] / [i915#2575]) -> [SKIP][233] ([Intel XE#605])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2890]) -> [SKIP][235] ([Intel XE#346])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#2890]) -> [SKIP][237] ([Intel XE#2925])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2423] / [i915#2575]) -> [SKIP][239] ([Intel XE#356])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [INCOMPLETE][240] -> [SKIP][241] ([Intel XE#2423] / [i915#2575])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_plane_cursor@primary.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2423] / [i915#2575]) -> [SKIP][243] ([Intel XE#455]) +6 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2423] / [i915#2575]) -> [FAIL][245] ([Intel XE#361])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][247] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#870]) -> [SKIP][249] ([Intel XE#2136]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#2890]) -> [SKIP][251] ([Intel XE#870])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_pm_backlight@fade.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][253] ([Intel XE#1129])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#2890]) -> [SKIP][255] ([Intel XE#1489]) +6 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1489]) -> [SKIP][257] ([Intel XE#2136]) +11 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1122]) -> [SKIP][259] ([Intel XE#2136]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][261] ([Intel XE#2136] / [Intel XE#2351]) +24 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][263] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_psr@fbc-pr-primary-render.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][265] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][267] ([Intel XE#2136]) +15 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2890]) -> [SKIP][269] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][271] ([Intel XE#2351])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_psr@psr-cursor-plane-move.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#2939]) -> [SKIP][273] ([Intel XE#2136])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#2423] / [i915#2575]) -> [SKIP][275] ([Intel XE#1127]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#3414]) -> [SKIP][277] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2423] / [i915#2575]) -> [SKIP][279] ([Intel XE#3414]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][280] ([Intel XE#2426]) -> [FAIL][281] ([Intel XE#1729])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#362]) -> [SKIP][283] ([Intel XE#2423] / [i915#2575])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#330]) -> [SKIP][285] ([Intel XE#2423] / [i915#2575])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2168]) -> [SKIP][287] ([Intel XE#2423] / [i915#2575])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_vrr@cmrr.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2423] / [i915#2575]) -> [SKIP][289] ([Intel XE#756])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#1130]) -> [SKIP][291] ([Intel XE#1123])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#1123]) -> [SKIP][293] ([Intel XE#1130])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-dg2-set2:     [FAIL][294] ([Intel XE#2667]) -> [SKIP][295] ([Intel XE#1130])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1130]) -> [SKIP][297] ([Intel XE#2905]) +8 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2905]) -> [SKIP][299] ([Intel XE#1130]) +10 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@xe_eudebug_online@basic-breakpoint.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#1130]) -> [SKIP][301] ([Intel XE#288]) +22 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#288]) -> [SKIP][303] ([Intel XE#1130]) +35 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1130]) -> [SKIP][305] ([Intel XE#2360])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2360]) -> [SKIP][307] ([Intel XE#1130])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#1130]) -> [SKIP][309] ([Intel XE#2541]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2541]) -> [SKIP][311] ([Intel XE#1130]) +11 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@xe_oa@syncs-ufence-wait.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#1130]) -> [SKIP][313] ([Intel XE#979])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#1061]) -> [FAIL][315] ([Intel XE#1173])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_peer2peer@write.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2284]) -> [SKIP][317] ([Intel XE#1130])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][319] ([Intel XE#1130]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1130]) -> [SKIP][321] ([Intel XE#579])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#944]) -> [SKIP][323] ([Intel XE#1130]) +4 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@xe_query@multigpu-query-config.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#1130]) -> [SKIP][325] ([Intel XE#944]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#1130]) -> [SKIP][327] ([Intel XE#3342])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#1130]) -> [DMESG-WARN][329] ([Intel XE#2919])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_wedged@basic-wedged.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8103 -> IGTPW_12079
  * Linux: xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9 -> xe-2211-e92f691cd7f6341efe3f9d14759b7776ab2d8571

  IGTPW_12079: 1c4c08bbf0bf4c6c173206c0b4fe8d9b2e7b5d1e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8103: 43994179978d4a120226f253cb95209d59639ef9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9: 6d0fd3fb958e77717cedf35f49325c7c0dfa11c9
  xe-2211-e92f691cd7f6341efe3f9d14759b7776ab2d8571: e92f691cd7f6341efe3f9d14759b7776ab2d8571

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/index.html

--===============5271947258424391381==
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
<tr><td><b>Series:</b></td><td>xe_fault_injection improvements (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139777/">https://patchwork.freedesktop.org/series/139777/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8103_full -&gt; XEIGTPW_12079_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12079_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12079_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12079_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a></li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8103_full and XEIGTPW_12079_full:</p>
<h3>New IGT tests (21)</h3>
<ul>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12079_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +110 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +112 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-8/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@xe_exec_balancer@twice-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +214 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-5/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-7/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@fbdev@write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_3d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_flip@bo-too-big-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_flip@bo-too-big-interruptible.html">PASS</a> +63 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html">PASS</a> +137 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_plane_cursor@primary.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-463/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-435/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-433/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-434/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8103/shard-dg2-434/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12079/shard-dg2-433/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8103 -&gt; IGTPW_12079</li>
<li>Linux: xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9 -&gt; xe-2211-e92f691cd7f6341efe3f9d14759b7776ab2d8571</li>
</ul>
<p>IGTPW_12079: 1c4c08bbf0bf4c6c173206c0b4fe8d9b2e7b5d1e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8103: 43994179978d4a120226f253cb95209d59639ef9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9: 6d0fd3fb958e77717cedf35f49325c7c0dfa11c9<br />
  xe-2211-e92f691cd7f6341efe3f9d14759b7776ab2d8571: e92f691cd7f6341efe3f9d14759b7776ab2d8571</p>

</body>
</html>

--===============5271947258424391381==--
