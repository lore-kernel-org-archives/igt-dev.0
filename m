Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE0EC3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 07:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2006F10E2EA;
	Mon, 12 May 2025 07:28:21 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6C010E2E9;
 Mon, 12 May 2025 07:28:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9017537837016404023=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/kms=5Fdisplay=5Fmode?=
 =?utf-8?q?s=3A_Fit_modes_within_MST_bandwidth_constraints_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 12 May 2025 07:28:19 -0000
Message-ID: <174703489967.67652.17230331394353746944@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250505161217.484268-1-jeevan.b@intel.com>
In-Reply-To: <20250505161217.484268-1-jeevan.b@intel.com>
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

--===============9017537837016404023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_display_modes: Fit modes within MST bandwidth constraints (rev7)
URL   : https://patchwork.freedesktop.org/series/146653/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8361_FULL -> XEIGTPW_13109_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13109_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13109_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13109_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_atomic_interruptible@legacy-cursor.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_sequence@get-busy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-436/igt@kms_sequence@get-busy@pipe-a-dp-4.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [ABORT][7] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - shard-lnl:          NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-prefetch:
    - shard-lnl:          [PASS][9] -> [SKIP][10] +36 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
#### Warnings ####

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          [SKIP][14] ([Intel XE#367]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
    - shard-bmg:          [SKIP][16] ([Intel XE#367]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][18] ([Intel XE#2252]) -> [SKIP][19] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-lnl:          [SKIP][20] ([Intel XE#373]) -> [SKIP][21] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          [SKIP][22] ([Intel XE#3278]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@kms_content_protection@lic-type-0.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [SKIP][24] ([Intel XE#2341]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          [SKIP][26] ([Intel XE#309]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          [SKIP][28] ([Intel XE#1421]) -> [SKIP][29] +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][30] ([Intel XE#2316]) -> [SKIP][31] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [FAIL][32] ([Intel XE#2882]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          [SKIP][34] ([Intel XE#352]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          [SKIP][36] ([Intel XE#5020]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-lnl:          [SKIP][38] ([Intel XE#2763]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_sequence@get-busy:
    - shard-dg2-set2:     [SKIP][40] ([Intel XE#4208] / [i915#2575]) -> [INCOMPLETE][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_sequence@get-busy.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-436/igt@kms_sequence@get-busy.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          [SKIP][42] ([Intel XE#1062]) -> [SKIP][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@xe_create@create-big-vram.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-lnl:          [SKIP][44] ([Intel XE#4837]) -> [SKIP][45] +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@xe_eudebug_online@preempt-breakpoint.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-lnl:          [SKIP][46] ([Intel XE#688]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@xe_evict@evict-beng-small-external.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          [SKIP][48] ([Intel XE#1392]) -> [SKIP][49] +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_pm@s3-basic-exec:
    - shard-lnl:          [SKIP][50] ([Intel XE#584]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_pm@s3-basic-exec.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_pm@s3-basic-exec.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          [SKIP][52] ([Intel XE#944]) -> [SKIP][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
New tests
---------

  New tests have been introduced between XEIGT_8361_FULL and XEIGTPW_13109_FULL:

### New IGT tests (1) ###

  * igt@xe_vm:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13109_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#2134])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@fbdev@nullptr.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@fbdev@nullptr.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - shard-dg2-set2:     [PASS][56] -> [SKIP][57] ([Intel XE#4208] / [Intel XE#4618])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@intel_sysfs_debugfs@xe-forcewake.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][58] -> [FAIL][59] ([Intel XE#4427]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#911]) +3 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1407]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#316]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2231])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1124]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1124]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1124]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#2191])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2314] / [Intel XE#2894])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2314] / [Intel XE#2894])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2191])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#367]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#367])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#367]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2887]) +8 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2231])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][80] -> [INCOMPLETE][81] ([Intel XE#3862]) +1 other test incomplete
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#3432])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#3432])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#787]) +153 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][86] ([Intel XE#1727] / [Intel XE#3113])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2887]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#4416]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#306])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2252]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#373]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#4208] / [i915#2575]) +38 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#373]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][94] ([Intel XE#1178]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2390])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][96] ([Intel XE#1178]) +2 other tests fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][97] ([Intel XE#1188])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#1188])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2320]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#308]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1424]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     [PASS][102] -> [SKIP][103] ([Intel XE#4208] / [i915#2575]) +107 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#309]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2291]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#2291]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][108] -> [FAIL][109] ([Intel XE#4667])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][110] -> [SKIP][111] ([Intel XE#4302])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4494] / [i915#3804])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4354])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#4422])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2373])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1135])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][117] -> [FAIL][118] ([Intel XE#3321])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][119] -> [SKIP][120] ([Intel XE#2316]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2316])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1421])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][123] -> [FAIL][124] ([Intel XE#301])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][125] -> [FAIL][126] ([Intel XE#301])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1397])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2293] / [Intel XE#2380])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2293])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][130] ([Intel XE#4683]) +1 other test fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1401]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2231] / [Intel XE#4954])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#651]) +13 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2311]) +12 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][136] -> [SKIP][137] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#4141]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#651]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-lnl:          [PASS][140] -> [SKIP][141] ([Intel XE#2351]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2313]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#656]) +12 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-lnl:          [PASS][144] -> [SKIP][145] ([Intel XE#2351] / [Intel XE#4996])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2312]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#653]) +11 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2351] / [Intel XE#4208]) +18 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1503])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-bmg:          [PASS][150] -> [SKIP][151] ([Intel XE#4954] / [Intel XE#4996]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_invalid_mode@zero-clock.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-bmg:          [PASS][152] -> [SKIP][153] ([Intel XE#2231] / [Intel XE#4954])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#455]) +11 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][155] -> [SKIP][156] ([Intel XE#4596])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#4596])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][158] ([Intel XE#4760])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#2763]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#2763]) +14 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2392])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1129])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-lnl:          [PASS][164] -> [SKIP][165] ([Intel XE#4962])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-4/igt@kms_pm_rpm@i2c.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_pm_rpm@i2c.html

  * igt@kms_properties@get_properties-sanity-atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][166] ([Intel XE#5017])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-436/igt@kms_properties@get_properties-sanity-atomic.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#1489]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#1489]) +5 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#4608]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#2893]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1406]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#4609])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#2330])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#1127])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#3414])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#3414] / [Intel XE#3904])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][179] -> [SKIP][180] ([Intel XE#1435])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][181] ([Intel XE#4212]) +1 other test dmesg-warn
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [PASS][182] -> [SKIP][183] ([Intel XE#4954]) +37 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][184] -> [SKIP][185] ([Intel XE#1499])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_vrr@negative-basic.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#1091] / [Intel XE#2849])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [ABORT][187] ([Intel XE#2705])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#1280] / [Intel XE#455])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#4837]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#4837]) +5 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#4996]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_eudebug@vma-ufence-faultable.html
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#4996]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#4837]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#688])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][195] -> [SKIP][196] ([Intel XE#4208]) +220 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#1392]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2322]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#1392])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     [PASS][200] -> [SKIP][201] ([Intel XE#1392])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#4954])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#288]) +13 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#2360])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#4943]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#4915]) +90 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-race:
    - shard-lnl:          [PASS][207] -> [SKIP][208] ([Intel XE#4996]) +19 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-mmap-new-race.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-mmap-new-race.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [PASS][209] -> [SKIP][210] ([Intel XE#4996]) +18 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#4943]) +7 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-lnl:          [PASS][212] -> [FAIL][213] ([Intel XE#4929])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-lnl:          [PASS][214] -> [DMESG-WARN][215] ([Intel XE#4792])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#4208]) +162 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          NOTRUN -> [FAIL][217] ([Intel XE#5012])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242]) -> ([PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [SKIP][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268]) ([Intel XE#378])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-436/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][269] ([Intel XE#4208])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@reload.html

  * igt@xe_oa@blocking:
    - shard-dg2-set2:     NOTRUN -> [SKIP][270] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_oa@blocking.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][271] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][272] ([Intel XE#1173]) +2 other tests fail
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][273] ([Intel XE#2284] / [Intel XE#366])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][274] -> [ABORT][275] ([Intel XE#1794]) +1 other test abort
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-4/igt@xe_pm@s4-basic.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][276] ([Intel XE#4650]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-7/igt@xe_pmu@fn-engine-activity-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][277] ([Intel XE#4650])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][278] ([Intel XE#4733]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#4733])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][280] ([Intel XE#944])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][281] ([Intel XE#4821])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#4273])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#3342])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2134]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@fbdev@unaligned-write.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@fbdev@unaligned-write.html

  * igt@intel_sysfs_debugfs@xe-base:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#4208] / [Intel XE#4618]) -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@intel_sysfs_debugfs@xe-base.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@intel_sysfs_debugfs@xe-base.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][288] ([Intel XE#2351] / [Intel XE#4996]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][290] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][291] +2 other tests pass
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][292] ([Intel XE#2291]) -> [PASS][293] +3 other tests pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][294] ([Intel XE#1475]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][296] ([Intel XE#3321]) -> [PASS][297] +1 other test pass
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][298] ([Intel XE#2316]) -> [PASS][299] +11 other tests pass
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][300] ([Intel XE#886]) -> [PASS][301] +2 other tests pass
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:
    - shard-bmg:          [FAIL][302] ([Intel XE#2882]) -> [PASS][303] +2 other tests pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#4208] / [i915#2575]) -> [PASS][305] +82 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_flip@busy-flip.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][306] ([Intel XE#301]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [FAIL][308] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][310] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][311] +1 other test pass
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][313] +6 other tests pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][314] ([Intel XE#3012]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][316] ([Intel XE#4596]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-lnl:          [SKIP][318] ([Intel XE#2351]) -> [PASS][319] +3 other tests pass
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_psr@fbc-psr-sprite-render.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#4208]) -> [PASS][321] +162 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#1392]) -> [PASS][323] +3 other tests pass
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [SKIP][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349]) ([Intel XE#378]) -> ([PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-4/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-8/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-8/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-4/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-8/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-4/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][375] ([Intel XE#4208]) -> [PASS][376] +1 other test pass
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@reload-no-display.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][377] ([Intel XE#1794]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][379] ([Intel XE#4819]) -> [PASS][380] +1 other test pass
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_pmu@gt-frequency.html

  * igt@xe_spin_batch@spin-basic:
    - shard-lnl:          [SKIP][381] ([Intel XE#4996]) -> [PASS][382] +16 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_spin_batch@spin-basic.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_spin_batch@spin-basic.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#873]) -> [SKIP][384] ([Intel XE#4208] / [i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#3768]) -> [SKIP][386] ([Intel XE#4208] / [i915#2575])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][388] ([Intel XE#316])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][389] ([Intel XE#2351]) -> [SKIP][390] ([Intel XE#3658])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#316]) -> [SKIP][392] ([Intel XE#4208]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#316]) -> [SKIP][394] ([Intel XE#2351] / [Intel XE#4208])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#4208]) -> [SKIP][396] ([Intel XE#316]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-lnl:          [SKIP][397] ([Intel XE#1124]) -> [SKIP][398] ([Intel XE#2351])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
    - shard-bmg:          [SKIP][399] ([Intel XE#1124]) -> [SKIP][400] ([Intel XE#2231])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][402] ([Intel XE#1124]) +4 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#1124]) -> [SKIP][404] ([Intel XE#4208]) +4 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][405] ([Intel XE#607]) -> [SKIP][406] ([Intel XE#2231])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#607]) -> [SKIP][408] ([Intel XE#4208])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          [SKIP][409] ([Intel XE#1477]) -> [SKIP][410] ([Intel XE#2351])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1124]) -> [SKIP][412] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#4208]) -> [SKIP][414] ([Intel XE#1124]) +5 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#4208] / [i915#2575]) -> [SKIP][416] ([Intel XE#2191])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2191]) -> [SKIP][418] ([Intel XE#4208] / [i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#367]) -> [SKIP][420] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#4208] / [i915#2575]) -> [SKIP][422] ([Intel XE#367]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][424] ([Intel XE#4208]) +13 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2907]) -> [SKIP][426] ([Intel XE#4208]) +3 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][427] ([Intel XE#2887]) -> [SKIP][428] ([Intel XE#2231]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][429] ([Intel XE#2351]) -> [SKIP][430] ([Intel XE#2887])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#4208]) -> [SKIP][432] ([Intel XE#2907]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [SKIP][433] ([Intel XE#2887]) -> [SKIP][434] ([Intel XE#2351]) +2 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][435] ([Intel XE#3432]) -> [SKIP][436] ([Intel XE#2231])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
    - shard-lnl:          [SKIP][437] ([Intel XE#3432]) -> [SKIP][438] ([Intel XE#2351])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][440] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][441] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][442] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#4208]) -> [SKIP][444] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#4208] / [i915#2575]) -> [SKIP][446] ([Intel XE#306])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_chamelium_color@degamma.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#306]) -> [SKIP][448] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#373]) -> [SKIP][450] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#4208] / [i915#2575]) -> [SKIP][452] ([Intel XE#373]) +7 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][453] ([Intel XE#2341]) -> [FAIL][454] ([Intel XE#1178]) +1 other test fail
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_content_protection@legacy.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][455] ([Intel XE#1178]) -> [SKIP][456] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#4208] / [i915#2575]) -> [FAIL][458] ([Intel XE#1188])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_content_protection@uevent.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_content_protection@uevent.html
    - shard-bmg:          [SKIP][459] ([Intel XE#2341]) -> [FAIL][460] ([Intel XE#1188])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_content_protection@uevent.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#308]) -> [SKIP][462] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          [SKIP][463] ([Intel XE#4996]) -> [SKIP][464] ([Intel XE#1424]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][465] ([Intel XE#2351]) -> [SKIP][466] ([Intel XE#4354])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#4208]) -> [SKIP][468] ([Intel XE#4356])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][470] ([Intel XE#455]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_dsc@dsc-with-formats.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#455]) -> [SKIP][472] ([Intel XE#4208]) +4 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#701]) -> [SKIP][474] ([Intel XE#4208] / [i915#2575])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][475] ([Intel XE#4996]) -> [SKIP][476] ([Intel XE#703])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_feature_discovery@display-3x.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#4208] / [i915#2575]) -> [SKIP][478] ([Intel XE#703])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_feature_discovery@display-3x.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1138]) -> [SKIP][480] ([Intel XE#4208] / [i915#2575])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][481] ([Intel XE#301]) -> [SKIP][482] ([Intel XE#4208] / [i915#2575])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][483] ([Intel XE#2351]) -> [SKIP][484] ([Intel XE#1397] / [Intel XE#1745])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][485] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][486] ([Intel XE#2231] / [Intel XE#4954])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-lnl:          [SKIP][487] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][488] ([Intel XE#2351])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#455]) -> [SKIP][490] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][491] ([Intel XE#656]) -> [SKIP][492] ([Intel XE#2351]) +5 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][493] ([Intel XE#2311]) -> [SKIP][494] ([Intel XE#2312]) +18 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][495] ([Intel XE#2351]) -> [SKIP][496] ([Intel XE#656])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][497] ([Intel XE#2312]) -> [SKIP][498] ([Intel XE#2231] / [Intel XE#4954]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#651]) -> [SKIP][500] ([Intel XE#4208]) +23 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          [SKIP][501] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][502] ([Intel XE#656])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][503] ([Intel XE#4141]) -> [SKIP][504] ([Intel XE#2312]) +12 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][505] ([Intel XE#2312]) -> [SKIP][506] ([Intel XE#4141]) +5 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][507] ([Intel XE#4141]) -> [SKIP][508] ([Intel XE#2231] / [Intel XE#4954])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          [SKIP][509] ([Intel XE#1469]) -> [SKIP][510] ([Intel XE#2351])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-bmg:          [SKIP][511] ([Intel XE#2352]) -> [SKIP][512] ([Intel XE#2231] / [Intel XE#4954])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][513] ([Intel XE#2312]) -> [SKIP][514] ([Intel XE#2311]) +19 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][515] ([Intel XE#2311]) -> [SKIP][516] ([Intel XE#2231] / [Intel XE#4954])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][518] ([Intel XE#651]) +13 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#651]) -> [SKIP][520] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#4208]) -> [SKIP][522] ([Intel XE#651]) +15 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][523] ([Intel XE#2313]) -> [SKIP][524] ([Intel XE#2231] / [Intel XE#4954]) +2 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#4208]) -> [SKIP][526] ([Intel XE#653]) +24 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][527] ([Intel XE#2312]) -> [SKIP][528] ([Intel XE#2313]) +19 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][529] ([Intel XE#2313]) -> [SKIP][530] ([Intel XE#2312]) +22 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][531] ([Intel XE#2313]) -> [SKIP][532] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#4208]) -> [SKIP][534] ([Intel XE#455]) +2 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#653]) -> [SKIP][536] ([Intel XE#4208]) +20 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#653]) -> [SKIP][538] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][540] ([Intel XE#653]) +3 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#4208] / [i915#2575]) -> [SKIP][542] ([Intel XE#605])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#455]) -> [SKIP][544] ([Intel XE#4208] / [i915#2575]) +9 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#4208]) -> [SKIP][546] ([Intel XE#2927])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#4208]) -> [SKIP][548] ([Intel XE#2925])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#356]) -> [SKIP][550] ([Intel XE#4208] / [i915#2575])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#4359]) -> [SKIP][552] ([Intel XE#4208])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][553] ([Intel XE#5021]) -> [SKIP][554] ([Intel XE#4596])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][555] ([Intel XE#5020]) -> [SKIP][556] ([Intel XE#4954])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#4208] / [i915#2575]) -> [SKIP][558] ([Intel XE#5020])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_plane_multiple@tiling-yf.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][560] ([Intel XE#4208] / [i915#2575])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#4208] / [i915#2575]) -> [SKIP][562] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#1129]) -> [SKIP][564] ([Intel XE#4208])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-dg2-set2:     [FAIL][565] ([Intel XE#5017]) -> [SKIP][566] ([Intel XE#4208] / [i915#2575])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_properties@get_properties-sanity-non-atomic.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#1489]) -> [SKIP][568] ([Intel XE#4208]) +10 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][569] ([Intel XE#1489]) -> [SKIP][570] ([Intel XE#2231] / [Intel XE#4954])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-lnl:          [SKIP][571] ([Intel XE#2893] / [Intel XE#4608]) -> [SKIP][572] ([Intel XE#2351])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#4208]) -> [SKIP][574] ([Intel XE#1489]) +4 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#1122]) -> [SKIP][576] ([Intel XE#4208])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#4208]) -> [SKIP][578] ([Intel XE#1122])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][580] ([Intel XE#2850] / [Intel XE#929])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-blt.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#4208]) -> [SKIP][582] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][584] ([Intel XE#4208]) +12 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][586] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][588] ([Intel XE#2939])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#2939]) -> [SKIP][590] ([Intel XE#4208])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#4208] / [i915#2575]) -> [SKIP][592] ([Intel XE#3414])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#4208] / [i915#2575]) -> [SKIP][594] ([Intel XE#1127])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-lnl:          [SKIP][595] ([Intel XE#4996]) -> [SKIP][596] ([Intel XE#1127])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#1127]) -> [SKIP][598] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#3414]) -> [SKIP][600] ([Intel XE#4208] / [i915#2575])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          [SKIP][601] ([Intel XE#4996]) -> [SKIP][602] ([Intel XE#3414] / [Intel XE#3904])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][603] ([Intel XE#1729]) -> [SKIP][604] ([Intel XE#4208] / [i915#2575])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#4208] / [i915#2575]) -> [SKIP][606] ([Intel XE#455]) +5 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_vrr@flip-dpms.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#4208] / [i915#2575]) -> [SKIP][608] ([Intel XE#756]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#756]) -> [SKIP][610] ([Intel XE#4208] / [i915#2575])
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][612] ([Intel XE#4208])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#4208]) -> [SKIP][614] ([Intel XE#1280] / [Intel XE#455])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#4208]) -> [SKIP][616] ([Intel XE#1123]) +1 other test skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#4208]) -> [SKIP][618] ([Intel XE#1126])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#4497]) -> [SKIP][620] ([Intel XE#4208]) +3 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#4208]) -> [SKIP][622] ([Intel XE#4497])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-lnl:          [SKIP][623] ([Intel XE#4996]) -> [SKIP][624] ([Intel XE#4837])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#4208]) -> [SKIP][626] ([Intel XE#4837]) +15 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_eudebug@multiple-sessions.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#4837]) -> [SKIP][628] ([Intel XE#4208]) +15 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-bmg:          [SKIP][629] ([Intel XE#4837]) -> [SKIP][630] ([Intel XE#4954]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@xe_eudebug_online@preempt-breakpoint.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-lnl:          [SKIP][631] ([Intel XE#4996]) -> [SKIP][632] ([Intel XE#688])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][633] ([Intel XE#2322]) -> [SKIP][634] ([Intel XE#4954]) +1 other test skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-lnl:          [SKIP][635] ([Intel XE#4996]) -> [SKIP][636] ([Intel XE#1392]) +1 other test skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#1392]) -> [SKIP][638] ([Intel XE#4208]) +1 other test skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch:
    - shard-dg2-set2:     [INCOMPLETE][639] ([Intel XE#2594]) -> [SKIP][640] ([Intel XE#288])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#288]) -> [SKIP][642] ([Intel XE#4208]) +30 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#4208]) -> [SKIP][644] ([Intel XE#288]) +23 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#2360]) -> [SKIP][646] ([Intel XE#4208])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@many-stride-mmap-huge:
    - shard-bmg:          [SKIP][647] ([Intel XE#4943]) -> [SKIP][648] ([Intel XE#4996]) +1 other test skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-mmap-huge.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-mmap-huge.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#4915]) -> [SKIP][650] ([Intel XE#4208]) +204 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:
    - shard-dg2-set2:     [SKIP][651] ([Intel XE#4208]) -> [SKIP][652] ([Intel XE#4915]) +144 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset:
    - shard-lnl:          [SKIP][653] ([Intel XE#4943]) -> [SKIP][654] ([Intel XE#4996]) +1 other test skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [FAIL][655] ([Intel XE#5012]) -> [SKIP][656] ([Intel XE#4208])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#255]) -> [SKIP][658] ([Intel XE#4208])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#4208]) -> [SKIP][660] ([Intel XE#560])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_media_fill@media-fill.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#4208]) -> [SKIP][662] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][664] ([Intel XE#4208]) +5 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_oa@polling-small-buf.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     [SKIP][665] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][666] ([Intel XE#4208])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][667] ([Intel XE#4208]) -> [SKIP][668] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +2 other tests skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][669] ([Intel XE#4208]) -> [SKIP][670] ([Intel XE#977])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][671] ([Intel XE#4208]) -> [SKIP][672] ([Intel XE#2838] / [Intel XE#979])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#1061]) -> [FAIL][674] ([Intel XE#1173])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_peer2peer@read.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][675] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][676] ([Intel XE#4208]) +1 other test skip
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][677] ([Intel XE#2284]) -> [SKIP][678] ([Intel XE#4208])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#4208]) -> [SKIP][680] ([Intel XE#2284] / [Intel XE#366])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][681] ([Intel XE#4208]) -> [SKIP][682] ([Intel XE#579])
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][683] ([Intel XE#4650]) -> [SKIP][684] ([Intel XE#4208])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_pmu@all-fn-engine-activity-load.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-lnl:          [SKIP][685] ([Intel XE#4996]) -> [SKIP][686] ([Intel XE#4650])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#4208]) -> [SKIP][688] ([Intel XE#4650])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     [SKIP][689] ([Intel XE#4733]) -> [SKIP][690] ([Intel XE#4208]) +2 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-dg2-set2:     [SKIP][691] ([Intel XE#4208]) -> [SKIP][692] ([Intel XE#4733])
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][693] ([Intel XE#4208]) -> [SKIP][694] ([Intel XE#944]) +2 other tests skip
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_query@multigpu-query-invalid-extension.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          [SKIP][695] ([Intel XE#944]) -> [SKIP][696] ([Intel XE#4954])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     [SKIP][697] ([Intel XE#4814]) -> [SKIP][698] ([Intel XE#4208])
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_render_copy@render-stress-0-copies.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     [SKIP][699] ([Intel XE#4208]) -> [SKIP][700] ([Intel XE#4814])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_render_copy@render-stress-2-copies.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     [SKIP][701] ([Intel XE#4208]) -> [SKIP][702] ([Intel XE#4130])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     [SKIP][703] ([Intel XE#4208]) -> [SKIP][704] ([Intel XE#4273])
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parallel.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-436/igt@xe_sriov_flr@flr-vfs-parallel.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4983
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8361 -> IGTPW_13109

  IGTPW_13109: f861c38eb9fc668db02c34db57754cfb433a76ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8361: 8361
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/index.html

--===============9017537837016404023==
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
<tr><td><b>Series:</b></td><td>tests/kms_display_modes: Fit modes within MS=
T bandwidth constraints (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146653/">https://patchwork.freedesktop.org/series/146653/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13109/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8361_FULL -&gt; XEIGTPW_13109_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13109_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13109_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
109_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_atomic_interruptible@legacy-cursor.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
9/shard-bmg-4/igt@kms_atomic_interruptible@legacy-cursor.html">SKIP</a> +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1=
-displays-2560x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7=
/igt@kms_fbcon_fbt@psr-suspend.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-436/igt@kms_sequence@get-busy@pipe-a-d=
p-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_setmode@invalid-clone-sing=
le-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">ABORT</a> +1 other test abort</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_exec_compute_mode@twice-preem=
pt-fence-early.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13109/shard-lnl-3/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.ht=
ml">SKIP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@xe_exec_sys=
tem_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.h=
tml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_ct_send_recv.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13109/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2560x1440=
p.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13109/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-2560x1440=
p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252=
">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.ht=
ml">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"=
>Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13109/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html=
">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-2/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Inte=
l XE#3278</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13109/shard-lnl-3/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13109/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-=
flip-atomic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel =
XE#1421</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13109/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
109/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-inte=
rruptible.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">In=
tel XE#352</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-lnl-3/igt@kms_force_connector_basic@force-edid.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5=
020</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3109/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-up=
scale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_plane_scaling@plan=
es-downscale-factor-0-5-upscale-20x20.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_sequence@get-busy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13109/shard-dg2-436/igt@kms_sequence@get-busy.html">INCOMPLETE</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-2/igt@xe_create@create-big-vram.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#106=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
09/shard-lnl-3/igt@xe_create@create-big-vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-1/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">I=
ntel XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13109/shard-lnl-3/igt@xe_eudebug_online@preempt-breakpoint.html">SK=
IP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-1/igt@xe_evict@evict-beng-small-external.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Inte=
l XE#688</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13109/shard-lnl-3/igt@xe_evict@evict-beng-small-external.html">SKIP</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null=
-defer-bind.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard=
-lnl-3/igt@xe_pm@s3-basic-exec.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/944">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-ba=
nk-mask.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8361_FULL and XEIGTPW_13109=
_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_vm:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13109_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@fbd=
ev@nullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/sh=
ard-dg2-464/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">In=
tel XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_async_flips@async-flip-suspend-resume@pipe=
-d-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13109/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-res=
ume@pipe-d-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4427">Intel XE#4427</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_async_flips@async-flip-=
with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-=
hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rot=
ate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13109/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_bw@connected-linear-tiling=
-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_bw@linear-tiling-4-display=
s-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180=
-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13109/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basi=
c-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_chamelium_color@ctm-max.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resol=
ution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_chamelium_frames@hdmi-frame-=
dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-with=
out-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_content_protection@uevent@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_content_protection@uevent@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-mo=
vement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-right-edge.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3109/shard-dg2-464/igt@kms_cursor_edge_walk@128x128-right-edge.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>) +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
09/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667">Intel =
XE#4667</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109=
/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4=
302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_feature_discovery@psr1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13109/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3109/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
9/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13109/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-i=
ndfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-mul=
tidraw.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13109/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-in=
dfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprim=
ary.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13109/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaled=
primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_invalid_mode@zero-clock.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg=
-4/igt@kms_invalid_mode@zero-clock.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
09/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel =
XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-=
bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-hdmi-a-2.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-4/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_pm=
_rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-436/igt@kms_properties@get_properties-=
sanity-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5017">Intel XE#5017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-blt@edp=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_psr@psr-cursor-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109=
/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1=
435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_setmode@invalid-clone-sing=
le-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) +1=
 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/sh=
ard-bmg-4/igt@kms_vblank@ts-continuation-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a=
>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/ig=
t@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-un=
bind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@testdisplay.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_compute_preempt@compute-pre=
empt-many@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@xe_eudebug@discovery-race-vmbind=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_eudebug@vm-bind-clear-fault=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_eudebug@vma-ufence-faultable.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4996">Intel XE#4996</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_eudebug@vma-ufence-faultable.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4996">Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@xe_eudebug_online@interrupt-othe=
r-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@xe_evict@evict-beng-small-multi-=
vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shar=
d-dg2-464/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
220 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null-defer-mmap.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13109/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_exec_compute_mode@twice-preem=
pt-fence-early.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_exec_fault_mode@twice-userp=
tr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@xe_exec_system_allocator@process=
-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_exec_system_allocator@threa=
ds-many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>)=
 +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-mmap-new-r=
ace.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13109/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-mmap-n=
ew-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4996">Intel XE#4996</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-fre=
e-nomemset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_exec_system_allocator@threads-many=
-stride-free-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@xe_exec_system_allocator@threads=
-shared-vm-many-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-no=
memset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-=
stride-new-bo-map-nomemset.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_exec_system_alloca=
tor@threads-shared-vm-many-stride-new-bo-map-nomemset.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929">Intel XE#49=
29</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@xe_fault_injection@inject-faul=
t-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4792">Intel XE#4792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_fault_injection@probe-fail-=
guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +162 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8361/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8361/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-=
dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8361/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_836=
1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8361/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8361/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shar=
d-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13109/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2=
-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
109/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt=
@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shar=
d-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13109/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_module_load@reload.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_oa@blocking.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel=
 XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_oa@syncs-userptr-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@xe_pm@=
s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-7/igt@xe_pmu@fn-engine-activity-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4650">Intel XE#4650</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@xe_spin_batch@spin-mem-copy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@fbdev@unaligned-write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
9/shard-dg2-432/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-base:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@intel_sysfs_debugfs@xe-base.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4618">Intel XE#4618</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13109/shard-dg2-463/igt@intel_sysfs_debugfs@xe-base.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@kms_big_fb@4-tiled-add=
fb-size-offset-overflow.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html">PASS</a> +2 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13109/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legac=
y.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1475">Intel XE#1475</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13109/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-curs=
or-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@bc-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#88=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
09/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">=
Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13109/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html">=
PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_flip@busy-flip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"=
>i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-dg2-435/igt@kms_flip@busy-flip.html">PASS</a> +82 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_flip@flip-vs-expired-vbl=
ank@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_flip@flip-vs-suspen=
d-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> +6 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Inte=
l XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13109/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13109/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13109/shard-lnl-4/igt@kms_psr@fbc-psr-sprite-render.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.ht=
ml">PASS</a> +162 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_exec_basi=
c@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8361/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8361/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8361/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8361/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8361/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-ln=
l-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard=
-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@xe_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
361/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8361/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8361/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8361/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13109/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13109/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13109/shard-lnl-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard=
-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
109/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13109/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13109/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13109/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13109/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13109/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-ln=
l-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@xe_module_load@load.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_module_load@reload-no-display.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-dg2-435/igt@xe_module_load@reload-no-display.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#17=
94</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
109/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/s=
hard-dg2-466/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_spin_batch@spin-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
9/shard-lnl-1/igt@xe_spin_batch@spin-basic.html">PASS</a> +16 other tests p=
ass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">In=
tel XE#873</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3768">Intel XE#3768</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_async_flips@invalid-async-flip-a=
tomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-5/igt@kms_big_fb@4-ti=
led-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Int=
el XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13109/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13109/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"=
>Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-7/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-lnl-3/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">In=
tel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-=
0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt=
@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13109/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/607">Intel XE#607</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/607">Intel XE#607</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1477">Intel XE#1477</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_big_fb@yf-tiled-m=
ax-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate=
-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_big_fb@yf-tile=
d-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_bw@conn=
ected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840=
x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_bw@connected-linear-t=
iling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13109/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_bw@linear-tiling-=
3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
07">Intel XE#2907</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13109/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-ge=
n12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13109/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl=
-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-m=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs=
-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-=
tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs=
-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-=
tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_ccs@missing-=
ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard=
-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_chamelium_color@degamma.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"=
>Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#30=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
09/shard-dg2-464/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-hiber=
nate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-=
hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13109/shard-bmg-8/igt@kms_content_protection@legacy.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13109/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_content_protection@uevent.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1188">Intel XE#1188</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13109/shard-bmg-1/igt@kms_content_protection@uevent.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#118=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308=
">Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13109/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996"=
>Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13109/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13109/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#435=
4</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13109/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE=
#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13109/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13109/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bp=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel=
 XE#701</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13109/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel=
 XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13109/shard-lnl-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel X=
E#703</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_feature_discovery@display-3=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Int=
el XE#1138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-dg2-464/igt@kms_feature_discovery@display-4x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-6/igt@kms_flip_scaled_cr=
c@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel=
 XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/ig=
t@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4954">Intel XE#4954</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/ig=
t@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-=
ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_flip_scaled_=
crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_frontbuffer_tracking@d=
rrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-5/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-2/igt@kms_frontbuffer_tr=
acking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-2/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">=
Intel XE#1469</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13109/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">=
Intel XE#2352</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
31">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-ind=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-8/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shr=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#=
4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledp=
rimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_frontbuffer_tracking@=
fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-mul=
tidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-in=
dfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-1/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcps=
r-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-dg2-435/igt@kms_frontbuffer_tracking@pipe-fbc-rte.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_trac=
king@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +20 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13109/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">I=
ntel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3109/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13109/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE=
#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/356">Intel XE#356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/435=
9">Intel XE#4359</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13109/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel X=
E#5021</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13109/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4=
596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5=
020</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3109/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13109/shard-dg2-466/igt@kms_plane_multiple@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/50=
20">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-=
with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downsca=
le-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms=
_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/sha=
rd-dg2-464/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-non-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_properties@get_properties-sanity-non-atomi=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5017">Intel XE#5017</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_properties@get_properties-=
sanity-non-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_psr2_sf@=
fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuo=
us-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/igt@kms_psr2_sf@fbc=
-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954"=
>Intel XE#4954</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuo=
us-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@k=
ms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13109/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Int=
el XE#1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13109/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13109/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13109/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">In=
tel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13109/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE=
#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Inte=
l XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel X=
E#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13109/shard-dg2-464/igt@kms_psr@pr-primary-page-flip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-ov=
erlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@kms_psr_stre=
ss_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-ov=
erlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2939">Intel XE#2939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_psr_stress_test@invali=
date-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_rotation_crc@primary-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@kms_rotation_crc@pr=
imary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13109/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-refl=
ect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1127">Intel XE#1127</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"=
>Intel XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13109/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">In=
tel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13109/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">=
Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13109/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13109/shard-dg2-433/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb21010=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-435/igt@kms_writeback@w=
riteback-check-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel X=
E#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13109/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">I=
ntel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_compute_preempt@compute-pree=
mpt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13109/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-man=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13109/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13109/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
26">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/449=
7">Intel XE#4497</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13109/shard-dg2-464/igt@xe_eu_stall@invalid-event-report-count.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13109/shard-dg2-466/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">=
Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13109/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-ufence-sigi=
nt-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13109/shard-dg2-433/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4=
837</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@xe_eudebug_online@interrupt-all-set-breakpoint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_eudebug_online@interrupt-all=
-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">I=
ntel XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13109/shard-bmg-4/igt@xe_eudebug_online@preempt-breakpoint.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954=
">Intel XE#4954</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-=
reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13109/shard-lnl-8/igt@xe_evict_ccs@evict-overcomm=
it-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-bmg-4/i=
gt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-inv=
alidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4954">Intel XE#4954</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-n=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13109/shard-lnl-4/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_exec_basic@m=
ultigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-=
prefetch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-434/igt@xe_exec_fault_mod=
e@once-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-prefetch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
8">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-prefetch.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13109/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-r=
ebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2360">Intel XE#2360</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-i=
nterrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-mmap-huge.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4943">Intel XE#4943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_exec_system_allocator@many-strid=
e-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4996">Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@xe_exec_system_allocator@process-many-mmap-fre=
e-race-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_exec_system_a=
llocator@process-many-mmap-free-race-nomemset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
+204 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-man=
y-large-execqueues-mmap-new-race-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg=
2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-=
mmap-new-race-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +144 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge=
-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-lnl-3/igt@xe_e=
xec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4996">Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_=
send_recv.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5012">Intel XE#5012</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_fault_injection@pro=
be-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/=
shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_media_fill@media-fill.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
109/shard-dg2-433/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13109/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541=
">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#254=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573=
">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-dg2-464/igt@xe_oa@polling-small-buf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel X=
E#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-464/igt@xe_oa@syncs-syncobj-w=
ait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13109/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2=
541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4501">Intel XE#4501</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
9/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
9/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#=
979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/sha=
rd-dg2-435/igt@xe_peer2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13109/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/sha=
rd-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13109/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13109/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">I=
ntel XE#4650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13109/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996=
">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-lnl-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4650">Intel XE#4650</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13109/shard-dg2-433/igt@xe_pmu@fn-engine-activity-sched-if-idl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
9/shard-dg2-464/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13109/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">=
Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_query@multigpu-query-invalid-extension.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13109/shard-dg2-435/igt@xe_query@multigpu-query-invalid-exte=
nsion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/944">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13109/shard-bmg-4/igt@xe_query@multigpu-query-topology-l3-ba=
nk-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@xe_render_copy@render-stress-0-copies.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814=
">Intel XE#4814</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-dg2-464/igt@xe_render_copy@render-stress-0-copies.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_render_copy@render-stress-2-copies.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13109/shard-dg2-435/igt@xe_render_copy@render-stress-2-copies.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovis=
ion-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13109/shard-dg2-463/igt@xe_sriov_aut=
o_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#41=
30</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13109/shard-dg2-436/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE=
#4273</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8361 -&gt; IGTPW_13109</li>
</ul>
<p>IGTPW_13109: f861c38eb9fc668db02c34db57754cfb433a76ac @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8361: 8361<br />
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cf=
efdb7aaef12cd80c9</p>

</body>
</html>

--===============9017537837016404023==--
