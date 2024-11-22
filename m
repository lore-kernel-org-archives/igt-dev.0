Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC94E69183
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 17:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BDD10EBFE;
	Fri, 22 Nov 2024 17:01:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C7A10EBFE;
 Fri, 22 Nov 2024 17:01:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/igt=5Fpsr=3A_Dump_ou?=
 =?utf-8?q?t_PSR_status_if_waiting_PSR_entry_or_update_fails?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 17:01:20 -0000
Message-ID: <173229488030.1766149.3040351706202270526@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119123324.4070696-1-jouni.hogander@intel.com>
In-Reply-To: <20241119123324.4070696-1-jouni.hogander@intel.com>
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

== Series Details ==

Series: lib/igt_psr: Dump out PSR status if waiting PSR entry or update fails
URL   : https://patchwork.freedesktop.org/series/141547/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15722_full -> IGTPW_12142_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12142_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12142_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/index.html

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12142_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2:          ([PASS][1], [PASS][2]) -> ([PASS][3], [FAIL][4])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-4/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-2/igt@core_setmaster@master-drop-set-user.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@core_setmaster@master-drop-set-user.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html

  * igt@debugfs_test@read_all_entries_display_off:
    - shard-mtlp:         ([PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10]) -> [ABORT][11]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-5/igt@debugfs_test@read_all_entries_display_off.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-3/igt@debugfs_test@read_all_entries_display_off.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-4/igt@debugfs_test@read_all_entries_display_off.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-2/igt@debugfs_test@read_all_entries_display_off.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-8/igt@debugfs_test@read_all_entries_display_off.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-6/igt@debugfs_test@read_all_entries_display_off.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-6/igt@debugfs_test@read_all_entries_display_off.html

  * igt@gem_ppgtt@shrink-vs-evict-pinned:
    - shard-rkl:          NOTRUN -> ([DMESG-WARN][12], [DMESG-WARN][13])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-7/igt@gem_ppgtt@shrink-vs-evict-pinned.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@gem_ppgtt@shrink-vs-evict-pinned.html

  * igt@gem_ringfill@engines-basic@rcs0:
    - shard-dg1:          [PASS][14] -> ([PASS][15], [INCOMPLETE][16]) +1 other test ( 1 incomplete, 1 pass )
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-18/igt@gem_ringfill@engines-basic@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gem_ringfill@engines-basic@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@gem_ringfill@engines-basic@rcs0.html

  * igt@gem_vm_create@create-ext:
    - shard-rkl:          ([PASS][17], [PASS][18]) -> ([DMESG-WARN][19], [PASS][20]) +1 other test ( 1 dmesg-warn, 1 pass )
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-1/igt@gem_vm_create@create-ext.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-7/igt@gem_vm_create@create-ext.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@gem_vm_create@create-ext.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@gem_vm_create@create-ext.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          ([PASS][21], [PASS][22]) -> [DMESG-FAIL][23]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-dg2:          ([PASS][24], [PASS][25]) -> [SKIP][26] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-10/igt@i915_pm_rpm@gem-execbuf.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-4/igt@i915_pm_rpm@gem-execbuf.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg2:          ([PASS][27], [PASS][28]) -> ([SKIP][29], [PASS][30]) +1 other test ( 1 pass, 1 skip )
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-4/igt@i915_pm_rpm@reg-read-ioctl.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-2/igt@i915_pm_rpm@reg-read-ioctl.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          ([PASS][31], [PASS][32]) -> ([DMESG-FAIL][33], [DMESG-FAIL][34])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@i915_selftest@live@gt_pm.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@i915_selftest@live@gt_pm.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@i915_selftest@live@gt_pm.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         ([PASS][35], [PASS][36]) -> ([ABORT][37], [ABORT][38]) +1 other test ( 2 abort )
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-3/igt@i915_selftest@live@sanitycheck.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-8/igt@i915_selftest@live@sanitycheck.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@i915_selftest@live@sanitycheck.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          ([PASS][39], [PASS][40]) -> ([DMESG-FAIL][41], [INCOMPLETE][42]) ([i915#4817])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-1/igt@i915_suspend@fence-restore-untiled.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-rkl:          ([PASS][43], [PASS][44]) -> [DMESG-WARN][45] +19 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-7/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-rkl:          ([PASS][46], [PASS][47]) -> ([DMESG-WARN][48], [DMESG-WARN][49]) +8 other tests ( 2 dmesg-warn )
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-7/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][50], [SKIP][51]) +2 other tests ( 2 skip )
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][52]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2:          NOTRUN -> ([SKIP][53], [SKIP][54]) ([i915#2575]) +2 other tests ( 2 skip )
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@kms_flip@2x-flip-vs-modeset.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-hdmi-a2:
    - shard-rkl:          [PASS][55] -> [DMESG-WARN][56] +9 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-5/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-hdmi-a2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][57] +3 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
    - shard-rkl:          [PASS][58] -> ([DMESG-WARN][59], [DMESG-WARN][60]) +6 other tests ( 2 dmesg-warn )
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-7/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html

  * igt@perf_pmu@busy-idle-no-semaphores:
    - shard-dg2:          NOTRUN -> ([PASS][61], [SKIP][62]) +2 other tests ( 1 pass, 1 skip )
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@perf_pmu@busy-idle-no-semaphores.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@perf_pmu@busy-idle-no-semaphores.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [SKIP][63] -> ([SKIP][64], [PASS][65])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ctx_param@invalid-ctx-get:
    - shard-dg2:          [SKIP][66] ([i915#2575]) -> [INCOMPLETE][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@gem_ctx_param@invalid-ctx-get.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@gem_ctx_param@invalid-ctx-get.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-dg2:          ([SKIP][68], [PASS][69]) -> [SKIP][70]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-1/igt@gem_lmem_evict@dontneed-evict-race.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          ([DMESG-FAIL][71], [DMESG-FAIL][72]) ([i915#12964]) -> ([FAIL][73], [FAIL][74])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@gem_tiled_swapping@non-threaded.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@gem_tiled_swapping@non-threaded.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@gem_tiled_swapping@non-threaded.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
    - shard-snb:          ([FAIL][75], [FAIL][76]) ([i915#12971]) -> ([FAIL][77], [PASS][78])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-snb7/igt@gem_tiled_swapping@non-threaded.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         ([PASS][79], [FAIL][80]) ([i915#12971]) -> ([FAIL][81], [FAIL][82])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-4/igt@gem_tiled_swapping@non-threaded.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-10/igt@gem_tiled_swapping@non-threaded.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2:          [SKIP][83] ([i915#2575]) -> ([SKIP][84], [SKIP][85]) +2 other tests ( 2 skip )
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2:          ([SKIP][86], [SKIP][87]) ([i915#2575]) -> [SKIP][88]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2:          ([SKIP][89], [SKIP][90]) -> ([SKIP][91], [SKIP][92]) ([i915#2575]) +1 other test ( 2 skip )
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          ([SKIP][93], [SKIP][94]) ([i915#2575]) -> ([SKIP][95], [SKIP][96])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][97] ([i915#2575]) -> ([SKIP][98], [SKIP][99]) ([i915#12713])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@perf_pmu@busy-double-start:
    - shard-dg2:          ([PASS][100], [FAIL][101]) ([i915#4349]) -> [SKIP][102]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-6/igt@perf_pmu@busy-double-start.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-5/igt@perf_pmu@busy-double-start.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@perf_pmu@busy-double-start.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][103] +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-9/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15722_full and IGTPW_12142_full:

### New IGT tests (3) ###

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [4.45] s

  

Known issues
------------

  Here are the changes found in IGTPW_12142_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@default-alignment:
    - shard-dg2:          [PASS][104] -> [SKIP][105] +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@api_intel_allocator@default-alignment.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@api_intel_allocator@default-alignment.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#8411])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([i915#6230])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@api_intel_bb@crc32.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> ([SKIP][109], [SKIP][110]) ([i915#6230])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@api_intel_bb@crc32.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@api_intel_bb@crc32.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2:          [PASS][111] -> ([FAIL][112], [PASS][113]) ([i915#12909])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@core_setmaster@master-drop-set-root.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@core_setmaster@master-drop-set-root.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#9318])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-2/igt@debugfs_test@basic-hwmon.html
    - shard-rkl:          NOTRUN -> ([SKIP][115], [SKIP][116]) ([i915#9318])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@debugfs_test@basic-hwmon.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy@ccs0:
    - shard-dg2:          NOTRUN -> ([SKIP][117], [SKIP][118]) ([i915#8414]) +17 other tests ( 2 skip )
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@drm_fdinfo@busy@ccs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@drm_fdinfo@busy@ccs0.html

  * igt@drm_fdinfo@busy@vcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#8414]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-5/igt@drm_fdinfo@busy@vcs0.html

  * igt@drm_fdinfo@isolation:
    - shard-dg1:          NOTRUN -> ([SKIP][120], [SKIP][121]) ([i915#8414]) +6 other tests ( 2 skip )
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@drm_fdinfo@isolation.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@drm_fdinfo@isolation.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#8414])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@drm_fdinfo@virtual-busy.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#2582])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#7697])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> ([SKIP][125], [SKIP][126]) ([i915#7697])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@gem_basic@multigpu-create-close.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#4873])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-8/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> ([SKIP][128], [SKIP][129]) ([i915#3555] / [i915#9323])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-9/igt@gem_ccs@block-copy-compressed.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#9323])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#9323])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#9323])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#3555] / [i915#9323])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][134] -> ([PASS][135], [INCOMPLETE][136]) ([i915#12392])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> ([SKIP][137], [SKIP][138]) ([i915#6335])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-9/igt@gem_create@create-ext-cpu-access-big.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#6335])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> ([SKIP][140], [SKIP][141]) ([i915#8562])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-7/igt@gem_create@create-ext-set-pat.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-10/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][142] ([i915#1099])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-snb:          NOTRUN -> ([SKIP][143], [SKIP][144]) ([i915#1099])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-snb1/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> ([SKIP][145], [SKIP][146]) ([i915#280])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-9/igt@gem_ctx_sseu@invalid-sseu.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-4/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> ([ABORT][147], [ABORT][148]) ([i915#10030] / [i915#7975] / [i915#8213])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@gem_eio@hibernate.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][149] ([i915#5784])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          ([PASS][150], [PASS][151]) -> ([FAIL][152], [PASS][153]) ([i915#12543] / [i915#5784])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-6/igt@gem_eio@reset-stress.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-5/igt@gem_eio@reset-stress.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-8/igt@gem_eio@reset-stress.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@gem_eio@reset-stress.html

  * igt@gem_exec_await@wide-contexts:
    - shard-rkl:          ([PASS][154], [PASS][155]) -> [DMESG-WARN][156] ([i915#12964])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-7/igt@gem_exec_await@wide-contexts.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@gem_exec_await@wide-contexts.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> ([SKIP][157], [SKIP][158]) ([i915#4771])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@gem_exec_balancer@bonded-dual.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> ([SKIP][159], [SKIP][160]) ([i915#4771])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@gem_exec_balancer@bonded-pair.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> ([SKIP][161], [SKIP][162]) ([i915#4036])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@gem_exec_balancer@invalid-bonds.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [FAIL][163] ([i915#6117])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][164] ([i915#11713])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> ([SKIP][165], [SKIP][166]) ([i915#6334]) +1 other test ( 2 skip )
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@gem_exec_capture@capture-invisible@lmem0.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#4812]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-1/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit:
    - shard-dg2:          NOTRUN -> ([SKIP][168], [SKIP][169]) ([i915#2575] / [i915#4812])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@gem_exec_fence@submit.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#3539] / [i915#4852]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> ([SKIP][171], [SKIP][172]) ([i915#3539] / [i915#4852]) +1 other test ( 2 skip )
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-gtt-active:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#3281]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3281]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> ([SKIP][175], [SKIP][176]) ([i915#3281]) +1 other test ( 2 skip )
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu-active.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3281]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-dg2:          NOTRUN -> ([SKIP][178], [SKIP][179]) ([i915#3281]) +4 other tests ( 2 skip )
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-wc.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#3281])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-1/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> ([SKIP][181], [SKIP][182]) ([i915#2575] / [i915#3281]) +2 other tests ( 2 skip )
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@gem_exec_reloc@basic-wc.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> ([SKIP][183], [SKIP][184]) ([i915#3281]) +2 other tests ( 2 skip )
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#4537] / [i915#4812])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> ([SKIP][186], [SKIP][187]) ([i915#4537] / [i915#4812]) +1 other test ( 2 skip )
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-chain.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> ([SKIP][188], [SKIP][189]) ([i915#4812]) +4 other tests ( 2 skip )
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> ([ABORT][190], [ABORT][191]) ([i915#7975] / [i915#8213])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([i915#2575] / [i915#4860])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-none.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#4860])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> ([SKIP][195], [SKIP][196]) ([i915#4860])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#4860])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> ([SKIP][198], [SKIP][199]) ([i915#4860])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#4613] / [i915#7582])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#12936])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> ([SKIP][202], [SKIP][203]) ([i915#4613]) +1 other test ( 2 skip )
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-dg1:          NOTRUN -> ([SKIP][204], [SKIP][205]) ([i915#12193])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-tglu:         NOTRUN -> ([SKIP][206], [SKIP][207]) ([i915#4613]) +3 other tests ( 2 skip )
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#4613])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> ([SKIP][209], [SKIP][210]) ([i915#4565])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive:
    - shard-dg2:          [PASS][211] -> [SKIP][212] ([i915#12936])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@gem_lmem_swapping@massive.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#4613])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          ([PASS][214], [PASS][215]) -> ([SKIP][216], [SKIP][217]) ([i915#12936])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@gem_lmem_swapping@parallel-multi.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-2/igt@gem_lmem_swapping@parallel-multi.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@gem_lmem_swapping@parallel-multi.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-8/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#4613])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-dg2:          ([PASS][219], [PASS][220]) -> ([SKIP][221], [PASS][222]) ([i915#12936])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-8/igt@gem_lmem_swapping@parallel-random.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-10/igt@gem_lmem_swapping@parallel-random.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_lmem_swapping@parallel-random.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#4613])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg2:          [PASS][224] -> ([PASS][225], [SKIP][226]) ([i915#12936])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-1/igt@gem_lmem_swapping@verify-ccs.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@gem_lmem_swapping@verify-ccs.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> ([SKIP][227], [SKIP][228]) ([i915#284])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-5/igt@gem_media_vme.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-7/igt@gem_media_vme.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg2:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([i915#4083]) +1 other test ( 2 skip )
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@gem_mmap@basic-small-bo.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@gem_mmap@basic-small-bo.html
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#4083]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-6/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap@short-mmap:
    - shard-dg1:          NOTRUN -> ([SKIP][232], [SKIP][233]) ([i915#4083]) +3 other tests ( 2 skip )
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gem_mmap@short-mmap.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@basic-read-write:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#4077]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@gem_mmap_gtt@basic-read-write.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#4077]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-3/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([i915#4077]) +7 other tests ( 2 skip )
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#4083]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          NOTRUN -> ([SKIP][239], [SKIP][240]) ([i915#3282])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#3282])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#3282])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@gem_pread@snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#3282])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gem_pread@snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3282]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-2/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([i915#3282])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gem_pwrite@basic-exhaustion.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> ([WARN][247], [WARN][248]) ([i915#2658])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-4/igt@gem_pwrite@basic-exhaustion.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          NOTRUN -> ([SKIP][249], [SKIP][250]) ([i915#4270])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@gem_pxp@create-protected-buffer.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-tglu:         [PASS][251] -> ([SKIP][252], [SKIP][253]) ([i915#4270])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-10/igt@gem_pxp@create-valid-protected-context.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-8/igt@gem_pxp@create-valid-protected-context.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu:         ([PASS][254], [PASS][255]) -> [SKIP][256] ([i915#4270])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-7/igt@gem_pxp@fail-invalid-protected-context.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-4/igt@gem_pxp@fail-invalid-protected-context.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> ([SKIP][257], [SKIP][258]) ([i915#2575] / [i915#4270])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-rkl:          NOTRUN -> ([SKIP][259], [SKIP][260]) ([i915#4270])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-tglu:         ([PASS][261], [PASS][262]) -> ([SKIP][263], [SKIP][264]) ([i915#4270])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-10/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-9/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-8/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> ([TIMEOUT][265], [TIMEOUT][266]) ([i915#12917])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> ([SKIP][267], [SKIP][268]) ([i915#4270]) +2 other tests ( 2 skip )
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> ([SKIP][269], [SKIP][270]) ([i915#3282]) +1 other test ( 2 skip )
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@gem_readwrite@beyond-eob.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> ([SKIP][271], [SKIP][272]) ([i915#5190] / [i915#8428]) +3 other tests ( 2 skip )
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> ([SKIP][273], [SKIP][274]) ([i915#2575] / [i915#5190] / [i915#8428])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#8428]) +5 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#2575] / [i915#5190]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> ([SKIP][277], [SKIP][278]) ([i915#4885])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#4885])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> ([SKIP][280], [SKIP][281]) ([i915#3297] / [i915#3323])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-7/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> ([SKIP][282], [SKIP][283]) ([i915#3297] / [i915#3323])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> ([SKIP][284], [SKIP][285]) ([i915#3297]) +1 other test ( 2 skip )
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@gem_userptr_blits@dmabuf-unsync.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-rkl:          NOTRUN -> ([SKIP][286], [SKIP][287]) ([i915#3297]) +1 other test ( 2 skip )
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@gem_userptr_blits@dmabuf-unsync.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#3297]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-tglu:         NOTRUN -> ([SKIP][289], [SKIP][290]) ([i915#3297]) +1 other test ( 2 skip )
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-9/igt@gem_userptr_blits@dmabuf-unsync.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-4/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#3297]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> ([SKIP][292], [SKIP][293]) ([i915#3297] / [i915#4880])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#3297] / [i915#4880])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> ([SKIP][295], [SKIP][296]) ([i915#2575] / [i915#3297] / [i915#4880])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> ([SKIP][297], [SKIP][298]) ([i915#3297] / [i915#4880]) +1 other test ( 2 skip )
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> ([SKIP][299], [SKIP][300]) ([i915#3297])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_watchdog@default-virtual:
    - shard-dg2:          NOTRUN -> ([SKIP][301], [SKIP][302]) ([i915#12961])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@gem_watchdog@default-virtual.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@gem_watchdog@default-virtual.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> ([SKIP][303], [SKIP][304]) ([i915#2575])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@gen7_exec_parse@bitmasks.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> ([SKIP][305], [SKIP][306]) ([i915#2856])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-8/igt@gen9_exec_parse@bb-start-param.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@gen9_exec_parse@bb-start-param.html
    - shard-rkl:          NOTRUN -> ([SKIP][307], [SKIP][308]) ([i915#2527]) +1 other test ( 2 skip )
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-7/igt@gen9_exec_parse@bb-start-param.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html
    - shard-dg1:          NOTRUN -> ([SKIP][309], [SKIP][310]) ([i915#2527]) +2 other tests ( 2 skip )
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@gen9_exec_parse@bb-start-param.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@gen9_exec_parse@bb-start-param.html
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#2527] / [i915#2856])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@gen9_exec_parse@bb-start-param.html
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#2856])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-3/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> ([SKIP][313], [SKIP][314]) ([i915#2527] / [i915#2856]) +2 other tests ( 2 skip )
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@gen9_exec_parse@cmd-crossing-page.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-4/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#2527])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#2527] / [i915#2856])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [PASS][317] -> [ABORT][318] ([i915#9820])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#7178])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][320] +5 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          ([PASS][321], [PASS][322]) -> [FAIL][323] ([i915#12942]) +1 other test fail
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> ([SKIP][324], [SKIP][325]) ([i915#11681] / [i915#2575] / [i915#6621])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> ([SKIP][326], [SKIP][327]) ([i915#11681])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@i915_pm_rps@thresholds-idle.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][328] ([i915#9311])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-dg2:          ([PASS][329], [PASS][330]) -> [FAIL][331] ([i915#12867]) +4 other tests fail
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-10/igt@i915_selftest@perf.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-8/igt@i915_selftest@perf.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@i915_selftest@perf.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-dg2:          NOTRUN -> ([SKIP][332], [SKIP][333]) ([i915#2575] / [i915#4077])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@i915_suspend@fence-restore-tiled2untiled.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#4212])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-1/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> ([SKIP][335], [SKIP][336]) ([i915#4215])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> ([SKIP][337], [SKIP][338]) ([i915#2575] / [i915#4212])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> ([SKIP][339], [SKIP][340]) ([i915#4212]) +1 other test ( 2 skip )
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#9531])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_interruptible@universal-setplane-primary:
    - shard-dg1:          [PASS][342] -> ([DMESG-WARN][343], [PASS][344]) ([i915#4423])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-14/igt@kms_atomic_interruptible@universal-setplane-primary.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_atomic_interruptible@universal-setplane-primary.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@kms_atomic_interruptible@universal-setplane-primary.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> ([SKIP][345], [SKIP][346]) ([i915#1769] / [i915#3555])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> ([SKIP][347], [SKIP][348]) ([i915#1769] / [i915#3555])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          [PASS][349] -> ([PASS][350], [FAIL][351]) ([i915#5956]) +1 other test ( 1 fail, 1 pass )
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-mtlp:         ([PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356]) -> [FAIL][357] ([i915#11808] / [i915#5956]) +1 other test fail
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][358] ([i915#5286]) +3 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#4538] / [i915#5286]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-mtlp:         ([PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365]) -> [FAIL][366] ([i915#12469] / [i915#5138])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#5286]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> ([SKIP][368], [SKIP][369]) ([i915#5286]) +6 other tests ( 2 skip )
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-dg1:          NOTRUN -> ([SKIP][370], [SKIP][371]) ([i915#5286])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> ([SKIP][372], [SKIP][373]) ([i915#4538] / [i915#5286]) +1 other test ( 2 skip )
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> ([SKIP][374], [SKIP][375]) ([i915#5286]) +1 other test ( 2 skip )
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#3638]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> ([SKIP][377], [SKIP][378]) ([i915#3638])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> ([SKIP][379], [SKIP][380]) +4 other tests ( 2 skip )
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> ([SKIP][381], [PASS][382]) +7 other tests ( 1 pass, 1 skip )
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> ([SKIP][383], [SKIP][384]) ([i915#4538] / [i915#5190]) +4 other tests ( 2 skip )
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#4538] / [i915#5190]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> ([SKIP][386], [SKIP][387]) +8 other tests ( 2 skip )
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> ([SKIP][388], [SKIP][389]) ([i915#4538]) +3 other tests ( 2 skip )
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][390] ([i915#6187])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#4538]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][392] +20 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-mtlp:         NOTRUN -> [SKIP][393] +11 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#5190]) +4 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> ([SKIP][395], [SKIP][396]) ([i915#10307] / [i915#6095]) +60 other tests ( 2 skip )
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][397] ([i915#6095]) +160 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-dg1:          NOTRUN -> ([SKIP][398], [SKIP][399]) ([i915#6095]) +14 other tests ( 2 skip )
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> ([SKIP][400], [SKIP][401]) ([i915#12313]) +1 other test ( 2 skip )
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#12313])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> ([SKIP][403], [SKIP][404]) ([i915#12805])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> ([SKIP][405], [SKIP][406]) ([i915#6095]) +64 other tests ( 2 skip )
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][407] ([i915#6095]) +48 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#6095]) +3 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> ([SKIP][409], [SKIP][410]) ([i915#6095]) +8 other tests ( 2 skip )
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> ([SKIP][411], [SKIP][412]) ([i915#6095]) +4 other tests ( 2 skip )
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][413] ([i915#6095]) +34 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> ([SKIP][414], [SKIP][415]) ([i915#10307] / [i915#10434] / [i915#6095])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][416] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][417] ([i915#6095]) +19 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][418] ([i915#6095]) +44 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> ([SKIP][419], [SKIP][420]) ([i915#12313])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> ([SKIP][421], [SKIP][422]) ([i915#12313]) +1 other test ( 2 skip )
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2:          [PASS][423] -> ([SKIP][424], [PASS][425]) +6 other tests ( 1 pass, 1 skip )
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][426] ([i915#12313]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][427] ([i915#10307] / [i915#6095]) +87 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> ([SKIP][428], [SKIP][429]) ([i915#3742])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> ([SKIP][430], [SKIP][431]) ([i915#3742])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][432] ([i915#7213]) +3 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> ([SKIP][433], [SKIP][434]) ([i915#4087]) +4 other tests ( 2 skip )
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][435] ([i915#7828]) +3 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-tglu-1:       NOTRUN -> [SKIP][436] ([i915#7828]) +6 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> ([SKIP][437], [SKIP][438]) ([i915#2575] / [i915#7828]) +5 other tests ( 2 skip )
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_chamelium_frames@dp-crc-fast.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-mtlp:         NOTRUN -> [SKIP][439] ([i915#7828]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-4/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][440] ([i915#7828])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#7828]) +3 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> ([SKIP][442], [SKIP][443]) ([i915#7828]) +2 other tests ( 2 skip )
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@kms_chamelium_frames@dp-frame-dump.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@kms_chamelium_frames@dp-frame-dump.html
    - shard-rkl:          NOTRUN -> ([SKIP][444], [SKIP][445]) ([i915#7828]) +1 other test ( 2 skip )
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@kms_chamelium_frames@dp-frame-dump.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-7/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg1:          NOTRUN -> ([SKIP][446], [SKIP][447]) ([i915#7828]) +4 other tests ( 2 skip )
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][448] ([i915#7828]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-tglu:         NOTRUN -> ([SKIP][449], [SKIP][450]) ([i915#7828]) +6 other tests ( 2 skip )
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@invalid-gamma-lut-sizes:
    - shard-dg2:          ([PASS][451], [PASS][452]) -> [SKIP][453] ([i915#2575]) +78 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-6/igt@kms_color@invalid-gamma-lut-sizes.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-5/igt@kms_color@invalid-gamma-lut-sizes.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_color@invalid-gamma-lut-sizes.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> ([SKIP][454], [SKIP][455]) ([i915#7118] / [i915#9424])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][456] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> ([SKIP][457], [SKIP][458]) ([i915#3116] / [i915#3299]) +1 other test ( 2 skip )
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][459] ([i915#3299])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> ([SKIP][460], [SKIP][461]) ([i915#3299])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> ([SKIP][462], [SKIP][463]) ([i915#3299]) +1 other test ( 2 skip )
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@kms_content_protection@dp-mst-lic-type-1.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> ([SKIP][464], [SKIP][465]) ([i915#6944] / [i915#9424]) +1 other test ( 2 skip )
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-8/igt@kms_content_protection@lic-type-0.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@kms_content_protection@lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][466] ([i915#9424])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][467] ([i915#6944] / [i915#9424])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-4/igt@kms_content_protection@lic-type-1.html
    - shard-dg2:          NOTRUN -> ([SKIP][468], [SKIP][469]) ([i915#2575] / [i915#9424])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_content_protection@lic-type-1.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][470] ([i915#9424])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-3/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> ([SKIP][471], [SKIP][472]) ([i915#9424])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-14/igt@kms_content_protection@lic-type-1.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> ([SKIP][473], [SKIP][474]) ([i915#6944] / [i915#7116] / [i915#7118])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-7/igt@kms_content_protection@srm.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-10/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][475] ([i915#7116] / [i915#9424])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][476] ([i915#1339] / [i915#7173])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> ([SKIP][477], [SKIP][478]) ([i915#12976])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2:          NOTRUN -> ([SKIP][479], [SKIP][480]) ([i915#2575] / [i915#3555])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][481] ([i915#12976])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][482] ([i915#8814])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> ([SKIP][483], [SKIP][484]) ([i915#3555]) +3 other tests ( 2 skip )
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][485] ([i915#12976])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][486] ([i915#3555])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-dg1:          NOTRUN -> ([SKIP][487], [SKIP][488]) ([i915#3555]) +5 other tests ( 2 skip )
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][489] ([i915#3555] / [i915#8814])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][490] ([i915#12976])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][491] ([i915#12976])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][492] ([i915#4103])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> ([SKIP][493], [SKIP][494]) ([i915#2575] / [i915#5354])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][495] ([i915#9809]) +4 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          ([PASS][496], [PASS][497]) -> ([FAIL][498], [FAIL][499]) ([i915#2346])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][500] ([i915#9067])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][501] ([i915#4103])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][502] ([i915#4213])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][503] ([i915#3555] / [i915#8827])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][504] ([i915#1769] / [i915#3555] / [i915#3804])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][505] ([i915#3804])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> ([SKIP][506], [SKIP][507]) ([i915#1257])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-1/igt@kms_dp_aux_dev.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-7/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][508] ([i915#3840])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][509] ([i915#3840])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][510] ([i915#3555] / [i915#3840])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> ([SKIP][511], [SKIP][512]) ([i915#3555] / [i915#3840])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-6/igt@kms_dsc@dsc-with-formats.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-tglu-10/igt@kms_dsc@dsc-with-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][513] ([i915#3555] / [i915#3840])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-mtlp-7/igt@kms_dsc@dsc-with-formats.html
    - shard-dg2:          NOTRUN -> ([SKIP][514], [SKIP][515]) ([i915#3555] / [i915#3840])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-11/igt@kms_dsc@dsc-with-formats.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg2-5/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> ([SKIP][516], [SKIP][517]) ([i915#3555] / [i915#3840])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-7/igt@kms_dsc@dsc-with-formats.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-rkl-2/igt@kms_dsc@dsc-with-formats.html
    - shard-dg1:          NOTRUN -> ([SKIP][518], [SKIP][519]) ([i915#3555] / [i915#3840])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-13/igt@kms_dsc@dsc-with-formats.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-18/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg1:          NOTRUN -> [SKIP][520] ([i915#3469])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/shard-dg1-17/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> ([SKIP][521], [SKIP][522]) ([i915#3469]) +1 other test (

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12142/index.html
