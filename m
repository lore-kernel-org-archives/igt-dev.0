Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A1BCD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 19:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E5D10E04B;
	Fri, 19 Jun 2026 19:37:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA5410F6F8;
 Fri, 19 Jun 2026 19:37:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5803395953100495305=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_debugfs_entry_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Jun 2026 19:37:25 -0000
Message-ID: <178189784523.96724.9759952221750526744@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260619164229.639186-1-sobin.thomas@intel.com>
In-Reply-To: <20260619164229.639186-1-sobin.thomas@intel.com>
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

--===============5803395953100495305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add debugfs entry (rev2)
URL   : https://patchwork.freedesktop.org/series/168831/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8976_FULL -> XEIGTPW_15410_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15410_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15410_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15410_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-10/igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15410_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +4 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2887])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2286] / [Intel XE#6035])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1138] / [Intel XE#7344])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#301])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7178] / [Intel XE#7349])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7351])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#6312])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#4141]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2311]) +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2313]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7061])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#7915]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-10/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#6911] / [Intel XE#7378])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-9/igt@kms_psr@psr2-suspend.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6599])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7636])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7636])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-3/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2322] / [Intel XE#7372])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#8374])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#8364]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#8364]) +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-rebind-err:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#8378]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-rebind-err.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6964])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7793])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-8/igt@xe_page_reclaim@random.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-8/igt@xe_peer2peer@read.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4733] / [Intel XE#7417])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#944])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-9/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#6569])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput-low-priority:
    - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#7992]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-10/igt@xe_sriov_scheduling@equal-throughput-low-priority.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-low-priority.html

  
#### Possible fixes ####

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][45] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][47] ([Intel XE#301]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][49] ([Intel XE#7308]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][51] ([Intel XE#7915]) -> [PASS][52] +3 other tests pass
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-9/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][53] ([Intel XE#2142]) -> [PASS][54] +1 other test pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][55] ([Intel XE#7850]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][57] ([Intel XE#6569]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_vm@large-userptr-binds-16777216:
    - shard-lnl:          [ABORT][59] ([Intel XE#8007]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-2/igt@xe_vm@large-userptr-binds-16777216.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][61] ([Intel XE#301]) -> [FAIL][62] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8976 -> IGTPW_15410

  IGTPW_15410: 15410
  IGT_8976: 8976
  xe-5282-a21fadfbf1d34161adab1c6de52d688fefcefb81: a21fadfbf1d34161adab1c6de52d688fefcefb81

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/index.html

--===============5803395953100495305==
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
<tr><td><b>Series:</b></td><td>Add debugfs entry (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168831/">https://patchwork.freedesktop.org/series/168831/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8976_FULL -&gt; XEIGTPW_15410_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15410_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15410_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15410_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-10/igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15410_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-10/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-9/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-3/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind-err:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-rebind-err.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-8/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-8/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-9/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-low-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-10/igt@xe_sriov_scheduling@equal-throughput-low-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-low-priority.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-9/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-7/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-2/igt@xe_vm@large-userptr-binds-16777216.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8976/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15410/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8976 -&gt; IGTPW_15410</li>
</ul>
<p>IGTPW_15410: 15410<br />
  IGT_8976: 8976<br />
  xe-5282-a21fadfbf1d34161adab1c6de52d688fefcefb81: a21fadfbf1d34161adab1c6de52d688fefcefb81</p>

</body>
</html>

--===============5803395953100495305==--
