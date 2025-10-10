Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827FDCCD184
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 00:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1194E10EB3C;
	Fri, 10 Oct 2025 00:12:22 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385AC10EB3B;
 Fri, 10 Oct 2025 00:12:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1236373290877123364=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/xe/xe=5Fexec=5Fsyste?=
 =?utf-8?q?m=5Fallocator=3A_Add_partial_unmap_atomic_access_sections?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Oct 2025 00:12:20 -0000
Message-ID: <176005514011.25581.1977544075105955093@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009121436.3503049-1-matthew.brost@intel.com>
In-Reply-To: <20251009121436.3503049-1-matthew.brost@intel.com>
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

--===============1236373290877123364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe/xe_exec_system_allocator: Add partial unmap atomic access sections
URL   : https://patchwork.freedesktop.org/series/155676/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8581_FULL -> XEIGTPW_13884_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13884_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13884_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13884_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html

  * igt@kms_plane_multiple@tiling-4@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-464/igt@kms_plane_multiple@tiling-4@pipe-d-dp-4.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_plane_multiple@tiling-4@pipe-d-dp-4.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [PASS][6] -> [FAIL][7] +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-lnl-7/igt@kms_setmode@basic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@kms_setmode@basic.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-dg2-set2:     [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-434/igt@xe_vm@bind-array-enobufs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@xe_vm@bind-array-enobufs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_sriov_vram@vf-access-beyond}:
    - shard-lnl:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@xe_sriov_vram@vf-access-beyond.html

  
New tests
---------

  New tests have been introduced between XEIGT_8581_FULL and XEIGTPW_13884_FULL:

