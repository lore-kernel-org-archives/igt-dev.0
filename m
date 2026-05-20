Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D40CD4F5E
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 05:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D62610EEEB;
	Wed, 20 May 2026 05:38:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F210310EEEB;
 Wed, 20 May 2026 05:37:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4051783012386085482=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/kms=5Fsetmode=3A_Add?=
 =?utf-8?q?_HDMI_2=2E0_clock_limit_for_mode_selection_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 20 May 2026 05:37:55 -0000
Message-ID: <177925547598.88514.5711754774607880518@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260519041750.1199802-1-jeevan.b@intel.com>
In-Reply-To: <20260519041750.1199802-1-jeevan.b@intel.com>
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

--===============4051783012386085482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Add HDMI 2.0 clock limit for mode selection (rev4)
URL   : https://patchwork.freedesktop.org/series/160881/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8921_FULL -> XEIGTPW_15202_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15202_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15202_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15202_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html

  * igt@xe_waitfence@abstime:
    - shard-bmg:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-3/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@xe_waitfence@abstime.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15202_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084]) +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2325] / [Intel XE#7358])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2321] / [Intel XE#7355])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#7774]) +1 other test dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1508])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2244])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#301]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][21] -> [INCOMPLETE][22] ([Intel XE#2597] / [Intel XE#6819])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:
    - shard-bmg:          [PASS][23] -> [DMESG-FAIL][24] ([Intel XE#1727] / [Intel XE#6819])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4141]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#656] / [Intel XE#7905])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +22 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2313]) +26 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7905])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7061]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr@pipe-a-dp-2-xrgb16161616f:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7922]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-dp-2-xrgb16161616f.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7915]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#7915]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7130]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7283]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#5021] / [Intel XE#7377])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1489]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2387] / [Intel XE#7429])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1406])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-5/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#6361]) +2 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1499])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#2142]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7636]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7140])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7136]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6874]) +15 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7866]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#6703]) +22 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-8/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#6703]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7138]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#6964]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7793]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2236] / [Intel XE#7590])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#944]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][66] ([Intel XE#7308]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][68] ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][70] ([Intel XE#7340]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][72] ([Intel XE#6321]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap:
    - shard-lnl:          [ABORT][74] ([Intel XE#8044]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-4/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-7/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][76] ([Intel XE#6569]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:
    - shard-bmg:          [FAIL][78] -> [PASS][79] +24 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-9/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          [SKIP][80] ([Intel XE#1124]) -> [SKIP][81] ([Intel XE#6703])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          [SKIP][82] ([Intel XE#2252]) -> [SKIP][83] ([Intel XE#6703])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-bmg:          [SKIP][84] ([Intel XE#2320]) -> [SKIP][85] ([Intel XE#6703])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-64x21.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][86] ([Intel XE#2311]) -> [SKIP][87] ([Intel XE#6703]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][88] ([Intel XE#4141]) -> [SKIP][89] ([Intel XE#6703])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][90] ([Intel XE#2313]) -> [SKIP][91] ([Intel XE#6703])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][92] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][93] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][94] ([Intel XE#7916]) -> [SKIP][95] ([Intel XE#7915]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][96] ([Intel XE#6874]) -> [SKIP][97] ([Intel XE#6703]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#8044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8044
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8921 -> IGTPW_15202
  * Linux: xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 -> xe-5097-f32ba7e949b0579eee118f06312945e34ce6628d

  IGTPW_15202: 15202
  IGT_8921: 8921
  xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497
  xe-5097-f32ba7e949b0579eee118f06312945e34ce6628d: f32ba7e949b0579eee118f06312945e34ce6628d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/index.html

--===============4051783012386085482==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Add HDMI 2.0 clock limit for mode selection (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160881/">https://patchwork.freedesktop.org/series/160881/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8921_FULL -&gt; XEIGTPW_15202_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15202_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15202_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15202_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-3/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@xe_waitfence@abstime.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15202_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-dp-2-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-5/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@xe_evict@evict-cm-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-8/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-lnl-4/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8044">Intel XE#8044</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-lnl-7/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-9/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8921 -&gt; IGTPW_15202</li>
<li>Linux: xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 -&gt; xe-5097-f32ba7e949b0579eee118f06312945e34ce6628d</li>
</ul>
<p>IGTPW_15202: 15202<br />
  IGT_8921: 8921<br />
  xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497<br />
  xe-5097-f32ba7e949b0579eee118f06312945e34ce6628d: f32ba7e949b0579eee118f06312945e34ce6628d</p>

</body>
</html>

--===============4051783012386085482==--
