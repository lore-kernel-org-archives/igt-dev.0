Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5931CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ED110E88B;
	Thu,  6 Nov 2025 10:40:23 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3811010E88B;
 Thu,  6 Nov 2025 10:40:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5013539229345290200=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_initial_Panthor_tests_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Nov 2025 10:40:22 -0000
Message-ID: <176242562221.24199.4636887968851883306@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
In-Reply-To: <20251104202845.2879460-1-daniel.almeida@collabora.com>
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

--===============5013539229345290200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add initial Panthor tests (rev3)
URL   : https://patchwork.freedesktop.org/series/153632/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8608_FULL -> XEIGTPW_13996_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13996_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13996_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13996_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][3] +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle.html

  * igt@panthor/panthor_vm@vm_unbind (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] +11 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@panthor/panthor_vm@vm_unbind.html
    - shard-lnl:          NOTRUN -> [SKIP][5] +11 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@panthor/panthor_vm@vm_unbind.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-435/igt@xe_exec_compute_mode@many-userptr-invalidate.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_exec_compute_mode@many-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  
New tests
---------

  New tests have been introduced between XEIGT_8608_FULL and XEIGTPW_13996_FULL:

### New IGT tests (12) ###

  * igt@panthor/panthor_gem@bo_create:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_gem@bo_create_round_size:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_gem@bo_mmap_offset:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_group@group_create:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_group@group_submit:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_query@query:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_vm@vm_bind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_vm@vm_create_destroy:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_vm@vm_destroy_invalid:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_vm@vm_unbind:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@panthor/panthor_vm@vm_unbind_invalid_address:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13996_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1125])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2370])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#3658])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#607])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#607])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1477])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2328])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1512])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#367]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +41 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2907])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#2669]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#306]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2325]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2252]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#6507])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1178]) +2 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#3278])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#3304])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2321])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#308]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1424]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#309])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2286])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4354])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2375])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1137])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1137])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2316]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1421]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1397]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2311]) +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#651]) +20 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#6313])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#5390]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#656]) +16 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#651]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#658])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1469])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2352])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#653]) +17 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2313]) +14 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#455])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#1503])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#346])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#346])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#455]) +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#599])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#2763]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2938])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1122])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#2893]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-466/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1406])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][90] ([Intel XE#4689])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#3414])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#3414] / [Intel XE#3904])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][93] ([Intel XE#4537])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#6503])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2450])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#1499])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [FAIL][98] ([Intel XE#5963])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#6360])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-page-copy-17:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#5300])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_copy_basic@mem-page-copy-17.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4837]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#4837]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4837]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#688]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1392])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2322]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#288]) +15 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#4915]) +184 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4943]) +9 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][110] -> [FAIL][111] ([Intel XE#5625])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#4943]) +7 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#6281])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#255])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-463/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#3573]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2248])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#5694])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#6251]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#4733]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#4733]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#944]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#4814]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#4130])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#4130])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#3342])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#3342])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][128] ([Intel XE#6054]) -> [PASS][129] +3 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][130] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][134] ([Intel XE#2291]) -> [PASS][135] +4 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][136] ([Intel XE#4633]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][138] ([Intel XE#1340]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][140] ([Intel XE#2316]) -> [PASS][141] +4 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][142] ([Intel XE#1503]) -> [PASS][143] +2 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][144] ([Intel XE#3012]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][146] ([Intel XE#4596]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][148] ([Intel XE#2571]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][150] ([Intel XE#718]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [INCOMPLETE][152] -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][154] ([Intel XE#5625]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#5893]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [SKIP][182], [PASS][183]) ([Intel XE#378]) -> ([PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-433/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-436/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-436/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-433/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-436/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-433/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-433/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-432/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-464/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-464/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-464/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-432/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-432/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-434/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-434/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-434/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-463/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-463/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-463/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-463/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-466/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-466/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-435/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-435/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-435/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-435/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-463/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-466/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-466/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-466/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-463/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-466/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-bmg:          [INCOMPLETE][209] ([Intel XE#2594]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
    - shard-lnl:          [FAIL][211] ([Intel XE#6251]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][213] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][214] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][215] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][216] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][217] ([Intel XE#2341]) -> [FAIL][218] ([Intel XE#1178])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_content_protection@atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][219] ([Intel XE#2312]) -> [SKIP][220] ([Intel XE#2311]) +15 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][221] ([Intel XE#5390]) -> [SKIP][222] ([Intel XE#2312]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][223] ([Intel XE#2312]) -> [SKIP][224] ([Intel XE#5390]) +8 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][225] ([Intel XE#2311]) -> [SKIP][226] ([Intel XE#2312]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][227] ([Intel XE#2312]) -> [SKIP][228] ([Intel XE#2313]) +13 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][229] ([Intel XE#4596]) -> [SKIP][230] ([Intel XE#5021])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][231] ([Intel XE#5021]) -> [SKIP][232] ([Intel XE#4596])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][233] ([Intel XE#1729]) -> [SKIP][234] ([Intel XE#2426])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#5963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5963
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8608 -> IGTPW_13996
  * Linux: xe-4050-695cfd228beb5b8816553e7002a2d61d381327a8 -> xe-4052-4247aae08afc576bbe58c7998b5e2f6a2ea982ad

  IGTPW_13996: 6dfbb78adfa229005bb100c73842b6df1c35671f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8608: 42ea0108ec47e4a00aed97d6f98e5339847c7331 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4050-695cfd228beb5b8816553e7002a2d61d381327a8: 695cfd228beb5b8816553e7002a2d61d381327a8
  xe-4052-4247aae08afc576bbe58c7998b5e2f6a2ea982ad: 4247aae08afc576bbe58c7998b5e2f6a2ea982ad

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/index.html

--===============5013539229345290200==
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
<tr><td><b>Series:</b></td><td>Add initial Panthor tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153632/">https://patchwork.freedesktop.org/series/153632/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13996/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13996/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8608_FULL -&gt; XEIGTPW_13996_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13996_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13996_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
996_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13996/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">DM=
ESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@panthor/panthor_gem@bo_mmap_offs=
et_invalid_handle.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_unbind (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@panthor/panthor_vm@vm_unbind.h=
tml">SKIP</a> +11 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@panthor/panthor_vm@vm_unbind.htm=
l">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-dg2-435/igt@xe_exec_compute_mode@many-userptr-invalidate.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13996/shard-dg2-436/igt@xe_exec_compute_mode@many-userptr-invalidate.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-x=
e_device_create.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@xe_fault_injection@inject-fault-=
probe-function-xe_device_create.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8608_FULL and XEIGTPW_13996=
_FULL:</p>
<h3>New IGT tests (12)</h3>
<ul>
<li>
<p>igt@panthor/panthor_gem@bo_create:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_gem@bo_create_round_size:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_gem@bo_mmap_offset:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_group@group_create:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_group@group_submit:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_query@query:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_bind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_create_destroy:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_destroy_invalid:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_unbind:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_unbind_invalid_address:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13996_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-3/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125"=
>Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
28">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-463/igt@kms_bw@linear-tiling-1-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tile=
d-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-4-tile=
d-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">In=
tel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13996/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to=
-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for=
-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-e=
ach-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_chamelium_sharpness_filter=
@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@kms_content_protection@lic-typ=
e-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1178">Intel XE#1178</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_cursor_crc@cursor-random-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-move=
ment-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2375">Intel XE#2375</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@kms_feature_discovery@dp-mst.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1137">Intel XE#1137</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-=
bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-race.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6313">Intel XE#6313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcps=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/i=
gt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-b=
mg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@kms_joiner@invalid-modeset-big=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
455">Intel XE#455</a>) +9 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/59=
9">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-466/igt@kms_psr2_sf@psr2-cursor-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled=
-reflect-x-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@kms_sharpness_filter@filter-form=
ats.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4537">Intel XE#4537</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_sharpness_filter@invalid-pla=
ne-with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-8/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-6/ig=
t@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kern=
el.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5963">Intel XE#5963</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-463/igt@xe_compute_preempt@compute-thr=
eadgroup-preempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6360">Intel XE#6360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-17:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_copy_basic@mem-page-copy-17=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5300">Intel XE#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@xe_eudebug@basic-vm-access-param=
eters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufenc=
e-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@xe_evict@evict-threads-small-mul=
ti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basi=
c-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_exec_system_allocator@many-=
large-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +184 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-2/igt@xe_exec_system_allocator@once-la=
rge-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-single-vma.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13996/shard-lnl-5/igt@xe_exec_system_allocator@pat-in=
dex-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@xe_exec_system_allocator@threads=
-shared-vm-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@xe_fault_injection@exec-queue-=
create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">=
Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@xe_oa@oa-regs-whitelisted.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_pm@d3cold-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Int=
el XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/sh=
ard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-=
rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-term=
ination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-=
version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@xe_render_copy@render-stress-0=
-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4814">Intel XE#4814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_sriov_auto_provisioning@res=
ources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-1/igt@xe_sriov_auto_provisioning@resou=
rces-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3342">Intel XE#3342</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13996/shard-lnl-7/igt@xe_sriov_flr@flr-vf1-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-3/igt@kms_as=
ync_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html"=
>PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-2/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Inte=
l XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13996/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_cursor_lega=
cy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +4 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633=
">Intel XE#4633</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13996/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel=
 XE#1340</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13996/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13996/shard-bmg-4/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/s=
hard-bmg-4/igt@kms_hdr@static-toggle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3012">Intel XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13996/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-j=
oiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13996/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13996/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-l=
nl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-bind.h=
tml">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13996/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-b=
ind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-multi-vma.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-8/igt@xe_exec_system_all=
ocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_=
send_recv.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5893">Intel XE#5893</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_fault_injecti=
on@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8608/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-436/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8608/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8608/shard-dg2-436/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-=
dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-433/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-464/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8608/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-464/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8608/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-432/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8608/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-43=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8608/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-463/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_860=
8/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-463/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8608/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-466/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8608/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-435/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8608/shard-dg2-435/igt@xe_module_load@load.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13996/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-=
466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-466/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_139=
96/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13996/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-434/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13996/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13996/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13996/shard-dg2-464/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-d=
g2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-435/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13996/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13996/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-46=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996=
/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-436/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13996/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-dg2-432/igt=
@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">In=
tel XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13996/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_=
enhance0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe=
_engine_class_video_enhance0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-lnl-4/igt@xe_pm=
u@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.htm=
l">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel =
XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13996/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/sh=
ard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
7">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">In=
tel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13996/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-7/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-6/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13996/shard-bmg-8/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13996/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5=
021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel =
XE#5021</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13996/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE=
#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8608/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">I=
ntel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13996/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426=
">Intel XE#2426</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8608 -&gt; IGTPW_13996</li>
<li>Linux: xe-4050-695cfd228beb5b8816553e7002a2d61d381327a8 -&gt; xe-4052-4=
247aae08afc576bbe58c7998b5e2f6a2ea982ad</li>
</ul>
<p>IGTPW_13996: 6dfbb78adfa229005bb100c73842b6df1c35671f @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8608: 42ea0108ec47e4a00aed97d6f98e5339847c7331 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4050-695cfd228beb5b8816553e7002a2d61d381327a8: 695cfd228beb5b8816553e7=
002a2d61d381327a8<br />
  xe-4052-4247aae08afc576bbe58c7998b5e2f6a2ea982ad: 4247aae08afc576bbe58c79=
98b5e2f6a2ea982ad</p>

</body>
</html>

--===============5013539229345290200==--
