Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA13CDB471
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 21:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CA310E239;
	Tue, 23 Jun 2026 21:31:49 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9F610E239;
 Tue, 23 Jun 2026 21:31:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3232694010940517931=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel=3A_Trigger_con?=
 =?utf-8?q?figfs_attr_callbacks_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Smitha Balasubramanyam" <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Jun 2026 21:31:21 -0000
Message-ID: <178225028131.108058.1938536895214396555@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260416090755.1025223-1-smitha.balasubramanyam@intel.com>
In-Reply-To: <20260416090755.1025223-1-smitha.balasubramanyam@intel.com>
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

--===============3232694010940517931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Trigger configfs attr callbacks (rev4)
URL   : https://patchwork.freedesktop.org/series/164983/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8980_FULL -> XEIGTPW_15429_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15429_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15429_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15429_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_configfs@sriov-max-vfs-store-show (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-7/igt@xe_configfs@sriov-max-vfs-store-show.html

  
New tests
---------

  New tests have been introduced between XEIGT_8980_FULL and XEIGTPW_15429_FULL:

### New IGT tests (2) ###

  * igt@xe_configfs@psmi-enable-disable:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 1.08] s

  * igt@xe_configfs@sriov-max-vfs-store-show:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.88] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15429_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2320])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#7571])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#301]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#301] / [Intel XE#3149])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2311]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7399])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2313]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#7308])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-4/igt@kms_hdmi_inject@inject-audio.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4090] / [Intel XE#7443])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#8303]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2685] / [Intel XE#3307])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-9/igt@kms_plane_scaling@intel-max-src-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#8399])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1489])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2234] / [Intel XE#2850])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-3/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2330] / [Intel XE#5813])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7636]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_exec_compute_mode@twice-userptr-unmap:
    - shard-lnl:          [PASS][25] -> [ABORT][26] ([Intel XE#8007])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-unmap.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-unmap.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#8374])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#8364]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#8378]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6964])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-1/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [PASS][33] -> [FAIL][34] ([Intel XE#6569])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][35] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [FAIL][37] ([Intel XE#6078]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][39] ([Intel XE#3149] / [Intel XE#3321]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][41] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) -> [PASS][42] +1 other test pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][43] ([Intel XE#301]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][45] ([Intel XE#8361]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][47] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][49] ([Intel XE#301]) -> [FAIL][50] ([Intel XE#301] / [Intel XE#3149])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][51] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][52] ([Intel XE#3544])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][53] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][54] ([Intel XE#2509] / [Intel XE#7437])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399


Build changes
-------------

  * IGT: IGT_8980 -> IGTPW_15429

  IGTPW_15429: 15429
  IGT_8980: 65d820119e86b017bf801c8f2bb500e557b29d1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5290-60326b17f877e12846167bf8ef83680b9875218a: 60326b17f877e12846167bf8ef83680b9875218a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/index.html

--===============3232694010940517931==
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
<tr><td><b>Series:</b></td><td>tests/intel: Trigger configfs attr callbacks (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164983/">https://patchwork.freedesktop.org/series/164983/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8980_FULL -&gt; XEIGTPW_15429_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15429_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15429_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15429_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_configfs@sriov-max-vfs-store-show (NEW):<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-7/igt@xe_configfs@sriov-max-vfs-store-show.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8980_FULL and XEIGTPW_15429_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_configfs@psmi-enable-disable:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@sriov-max-vfs-store-show:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.88] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15429_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-9/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-3/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-unmap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-unmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-unmap.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-1/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-9/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361">Intel XE#8361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8980/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15429/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8980 -&gt; IGTPW_15429</li>
</ul>
<p>IGTPW_15429: 15429<br />
  IGT_8980: 65d820119e86b017bf801c8f2bb500e557b29d1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5290-60326b17f877e12846167bf8ef83680b9875218a: 60326b17f877e12846167bf8ef83680b9875218a</p>

</body>
</html>

--===============3232694010940517931==--
