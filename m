Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CFACD343F
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 00:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF41D10E027;
	Wed, 13 May 2026 00:05:56 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B1B10E027;
 Wed, 13 May 2026 00:05:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4254695125101801725=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_RFC=3A_Add_preferred_FB_mo?=
 =?utf-8?q?difier_helper_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 May 2026 00:05:40 -0000
Message-ID: <177863074093.64915.15899582503602550540@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512062020.546220-1-jeevan.b@intel.com>
In-Reply-To: <20260512062020.546220-1-jeevan.b@intel.com>
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

--===============4254695125101801725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: Add preferred FB modifier helper (rev2)
URL   : https://patchwork.freedesktop.org/series/164817/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8904_FULL -> XEIGTPW_15160_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15160_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15160_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15160_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-lnl:          [PASS][2] -> [FAIL][3] +34 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [PASS][4] -> [FAIL][5] +53 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-bmg:          [SKIP][6] ([Intel XE#6703] / [Intel XE#7935]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15160_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][12] -> [ABORT][13] ([Intel XE#1727]) +1 other test abort
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-dp-2:
    - shard-bmg:          [PASS][14] -> [INCOMPLETE][15] ([Intel XE#1727])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-dp-2.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2325] / [Intel XE#7358])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#7935]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#7935])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#301]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2311]) +13 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#656] / [Intel XE#7905])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#6312]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2313]) +12 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#7915]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#4596] / [Intel XE#5854])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1489])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][36] -> [SKIP][37] ([Intel XE#4692] / [Intel XE#7508])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7636]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7140])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-basic:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7482])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7136]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6874]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-basic-smem.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#6874])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-5/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7793])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_sriov_vfio@region-info:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#5937])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_sriov_vfio@region-info.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@xe_sriov_vfio@region-info.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-lnl:          [FAIL][48] ([Intel XE#3718] / [Intel XE#7265]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][50] ([Intel XE#7265]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][52] ([Intel XE#7084]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][54] ([Intel XE#7915]) -> [PASS][55] +3 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-8/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][56] ([Intel XE#6321]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@once-free:
    - shard-bmg:          [SKIP][58] ([Intel XE#6703]) -> [PASS][59] +35 other tests pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_exec_system_allocator@once-free.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@xe_exec_system_allocator@once-free.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [ABORT][60] -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@xe_module_load@reload-no-display.html
    - shard-lnl:          [ABORT][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-lnl-4/igt@xe_module_load@reload-no-display.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-3/igt@xe_module_load@reload-no-display.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-bmg:          [SKIP][64] ([Intel XE#6703]) -> [SKIP][65] ([Intel XE#1124])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][66] ([Intel XE#6703]) -> [SKIP][67] ([Intel XE#2887])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][68] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][69] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][70] ([Intel XE#6703]) -> [SKIP][71] ([Intel XE#2311]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-render.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][72] ([Intel XE#6703]) -> [SKIP][73] ([Intel XE#7061])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [SKIP][75] ([Intel XE#2313]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][76] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][77] ([Intel XE#3544] / [Intel XE#7916])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][78] ([Intel XE#7915]) -> [SKIP][79] ([Intel XE#7916]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#6911] / [Intel XE#7466])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][82] ([Intel XE#6703]) -> [SKIP][83] ([Intel XE#1489])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][84] ([Intel XE#6703]) -> [SKIP][85] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][86] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][87] ([Intel XE#1729] / [Intel XE#7424])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][88] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][89] ([Intel XE#2509] / [Intel XE#7437])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-bmg:          [SKIP][90] ([Intel XE#6703]) -> [SKIP][91] ([Intel XE#7636]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-bmg:          [SKIP][92] ([Intel XE#6703]) -> [SKIP][93] ([Intel XE#2322] / [Intel XE#7372])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          [SKIP][94] ([Intel XE#6703]) -> [SKIP][95] ([Intel XE#6874]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-basic.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [SKIP][96] ([Intel XE#6703]) -> [SKIP][97] ([Intel XE#7138]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [SKIP][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [SKIP][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [DMESG-FAIL][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149]) ([Intel XE#2457] / [Intel XE#5545] / [Intel XE#6652] / [Intel XE#7405])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-10/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-10/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-8/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-5/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-1/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-1/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-1/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-9/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-9/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-9/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-8/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-5/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-6/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-6/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-6/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-4/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-4/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-8/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-10/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-8/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-4/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-4/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-4/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-4/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-8/igt@xe_module_load@load.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][150] ([Intel XE#6703]) -> [SKIP][151] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_pm@d3hot-i2c.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@xe_pm@d3hot-i2c.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935


Build changes
-------------

  * IGT: IGT_8904 -> IGTPW_15160

  IGTPW_15160: 4f8d846588a3793f6023b534778ff6d300a90c85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8904: 07cadbb0bf25b18ac37467c4505f87eb50d4e435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5047-b83102e9c06357b09f2cfbe944269786cb6985c4: b83102e9c06357b09f2cfbe944269786cb6985c4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/index.html

--===============4254695125101801725==
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
<tr><td><b>Series:</b></td><td>RFC: Add preferred FB modifier helper (rev2)=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164817/">https://patchwork.freedesktop.org/series/164817/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15160/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15160/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8904_FULL -&gt; XEIGTPW_15160_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15160_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15160_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
160_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-fli=
pa-varying-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_151=
60/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> +=
34 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_151=
60/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> +=
53 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@cursor-vs-flip-toggle:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7935">Intel XE#7935</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_cursor_legacy@cursor-vs-=
flip-toggle.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15160_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-=
target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@kms_ccs@bad-rotation-90-yf-tiled=
-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-cc=
s@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other t=
est abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-cc=
s@pipe-b-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15160/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4=
-tiled-bmg-ccs@pipe-b-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transiti=
ons-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-fl=
ip-atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15160/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-=
flipa-atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1516=
0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr=
-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2=
101010.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15160/shard-bmg-3/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-=
3-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-8/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15160/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4692">Intel XE#4692</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7508">Intel XE#7508</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadat=
a-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_evict@evict-small-multi-queue=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-lnl-4/igt@xe_exec_balancer@many-execqueues=
-cm-virtual-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Int=
el XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-=
queue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-b=
asic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-lnl-5/igt@xe_exec_multi_queue@two-queues-b=
asic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@xe_page_reclaim@binds-full-pd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@region-info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@xe_sriov_vfio@region-info.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6=
/igt@xe_sriov_vfio@region-info.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7265">Intel XE#7265</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-2/igt@kms_async_flips@alt=
ernate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic=
@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7265">Intel XE#7265</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-2/igt@kms_async_flips@alte=
rnate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7084">Intel XE#7084</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-8/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7915">Intel XE#7915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15160/shard-bmg-2/igt@kms_hdr@static-swap@pipe-a-hdmi-a-=
3-xrgb2101010.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6321">Intel XE#6321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-=
threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@xe_exec_system_allocator@once-free.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15160/shard-bmg-10/igt@xe_exec_system_allocator@once-free.html">PASS<=
/a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-3/igt@xe_module_load@reload-no-display.html">ABORT</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/sha=
rd-bmg-1/igt@xe_module_load@reload-no-display.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-lnl-4/igt@xe_module_load@reload-no-display.html">ABORT</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/sha=
rd-lnl-3/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">I=
ntel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15160/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124=
">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15160/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-g=
en12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-lnl-8/igt@kms_cursor_legac=
y@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935"=
>Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-rende=
r:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-=
pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@kms_frontbuf=
fer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel X=
E#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-=
draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@kms_frontbuffer_tracking@=
fbcdrrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@kms_frontbuffer_=
tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/79=
15">Intel XE#7915</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7916">Intel XE#7916</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_hdr@brightness-with-h=
dr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3544">Intel XE#3544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb=
16161616f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_hdr@brightness-with=
-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15160/shard-bmg-10/igt@kms_joiner@basic-force-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911"=
>Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-=
cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/sh=
ard-bmg-6/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5848">Intel XE#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@kms_tiled_display@basic-test-p=
attern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1729">Intel XE#1729</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@kms_tiled_displa=
y@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15160/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-vm-destroy-=
discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15160/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueu=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">I=
ntel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15160/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874=
">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-rac=
e:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@xe_exec_thre=
ads@threads-multi-queue-shared-vm-userptr-invalidate-race.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel X=
E#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8904/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-10/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8904/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGT_8904/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-1/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8904/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGT_8904/shard-bmg-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-=
9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8904/shard-bmg-9/igt@xe_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8904/shard-bmg-5/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shar=
d-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/s=
hard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_890=
4/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
8904/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8904/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8904/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8904/shard-bmg-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8904/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405"=
>Intel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15160/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1516=
0/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15160/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-10/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15160/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/s=
hard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15160/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15160/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-1/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15160/shard-bmg-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-2/igt@xe_module_load@load.html=
">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15160/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15160/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-bmg-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15160/shard-bmg-8/igt@xe_module_load@load.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">In=
tel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5545">Intel XE#5545</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8904/shard-bmg-2/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15160/shard-b=
mg-6/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#740=
0</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8904 -&gt; IGTPW_15160</li>
</ul>
<p>IGTPW_15160: 4f8d846588a3793f6023b534778ff6d300a90c85 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8904: 07cadbb0bf25b18ac37467c4505f87eb50d4e435 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5047-b83102e9c06357b09f2cfbe944269786cb6985c4: b83102e9c06357b09f2cfbe=
944269786cb6985c4</p>

</body>
</html>

--===============4254695125101801725==--
