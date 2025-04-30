Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4F9C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 08:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6659310E6E0;
	Wed, 30 Apr 2025 08:01:11 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9541F10E6E0;
 Wed, 30 Apr 2025 08:01:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2367722278771855740=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/igt=5Fos=3A_Implement_?=
 =?utf-8?q?and_use_igt=5Fget=5Fmeminfo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Apr 2025 08:01:09 -0000
Message-ID: <174600006959.28621.1512618557362880763@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429192956.275280-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250429192956.275280-1-jonathan.cavitt@intel.com>
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

--===============2367722278771855740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_os: Implement and use igt_get_meminfo
URL   : https://patchwork.freedesktop.org/series/148430/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8344_FULL -> XEIGTPW_13061_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13061_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13061_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13061_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][1] +20 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][2] +7 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge-nomemset.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
    - shard-lnl:          [FAIL][3] ([Intel XE#4914]) -> [SKIP][4] +109 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [FAIL][5] ([Intel XE#4914]) -> [SKIP][6] +82 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset}:
    - shard-lnl:          [FAIL][7] ([Intel XE#4914]) -> [SKIP][8] +9 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-1/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html

  * {igt@xe_exec_system_allocator@once-large-mmap-huge}:
    - shard-bmg:          NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_exec_system_allocator@once-large-mmap-huge.html

  * {igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset}:
    - shard-lnl:          NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset.html

  * {igt@xe_exec_system_allocator@twice-large-mmap-new-huge}:
    - shard-bmg:          [FAIL][11] ([Intel XE#4914]) -> [SKIP][12] +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@xe_exec_system_allocator@twice-large-mmap-new-huge.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@xe_exec_system_allocator@twice-large-mmap-new-huge.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13061_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#4665])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1465])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2233])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#911])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +9 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2314] / [Intel XE#2894])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2191]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#367]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2907]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +13 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +41 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#3442])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2652] / [Intel XE#787]) +16 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3432])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +202 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][40] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#306])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#306]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2325]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2252]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#373]) +9 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][47] ([Intel XE#1178]) +2 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#307])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#3304])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#3278])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1178]) +5 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][52] ([Intel XE#1188])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2320]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2321])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1424]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#309]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2286])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2291]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1340])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#4494] / [i915#3804])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#4294])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4422])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4422])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#4422])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#776])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2373])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1138])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2316]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2316]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1421]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [PASS][75] -> [FAIL][76] ([Intel XE#301])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#301]) +6 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#301])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#886]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][82] -> [FAIL][83] ([Intel XE#2882]) +2 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1397] / [Intel XE#1745])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1397])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#651]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2312]) +12 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2311]) +23 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#651]) +26 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#4141]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#656]) +13 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#658])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1469])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#653]) +31 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2352]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2313]) +18 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#4298])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#346])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#346])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#346])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#4090])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2925]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#4090])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2486])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][107] ([Intel XE#616]) +2 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][108] -> [FAIL][109] ([Intel XE#616]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-466/igt@kms_plane_cursor@viewport.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][110] -> [SKIP][111] ([Intel XE#4596]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][112] ([Intel XE#4212])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][113] ([Intel XE#4760]) +1 other test abort
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#2763]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2763]) +19 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2763]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#870]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#870])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1129])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#3309])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1489]) +5 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2893]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1489]) +6 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1122])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#4609]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1406]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#3414]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_rotation_crc@bad-tiling.html
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2330]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1127]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1127]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#455]) +12 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1499]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#756])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#756]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1091] / [Intel XE#2849])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1123]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1126])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2504])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#4497])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#4837]) +17 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#4837]) +15 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#688]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2322]) +9 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][150] -> [SKIP][151] ([Intel XE#1392]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1392]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#288]) +26 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#2360])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#4837]) +6 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#4915]) +156 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-lnl:          NOTRUN -> [ABORT][157] ([Intel XE#4757])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182]) -> ([PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [SKIP][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208]) ([Intel XE#378])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-1/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-4/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-7/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-2/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-5/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-3/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-4/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-4/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-6/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-8/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-6/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-2/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-3/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233]) -> ([PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [SKIP][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259]) ([Intel XE#378])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-433/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-464/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-466/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-434/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-434/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-434/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-436/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-435/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-435/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-433/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-466/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-466/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-435/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-436/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-436/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-464/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-464/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-433/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-433/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-464/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#379])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-3/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#2541] / [Intel XE#3573]) +9 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     NOTRUN -> [SKIP][262] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][263] ([Intel XE#979])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][264] ([Intel XE#1173]) +1 other test fail
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][265] ([Intel XE#2284])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][266] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][267] ([Intel XE#2284] / [Intel XE#366])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][268] -> [ABORT][269] ([Intel XE#1794])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][270] ([Intel XE#4650]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][271] ([Intel XE#4650]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.html
    - shard-lnl:          NOTRUN -> [SKIP][272] ([Intel XE#4650])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][273] ([Intel XE#4733]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][274] ([Intel XE#4733]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][275] ([Intel XE#944]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-2/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-engines:
    - shard-lnl:          NOTRUN -> [SKIP][276] ([Intel XE#944]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][277] ([Intel XE#944]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][278] ([Intel XE#4814])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#4130]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][280] ([Intel XE#4130]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-lnl:          NOTRUN -> [SKIP][281] ([Intel XE#4130])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][282] ([Intel XE#4351])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_sriov_scheduling@equal-throughput.html
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#4351])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_sriov_scheduling@equal-throughput.html
    - shard-bmg:          NOTRUN -> [SKIP][284] ([Intel XE#4351])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][285] ([Intel XE#911]) -> [PASS][286] +3 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][287] ([Intel XE#3862]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][289] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][291] ([Intel XE#2291]) -> [PASS][292] +2 other tests pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [DMESG-WARN][293] -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][295] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][297] ([Intel XE#301]) -> [PASS][298] +4 other tests pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][299] ([Intel XE#2316]) -> [PASS][300] +7 other tests pass
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][301] ([Intel XE#301]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [FAIL][303] ([Intel XE#3321]) -> [PASS][304] +2 other tests pass
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][305] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][306] +1 other test pass
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][307] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][308] +1 other test pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [FAIL][309] ([Intel XE#886]) -> [PASS][310] +2 other tests pass
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - shard-bmg:          [FAIL][311] ([Intel XE#2882]) -> [PASS][312] +3 other tests pass
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][313] ([Intel XE#1503]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][315] ([Intel XE#3012]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][317] ([Intel XE#4596]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][319] ([Intel XE#1435]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [ABORT][321] -> [PASS][322] +1 other test pass
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][323] ([Intel XE#4459]) -> [PASS][324] +1 other test pass
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1392]) -> [PASS][326] +6 other tests pass
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-bmg:          [DMESG-WARN][327] ([Intel XE#4931]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@xe_exec_reset@gt-reset-stress.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@many-stride-new:
    - shard-bmg:          [DMESG-WARN][329] ([Intel XE#3428]) -> [PASS][330] +8 other tests pass
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-new.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-new.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][331] ([Intel XE#4937]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][333] ([Intel XE#4792]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
    - shard-lnl:          [DMESG-WARN][335] ([Intel XE#4792]) -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][337] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][338] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][339] ([Intel XE#2341]) -> [FAIL][340] ([Intel XE#1178])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@kms_content_protection@atomic.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][341] ([Intel XE#2312]) -> [SKIP][342] ([Intel XE#2311]) +25 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][343] ([Intel XE#2311]) -> [SKIP][344] ([Intel XE#2312]) +12 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][345] ([Intel XE#4141]) -> [SKIP][346] ([Intel XE#2312]) +7 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][347] ([Intel XE#2312]) -> [SKIP][348] ([Intel XE#4141]) +10 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][349] ([Intel XE#2312]) -> [SKIP][350] ([Intel XE#2313]) +16 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][351] ([Intel XE#2313]) -> [SKIP][352] ([Intel XE#2312]) +10 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][353] ([Intel XE#4596]) -> [SKIP][354] ([Intel XE#2493])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [DMESG-WARN][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379]) ([Intel XE#3428]) -> ([PASS][380], [PASS][381], [PASS][382], [PASS][383], [SKIP][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [DMESG-WARN][399], [PASS][400], [DMESG-WARN][401], [DMESG-WARN][402], [PASS][403], [PASS][404], [PASS][405]) ([Intel XE#2457] / [Intel XE#3428])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-4/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-4/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-4/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-2/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-2/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-1/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-1/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-7/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-8/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-8/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-1/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-4/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-8/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-2/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-2/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-2/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][406] ([Intel XE#4817]) -> [FAIL][407] ([Intel XE#4835]) +1 other test fail
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-436/igt@xe_pmu@gt-frequency.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
  [Intel XE#4835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4914
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4931
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8344 -> IGTPW_13061
  * Linux: xe-3009-f13165b51331915eb63fdb160331e035ecae35c7 -> xe-3010-11bac2f4b353b42599a9b028f48261d32b94fe34

  IGTPW_13061: a3fa317f4cc8b9a2083bc2c198714725212e02af @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8344: 00f143c5f06f7d5936aacb70dad22be371570d38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3009-f13165b51331915eb63fdb160331e035ecae35c7: f13165b51331915eb63fdb160331e035ecae35c7
  xe-3010-11bac2f4b353b42599a9b028f48261d32b94fe34: 11bac2f4b353b42599a9b028f48261d32b94fe34

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/index.html

--===============2367722278771855740==
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
<tr><td><b>Series:</b></td><td>lib/igt_os: Implement and use igt_get_meminf=
o</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148430/">https://patchwork.freedesktop.org/series/148430/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13061/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13061/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8344_FULL -&gt; XEIGTPW_13061_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13061_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13061_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
061_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_exec_system_allocator@threads=
-many-mmap-new-huge-nomemset.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge-nomem=
set:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_exec_system_allocator@threads=
-shared-vm-many-mmap-free-huge-nomemset.html">SKIP</a> +7 other tests skip<=
/li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-huge:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-=
execqueues-mmap-free-huge.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4914">Intel XE#4914</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html">SKI=
P</a> +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-=
execqueues-mmap-new-huge.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4914">Intel XE#4914</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@xe_exec_s=
ystem_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP<=
/a> +82 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-1/igt@xe_exec_system_allocator@once-large-mmap-free-hu=
ge-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4914">Intel XE#4914</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@xe_exec_system_allocat=
or@once-large-mmap-free-huge-nomemset.html">SKIP</a> +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@once-large-mmap-huge}:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_exec_system_allocator@once-la=
rge-mmap-huge.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset}:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@xe_exec_system_allocator@once-la=
rge-mmap-new-huge-nomemset.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@twice-large-mmap-new-huge}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-6/igt@xe_exec_system_allocator@twice-large-mmap-new-hu=
ge.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4914">Intel XE#4914</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@xe_exec_system_allocator@twice-=
large-mmap-new-huge.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13061_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@intel_hwmon@hwmon-write.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665=
">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_3d.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@kms_async_flips@async-flip-with-p=
age-flip-events-linear-atomic.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13061/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_bw@connected-linear-tiling=
-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@kms_bw@linear-tiling-1-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basi=
c-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +202 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel =
XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +9 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
73">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_content_protection@dp-mst-=
lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_content_protection@uevent@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-12=
8x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061=
/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4=
294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel=
 XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-8/igt@kms_feature_discovery@display-2x.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shar=
d-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/sh=
ard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421"=
>Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13061/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1306=
1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13061/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">I=
ntel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi=
-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13061/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcps=
r-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/653">Intel XE#653</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_joiner@invalid-modeset-big=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_joiner@switch-modeset-ultr=
a-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2=
-436/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-=
bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) +1 other test abort</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">I=
ntel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@kms_pm_backlight@fade-with-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-up=
date-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@kms_psr@fbc-psr2-basic@edp-1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4609">Intel XE#4609</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_vrr@flip-basic-fastset.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_writeback@writeback-pixel-=
formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-un=
bind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-=
0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_eu_stall@non-blocking-read.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufenc=
e-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-2/igt@xe_eudebug_online@single-step.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_evict@evict-large-external-cm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_exec_basi=
c@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/139=
2">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_exec_fault_mode@once-bindex=
ecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner=
-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoint-w=
aitsip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_exec_system_allocator@many-=
large-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +156 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_clas=
s_defaults:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_fault_injection@inject-fault-=
probe-function-xe_add_hw_engine_class_defaults.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757">Intel XE#4757</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8344/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8344/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8344/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8344/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8344/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8344/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-ln=
l-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8344/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard=
-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
344/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8344/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8344/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-2/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13061/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/s=
hard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13061/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13061/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1306=
1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13061/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13061/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shar=
d-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3061/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13061/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13061/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8344/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8344/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-=
dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-434/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8344/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-434/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8344/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-435/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8344/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-43=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8344/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard=
-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-435/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_834=
4/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-436/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8344/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8344/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-433/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8344/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13061/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shar=
d-dg2-435/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13061/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2=
-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
061/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13061/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13061/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shar=
d-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13061/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-3/igt@xe_noexec_ping_pong.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Int=
el XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_oa@syncs-syncobj-none.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979=
">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-=
vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-7/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-2=
/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-=
load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4650">Intel XE#4650</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4650">Intel XE#4650</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_pmu@fn-engine-activity-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt@xe_pxp@pxp-termination-key-upd=
ate-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@xe_pxp@pxp-termination-key-updat=
e-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-2/igt@xe_query@multigpu-query-config.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-6/igt@xe_query@multigpu-query-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_query@multigpu-query-oa-uni=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_render_copy@render-stress-2=
-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_sriov_auto_provisioning@resou=
rces-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test s=
kip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@xe_sriov_auto_provisioning@res=
ources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test=
 skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_sriov_auto_provisioning@resou=
rces-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@xe_sriov_scheduling@equal-thro=
ughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-5/igt@kms_async_flips=
@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13061/shard-dg2-432/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13061/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggl=
e.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">=
DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13061/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-435/igt@km=
s_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ad-hdmi-a6-dp4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
061/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +7 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13061/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">=
Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13061/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">=
PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_flip@flip-vs-suspen=
d-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"=
>Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13061/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-=
dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate=
-interruptible@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_flip@plain-flip-fb-rec=
reate-interruptible@b-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/s=
hard-bmg-1/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Inte=
l XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13061/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13061/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13061/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">AB=
ORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
061/shard-bmg-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
61/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-464/igt@xe_exec_basic@multigpu-=
no-exec-userptr-invalidate-race.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-3/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4931">In=
tel XE#4931</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13061/shard-bmg-7/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-new.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_exec_system_allocator@many-strid=
e-new.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-8/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-w=
ait_for_lmem_ready.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4792">Intel XE#4792</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@xe_fault_=
injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a></l=
i>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-w=
ait_for_lmem_ready.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4792">Intel XE#4792</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-lnl-1/igt@xe_fault_=
injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a></l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-dg2-436/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"=
>Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13061/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@kms_frontbuffer_tracking@=
psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel =
XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13061/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE=
#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8344/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8344/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8344/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8344/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8344/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bm=
g-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
344/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8344/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8344/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8344/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8344/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13061/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13061/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-3/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
061/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13061/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13061/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13061/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13061/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13061/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13061/shard-bmg-6/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
061/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13061/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8344/shard-dg2-436/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817">Intel XE#4817</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13061/s=
hard-dg2-434/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4835">Intel XE#4835</a>) +1 other =
test fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8344 -&gt; IGTPW_13061</li>
<li>Linux: xe-3009-f13165b51331915eb63fdb160331e035ecae35c7 -&gt; xe-3010-1=
1bac2f4b353b42599a9b028f48261d32b94fe34</li>
</ul>
<p>IGTPW_13061: a3fa317f4cc8b9a2083bc2c198714725212e02af @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8344: 00f143c5f06f7d5936aacb70dad22be371570d38 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3009-f13165b51331915eb63fdb160331e035ecae35c7: f13165b51331915eb63fdb1=
60331e035ecae35c7<br />
  xe-3010-11bac2f4b353b42599a9b028f48261d32b94fe34: 11bac2f4b353b42599a9b02=
8f48261d32b94fe34</p>

</body>
</html>

--===============2367722278771855740==--