### New IGT tests (8) ###

  * igt@xe_exec_system_allocator@partial-atomic-middle-munmap-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_exec_system_allocator@partial-atomic-middle-munmap-no-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_system_allocator@partial-atomic-middle-remap-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_system_allocator@partial-atomic-munmap-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_system_allocator@partial-atomic-munmap-no-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_system_allocator@partial-atomic-remap-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13884_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#316]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3658])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2191]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2191]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +41 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#3432]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2907]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#6168] / [i915#14968])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1727] / [Intel XE#3113])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#373]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-433/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#3278])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#1178]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2320]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1424]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#1475])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#4354])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#701])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2374])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1135])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1421]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2316]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2316])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#301])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293] / [Intel XE#2380])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#352])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#651]) +18 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#651]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#5390]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2311]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#656]) +26 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2312])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#653]) +11 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1503])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1450]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4298])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2501])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#356])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4329])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     NOTRUN -> [FAIL][74] ([Intel XE#616]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#4596])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg2-set2:     [PASS][77] -> [INCOMPLETE][78] ([Intel XE#5175])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-464/igt@kms_plane_multiple@tiling-4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#5020])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#309]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#2763]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#870])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#870])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#718]) +2 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1439] / [Intel XE#3141])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#4608]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1406] / [Intel XE#2893]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1406]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#4609]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1406] / [Intel XE#4692])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#2939])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#3414]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#3414] / [Intel XE#3904])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_rotation_crc@bad-tiling.html
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#3414] / [Intel XE#3904])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1127])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1127])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2413])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1435])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1435]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#455]) +10 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_vrr@flipline.html
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#1499])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1499])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1091] / [Intel XE#2849])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1123])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#4837]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4837]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4837]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_evict@evict-beng-large:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#688]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@xe_evict@evict-beng-large.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1392]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2322]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#288]) +13 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#4943]) +7 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4915]) +124 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#4943]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][121] ([Intel XE#5466] / [Intel XE#5530])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#3573]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#5694])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_pm@d3cold-i2c.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#5694])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#2284] / [Intel XE#366])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#5742])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#584])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@xe_pm@s3-basic.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#4733])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-7/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#4733]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#944]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#944])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#944])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#4814])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4130])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#4130])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][136] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][138] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][140] ([Intel XE#2291]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2-set2:     [INCOMPLETE][142] ([Intel XE#3226]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-bmg:          [DMESG-WARN][144] ([Intel XE#5354]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-4/igt@kms_cursor_legacy@single-bo.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-4/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][146] ([Intel XE#2316]) -> [PASS][147] +2 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][148] ([Intel XE#5337] / [Intel XE#5416]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][150] ([Intel XE#1503]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][152] ([Intel XE#1499]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][154] -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#5893]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#4504]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-435/igt@xe_pm@s2idle-multiple-execs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
    - shard-bmg:          [FAIL][160] ([Intel XE#5937]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][162] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][163] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][164] ([Intel XE#2311]) -> [SKIP][165] ([Intel XE#2312]) +6 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][166] ([Intel XE#5390]) -> [SKIP][167] ([Intel XE#2312]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][168] ([Intel XE#2312]) -> [SKIP][169] ([Intel XE#5390]) +5 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][170] ([Intel XE#2312]) -> [SKIP][171] ([Intel XE#2311]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][172] ([Intel XE#2312]) -> [SKIP][173] ([Intel XE#2313]) +6 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][174] ([Intel XE#2313]) -> [SKIP][175] ([Intel XE#2312]) +5 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][176] ([Intel XE#2426]) -> [FAIL][177] ([Intel XE#1729])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][178] ([Intel XE#1729]) -> [SKIP][179] ([Intel XE#362])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#362]) -> [SKIP][181] ([Intel XE#1500])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8581/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5337
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968


Build changes
-------------

  * IGT: IGT_8581 -> IGTPW_13884
  * Linux: xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb -> xe-3892-7896357960ab49751bdda502f7838b51730f9b51

  IGTPW_13884: 13884
  IGT_8581: 8581
  xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb: 0406d0518ff3a69ea611bfaf02a2f76d715156cb
  xe-3892-7896357960ab49751bdda502f7838b51730f9b51: 7896357960ab49751bdda502f7838b51730f9b51

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/index.html

--===============1236373290877123364==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/xe/xe_exec_system_allocator: Add parti=
al unmap atomic access sections</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155676/">https://patchwork.freedesktop.org/series/155676/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13884/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13884/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8581_FULL -&gt; XEIGTPW_13884_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13884_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13884_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
884_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-b=
mg-6/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend@pi=
pe-d-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-464/igt@kms_plane_multiple@tiling-4@pipe-d-dp-4.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3884/shard-dg2-463/igt@kms_plane_multiple@tiling-4@pipe-d-dp-4.html">INCOMP=
LETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-lnl-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@k=
ms_setmode@basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-434/igt@xe_vm@bind-array-enobufs.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-=
466/igt@xe_vm@bind-array-enobufs.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_sriov_vram@vf-access-beyond}:<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@xe_sriov_vram@vf-access-beyond.h=
tml">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8581_FULL and XEIGTPW_13884=
_FULL:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-middle-munmap-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-middle-munmap-no-cpu-fault:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-middle-remap-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:</=
p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-munmap-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-munmap-no-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-remap-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13884_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@kms_bw@connected-linear-tiling=
-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-=
tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">In=
tel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6168">Intel XE#6168</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13884/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-r=
c-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6168">Intel XE#6168</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14968">i915#14968</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-chang=
e-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-433/igt@kms_chamelium_edid@vga-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-move=
ment-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13884/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tran=
sitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_feature_discovery@chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_feature_discovery@psr1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-=
6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13884/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE=
#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@kms_force_connector_basic@force-=
edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-=
1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +26 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_invalid_mode@clock-too-high@=
pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_invalid_mode@clock-too-high@=
pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_joiner@basic-max-non-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@kms_multipipe_modeset@basic-ma=
x-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_plane_cursor@viewport.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-=
bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-464/igt@kms_plane_multiple@tiling-4.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-d=
g2-463/igt@kms_plane_multiple@tiling-4.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@kms_plane_scaling@2x-scaler-mult=
i-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@k=
ms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Int=
el XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Inte=
l XE#4608</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-on=
off@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_psr@fbc-psr2-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3414">Intel XE#3414</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-464/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-c=
enter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-8/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +10 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-1/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel=
 XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-=
0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@xe_eudebug@multiple-sessions.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@xe_eudebug@vma-ufence-faultabl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-1/igt@xe_evict@evict-beng-large.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
8">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@xe_exec_fault_mode@once-bindex=
ecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@xe_exec_system_allocator@once-mm=
ap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@xe_exec_system_allocator@threa=
ds-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +124 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@xe_exec_system_allocator@threads=
-shared-vm-many-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-3/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_pm@d3cold-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Int=
el XE#5694</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@xe_pm@d3cold-i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel=
 XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@xe_pm@d3hot-i2c.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Inte=
l XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-4/igt@xe_pm@s3-basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE=
#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-7/igt@xe_pxp@pxp-src-to-pxp-dest-rende=
rcopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-exec-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-=
version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-463/igt@xe_render_copy@render-stress-4=
-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@xe_sriov_auto_provisioning@sel=
fconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13884/shard-lnl-8/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Int=
el XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13884/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomi=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-siz=
e.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3226">Intel XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13884/shard-dg2-435/igt@kms_cursor_legacy@cursor=
b-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-4/igt@kms_cursor_legacy@single-bo.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Inte=
l XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13884/shard-bmg-4/igt@kms_cursor_legacy@single-bo.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off=
-vs-modeset-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5337">Intel XE#5337</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5416">Intel XE#5416</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-lnl-2/igt@kms_flip@flip-vs-a=
bsolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/sha=
rd-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1388=
4/shard-bmg-1/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13884/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_=
send_recv.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5893">Intel XE#5893</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@xe_fault_injecti=
on@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-435/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">In=
tel XE#4504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13884/shard-dg2-464/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf=
-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovisio=
n-increase-numvfs@vf-random.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-7/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel =
XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13884/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-sh=
rfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-3/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13884/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13884/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729=
">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13884/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8581/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/362">Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13884/shard-dg2-434/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8581 -&gt; IGTPW_13884</li>
<li>Linux: xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb -&gt; xe-3892-7=
896357960ab49751bdda502f7838b51730f9b51</li>
</ul>
<p>IGTPW_13884: 13884<br />
  IGT_8581: 8581<br />
  xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb: 0406d0518ff3a69ea611bfa=
f02a2f76d715156cb<br />
  xe-3892-7896357960ab49751bdda502f7838b51730f9b51: 7896357960ab49751bdda50=
2f7838b51730f9b51</p>

</body>
</html>

--===============1236373290877123364==--
